USE [INTERNET]
GO
/****** Object:  StoredProcedure [INTERNET].[Validar_Mediciones]    Script Date: 1/05/2024 07:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
** PROCEDIMIENTO : Validar_Mediciones
*/

CREATE PROCEDURE [INTERNET].[Validar_Mediciones]
	@p_DwLink 		DECIMAL(7,4) = NULL,
	@p_UpLink 		DECIMAL(7,4) = NULL,
	@p_HraMed 		VARCHAR(5),
	@p_FecMed 		DATE,
	@p_IdeOpe 		CHAR(3),
	@p_IdeTec 		VARCHAR(10),
	@p_ValNmroDwl 	TINYINT OUTPUT,
	@p_ValNmroUpl 	TINYINT OUTPUT,
	@p_ValHoraMed 	TINYINT OUTPUT,
	@p_ValDiapMed 	TINYINT OUTPUT,
	@p_ValDiafMed 	TINYINT OUTPUT,
	@p_ValVelgDwl 	TINYINT OUTPUT,
	@p_ValVelgUpl 	TINYINT OUTPUT
AS
 BEGIN   
  
   /*Validacion de formato de numero*/
   EXEC INTERNET.Validar_Formato_Numero @p_DwLink,@p_UpLink,@p_ValNmroDwl OUTPUT,@p_ValNmroUpl OUTPUT
   
   /*Validacion de horas de medicion*/
   EXEC INTERNET.Validar_Rango_Hora @p_HraMed,@p_ValHoraMed OUTPUT

   /*Validacion de dias particulares*/
   EXEC INTERNET.Validar_Dia_Particular @p_FecMed,@p_ValDiapMed OUTPUT

   /*Validacion de dias feriado*/
   EXEC INTERNET.Validar_Dia_Feriado @p_FecMed,@p_ValDiafMed OUTPUT

   /*Validacion de velocidad garantizada*/
   EXEC INTERNET.Validar_Velocidad_Garantizada @p_DwLink,@p_UpLink,@p_IdeOpe,@p_IdeTec,@p_ValVelgDwl OUTPUT,@p_ValVelgUpl OUTPUT
											   					   					   
 END
GO
