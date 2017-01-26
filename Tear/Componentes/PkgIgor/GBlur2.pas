{-----------------------------------------------------------------------------
 Unit Name: GBlur2
 Author:    paul fisher
 Purpose:
 History:
-----------------------------------------------------------------------------}


unit GBlur2;


interface 


uses Windows, Graphics; 


type 
    PRGBTriple = ^TRGBTriple; 
    TRGBTriple = packed record 
     b: byte; //easier to type than rgbtBlue... 
     g: byte; 
     r: byte; 
    end; 


    PRow = ^TRow; 
    TRow = array[0..1000000] of TRGBTriple; 


    PPRows = ^TPRows; 
    TPRows = array[0..1000000] of PRow; 


const MaxKernelSize = 100; 


type 


    TKernelSize = 1..MaxKernelSize; 


    TKernel = record 
     Size: TKernelSize; 
     Weights: array[-MaxKernelSize..MaxKernelSize] of single; 
    end; 
//the idea is that when using a TKernel you ignore the Weights 
//except for Weights in the range -Size..Size. 


procedure GBlur(theBitmap: TBitmap; radius: double);
procedure DrawTransparentBitmap(DC: HDC; hBmp : HBITMAP ;
          xStart: integer; yStart : integer; cTransparentColor : COLORREF);



implementation 


uses SysUtils;


procedure DrawTransparentBitmap(DC: HDC; hBmp : HBITMAP ;
          xStart: integer; yStart : integer; cTransparentColor : COLORREF);
var
      bm:                                                  BITMAP;
      cColor:                                              COLORREF;
      bmAndBack, bmAndObject, bmAndMem, bmSave:            HBITMAP;
      bmBackOld, bmObjectOld, bmMemOld, bmSaveOld:         HBITMAP;
      hdcMem, hdcBack, hdcObject, hdcTemp, hdcSave:        HDC;
      ptSize:                                              TPOINT;
 
begin
   hdcTemp := CreateCompatibleDC(dc);
   SelectObject(hdcTemp, hBmp);   // Select the bitmap
 
   GetObject(hBmp, sizeof(BITMAP), @bm);
   ptSize.x := bm.bmWidth;            // Get width of bitmap
   ptSize.y := bm.bmHeight;           // Get height of bitmap
   DPtoLP(hdcTemp, ptSize, 1);        // Convert from device
                                      // to logical points
 
   // Create some DCs to hold temporary data.
   hdcBack   := CreateCompatibleDC(dc);
   hdcObject := CreateCompatibleDC(dc);
   hdcMem    := CreateCompatibleDC(dc);
   hdcSave   := CreateCompatibleDC(dc);
 
   // Create a bitmap for each DC. DCs are required for a number of
   // GDI functions.
 
   // Monochrome DC
   bmAndBack   := CreateBitmap(ptSize.x, ptSize.y, 1, 1, nil);
 
   // Monochrome DC
   bmAndObject := CreateBitmap(ptSize.x, ptSize.y, 1, 1, nil);
 
   bmAndMem    := CreateCompatibleBitmap(dc, ptSize.x, ptSize.y);
   bmSave      := CreateCompatibleBitmap(dc, ptSize.x, ptSize.y);
 
   // Each DC must select a bitmap object to store pixel data.
   bmBackOld   := SelectObject(hdcBack, bmAndBack);
   bmObjectOld := SelectObject(hdcObject, bmAndObject);
   bmMemOld    := SelectObject(hdcMem, bmAndMem);
   bmSaveOld   := SelectObject(hdcSave, bmSave);
 
   // Set proper mapping mode.
   SetMapMode(hdcTemp, GetMapMode(dc));
 
   // Save the bitmap sent here, because it will be overwritten.
   BitBlt(hdcSave, 0, 0, ptSize.x, ptSize.y, hdcTemp, 0, 0, SRCCOPY);
 
   // Set the background color of the source DC to the color.
   // contained in the parts of the bitmap that should be transparent
   cColor := SetBkColor(hdcTemp, cTransparentColor);
 
   // Create the object mask for the bitmap by performing a BitBlt
   // from the source bitmap to a monochrome bitmap.
   BitBlt(hdcObject, 0, 0, ptSize.x, ptSize.y, hdcTemp, 0, 0,
          SRCCOPY);
 
   // Set the background color of the source DC back to the original
   // color.
   SetBkColor(hdcTemp, cColor);
 
   // Create the inverse of the object mask.
   BitBlt(hdcBack, 0, 0, ptSize.x, ptSize.y, hdcObject, 0, 0,
          NOTSRCCOPY);
 
   // Copy the background of the main DC to the destination.
   BitBlt(hdcMem, 0, 0, ptSize.x, ptSize.y, dc, xStart, yStart,
          SRCCOPY);
 
   // Mask out the places where the bitmap will be placed.
   BitBlt(hdcMem, 0, 0, ptSize.x, ptSize.y, hdcObject, 0, 0, SRCAND);
 
   // Mask out the transparent colored pixels on the bitmap.
   BitBlt(hdcTemp, 0, 0, ptSize.x, ptSize.y, hdcBack, 0, 0, SRCAND);
 
   // XOR the bitmap with the background on the destination DC.
   BitBlt(hdcMem, 0, 0, ptSize.x, ptSize.y, hdcTemp, 0, 0, SRCPAINT);
 
   // Copy the destination to the screen.
   BitBlt(dc, xStart, yStart, ptSize.x, ptSize.y, hdcMem, 0, 0,
          SRCCOPY);
 
   // Place the original bitmap back into the bitmap sent here.
   BitBlt(hdcTemp, 0, 0, ptSize.x, ptSize.y, hdcSave, 0, 0, SRCCOPY);
 
   // Delete the memory bitmaps.
   DeleteObject(SelectObject(hdcBack, bmBackOld));
   DeleteObject(SelectObject(hdcObject, bmObjectOld));
   DeleteObject(SelectObject(hdcMem, bmMemOld));
   DeleteObject(SelectObject(hdcSave, bmSaveOld));
 
   // Delete the memory DCs.
   DeleteDC(hdcMem);
   DeleteDC(hdcBack);
   DeleteDC(hdcObject);
   DeleteDC(hdcSave);
   DeleteDC(hdcTemp);
