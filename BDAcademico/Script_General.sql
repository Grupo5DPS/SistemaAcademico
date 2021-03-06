USE [BDAcademico]
GO
/****** Object:  Table [dbo].[TAlumno]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAlumno](
	[CodAlumno] [char](5) NOT NULL,
	[APaterno] [varchar](50) NOT NULL,
	[AMaterno] [varchar](50) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[CodCarrera] [char](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAsignatura]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAsignatura](
	[CodAsignatura] [char](3) NOT NULL,
	[Asignatura] [varchar](50) NOT NULL,
	[CodRequisito] [char](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodAsignatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TCarga]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCarga](
	[IdCarga] [int] NOT NULL,
	[CodDocente] [char](3) NOT NULL,
	[CodAsignatura] [char](3) NOT NULL,
	[Semestre] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCarga] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TCarrera]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCarrera](
	[CodCarrera] [char](3) NOT NULL,
	[Carrera] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TDocente]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TDocente](
	[CodDocente] [char](3) NOT NULL,
	[APaterno] [varchar](50) NOT NULL,
	[AMaterno] [varchar](50) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodDocente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TNotas]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TNotas](
	[CodAlumno] [char](5) NOT NULL,
	[CodAsignatura] [char](3) NOT NULL,
	[Semestre] [varchar](20) NOT NULL,
	[Parcial1] [decimal](4, 2) NULL,
	[Parcial2] [decimal](4, 2) NULL,
	[NotaFinal] [decimal](4, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodAlumno] ASC,
	[CodAsignatura] ASC,
	[Semestre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TUsuario]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TUsuario](
	[Usuario] [varchar](50) NOT NULL,
	[Contrasena] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TAlumno]  WITH CHECK ADD FOREIGN KEY([CodCarrera])
REFERENCES [dbo].[TCarrera] ([CodCarrera])
GO
ALTER TABLE [dbo].[TAlumno]  WITH CHECK ADD FOREIGN KEY([Usuario])
REFERENCES [dbo].[TUsuario] ([Usuario])
GO
ALTER TABLE [dbo].[TAsignatura]  WITH CHECK ADD FOREIGN KEY([CodRequisito])
REFERENCES [dbo].[TAsignatura] ([CodAsignatura])
GO
ALTER TABLE [dbo].[TCarga]  WITH CHECK ADD FOREIGN KEY([CodAsignatura])
REFERENCES [dbo].[TAsignatura] ([CodAsignatura])
GO
ALTER TABLE [dbo].[TCarga]  WITH CHECK ADD FOREIGN KEY([CodDocente])
REFERENCES [dbo].[TDocente] ([CodDocente])
GO
ALTER TABLE [dbo].[TDocente]  WITH CHECK ADD FOREIGN KEY([Usuario])
REFERENCES [dbo].[TUsuario] ([Usuario])
GO
ALTER TABLE [dbo].[TNotas]  WITH CHECK ADD FOREIGN KEY([CodAlumno])
REFERENCES [dbo].[TAlumno] ([CodAlumno])
GO
ALTER TABLE [dbo].[TNotas]  WITH CHECK ADD FOREIGN KEY([CodAsignatura])
REFERENCES [dbo].[TAsignatura] ([CodAsignatura])
GO
/****** Object:  StoredProcedure [dbo].[spActualizarAlumno]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spActualizarAlumno]
@CodAlumno char (5) ,
@APaterno varchar (50),
@AMaterno varchar (50),
@Nombres varchar (50) ,
@Usuario varchar (50) ,
@CodCarrera char (3),
@Contrasena	varchar(50)
as
begin
	--VAlidar CodAlumno
	if  exists (select CodAlumno from TAlumno where CodAlumno=@CodAlumno)
		--Validar Usuario
		if  exists (select Usuario from TUsuario where Usuario=@Usuario)
			--Validar CodCarrera
			if exists (select CodCarrera from TCarrera where CodCarrera=@CodCarrera)
			begin
				begin tran TransacAgregar --Iniciar la transaccion explicita
				begin try
					update TUsuario set Contrasena=@Contrasena where Usuario=@Usuario
					update TAlumno set CodCarrera=@CodCarrera where CodAlumno=@CodAlumno
					commit tran TransacAgregar
					select CodError = 0, Mensaje= 'Se actualizó Usuario y Alumno en TUsuario y TAlumno'
				end try
				begin catch
					Rollback tran TransacAgregar
					select CodError = 1, Mensaje= 'Error: No se ejecutó la transaccion' 
				end catch
			end
			else select CodError=1, Mensaje= 'Error: CodCarrera no existe en TCarrera'
		else select CodError = 1, Mensaje ='Error: Usuario no existe en TUsuario'
	else select CodError = 1, Mensaje = 'Error: CodAlumno existe en TAlumno'

end
GO
/****** Object:  StoredProcedure [dbo].[spActualizarAsignatura]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spActualizarAsignatura]
@CodAsignatura char(3), @Asignatura varchar(50),@CodRequisito char(3)
as
begin
	--validar que la Asignatura que exista
	if exists(select CodAsignatura from TAsignatura where CodAsignatura=@CodAsignatura)
		if not exists(select @Asignatura from TAsignatura where Asignatura=@Asignatura)
		begin
			update TAsignatura set Asignatura=@Asignatura, CodRequisito=@CodRequisito where CodAsignatura=@CodAsignatura
			select CodError=0, Mensaje='Asignatura actualizada en TAsignatura'
		end
		else select CodError=1, Mensaje='ERROR: Asignatura duplicada en TAsignatura'
	else select CodError=1, Mensaje='ERROR: Asignatura no existe en TAsignatura'
end
GO
/****** Object:  StoredProcedure [dbo].[spActualizarCarga]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spActualizarCarga]
@IdCarga int, @CodDocente char(3),@CodAsignatura char(3), @Semestre varchar(20)
as
begin
	--validar que el Codigo de Carga exista
	if exists(select IdCarga from TCarga where IdCarga=@IdCarga)
		if not exists(select CodAsignatura from TCarga where CodAsignatura=@CodAsignatura)
		begin
			update TCarga set CodDocente=@CodDocente,CodAsignatura=@CodAsignatura, Semestre=@Semestre where IdCarga=@IdCarga
			select CodError=0, Mensaje='Carga actualizada en TCarga'
		end
		else select CodError=1, Mensaje='ERROR: Asignatura duplicada en TCarga'
	else select CodError=1, Mensaje='ERROR: Carga no existe en TCarga'
end
GO
/****** Object:  StoredProcedure [dbo].[spActualizarCarrera]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spActualizarCarrera]
@CodCarrera char(3), @Carrera varchar(50)
as
begin
	--validar que el Codigo de carrera exista
	if exists(select CodCarrera from TCarrera where CodCarrera=@CodCarrera)
		if not exists(select Carrera from TCarrera where Carrera=@Carrera)
		begin
			update TCarrera set Carrera=@Carrera where CodCarrera=@Codcarrera
			select CodError=0, Mensaje='Carrera actualizada en TCarrera'
		end
		else select CodError=1, Mensaje='ERROR: Carrera duplicada en TCarrera'
	else select CodError=1, Mensaje='ERROR: Carrera no existe en TCarrera'
end
GO
/****** Object:  StoredProcedure [dbo].[spActualizarDocente]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spActualizarDocente]
@CodDocente char (5) ,
@APaterno varchar (50),
@AMaterno varchar (50),
@Nombres varchar (50) 
as
begin
	--VAlidar CodDocente
	if exists (select CodDocente from TDocente where CodDocente=@CodDocente)
		--Validar Usuario
			begin
					update TDocente set APaterno=@APaterno,AMaterno=@AMaterno,Nombres=@Nombres where CodDocente=@CodDocente
					select CodError = 0, Mensaje= 'Se actualizó Usuario y Docente en TDocente'
			end
	else select CodError = 1, Mensaje = 'Error: CodDocente no existe en TDocente'
end
GO
/****** Object:  StoredProcedure [dbo].[spActualizarNotas]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spActualizarNotas]
@CodAlumno	char(5), @CodAsignatura	char(3), @Semestre varchar(20),	@Parcial1 decimal(4,2), @Parcial2 decimal(4,2), @NotaFinal decimal(4,2)
as
begin
	--Validar que las Notas existan
	if exists(select @CodAlumno, @CodAsignatura from TNotas where CodAlumno= @CodAlumno AND CodAsignatura = @CodAsignatura)
		begin
			update TNotas set Semestre = @Semestre, Parcial1 = @Parcial1, Parcial2 = @Parcial2, NotaFinal = @NotaFinal where 
			CodAlumno= @CodAlumno AND CodAsignatura = @CodAsignatura
			select CodError = 0, Mensaje = 'Notas actualizadas en TNotas'
		end
	else select CodError = 1, Mensaje = 'Error: Los datos ingresados no pueden actualizar las notas solicitadas'
end
GO
/****** Object:  StoredProcedure [dbo].[spActualizarUsuario]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spActualizarUsuario]
@Usuario varchar(50), @Contrasena varchar(50)
as
begin
	--validar que el Usuario que exista
	if exists(select Usuario from TUsuario where Usuario=@Usuario)
		if not exists(select Contrasena from TUsuario where Contrasena=@Contrasena)
		begin
			update TUsuario set Contrasena=@Contrasena where Usuario=@Usuario
			select CodError=0, Mensaje='Contrasena actualizada en TUsuario'
		end
		else select CodError=1, Mensaje='ERROR: Contraseña duplicada en TUsuario'
	else select CodError=1, Mensaje='ERROR: Usuario no existe en TUsuario'
end
GO
/****** Object:  StoredProcedure [dbo].[spAgregarAlumno]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spAgregarAlumno]
@CodAlumno char (5) ,
@APaterno varchar (50),
@AMaterno varchar (50),
@Nombres varchar (50) ,
@Usuario varchar (50) ,
@CodCarrera char (3),
@Contrasena	varchar(50)
as
begin
	--VAlidar CodAlumno
	if not exists (select CodAlumno from TAlumno where CodAlumno=@CodAlumno)
		--Validar Usuario
		if not exists (select Usuario from TUsuario where Usuario=@Usuario)
			--Validar CodCarrera
			if exists (select CodCarrera from TCarrera where CodCarrera=@CodCarrera)
			begin
				begin tran TransacAgregar --Iniciar la transaccion explicita
				begin try
					insert into TUsuario values(@Usuario,@Contrasena)
					insert into TAlumno values(@CodAlumno,@APaterno,@AMaterno,@Nombres,@Usuario,@CodCarrera)
					commit tran TransacAgregar
					select CodError = 0, Mensaje= 'Se agregó Usuario y Alumno en TUsuario y TAlumno'
				end try
				begin catch
					Rollback tran TransacAgregar
					select CodError = 1, Mensaje= 'Error: No se ejecutó la transaccion' 
				end catch
			end
			else select CodError=1, Mensaje= 'Error: CodCarrera no existe en TCarrera'
		else select CodError = 1, Mensaje ='Error: Usuario existe en TUsuario'
	else select CodError = 1, Mensaje = 'Error: CodAlumno existe en TAlumno'

end

execute spAgregarAlumno 'A0031','Alvarez','Astete','Anthony','tony','C03','123'
GO
/****** Object:  StoredProcedure [dbo].[spAgregarAsignatura]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spAgregarAsignatura]

@CodAsignatura char(3), @Asignatura varchar(50), @CodRequisito char(3)
as
begin
	---validacion de parametro CodError=0(Correcto), CodError=1,(Error)
	---validar la clave primaria
	if not exists(select CodAsignatura from TAsignatura where CodAsignatura=@CodAsignatura)
	---validar que la Asignatura no se duplique
		if not exists(select Asignatura from TAsignatura where Asignatura=@Asignatura)
		begin
			insert into TAsignatura values(@CodAsignatura,@Asignatura, @CodRequisito)
			select CodError=0,Mensaje='Asignatura insertada en TAsignatura'
		end
		else select CodError = 1, Mensaje='Error: Clave Duplicada en TAsignatura'
	else select CodError=1, Mensaje='Error: Clave duplicada en TAsignatura'
end 
GO
/****** Object:  StoredProcedure [dbo].[spAgregarCarga]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spAgregarCarga]

@IdCarga int, @CodDocente char(3),@CodAsignatura char(3), @Semestre varchar(20)
as
begin
	---validacion de parametro CodError=0(Correcto), CodError=1,(Error)
	---validar la clave primaria
	if not exists(select IdCarga from TCarga where IdCarga=@IdCarga)
	---validar que la asignatura no se duplique
		if exists(select CodAsignatura from TCarga where CodAsignatura=@CodAsignatura)
			if not exists(select Semestre from TCarga where Semestre=@Semestre)
			begin
				insert into TCarga values(@IdCarga,@CodDocente,@CodAsignatura,@Semestre)
				select CodError=0,Mensaje='Carga insertada en TCarga'
			end
			else select CodError = 1, Mensaje='Error: Carga Duplicada en el semestre en TCarga'
		else 
		begin
			insert into TCarga values(@IdCarga,@CodDocente,@CodAsignatura,@Semestre)
			select CodError=0,Mensaje='Carga insertada en TCarga'
		end
	else select CodError=1, Mensaje='Error: ID duplicada en TCarga'	
end 
GO
/****** Object:  StoredProcedure [dbo].[spAgregarCarrera]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spAgregarCarrera]

@CodCarrera char(3), @Carrera varchar(50)
as
begin
	---validacion de parametro CodError=0(Correcto), CodError=1,(Error)
	---validar la clave primaria
	if not exists(select CodCarrera from TCarrera where CodCarrera=@CodCarrera)
	---validar que la carrera no se duplique
		if not exists(select Carrera from TCarrera where Carrera=@Carrera)
		begin
			insert into TCarrera values(@CodCarrera,@Carrera)
			select CodError=0,Mensaje='Carrera insertada en Tcarrera'
		end
		else select CodError = 1, Mensaje='Error: Clave Duplicada en TCarrera'
	else select CodError=1, Mensaje='Error: Clave duplicada en TCarrera'

	
end 
GO
/****** Object:  StoredProcedure [dbo].[spAgregarDocente]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spAgregarDocente]
@CodDocente char (5) ,
@APaterno varchar (50),
@AMaterno varchar (50),
@Nombres varchar (50) ,
@Usuario varchar (50) ,
@Contrasena	varchar(50)
as
begin
	--VAlidar CodDocente
	if not exists (select CodDocente from TDocente where CodDocente=@CodDocente)
		--Validar Usuario
		if not exists (select Usuario from TUsuario where Usuario=@Usuario)
			--Validar CodCarrera
			begin
				begin tran TransacAgregar --Iniciar la transaccion explicita
				begin try
					insert into TUsuario values(@Usuario,@Contrasena)
					insert into TDocente values(@CodDocente,@APaterno,@AMaterno,@Nombres,@Usuario)
					commit tran TransacAgregar
					select CodError = 0, Mensaje= 'Se agregó Usuario y Docente en TUsuario y TDocente'
				end try
				begin catch
					Rollback tran TransacAgregar
					select CodError = 1, Mensaje= 'Error: No se ejecutó la transaccion' 
				end catch
			end
			
		else select CodError = 1, Mensaje ='Error: Usuario existe en TUsuario'
	else select CodError = 1, Mensaje = 'Error: CodDocente existe en TDocente'

end
GO
/****** Object:  StoredProcedure [dbo].[spAgregarNotas]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spAgregarNotas]
@CodAlumno	char(5), @CodAsignatura	char(3), @Semestre varchar(20),	@Parcial1 decimal(4,2), @Parcial2 decimal(4,2), @NotaFinal decimal(4,2)
as
begin
	--Validacion de parametros
	--Validar la clave primaria
	if not exists(select @CodAlumno, @CodAsignatura from TNotas where CodAlumno= @CodAlumno AND CodAsignatura = @CodAsignatura)
	--Validar que la asignatura exista
		if exists(select CodAsignatura from TAsignatura where CodAsignatura = @CodAsignatura)
		begin
			insert into TNotas values (@CodAlumno, @CodAsignatura, @Semestre, @Parcial1, @Parcial2, @NotaFinal)
			select CodError = 0, Mensaje= 'Notas insertadas en TNotas'
		end
		else select CodError = 1, Mensaje = 'Error: La asignatura ingresada no existe'
	else select CodError=1, Mensaje = 'Error: Este alumno ya cuenta con notas ingresadas en ese curso'
end
GO
/****** Object:  StoredProcedure [dbo].[spAgregarUsuario]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spAgregarUsuario]

@Usuario varchar(50), @Contrasena varchar(50)
as
begin
	---validacion de parametro CodError=0(Correcto), CodError=1,(Error)
	---validar la clave primaria
	if not exists(select Usuario from TUsuario where Usuario=@Usuario)
	---validar que la carrera no se duplique
		if not exists(select Contrasena from TUsuario where Contrasena=@contrasena)
		begin
			insert into TUsuario values(@Usuario,@Contrasena)
			select CodError=0,Mensaje='Usuario insertado en TUsuario'
		end
		else select CodError = 1, Mensaje='Error: Clave Duplicada en TUsuario'
	else select CodError=1, Mensaje='Error: Clave duplicada en TUsuario'
end 
GO
/****** Object:  StoredProcedure [dbo].[spBuscarAlumno]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spBuscarAlumno]
@Texto varchar(50), @Criterio varchar(20)
as 
begin
	if (@Criterio = 'CodAlumno')
		select CodAlumno, Usuario from TAlumno where CodAlumno = @Texto

end
GO
/****** Object:  StoredProcedure [dbo].[spBuscarAsignatura]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spBuscarAsignatura] 
@Texto varchar(50), @Criterio varchar(50)
as
begin
	If(@Criterio='CodAsignatura ')
		select CodAsignatura , Asignatura , CodRequisito from TAsignatura where CodAsignatura=@Texto
	else if (@Criterio='Asignatura')
		select CodAsignatura , Asignatura , CodRequisito from TAsignatura where Asignatura=@Texto
			else if (@Criterio='Requisito')
				select CodAsignatura , Asignatura , CodRequisito from TAsignatura where CodRequisito=@Texto
end
GO
/****** Object:  StoredProcedure [dbo].[spBuscarCarga]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spBuscarCarga]
@Texto varchar(50), @Criterio varchar(50)
as
begin
	If(@Criterio='IdCarga')
		select IdCarga, CodDocente,CodAsignatura,Semestre from TCarga where IdCarga=@Texto
	else if (@Criterio='CodDocente')
		select IdCarga, CodDocente,CodAsignatura,Semestre from TCarga where CodDocente=@Texto
	else if (@Criterio='CodAsignatura')
		select IdCarga, CodDocente,CodAsignatura,Semestre from TCarga where CodAsignatura=@Texto
	else if (@Criterio='Semestre')
		select IdCarga, CodDocente,CodAsignatura,Semestre from TCarga where Semestre=@Texto
end
GO
/****** Object:  StoredProcedure [dbo].[spBuscarCarrera]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spBuscarCarrera]
@Texto varchar(50), @Criterio varchar(50)
as
begin
	If(@Criterio='CodCarrera')
		select CodCarrera, Carrera from TCarrera where CodCarrera=@Texto
	else if (@Criterio='Carrera')
		select CodCarrera,Carrera from TCarrera where Carrera LIKE @Texto + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[spBuscarDocente]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spBuscarDocente]
@Texto varchar(50), @Criterio varchar(50)
as
begin
	If(@Criterio='CodDocente')
		select CodDocente, APaterno,AMaterno,nombres, Usuario from TDocente where CodDocente=@Texto
	else if (@Criterio='APaterno')
		select CodDocente, APaterno,AMaterno,nombres, Usuario from TDocente where APaterno=@Texto
	else if (@Criterio='AMaterno')
		select CodDocente, APaterno,AMaterno,nombres, Usuario from TDocente where AMaterno=@Texto
	else if (@Criterio='Nombres')
		select CodDocente, APaterno,AMaterno,nombres, Usuario from TDocente where Nombres=@Texto
end
GO
/****** Object:  StoredProcedure [dbo].[spBuscarNotas]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spBuscarNotas]
@Texto varchar(50), @Criterio varchar(20)
as
begin
	if (@Criterio = 'CodAlumno')
		select CodAlumno, CodAsignatura, Semestre, Parcial1, Parcial2, NotaFinal from TNotas where CodAlumno = @Texto
	else if (@Criterio = 'CodAsignatura')
		select CodAlumno, CodAsignatura, Semestre, Parcial1, Parcial2, NotaFinal from TNotas where CodAsignatura = @Texto
	else if (@Criterio = 'Semestre')
		select CodAlumno, CodAsignatura, Semestre, Parcial1, Parcial2, NotaFinal from TNotas where Semestre = @Texto
end
GO
/****** Object:  StoredProcedure [dbo].[spBuscarUsuario]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spBuscarUsuario]
@Texto varchar(50), @Criterio varchar(50)
as
begin
	If(@Criterio='Usuario')
		select Usuario, Contrasena from TUsuario where Usuario=@Texto
end
GO
/****** Object:  StoredProcedure [dbo].[spEliminarAlumno]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spEliminarAlumno]
@CodAlumno char(5)
as
begin
	--Validar CodAlumno existe, debe de obtener el Usuario
	declare @Usuario varchar(50)
	set @Usuario=(select Usuario from TAlumno where CodAlumno=@CodAlumno)
	if exists (select CodAlumno from TAlumno where CodAlumno=@CodAlumno)
		if exists (select Usuario from TUsuario where Usuario=@Usuario)
		begin
			begin tran tranEliminar
			begin try
				delete from TAlumno where CodAlumno = @CodAlumno
				delete from TUsuario where Usuario = @Usuario
				commit tran tranEliminar
				select  CodError=0, Mensaje = 'Alumno eliminado en TAlumno y TUsuario' 
			end try
			begin catch
				rollback tran tranEliminar
				select CodError = 1, Mensaje = 'Error: en la transaccion'
			end catch
		end
		else select CodError = 1, Mensaje= 'Error: Usuario no existe en TUsuario'
	else select CodError = 1, Mensaje = 'Error: No existe CodAlumno en TAlumno' 
end
GO
/****** Object:  StoredProcedure [dbo].[spEliminarAsignatura]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spEliminarAsignatura]
@CodAsignatura varchar(50)
as
begin
	--Usuario exista
	if exists(select CodAsignatura from TAsignatura where CodAsignatura=@CodAsignatura)
	--Usuario no este en la tabla Docente
		if not exists(select CodAsignatura from TCarga where CodAsignatura=@CodAsignatura)
		--Usuario no este en la tabla Alumno
			if not exists(select CodAsignatura from TNotas where CodAsignatura=@CodAsignatura) 
			begin
				delete from TAsignatura where CodAsignatura=@CodAsignatura
				select CodError=0, Mensaje='Error:Asignatura eliminada de TAsignatura'
			end
			else select CodError=1, Mensaje='Error:Asignatura existe en TNotas'
		else select CodError=1, Mensaje='Error:Asignatura existe en TCarga'
	else select CodError=1, Mensaje='Error:Asignatura no existe en TAsignatura'
end
GO
/****** Object:  StoredProcedure [dbo].[spEliminarCarga]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spEliminarCarga]
@IdCarga char(3)
as
begin
	--CodCarrera exista
	if exists(select IdCarga from TCarga where IdCarga=@IdCarga)
		begin
			delete from TCarga where IdCarga=@IdCarga
			select CodError=0, Mensaje='Error:Carga eliminada de TCarga'
		end
	else select CodError=1, Mensaje='Error:IdCarga no existe en TCarga'
end
GO
/****** Object:  StoredProcedure [dbo].[spEliminarCarrera]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spEliminarCarrera]
@CodCarrera char(3)
as
begin
	--CodCarrera exista
	if exists(select CodCarrera from TCarrera where CodCarrera=@CodCarrera)
	--CodCarrera mo este en la tabla Alumno
		if not exists(select CodCarrera from TAlumno where CodCarrera=@CodCarrera)
		begin
			delete from TCarrera where CodCarrera=@CodCarrera
			select CodError=0, Mensaje='Error:Carrera eliminada de TCarrera'
		end
		else select CodError=1, Mensaje='Error:CodCarrera no existe en TCarrera'
	else select CodError=1, Mensaje='Error:CodCarrera no existe en TCarrera'
end
GO
/****** Object:  StoredProcedure [dbo].[spEliminarDocente]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spEliminarDocente]
@CodDocente char(5),@Usuario varchar(50)
as
begin
	--Validar CodDocente existe, debe de obtener el Usuario
	if exists(select CodDocente from TDocente where CodDocente=@CodDocente)
		if not exists(select CodDocente from TCarga where CodDocente=@CodDocente)
		begin
			begin tran tranEliminar
			begin try
				delete from TDocente where CodDocente = @CodDocente
				delete from TUsuario where Usuario = @Usuario
				commit tran tranEliminar
				select  CodError=0, Mensaje = 'Docente eliminado en TDocente y TUsuario' 
			end try
			begin catch
				rollback tran tranEliminar
				select CodError = 1, Mensaje = 'Error: en la transaccion'
			end catch
		end
		else select CodError=1, Mensaje='Error:Docente esta a cargo de un curso TCarga'
	else select CodError=1, Mensaje='Error:CodDocente no existe en TDocente'
end
GO
/****** Object:  StoredProcedure [dbo].[spEliminarNotas]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spEliminarNotas]
@CodAlumno char(5), @CodAsignatura char(3)
as 
begin
	--Notas existen
	if exists(select @CodAlumno, @CodAsignatura from TNotas where CodAlumno= @CodAlumno AND CodAsignatura = @CodAsignatura)
		--Usuario no este en la TAlumno
		begin
			delete from TNotas where CodAlumno= @CodAlumno AND CodAsignatura = @CodAsignatura
			select CodError = 0, Mensaje = 'Notas eliminadas de TNotas'
		end
	else select CodError = 1, Mensaje = 'Error: Notas no existen en TNotas'
end
GO
/****** Object:  StoredProcedure [dbo].[spEliminarUsuario]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spEliminarUsuario]
@Usuario varchar(50)
as
begin
	--Usuario exista
	if exists(select Usuario from TUsuario where Usuario=@Usuario)
	--Usuario no este en la tabla Docente
		if not exists(select Usuario from TDocente where Usuario=@Usuario)
		--Usuario no este en la tabla Alumno
			if not exists(select Usuario from TAlumno where Usuario=@Usuario) 
			begin
				delete from TUsuario where Usuario=@Usuario
				select CodError=0, Mensaje='Error:Usuario eliminado de TUsuario'
			end
			else select CodError=1, Mensaje='Error:Usuario existe en TAlumno'
		else select CodError=1, Mensaje='Error:Usuario existe en TDocente'
	else select CodError=1, Mensaje='Error:Usuario no existe en TUsuario'
end
GO
/****** Object:  StoredProcedure [dbo].[spListarAlumno]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spListarAlumno]
as
begin
    select CodAlumno, APaterno, AMaterno, Nombres, Usuario, CodCarrera from TAlumno
end
GO
/****** Object:  StoredProcedure [dbo].[spListarAsignatura]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spListarAsignatura]
as
begin
select CodAsignatura, Asignatura, CodRequisito from TAsignatura
end
GO
/****** Object:  StoredProcedure [dbo].[spListarCarga]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spListarCarga]
as
begin
select IdCarga, CodDocente,CodAsignatura,Semestre from TCarga
end
GO
/****** Object:  StoredProcedure [dbo].[spListarCarrera]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spListarCarrera]
as
begin
select CodCarrera, Carrera from TCarrera
end
GO
/****** Object:  StoredProcedure [dbo].[spListarNotas]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spListarNotas]
as
begin
	select CodAlumno, CodAsignatura, Semestre, Parcial1, Parcial2, NotaFinal from TNotas
end
GO
/****** Object:  StoredProcedure [dbo].[spListarUsuario]    Script Date: 10/04/2021 22:25:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spListarUsuario]
as
begin
select Usuario, Contrasena from TUsuario
end
GO
