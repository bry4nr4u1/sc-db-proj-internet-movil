USE [INTERNET]
GO
/****** Object:  StoredProcedure [INTERNET].[Validar_Dia_Feriado]    Script Date: 1/05/2024 07:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
** FUNCION : Validar_Dia_Feriado
*/ 

CREATE PROCEDURE [INTERNET].[Validar_Dia_Feriado]
	@p_FecMed 		DATE,
	@p_ValDiafMed 	TINYINT OUTPUT
AS
 BEGIN
   DECLARE @v_MesFecMed TINYINT

   SET @v_MesFecMed = DATEPART(MONTH, @p_FecMed)

   IF @v_MesFecMed NOT IN (1,4,5,6,7,8,10,11,12)
	   BEGIN
		 SET @p_ValDiafMed = 1
	   END
   ELSE
	   BEGIN
	     IF DATEPART(quarter,@p_FecMed) <=2
			BEGIN
				SET @p_ValDiafMed =
					CASE @v_MesFecMed 
					  WHEN 1 THEN 
						CASE WHEN DATEPART(DAY, @p_FecMed) = 1 THEN 0 ELSE 1 END
					  WHEN 4 THEN 
						CASE WHEN (DATEPART(DAY, @p_FecMed) = 18 OR DATEPART(DAY, @p_FecMed) = 19) 
						  THEN 0 ELSE 1 END
					  WHEN 5 THEN 
						CASE WHEN DATEPART(DAY, @p_FecMed) = 1 THEN 0 ELSE 1 END
					  WHEN 6 THEN 
						CASE WHEN DATEPART(DAY, @p_FecMed) = 29 THEN 0 ELSE 1 END
					  END
			END
		 ELSE
			BEGIN
				SET @p_ValDiafMed =
					CASE @v_MesFecMed 
					  WHEN 7 THEN 
						CASE WHEN (DATEPART(DAY, @p_FecMed) = 26 OR DATEPART(DAY, @p_FecMed) = 27 OR DATEPART(DAY, @p_FecMed) = 28 OR DATEPART(DAY, @p_FecMed) = 29 OR DATEPART(DAY, @p_FecMed) = 30) 
						  THEN 0 ELSE 1 END
					  WHEN 8 THEN 
						CASE WHEN (DATEPART(DAY, @p_FecMed) = 29 OR DATEPART(DAY, @p_FecMed) = 30) THEN 0 ELSE 1 END
					  WHEN 10 THEN 
						CASE WHEN (DATEPART(DAY, @p_FecMed) = 8 OR DATEPART(DAY, @p_FecMed) = 31) THEN 0 ELSE 1 END
					  WHEN 11 THEN 
						CASE WHEN DATEPART(DAY, @p_FecMed) = 1 THEN 0 ELSE 1 END
					  WHEN 12 THEN 
						CASE WHEN (DATEPART(DAY, @p_FecMed) = 8 OR DATEPART(DAY, @p_FecMed) = 25) 
						  THEN 0 ELSE 1 END
					  END
			END
	   END
	/*
   --EXCEPCION DE DIAS FERIADOS
   IF (@v_MesFecMed = 10 AND DATEPART(DAY, @p_FecMed) = 31)
     BEGIN
		SET @p_ValDiafMed = 1
	 END
   */
 END
GO
