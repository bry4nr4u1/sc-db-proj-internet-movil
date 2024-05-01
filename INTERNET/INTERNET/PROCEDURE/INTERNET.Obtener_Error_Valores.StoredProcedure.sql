USE [INTERNET]
GO
/****** Object:  StoredProcedure [INTERNET].[Obtener_Error_Valores]    Script Date: 1/05/2024 07:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
** PROCEDIMIENTO : Obtener_Error_Valores
*/

CREATE PROCEDURE [INTERNET].[Obtener_Error_Valores]
    @p_CodErr	 INTEGER,
	@p_DscErr    VARCHAR(1000),
	@p_NomArcErr VARCHAR(200),
	@p_TipErr	 VARCHAR(50) OUTPUT,
	@p_NomTipErr VARCHAR(50) OUTPUT,
	@p_TabErr	 VARCHAR(50) OUTPUT,
	@p_ColErr	 VARCHAR(50) OUTPUT,
	@p_Anno		 INTEGER OUTPUT,
    @p_Tipo	     CHAR(1) OUTPUT,
	@p_Numero    INTEGER OUTPUT,
	@p_IdeAct    CHAR(3) OUTPUT,
	@p_IdeSup    CHAR(8) OUTPUT
AS
 BEGIN
   SELECT @p_TipErr	   = MAX(CASE WHEN CHARINDEX(TIPERR,UPPER(@p_DscErr) COLLATE Latin1_General_CI_AI)>0 THEN TIPERR ELSE '' END),
		  @p_NomTipErr = MAX(CASE WHEN CHARINDEX(NOMTIPERR,UPPER(@p_DscErr) COLLATE Latin1_General_CI_AI)>0 THEN NOMTIPERR ELSE '' END),
		  @p_TabErr	   = MAX(CASE WHEN CHARINDEX(TABERR,UPPER(@p_DscErr) COLLATE Latin1_General_CI_AI)>0 THEN TABERR ELSE '' END),
		  @p_ColErr	   = MAX(CASE WHEN CHARINDEX(COLERR,UPPER(@p_DscErr) COLLATE Latin1_General_CI_AI)>0 THEN COLERR ELSE '' END)
     FROM INTERNET.MAESTRO_ERROR
    WHERE CODERR = @p_CodErr;  

   SELECT @p_Anno = ANNO,
	      @p_Tipo = TIPO,
	      @p_Numero = NUMERO,
	      @p_IdeAct = IDEACT  
     FROM INTERNET.PERIODO
    WHERE STSPER = 'ACT';

	SET @p_IdeSup = SUBSTRING(@p_NomArcErr,LEN(@p_NomArcErr)-CHARINDEX('_',REVERSE(@p_NomArcErr))+2,LEN(@p_NomArcErr));

 END
GO
