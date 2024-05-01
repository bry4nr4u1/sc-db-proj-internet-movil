USE [INTERNET]
GO
/****** Object:  StoredProcedure [INTERNET].[Obtener_Codigo_Supervisor_Archivo]    Script Date: 1/05/2024 07:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
** PROCEDIMIENTO : Obtener_Codigo_Supervisor_Archivo
*/

CREATE PROCEDURE [INTERNET].[Obtener_Codigo_Supervisor_Archivo]
	@p_NomArc 	VARCHAR(200),
	@p_IdeSup 	VARCHAR(8) OUTPUT
AS
 BEGIN         
   SET @p_IdeSup = SUBSTRING(@p_NomArc,LEN(@p_NomArc)-CHARINDEX('_',REVERSE(@p_NomArc))+2,LEN(@p_NomArc));
 END
GO
