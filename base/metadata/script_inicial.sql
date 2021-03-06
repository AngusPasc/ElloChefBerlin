/******************************************************************************/
/*           Generated by IBExpert 2017.2.26.1 02/03/2017 17:45:20            */
/******************************************************************************/

SET SQL DIALECT 3;

SET NAMES WIN1252;

SET CLIENTLIB 'C:\Program Files\Firebird\Firebird_3_0\WOW64\fbclient.dll';

CREATE DATABASE 'localhost/3050:F:\Projetos\ElloChefBerlin\base\SIGFOOD.FDB'
USER 'SYSDBA' PASSWORD 'masterkey'
PAGE_SIZE 8192
DEFAULT CHARACTER SET WIN1252 COLLATION WIN1252;



/******************************************************************************/
/*                                 Exceptions                                 */
/******************************************************************************/

CREATE EXCEPTION ERRO_PADRAO 'N�o � poss�vel Excluir esse Registro';



/******************************************************************************/
/*                             Stored procedures                              */
/******************************************************************************/



SET TERM ^ ;

CREATE OR ALTER PROCEDURE PR_LOG_GRAVA_HISTORICO (
    DESCRICAO VARCHAR(15000))
AS
BEGIN
  EXIT;
END^






SET TERM ; ^



/******************************************************************************/
/*                                   Tables                                   */
/******************************************************************************/



CREATE TABLE EMPRESA (
    CODIGO_EMPRESA   INTEGER NOT NULL,
    RAZAO_SOCIAL     VARCHAR(40) NOT NULL,
    FANTASIA         VARCHAR(40) NOT NULL,
    ENDERECO         VARCHAR(40) NOT NULL,
    NUMERO_ENDERECO  VARCHAR(10) NOT NULL,
    BAIRRO           VARCHAR(30) NOT NULL,
    CIDADE           VARCHAR(30) NOT NULL,
    UF               CHAR(2) NOT NULL,
    CEP              VARCHAR(9) NOT NULL,
    FONE             VARCHAR(15) NOT NULL,
    EMAIL            VARCHAR(40) NOT NULL,
    CNPJ             VARCHAR(20) NOT NULL,
    LOGO             VARCHAR(500)
);

CREATE TABLE HISTORICO_LOG (
    CODIGO     INTEGER NOT NULL,
    USUARIO    VARCHAR(70),
    DATA       DATE,
    HORA       TIME,
    DESCRICAO  VARCHAR(15000)
);

CREATE TABLE PARAMETROS (
    CODIGO  INTEGER NOT NULL
);

CREATE TABLE PEDIDOS (
    COD_PEDIDO           INTEGER NOT NULL,
    COD_EMPRESA          INTEGER NOT NULL,
    COD_CLIENTE          INTEGER NOT NULL,
    RAZAO_SOCIAL         VARCHAR(60),
    DATA                 DATE,
    HORA                 TIME,
    OBS                  VARCHAR(500),
    VR_BRUTO             NUMERIC(15,2),
    VR_DESCONTO          NUMERIC(15,2),
    VR_ACRESCIMO         NUMERIC(15,2),
    VR_LIQUIDO           NUMERIC(15,2),
    VR_TROCO             NUMERIC(15,2),
    FLAG_SITUACAO        SMALLINT,
    DATA_CANCELAMENTO    TIMESTAMP,
    MOTIVO_CANCELAMENTO  VARCHAR(80),
    FLAG_GRAVADO         SMALLINT,
    FLAG_EDITANDO        SMALLINT
);

CREATE TABLE PEDIDOS_ITENS (
    COD_PEDIDO           INTEGER NOT NULL,
    COD_ITEM             INTEGER NOT NULL,
    COD_PRODUTO          VARCHAR(25) NOT NULL,
    COD_GRADE            VARCHAR(25),
    QTD                  NUMERIC(15,3),
    UNIDADE              VARCHAR(20),
    DESCRICAO_ADICIONAL  VARCHAR(500),
    VR_UNITARIO          NUMERIC(15,5),
    VR_BRUTO             NUMERIC(15,2),
    VR_DESCONTO          NUMERIC(15,2),
    VR_LIQUIDO           NUMERIC(15,2),
    VR_ACRESCIMO         NUMERIC(15,2),
    FLAG_CANCELADO       SMALLINT,
    DATA_CANCELAMENTO    TIMESTAMP,
    MOTIVO_CANCELAMENTO  VARCHAR(80)
);

