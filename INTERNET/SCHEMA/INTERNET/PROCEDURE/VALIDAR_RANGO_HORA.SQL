USE [INTERNET]
GO
/****** Object:  StoredProcedure [INTERNET].[Validar_Rango_Hora]    Script Date: 1/05/2024 07:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
** PROCEDIMIENTO : Validar_Rango_Hora
*/

CREATE PROCEDURE [INTERNET].[Validar_Rango_Hora]
	@p_HraMed 		VARCHAR(5),
	@p_ValHoraMed 	TINYINT OUTPUT
AS
 BEGIN   
   DECLARE @v_HraMed TIME;

   IF @p_HraMed NOT LIKE '[0-9][0-9]:[0-9][0-9]'
	   BEGIN
		 SET @p_ValHoraMed = 0;
	   END
   ELSE
	   BEGIN
		 SET @v_HraMed = CONVERT(TIME,@p_HraMed);

	     IF @v_HraMed BETWEEN CONVERT(TIME,'10:00') AND CONVERT(TIME,'23:59')
		     BEGIN
			   SET @p_ValHoraMed = 1;
		     END
	     ELSE
		     BEGIN
			   SET @p_ValHoraMed = 0;
		     END
	   END 
 END
GO
