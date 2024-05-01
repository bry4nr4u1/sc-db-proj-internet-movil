USE [INTERNET]
GO
/****** Object:  StoredProcedure [INTERNET].[Validar_Formato_Numero]    Script Date: 1/05/2024 07:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
**
** [Creacion funciones, procedimientos y disparadores en la base de datos INTERNET]
**
*/

/*
** PROCEDIMIENTO : Validar_Formato_Numero
*/

CREATE PROCEDURE [INTERNET].[Validar_Formato_Numero]
	@p_DwLink 	  	DECIMAL(7,4) = NULL,
	@p_UpLink 		DECIMAL(7,4) = NULL,
	@p_ValNmroDwl 	TINYINT OUTPUT,
	@p_ValNmroUpl 	TINYINT OUTPUT
AS
 BEGIN   
   IF @p_DwLink IS NULL
	   BEGIN
		 SET @p_ValNmroDwl = 0;
	   END
   ELSE
	   BEGIN
		 SET @p_ValNmroDwl = 1;
	   END
   
   IF @p_UpLink IS NULL
	   BEGIN
		 SET @p_ValNmroUpl = 0;
	   END
   ELSE
	   BEGIN
		 SET @p_ValNmroUpl = 1;
	   END
 END
GO
