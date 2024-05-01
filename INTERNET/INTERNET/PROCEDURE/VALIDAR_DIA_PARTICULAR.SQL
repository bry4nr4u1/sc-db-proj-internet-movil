USE [INTERNET]
GO
/****** Object:  StoredProcedure [INTERNET].[Validar_Dia_Particular]    Script Date: 1/05/2024 07:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
** PROCEDIMIENTO : Validar_Dia_Particular
*/

CREATE PROCEDURE [INTERNET].[Validar_Dia_Particular]
	@p_FecMed 		DATE,
	@p_ValDiapMed 	TINYINT OUTPUT
AS
 BEGIN   
   IF DATEPART(DW, @p_FecMed) IN (1,2,3,4,5,6)
	   BEGIN
		 SET @p_ValDiapMed = 1;
	   END
   ELSE
	   BEGIN
		 SET @p_ValDiapMed = 0;
	   END
 END
GO