CREATE TABLE PESSOAS (
    COD_PESSOA          INTEGER NOT NULL,
    RAZAO_SOCIAL        VARCHAR(60),
    NOME_FANTASIA       VARCHAR(60),
    CNPJ_CPF            VARCHAR(14),
    INSCR_MUNICIPAL     VARCHAR(14),
    TIPO_CLASSIFICACAO  SMALLINT,
    SEXO                SMALLINT NOT NULL,
    NACIONALIDADE       VARCHAR(10),
    SITE                VARCHAR(40),
    DATA_CADASTRO       DATE,
    OBS_PESSOA          VARCHAR(80),
    FLAG_ATIVO          SMALLINT,
    BLOQUEADO           SMALLINT,
    OBS_INATIVO         VARCHAR(80),
    HISTORICO           BLOB SUB_TYPE 0 SEGMENT SIZE 80,
    FLAG_CLIENTE        SMALLINT NOT NULL,
    FLAG_FORNECEDOR     SMALLINT NOT NULL,
    FLAG_VENDEDOR       SMALLINT NOT NULL,
    FLAG_TRANSPORT      SMALLINT NOT NULL,
    FLAG_CONVENIO       SMALLINT NOT NULL,
    FLAG_FUNC           SMALLINT NOT NULL,
    DATA_ALTERACAO      DATE,
    INSCR_ESTADUAL      VARCHAR(30),
    RG                  VARCHAR(14),
    SUFRAMA             VARCHAR(9),
    EMAIL               VARCHAR(60),
    CONJ_ESTADO_CIVIL   VARCHAR(20),
    CONJ_NOME           VARCHAR(30),
    CONJ_RENDA          NUMERIC(15,2),
    CONJ_CPF            VARCHAR(11),
    CONJ_PROFISSAO      VARCHAR(30),
    CONJ_REGIME         VARCHAR(30),
    CONJ_TRABALHO       VARCHAR(50),
    CONJ_RG             VARCHAR(14)
);

CREATE TABLE PRODUTO (
    COD_PRODUTO  VARCHAR(25) NOT NULL,
    DESCRICAO    VARCHAR(50),
    PRECO        NUMERIC(15,2),
    UNIDADE      VARCHAR(10),
    IMAGEM       BLOB SUB_TYPE 1 SEGMENT SIZE 8192
);



/******************************************************************************/
/*                             Check constraints                              */
/******************************************************************************/

ALTER TABLE PESSOAS ADD CONSTRAINT CK_PES_FLAG_ATIVO CHECK (FLAG_ATIVO IN (0,1));
ALTER TABLE PESSOAS ADD CONSTRAINT CK_PES_FLAG_CLIENTE CHECK (FLAG_CLIENTE IN (0,1));
ALTER TABLE PESSOAS ADD CONSTRAINT CK_PES_FLAG_CONVENIO CHECK (FLAG_CONVENIO IN (0,1));
ALTER TABLE PESSOAS ADD CONSTRAINT CK_PES_FLAG_FORNECEDOR CHECK (FLAG_FORNECEDOR IN (0,1));
ALTER TABLE PESSOAS ADD CONSTRAINT CK_PES_FLAG_TRANSPORT CHECK (FLAG_TRANSPORT IN (0,1));
ALTER TABLE PESSOAS ADD CONSTRAINT CK_PES_FLAG_VENDEDOR CHECK (FLAG_VENDEDOR IN (0,1));
ALTER TABLE PESSOAS ADD CONSTRAINT CK_PES_TIPO_CLASSIFICACAO CHECK ("TIPO_CLASSIFICACAO"=0 OR "TIPO_CLASSIFICACAO"=1 OR "TIPO_CLASSIFICACAO"=2 OR "TIPO_CLASSIFICACAO"=3);


/******************************************************************************/
/*                                Primary keys                                */
/******************************************************************************/

