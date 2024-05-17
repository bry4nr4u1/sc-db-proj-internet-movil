USE [INTERNET]
GO
/****** Object:  UserDefinedFunction [INTERNET].[Validar_Periodo]    Script Date: 1/05/2024 07:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
** FUNCION : Validar_Periodo
*/

CREATE FUNCTION [INTERNET].[Validar_Periodo](@p_FecMed date)
RETURNS BIT
AS
 BEGIN
   DECLARE @v_feciniper DATE,
		   @v_fecfinper DATE,
		   @resultado TINYINT
   
   SELECT @v_feciniper = feciniper,
		  @v_fecfinper = fecfinper
	 FROM INTERNET.PERIODO
    WHERE STSPER = 'ACT';

   IF @p_FecMed BETWEEN @v_feciniper AND @v_fecfinper
	   BEGIN
		 SET @resultado = 1
	   END
   ELSE
	   BEGIN
		 SET @resultado = 0
	   END
   RETURN @resultado;
 END
GO
