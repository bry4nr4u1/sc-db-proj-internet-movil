USE [INTERNET]
GO
/****** Object:  Trigger [INTERNET].[tr_Registrar_Actividad]    Script Date: 1/05/2024 09:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Crear el trigger
CREATE TRIGGER [INTERNET].[tr_Registrar_Actividad]
ON [INTERNET].[ACTIVIDAD]
AFTER INSERT
AS
BEGIN
    PRINT 'Se ha insertado una nueva Actividad.';
END;
GO