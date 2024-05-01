USE [INTERNET]
GO
/****** Object:  UserDefinedFunction [INTERNET].[Obtener_Valor_Configuracion]    Script Date: 1/05/2024 07:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
** FUNCTION : Obtener_Valor_Configuracion
*/

CREATE FUNCTION [INTERNET].[Obtener_Valor_Configuracion](@p_CodCfg CHAR(6),@p_CodPrm VARCHAR(50),@p_ClvPrm VARCHAR(50))
RETURNS VARCHAR(MAX)
AS
 BEGIN
   DECLARE @v_Valor VARCHAR(1000);

   SELECT @v_Valor = VALOR
	 FROM INTERNET.CONFIG_PARAM_ACTIVIDAD
    WHERE STSCFG = 'ACT'
	  AND CODCFG = @p_CodCfg
	  AND CODPRM = @p_CodPrm
	  AND CLVPRM = @p_ClvPrm;

   RETURN @v_Valor;
 END
GO
