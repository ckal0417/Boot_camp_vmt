USE CLASES;
GO

/* =========================================================
   1. ROLES
   ========================================================= */
INSERT INTO UserRoles (Code, ShowName)
VALUES 
('ADMIN', 'Administrador'),
('TEACH', 'Profesor'),
('STUD', 'Estudiante');
GO

/* =========================================================
   2. USUARIOS
   ========================================================= */
DECLARE @RoleAdmin INT = (SELECT UserRoleId FROM UserRoles WHERE Code = 'ADMIN');
DECLARE @RoleTeacher INT = (SELECT UserRoleId FROM UserRoles WHERE Code = 'TEACH');
DECLARE @RoleStudent INT = (SELECT UserRoleId FROM UserRoles WHERE Code = 'STUD');

/* Profesores */
DECLARE @Teacher1 UNIQUEIDENTIFIER = NEWID();
DECLARE @Teacher2 UNIQUEIDENTIFIER = NEWID();
DECLARE @Teacher3 UNIQUEIDENTIFIER = NEWID();

/* Estudiantes */
DECLARE @Student1 UNIQUEIDENTIFIER = NEWID();
DECLARE @Student2 UNIQUEIDENTIFIER = NEWID();
DECLARE @Student3 UNIQUEIDENTIFIER = NEWID();
DECLARE @Student4 UNIQUEIDENTIFIER = NEWID();
DECLARE @Student5 UNIQUEIDENTIFIER = NEWID();
DECLARE @Student6 UNIQUEIDENTIFIER = NEWID();

/* Admin */
DECLARE @Admin1 UNIQUEIDENTIFIER = NEWID();

INSERT INTO Users (UserId, RoleId, UserName, UserAge, UserMail, UserPhone, UserNi)
VALUES
(@Admin1,   @RoleAdmin,   'Cristopher Vera',      23, 'cris.admin@clases.com',      '0991111111', 'NI-ADM-001'),

(@Teacher1, @RoleTeacher, 'Andrea Mendoza',       30, 'andrea.mendoza@clases.com',  '0992222221', 'NI-TEA-001'),
(@Teacher2, @RoleTeacher, 'Carlos Paredes',       34, 'carlos.paredes@clases.com',  '0992222222', 'NI-TEA-002'),
(@Teacher3, @RoleTeacher, 'Valeria Torres',       28, 'valeria.torres@clases.com',  '0992222223', 'NI-TEA-003'),

(@Student1, @RoleStudent, 'Mateo Cedeño',         20, 'mateo.cedeno@clases.com',    '0993333331', 'NI-STU-001'),
(@Student2, @RoleStudent, 'Ashley Zambrano',      21, 'ashley.zambrano@clases.com', '0993333332', 'NI-STU-002'),
(@Student3, @RoleStudent, 'Javier Moreira',       22, 'javier.moreira@clases.com',  '0993333333', 'NI-STU-003'),
(@Student4, @RoleStudent, 'Nicole Vera',          19, 'nicole.vera@clases.com',     '0993333334', 'NI-STU-004'),
(@Student5, @RoleStudent, 'Sebastian Ruiz',       24, 'sebastian.ruiz@clases.com',  '0993333335', 'NI-STU-005'),
(@Student6, @RoleStudent, 'Camila Alcivar',       20, 'camila.alcivar@clases.com',  '0993333336', 'NI-STU-006');
GO

/* =========================================================
   3. TIPOS DE MODULO
   ========================================================= */
INSERT INTO ModuleType (ModuleTypeName, ModuleTypeTech)
VALUES
('Frontend Avanzado', 'React + TypeScript'),
('Backend Avanzado', 'ASP.NET Core Web API'),
('Base de Datos', 'SQL Server'),
('DevOps', 'Docker'),
('Control de Versiones', 'Git + GitHub'),
('Arquitectura Full Stack', 'Clean Architecture');
GO

/* =========================================================
   4. MODULOS
   ========================================================= */
DECLARE @TeacherA UNIQUEIDENTIFIER = (SELECT UserId FROM Users WHERE UserMail = 'andrea.mendoza@clases.com');
DECLARE @TeacherB UNIQUEIDENTIFIER = (SELECT UserId FROM Users WHERE UserMail = 'carlos.paredes@clases.com');
DECLARE @TeacherC UNIQUEIDENTIFIER = (SELECT UserId FROM Users WHERE UserMail = 'valeria.torres@clases.com');

