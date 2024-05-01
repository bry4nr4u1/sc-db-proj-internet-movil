USE [INTERNET]
GO
/****** Object:  StoredProcedure [INTERNET].[Validar_Velocidad_Garantizada]    Script Date: 1/05/2024 07:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
** PROCEDIMIENTO : Validar_Velocidad_Garantizada
*/

CREATE PROCEDURE [INTERNET].[Validar_Velocidad_Garantizada]
	@p_DwLink 		DECIMAL(7,4) = NULL,
	@p_UpLink 		DECIMAL(7,4) = NULL,
	@p_IdeOpe 		CHAR(3),
	@p_IdeTec 		VARCHAR(10),
	@p_ValVelgDwl 	TINYINT OUTPUT,
	@p_ValVelgUpl 	TINYINT OUTPUT
AS
 BEGIN
   DECLARE @v_Valor_DwCtta FLOAT,
		   @v_Valor_UpCtta FLOAT,
		   @v_Vel_Gar_Dw FLOAT,
		   @v_Vel_Gar_Up FLOAT;
   
   SELECT @v_Valor_DwCtta = DWCTTA,
	      @v_Valor_UpCtta = UPCTTA
     FROM INTERNET.VELOCIDAD
    WHERE IDEOPE = @p_IdeOpe
      AND IDETEC = @p_IdeTec;
   
   IF @p_DwLink IS NULL
	   BEGIN
		 SET @p_ValVelgDwl = 0;
	   END
   ELSE
	   BEGIN
		 SET @v_Vel_Gar_Dw = (0.4)*(@v_Valor_DwCtta)

		 IF (@p_DwLink >= @v_Vel_Gar_Dw)
			 BEGIN
				 SET @p_ValVelgDwl = 1;
			 END
		 ELSE
			 BEGIN
				 SET @p_ValVelgDwl = 0;
			 END
	    END
   
   IF @p_UpLink IS NULL
	   BEGIN
		 SET @p_ValVelgUpl = 0;
	   END
   ELSE
	   BEGIN 
		 SET @v_Vel_Gar_Up = (0.4)*(@v_Valor_UpCtta)

		 IF (@p_UpLink >= @v_Vel_Gar_Up)
			 BEGIN
				 SET @p_ValVelgUpl = 1;
			 END
		 ELSE
			 BEGIN
				 SET @p_ValVelgUpl = 0;
			 END
	    END
 END
GO