end;



procedure MakeGaussianKernel(var K: TKernel; radius: double; 
                            MaxData, DataGranularity: double);

var j: integer; temp, delta: double; KernelSize: TKernelSize;
begin 
  for j:= Low(K.Weights) to High(K.Weights) do 
  begin 
    temp:= j/radius; 
    K.Weights[j]:= exp(-temp*temp/2); 
  end; 


//now divide by constant so sum(Weights) = 1: 


  temp:= 0; 
  for j:= Low(K.Weights) to High(K.Weights) do 
     temp:= temp + K.Weights[j]; 
  for j:= Low(K.Weights) to High(K.Weights) do 
     K.Weights[j]:= K.Weights[j] / temp; 


//now discard (or rather mark as ignorable by setting Size) 
//the entries that are too small to matter - 
//this is important, otherwise a blur with a small radius 
//will take as long as with a large radius... 
  KernelSize:= MaxKernelSize; 
  delta:= DataGranularity / (2*MaxData); 
  temp:= 0; 
  while (temp < delta) and (KernelSize > 1) do 
   begin 
     temp:= temp + 2 * K.Weights[KernelSize]; 
     dec(KernelSize); 
   end; 


  K.Size:= KernelSize; 


//now just to be correct go back and jiggle again so the 
//sum of the entries we'll be using is exactly 1: 


  temp:= 0; 
  for j:= -K.Size to K.Size do 
     temp:= temp + K.Weights[j]; 
  for j:= -K.Size to K.Size do 
     K.Weights[j]:= K.Weights[j] / temp; 


end; 


function TrimInt(Lower, Upper, theInteger: integer): integer; 
begin 
 if theInteger < Lower then result:= Lower 
 else if theInteger > Upper then result:= Upper 
 else result:= theInteger; 
end; 


function TrimReal(Lower, Upper: integer; x: double): integer; 
begin 
 if x < Lower then result:= Lower 
 else if x > Upper then result:= Upper 
 else result:= trunc(x); 
end; 


procedure BlurRow(var theRow: array of TRGBTriple; K: TKernel); 
var j, n: integer; tr, tg, tb: double; //tempRed, etc 
       w: double; 
       P: PRow; 
begin 
GetMem(P, (High(theRow) + 1)*SizeOf(TRGBTriple)); 
//allocating and freeing temporary storage for each row can't be 
//the most efficient thing to do - this may be a major bottleneck 


for j:= 0 to High(theRow) do 
  begin 
    tb:= 0; 
    tg:= 0; 
    tr:= 0; 
    for n:= -K.Size to K.Size do 
    begin 
      w:= K.Weights[n]; 
      with theRow[TrimInt(0, High(theRow), j - n)] do 
//the TrimInt keeps us from running off the edge of the row... 
      begin 
        tb:= tb + w * b; 
        tg:= tg + w * g; 
        tr:= tr + w * r; 
      end; 
    end; 
    with P[j] do 
    begin 
      b:= TrimReal(0, 255, tb); 
      g:= TrimReal(0, 255, tg); 
      r:= TrimReal(0, 255, tr); 
//you want TrimReal instead of just trunc: someday when the value 
//is 257.5 by mistake you want to map that to 255, not to 1! 
    end; 
  end; 


Move(P[0], theRow[0], (High(theRow) + 1) * Sizeof(TRGBTriple)); 


FreeMem(P); 
end; 


procedure GBlur(theBitmap: TBitmap; radius: double);  
var Row, Col: integer; theRows: PPRows; K: TKernel; ACol: PRow;

begin 
if (theBitmap.HandleType <> bmDIB) or (theBitmap.PixelFormat <> pf24Bit) then
 raise exception.Create('GBlur only works for 24-bit bitmaps'); 


MakeGaussianKernel(K, radius, 255, 1); 
GetMem(theRows, theBitmap.Height * SizeOf(PRow)); 
GetMem(ACol, theBitmap.Height * SizeOf(TRGBTriple)); 


//record the location of the bitmap data: 
for Row:= 0 to theBitmap.Height - 1 do 
  theRows[Row]:= theBitmap.Scanline[Row]; 


//blur each row: 
for Row:= 0 to theBitmap.Height - 1 do 
  BlurRow(Slice(theRows[Row]^, theBitmap.Width), K); 


//now blur each column 
for Col:= 0 to theBitmap.Width - 1 do 
begin 
//- first read the column into a TRow: 
  for Row:= 0 to theBitmap.Height - 1 do 
     ACol[Row]:= theRows[Row][Col]; 


  BlurRow(Slice(ACol^, theBitmap.Height), K); 


//now put that row, um, column back into the data: 
  for Row:= 0 to theBitmap.Height - 1 do 
     theRows[Row][Col]:= ACol[Row]; 
end; 


FreeMem(theRows); 
FreeMem(ACol); 
end; 


end. 