ALTER TABLE HISTORICO_LOG ADD CONSTRAINT PK_HISTORICO_LOG PRIMARY KEY (CODIGO);
ALTER TABLE PARAMETROS ADD CONSTRAINT PK_PARAMETROS PRIMARY KEY (CODIGO);
ALTER TABLE PEDIDOS ADD PRIMARY KEY (COD_PEDIDO);
ALTER TABLE PEDIDOS_ITENS ADD CONSTRAINT PK_PEDIDOS_ITEM PRIMARY KEY (COD_PEDIDO, COD_ITEM);
ALTER TABLE PESSOAS ADD CONSTRAINT PK_PESSOA PRIMARY KEY (COD_PESSOA);
ALTER TABLE PRODUTO ADD CONSTRAINT PK_PRODUTO PRIMARY KEY (COD_PRODUTO);


/******************************************************************************/
/*                                Foreign keys                                */
/******************************************************************************/

ALTER TABLE PEDIDOS_ITENS ADD CONSTRAINT FK_PEDIDOS_COD_PEDIDO FOREIGN KEY (COD_PEDIDO) REFERENCES PEDIDOS (COD_PEDIDO);


/******************************************************************************/
/*                                  Triggers                                  */
/******************************************************************************/



SET TERM ^ ;



/******************************************************************************/
/*                            Triggers for tables                             */
/******************************************************************************/



/* Trigger: HISTORICO_LOG_BIU0 */
CREATE OR ALTER TRIGGER HISTORICO_LOG_BIU0 FOR HISTORICO_LOG
ACTIVE BEFORE INSERT OR UPDATE POSITION 0
AS
begin
  new.data = current_date;
  new.hora = current_time;
end
^

/* Trigger: PEDIDOS_BIU0 */
CREATE OR ALTER TRIGGER PEDIDOS_BIU0 FOR PEDIDOS
ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0
AS
begin
        new.data = current_date;
        new.hora = current_time;
    
        if (inserting) then
        execute procedure pr_log_grava_historico('Usu�rio: ??? ' || ' Gravando Pedido N�' || new.cod_pedido || ' em ' || new.data || ' �s ' || new.hora);

     --   execute procedure pr_log_grava_historico('Usu�rio: ??? ' || ' Cancelando Pedido N�' || new.cod_pedido || ' em ' || new.data || ' �s ' || new.hora || '. Motivo: ' || new.motivo_cancelamento );
end
^
SET TERM ; ^



/******************************************************************************/
/*                             Stored procedures                              */
/******************************************************************************/



SET TERM ^ ;

CREATE OR ALTER PROCEDURE PR_LOG_GRAVA_HISTORICO (
    DESCRICAO VARCHAR(15000))
AS
declare variable COD integer;
begin
  SELECT
    MAX(CODIGO) + 1
  FROM HISTORICO_LOG
  INTO COD;

  if (COD IS NULL) then
    COD = 1;


  INSERT INTO HISTORICO_LOG VALUES(:COD,'',current_date,current_time,:DESCRICAO);
  suspend;
end^



SET TERM ; ^



/******************************************************************************/
/*                                Descriptions                                */
/******************************************************************************/

COMMENT ON TABLE PESSOAS IS 
'Guarda Todas as Pessoas Relacionadas ao Ambiente.';



/******************************************************************************/
/*                            Fields descriptions                             */
/******************************************************************************/

COMMENT ON COLUMN PESSOAS.COD_PESSOA IS 
'C�digo da Pessoa.';

COMMENT ON COLUMN PESSOAS.RAZAO_SOCIAL IS 
'Raz�o Social ou Nome.';

COMMENT ON COLUMN PESSOAS.NOME_FANTASIA IS 
'Nome Fantasia ou Apelido.';

COMMENT ON COLUMN PESSOAS.CNPJ_CPF IS 
'CPF ou CNPJ.';

COMMENT ON COLUMN PESSOAS.INSCR_MUNICIPAL IS 
'Inscri��o Municipal.';

COMMENT ON COLUMN PESSOAS.TIPO_CLASSIFICACAO IS 
'Classifica��o da Pessoa.
Valores: 0 = Jur�dica;
         1 = F�sica;
         2 = Estrangeiro;
         3 = Produtor Rural;';

