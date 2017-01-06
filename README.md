<<<<<<< HEAD
﻿# TEAR - Software Para Balanceamento de Produção na Indústria de Confecção
=======
# TEAR - Software Para Balanceamento de Produção na Indústria de Confecção
>>>>>>> 56382e05f4aaae7185cf11a00f754d7e7c5f3e62

Principais pontos de desenvolvimento do sistema:
* CRUD Cadastros Base (Produto, Recurso, Linha de Produção, Operação, Ordem de Produção, etc): Concluído;
* Rotina de tiragem de tempos e cálculo do Tempo Padrão Final (Cronoanálise): Concluído;
* Reaproveitamento de tempo cronometrado: Em Revisão;
* Integração com APP Cronometragem: Concluído;
* Controle de movimentação da Ordem de Produção: Concluído;
* Controle de Acesso: Concluído;
* Sistema de login: Em desenvolvimento;
* Aplicação de uma técnica apropriada de balanceamento de linha de produção: Em desenvolvimento;
* Exibiçao dos dados de balanceamento através de grafico de Gantt: Concluído; 
* Relatórios dinâmicos: Concluído;

_____________________________________________________________________________

##Componentes Utilizados
* MsgDlgs (Pasta componentes do projeto);
* Componente Beleza (Pasta componentes do projeto);
* Report Builder 22;
* VCL DevExpress 14.2.2 para RadStudio XE8;

_____________________________________________________________________________

##Requisitos e Configurações
* Executar o script do banco de dados;
* Dentro do projeto, acessar uDataModule.pas e configurar FDConnection, conforme figura. Os valores devem ser alterados conforme as configurações do MYSQL (Database, User, Password,  Server, Port).

![tear_config](https://cloud.githubusercontent.com/assets/6893004/21574888/ba15b3e2-cee2-11e6-8f2e-f4a24bf7cee8.png)
<<<<<<< HEAD

_____________________________________________________________________________

##Módulos: 
* Cronoanálise; 
* Produção; 
* Ajustes;


![telaprincipal](https://cloud.githubusercontent.com/assets/6893004/21729935/752f71da-d434-11e6-9ad4-491efbeabdd1.png)

_____________________________________________________________________________

##Ciclo de Cadastros Base do Sistema: 

![etapas2](https://cloud.githubusercontent.com/assets/6893004/21731301/d39854ac-d43a-11e6-8bcd-70b115313662.png)

_____________________________________________________________________________

##Padrão Interfaces de Cadastros Base

![telaordemproducao](https://cloud.githubusercontent.com/assets/6893004/21730731/36ba94c6-d438-11e6-8273-db850e38e825.png)

_____________________________________________________________________________

##Interface Balanceamento

![interfacebalanceamento](https://cloud.githubusercontent.com/assets/6893004/21731048/97df290a-d439-11e6-9b4e-d476fec97dad.png)
=======
>>>>>>> 56382e05f4aaae7185cf11a00f754d7e7c5f3e62
