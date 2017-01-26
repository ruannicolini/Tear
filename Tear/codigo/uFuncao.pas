unit uFuncao;

interface

uses
  IdHashMessageDigest, Windows, Messages, SysUtils, Variants, Classes, Graphics, Zlib,
  Controls, Forms, Dialogs, StdCtrls;

  function MD5(const texto : string): string;
  function SerialNum(FDrive : string) :string;
  function Crip(wStri: string): string;
  function GetFileVersion(const FileName: string): string;
  procedure Comprimir(FileOutName: TFileName; Files: array of TFileName);

implementation

{==============================================================================}

//uses uFrmLogin;

function MD5(const texto:string):string;
var
  idmd5 : TIdHashMessageDigest5;
  str : String;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    result := idmd5.HashStringAsHex(texto);
  finally
    idmd5.Free;
  end;
end;

function SerialNum(FDrive:string) :string;
var
  Serial:DWord;
  DirLen,Flags: DWord;
  DLabel : Array[0..11] of Char;
begin
  try GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
  Result := IntToHex(Serial,8);
  except Result :='';
end;
end;

function Crip(wStri: String): String;
var Simbolos : array [0..4] of String;
x            : Integer;
begin
  Simbolos[1]:='ABCDEFGHIJLMNOPQRSTUVXZYWK ~!@#$%^&*()';
  Simbolos[2]:= 'ÂÀ©Øû×ƒçêùÿ5Üø£úñÑªº¿®¬¼ëèïÙýÄÅÉæÆôöò»Á';
  Simbolos[3]:= 'abcdefghijlmnopqrstuvxzywk1234567890';
  Simbolos[4]:= 'áâäàåíóÇüé¾¶§÷ÎÏ-+ÌÓß¸°¨·¹³²Õµþîì¡«½';

  for x := 1 to Length(Trim(wStri)) do
	begin
  if pos(copy(wStri,x,1),Simbolos[1])>0 then
    Result := Result+copy(Simbolos[2],
  pos(copy(wStri,x,1),Simbolos[1]),1)
  else
  if pos(copy(wStri,x,1),Simbolos[2])>0 then
     Result := Result+copy(Simbolos[1],
  pos(copy(wStri,x,1),Simbolos[2]),1)
  else
  if pos(copy(wStri,x,1),Simbolos[3])>0 then
     Result := Result+copy(Simbolos[4],
  pos(copy(wStri,x,1),Simbolos[3]),1)
  else
    if pos(copy(wStri,x,1),Simbolos[4])>0 then
      Result := Result+copy(Simbolos[3],
    pos(copy(wStri,x,1),Simbolos[4]),1);
    end;
end;

function GetFileVersion(const FileName: String): String;
var
  Zero: DWORD;
  VersionInfoSize: DWORD;
  PVersionData: pointer;
  PFixedFileInfo: PVSFixedFileInfo;
  FixedFileInfoLength: UINT;
  Major, Minor, Release, Build : Integer;
begin
  VersionInfoSize := GetFileVersionInfoSize(pChar(FileName), Zero);
  if VersionInfoSize = 0 then
     exit;
  PVersionData := AllocMem(VersionInfoSize);
  try
    if GetFileVersionInfo(pChar(FileName), 0, VersionInfoSize, PVersionData) = False then
       exit;
    if VerQueryValue(PVersionData, '', pointer(PFixedFileInfo), FixedFileInfoLength) = False then
       exit;
    Major := PFixedFileInfo^.dwFileVersionMS shr 16;
    Minor := PFixedFileInfo^.dwFileVersionMS and $FFFF;
    Release := PFixedFileInfo^.dwFileVersionLS shr 16;
    Build := PFixedFileInfo^.dwFileVersionLS and $FFFF;
  finally
    FreeMem(PVersionData);
  end;
  if (Major or Minor or Release or Build) <> 0 then
     Result := IntToStr(Major) + IntToStr(Minor) + IntToStr(Release) + IntToStr(Build);
end;


procedure Comprimir(FileOutName: TFileName; Files: array of TFileName);
var
  FileInName: TFileName;
  FileIn, FileOut: TFileStream;
  Zip: TCompressionStream;
  NumArquivos, I, Len, Size: Integer;
  Fim: Byte;
begin
  FileOut := TFileStream.Create(FileOutName, fmCreate or fmShareExclusive);
  Zip := TCompressionStream.Create( clMax, FileOut);
  NumArquivos := Length(Files);
  Zip.Write(NumArquivos, SizeOf(Integer));
  try
    for I := Low(Files) to High(Files) do
    begin
      FileIn := TFileStream.Create(Files[I], fmOpenRead and fmShareExclusive);
      try
        FileInName := ExtractFileName(Files[I]);
        Len := Length(FileInName);
        Zip.Write(Len, SizeOf(Integer));
        Zip.Write(FileInName[1], Len);
        Size := FileIn.Size;
        Zip.Write(Size, SizeOf(Integer));
        Zip.CopyFrom(FileIn, FileIn.Size);
        Fim := 0;
        Zip.Write(Fim, SizeOf(Byte));
      finally
        FileIn.Free;
      end;
    end;
  finally
   Zip.Free;
   FileOut.Free;
  end;
end;

end.