DECLARE @TypeFrontend INT = (SELECT ModuleTypeId FROM ModuleType WHERE ModuleTypeName = 'Frontend Avanzado');
DECLARE @TypeBackend INT  = (SELECT ModuleTypeId FROM ModuleType WHERE ModuleTypeName = 'Backend Avanzado');
DECLARE @TypeBD INT       = (SELECT ModuleTypeId FROM ModuleType WHERE ModuleTypeName = 'Base de Datos');
DECLARE @TypeDevOps INT   = (SELECT ModuleTypeId FROM ModuleType WHERE ModuleTypeName = 'DevOps');
DECLARE @TypeGit INT      = (SELECT ModuleTypeId FROM ModuleType WHERE ModuleTypeName = 'Control de Versiones');
DECLARE @TypeArch INT     = (SELECT ModuleTypeId FROM ModuleType WHERE ModuleTypeName = 'Arquitectura Full Stack');

INSERT INTO Module (ModuleName, TeacherId, TypeId)
VALUES
('React Components and State Management',     @TeacherA, @TypeFrontend),
('Advanced TypeScript for Frontend Apps',     @TeacherA, @TypeFrontend),
('REST API Development with ASP.NET Core',    @TeacherB, @TypeBackend),
('Authentication with JWT and Roles',         @TeacherB, @TypeBackend),
('SQL Server Modeling and Relationships',     @TeacherC, @TypeBD),
('Stored Procedures and Advanced Queries',    @TeacherC, @TypeBD),
('Docker for Full Stack Projects',            @TeacherB, @TypeDevOps),
('GitHub Flow and Team Collaboration',        @TeacherA, @TypeGit),
('Clean Architecture in Full Stack Systems',  @TeacherC, @TypeArch);
GO

/* =========================================================
   5. PARTICIPACIONES
   ========================================================= */
DECLARE @S1 UNIQUEIDENTIFIER = (SELECT UserId FROM Users WHERE UserMail = 'mateo.cedeno@clases.com');
DECLARE @S2 UNIQUEIDENTIFIER = (SELECT UserId FROM Users WHERE UserMail = 'ashley.zambrano@clases.com');
DECLARE @S3 UNIQUEIDENTIFIER = (SELECT UserId FROM Users WHERE UserMail = 'javier.moreira@clases.com');
DECLARE @S4 UNIQUEIDENTIFIER = (SELECT UserId FROM Users WHERE UserMail = 'nicole.vera@clases.com');
DECLARE @S5 UNIQUEIDENTIFIER = (SELECT UserId FROM Users WHERE UserMail = 'sebastian.ruiz@clases.com');
DECLARE @S6 UNIQUEIDENTIFIER = (SELECT UserId FROM Users WHERE UserMail = 'camila.alcivar@clases.com');

DECLARE @M1 INT = (SELECT ModuleId FROM Module WHERE ModuleName = 'React Components and State Management');
DECLARE @M2 INT = (SELECT ModuleId FROM Module WHERE ModuleName = 'Advanced TypeScript for Frontend Apps');
DECLARE @M3 INT = (SELECT ModuleId FROM Module WHERE ModuleName = 'REST API Development with ASP.NET Core');
DECLARE @M4 INT = (SELECT ModuleId FROM Module WHERE ModuleName = 'Authentication with JWT and Roles');
DECLARE @M5 INT = (SELECT ModuleId FROM Module WHERE ModuleName = 'SQL Server Modeling and Relationships');
DECLARE @M6 INT = (SELECT ModuleId FROM Module WHERE ModuleName = 'Stored Procedures and Advanced Queries');
DECLARE @M7 INT = (SELECT ModuleId FROM Module WHERE ModuleName = 'Docker for Full Stack Projects');
DECLARE @M8 INT = (SELECT ModuleId FROM Module WHERE ModuleName = 'GitHub Flow and Team Collaboration');
DECLARE @M9 INT = (SELECT ModuleId FROM Module WHERE ModuleName = 'Clean Architecture in Full Stack Systems');

INSERT INTO Participation (StudentId, ModuleId, Points)
VALUES
/* Mateo */
(@S1, @M1, 95),
(@S1, @M3, 90),
(@S1, @M5, 88),
(@S1, @M8, 92),

/* Ashley */
(@S2, @M1, 89),
(@S2, @M2, 94),
(@S2, @M8, 96),
(@S2, @M9, 91),

/* Javier */
(@S3, @M3, 87),
(@S3, @M4, 84),
(@S3, @M7, 90),
(@S3, @M9, 86),

/* Nicole */
(@S4, @M2, 93),
(@S4, @M5, 91),
(@S4, @M6, 88),
(@S4, @M8, 95),

/* Sebastian */
(@S5, @M3, 80),
(@S5, @M4, 85),
(@S5, @M7, 89),
(@S5, @M9, 90),

/* Camila */
(@S6, @M1, 97),
(@S6, @M2, 95),
(@S6, @M5, 94),
(@S6, @M6, 93);
GO