COMMENT ON COLUMN PESSOAS.SEXO IS 
'Sexo do Cliente.
Valores: 0 = Masculino;
         1 = Feminino;';

COMMENT ON COLUMN PESSOAS.NACIONALIDADE IS 
'Nacionalidade do Cliente.
Exemplo: Brasileira, Italiana, Espanhola.';

COMMENT ON COLUMN PESSOAS.SITE IS 
'P�gina na Web.';

COMMENT ON COLUMN PESSOAS.DATA_CADASTRO IS 
'Data de Cadastro.';

COMMENT ON COLUMN PESSOAS.OBS_PESSOA IS 
'Observa��o Livre.';

COMMENT ON COLUMN PESSOAS.FLAG_ATIVO IS 
'Indica se a Pessoa est� Ativa.
Valores: 0 = N�o;
         1 = Sim;';

COMMENT ON COLUMN PESSOAS.BLOQUEADO IS 
'Cliente Bloqueado: 
Valores: 0 = N�o Bloqueado;
         1 = Bloqueado;';

COMMENT ON COLUMN PESSOAS.OBS_INATIVO IS 
'Motivo da Inativa��o da Pessoa.';

COMMENT ON COLUMN PESSOAS.HISTORICO IS 
'Hist�rico Livre.';

COMMENT ON COLUMN PESSOAS.FLAG_CLIENTE IS 
'Indica se a Pessoa � um Cliente. Valores: 0 = N�o; 1 = Sim.';

COMMENT ON COLUMN PESSOAS.FLAG_FORNECEDOR IS 
'Indica se a Pessoa � um Fornecedor. Valores: 0 = N�o; 1 = Sim.';

COMMENT ON COLUMN PESSOAS.FLAG_VENDEDOR IS 
'Indica se a Pessoa � um Vendedor. Valores: 0 = N�o; 1 = Sim.';

COMMENT ON COLUMN PESSOAS.FLAG_TRANSPORT IS 
'Indica se a Pessoa � uma Transportadora. Valores: 0 = N�o; 1 = Sim.';

COMMENT ON COLUMN PESSOAS.FLAG_CONVENIO IS 
'Indica se a Pessoa � um Conv�nios. Valores: 0 = N�o; 1 = Sim.';

COMMENT ON COLUMN PESSOAS.FLAG_FUNC IS 
'Indica se a Pessoa � um Funcion�rio. Valores: 0 = N�o; 1 = Sim.';

COMMENT ON COLUMN PESSOAS.DATA_ALTERACAO IS 
'Data da �ltima Altera��o.';

COMMENT ON COLUMN PESSOAS.INSCR_ESTADUAL IS 
'Inscri��o Estadual.';

COMMENT ON COLUMN PESSOAS.RG IS 
'Registro Geral.';

COMMENT ON COLUMN PESSOAS.SUFRAMA IS 
'C�digo no SUFRAMA.';

COMMENT ON COLUMN PESSOAS.EMAIL IS 
'Endere�o Eletr�nico.';

COMMENT ON COLUMN PESSOAS.CONJ_ESTADO_CIVIL IS 
'Estado Civil do Cliente.
Valores: Solteiro(a);
         Casado(a);
         Vi�vo(a);
         Amaziado(a);
         Divorciado(a);';

COMMENT ON COLUMN PESSOAS.CONJ_NOME IS 
'Nome do C�njuge.';

COMMENT ON COLUMN PESSOAS.CONJ_RENDA IS 
'Renda em R$ do C�njuge.';

COMMENT ON COLUMN PESSOAS.CONJ_CPF IS 
'CPF do C�njuge.';

COMMENT ON COLUMN PESSOAS.CONJ_PROFISSAO IS 
'Profiss�o do C�njuge.';

COMMENT ON COLUMN PESSOAS.CONJ_REGIME IS 
'Regime de Bens. Exemplo: Comunh�o de Bens.';

COMMENT ON COLUMN PESSOAS.CONJ_TRABALHO IS 
'Local de Trabalho do C�njuge.';

COMMENT ON COLUMN PESSOAS.CONJ_RG IS 
'RG do C�njuge.';

