DROP DATABASE IF EXISTS bd_lolsito;
CREATE DATABASE bd_lolsito;
USE bd_lolsito;

CREATE TABLE Partida (
    Cod_Partida VARCHAR(6) NOT NULL,
    Resultado VARCHAR(10),
    Tiempo TIME,
    Asesinato TINYINT,
    Asistencia TINYINT,
    Muerte TINYINT,
    KDA DECIMAL(4,2),
    PRIMARY KEY (Cod_Partida)
);

CREATE TABLE Jugador (
    Cod_Jugador VARCHAR(50) NOT NULL,
    Alias VARCHAR(15),
    Nombre VARCHAR(15),
    Apellido VARCHAR(20),
    Edad TINYINT,
    Nivel SMALLINT,
    Posicion VARCHAR(10),
    Cod_Partida VARCHAR(6) NOT NULL,
    PRIMARY KEY (Cod_Jugador),
    FOREIGN KEY (Cod_Partida) REFERENCES Partida (Cod_Partida) ON UPDATE CASCADE
);

CREATE TABLE Campeon (
    Cod_Campeon VARCHAR(6) NOT NULL,
    Nombre VARCHAR(10),
    Daño SMALLINT,
    Vida SMALLINT,
    Cod_Jugador VARCHAR(50) NOT NULL,
    PRIMARY KEY (Cod_Campeon),
    FOREIGN KEY (Cod_Jugador) REFERENCES Jugador (Cod_Jugador) ON UPDATE CASCADE
);

CREATE TABLE Linea (
    Cod_Linea VARCHAR(6) NOT NULL,
    Nombre VARCHAR(10),
    Dificultad TINYINT,
	Cod_Campeon VARCHAR(6) NOT NULL,
    PRIMARY KEY (Cod_Linea),
    FOREIGN KEY (Cod_Campeon) REFERENCES Campeon (Cod_Campeon) ON UPDATE CASCADE
);

CREATE TABLE Rol (
    Cod_Rol VARCHAR(6) NOT NULL,
    Nombre VARCHAR(10),
    Dificultad TINYINT,
    Cod_Linea VARCHAR(6) NOT NULL,
    PRIMARY KEY (Cod_Rol),
    FOREIGN KEY (Cod_Linea) REFERENCES Linea (Cod_Linea) ON UPDATE CASCADE
);

CREATE TABLE Habilidad (
    Cod_Habilidad VARCHAR(6) NOT NULL,
    Nombre VARCHAR(25),
    Tipo_Habilidad VARCHAR(7),
    Dificultad TINYINT,
    Tiempo_Enfriamiento TINYINT,
    Definicion VARCHAR(500),
    Cod_Campeon VARCHAR(6) NOT NULL,
    PRIMARY KEY (Cod_Habilidad),
    FOREIGN KEY (Cod_Campeon) REFERENCES Campeon (Cod_Campeon) ON UPDATE CASCADE
);

CREATE TABLE Skin (
    Cod_Skin VARCHAR(6) NOT NULL,
    Nombre VARCHAR(50),
    Tipo VARCHAR(15),
    Tematica VARCHAR(25),
    Cod_Campeon VARCHAR(6) NOT NULL,
    PRIMARY KEY (Cod_Skin),
    FOREIGN KEY (Cod_Campeon) REFERENCES Campeon (Cod_Campeon) ON UPDATE CASCADE
);

CREATE TABLE Equipo (
    Cod_Equipo VARCHAR(6) NOT NULL,
    Nombre VARCHAR(15),
    Fecha_Creacion DATE,
    N_Jugadores TINYINT,
    Pais VARCHAR(15),
    Cod_Jugador VARCHAR(50),
    PRIMARY KEY (Cod_Equipo),
    FOREIGN KEY (Cod_Jugador) REFERENCES Jugador (Cod_Jugador) ON UPDATE CASCADE
);

CREATE TABLE Entrenador (
    Cod_Entrenador VARCHAR(6) NOT NULL,
    Nombre VARCHAR(10),
	Apellido VARCHAR(20),
    Edad TINYINT,
    Pais VARCHAR(20),
    PRIMARY KEY (Cod_Entrenador)
);

CREATE TABLE Entrena (
    Cod_Entrenador VARCHAR(6) NOT NULL,
    Cod_Equipo VARCHAR(6) NOT NULL,
    PRIMARY KEY (Cod_Entrenador, Cod_Equipo),
    FOREIGN KEY (Cod_Entrenador) REFERENCES Entrenador (Cod_Entrenador) ON UPDATE CASCADE,
    FOREIGN KEY (Cod_Equipo) REFERENCES Equipo (Cod_Equipo) ON UPDATE CASCADE
);

CREATE TABLE Participa (
    Cod_Jugador VARCHAR(50) NOT NULL,
    Cod_Equipo VARCHAR(6) NOT NULL,
    PRIMARY KEY (Cod_Jugador, Cod_Equipo),
    FOREIGN KEY (Cod_Jugador) REFERENCES Jugador (Cod_Jugador) ON UPDATE CASCADE,
    FOREIGN KEY (Cod_Equipo) REFERENCES Equipo (Cod_Equipo) ON UPDATE CASCADE
);

insert into Partida (Cod_Partida, Resultado, Tiempo, Asesinato, Asistencia, Muerte, KDA) Values
('010101', 'Victoria', '42:04', '9', '7', '4', '6.67'),
('010102', 'Victoria', '36:23', '2', '14', '6', '7.33'),
('010103', 'Derrota', '28:33', '4', '5', '4', '4.33'),
('010104', 'Victoria', '29:53', '6', '4', '2', '4'),
('010105', 'Derrota', '47:21', '2', '7', '6', '5'),
('010106', 'Derrota', '32:57', '2', '5', '7', '4.66'),
('010107', 'Derrota', '33:31', '5', '3', '5', '4.33'),
('010108', 'Victoria', '51:21', '11', '5', '18', '11.33');

insert into Jugador (Cod_Jugador, Alias, Nombre, Apellido, Edad, Nivel, Posicion, Cod_Partida) Values ('000051', 'Faker', 'Lee', 'Sang-hyeok', '26', '1399', 'Midlaner', '010108');
insert into Jugador (Cod_Jugador, Alias, Nombre, Apellido, Edad, Nivel, Posicion, Cod_Partida) Values ('000052', 'Caps', 'Rasmus Borrega', 'Winther', '23', '1152', 'Midlaner', '010104');
insert into Jugador (Cod_Jugador, Alias, Nombre, Apellido, Edad, Nivel, Posicion, Cod_Partida) Values ('000053', 'Rekkles', 'Carl Martin', 'Erik Larsson', '26', '1045', 'ADC', '010105');
insert into Jugador (Cod_Jugador, Alias, Nombre, Apellido, Edad, Nivel, Posicion, Cod_Partida) Values ('000054', 'Canyon', 'Kim', 'Geon-bu', '22', '512', 'Jungla', '010107');
insert into Jugador (Cod_Jugador, Alias, Nombre, Apellido, Edad, Nivel, Posicion, Cod_Partida) Values ('000055', 'Viper', 'Park', 'Do-hyeon', '23', '781', 'ADC', '010103');
insert into Jugador (Cod_Jugador, Alias, Nombre, Apellido, Edad, Nivel, Posicion, Cod_Partida) Values ('000056', 'Zven', 'Jesper', 'Svenningsen', '26', '932', 'Support', '010106');
insert into Jugador (Cod_Jugador, Alias, Nombre, Apellido, Edad, Nivel, Posicion, Cod_Partida) Values ('000057', 'Keria', 'Ryu', 'Min-seok', '21', '1479', 'Support', '010102');
insert into Jugador (Cod_Jugador, Alias, Nombre, Apellido, Edad, Nivel, Posicion, Cod_Partida) Values ('000058', 'Broken Blade', 'Sergen', 'Celik', '23', '921', 'Toplaner', '010101');


insert into Campeon (Cod_Campeon, Nombre, Daño, Vida, Cod_Jugador) Values
('000001', 'Akali', '570', '62', '000051'),
('000002', 'Darius', '652', '64', '000058'),
('000003', 'Garen', '690', '66', '000058'),
('000004', 'Jinx', '630', '59', '000055'),
('000005', 'Leblanc', '598', '55', '000052'),
('000006', 'Zed', '654', '63', '000054'),
('000007', 'Ashe', '624', '57', '000053'),
('000008', 'Yuumi', '500', '49', '000056'),
('000009', 'Thresh', '600', '56', '000057');


insert into Entrenador (Cod_Entrenador, Nombre, Apellido, Edad, Pais) Values
('000011', 'Tomas', 'Knezikek', '28', 'Republic Checa'),
('000012', 'Dylan', 'Falcon', '34', 'Canada'),
('000013', 'Bae', 'Seong-woo', '49', 'Corea del Sur'),
('000014', 'Choi', 'Cheon-ju', '32', 'Corea del Sur'),
('000015', 'Alfonso', 'Aguirre Rodri', '29', 'España'),
('000016', 'Yang', 'Ji-Song', '41', 'China');

insert into Equipo (Cod_Equipo, Nombre, Fecha_Creacion, N_Jugadores, Pais, Cod_Jugador) Values
('000021', 'G2', '2014-02-25', '5', 'España', '000052'),
('000022', 'EDG', '2013-12-03', '5', 'China', '000055'),
('000023', 'T1', '2012-04-06', '5', 'Corea del Sur', '000051'),
('000024', 'C9', '2012-03-08', '5', 'Norteamerica', '000056'),
('000025', 'DK', '2017-05-28', '5', 'Corea del Sur', '000054'),
('000026', 'Fnatic', '2011-03-14', '5', 'Reino Unido', '000053');

insert into Habilidad (Cod_Habilidad, Nombre, Tipo_Habilidad, Dificultad, Tiempo_Enfriamiento, Definicion, Cod_Campeon) Values
('000101', 'Pleno de cinco puntas', 'Q', '1', '1', 'Akali lanza kunais que ralentizan e infligen daño en funcion de su daño de ataque y poder de habilidad adicionales', '000001'),
('000102', 'Ejecucion perfecta', 'R', '3', '120', 'Akali se lanza contra un campeon al que aturde brevemente e inflige daño fisico. Puede volver a desplazarse en un periodo corto de tiempo.', '000001'),
('000103', 'Golpe decisivo', 'Q', '1', '8', 'Garen obtiene un aumento de velocidad de movimiento y se libra de todas las ralentizaciones. Su siguiente ataque golpea una zona vital de su enemigo, lo que inflige daño adicional y lo silencia.', '000003'),
('000104', 'Justicia demanciana', 'R', '2', '120', 'Garen invoca too el poder de Demacia para ejecutar a un campeon enemigo','000002'),
('000105', 'Diezmar', 'Q', '1', '9', 'Darius reune fuerzas y traza un amplio circulo con su hacha. Los enemigos golpeados con su hoja sufriran mas daño que los golpeados por su mano. Darius se cura en funcion de campeones enemigos y monstruos gigantes alcanzados por la hoja', '000002'),
('000106', 'Guillotina noxiana', 'R', '3', '120', 'Darius salta hacia un campeon enemigo y le asesta un golpe letal que inflige daño verdadero. Este daño se ve incrementado por cada acumulacion de Hemorragia que tenga el objetuvo. Si el ataque es letal, se reinicia el enfriamiento durante un corto periodo de tiempo.', '000002'),
('000107', 'Cambiazo', 'Q', '1', '1', 'Jinx modifica sus ataques basicos al alternar entre Pium Pium, su ametrallador, y Espinas, su lanzacohetes. Los ataques con Pium Pium otorgan velocidad de ataque, mientras que con Espinas inflige daño en área e incrementa su alcance, pero drena maná y ataca más despacio.', '000004'),
('000108', 'Supermegacohete mortal', 'R', '3', '90', 'Jinx dispara un supercohete por todo el mapa que va aumentando su daño a medida que avanza. El cohete explotará al impactar contra un campeón enemigo y tanto este como los enemigos circundantes recibirán una cantidad de daño proporcional a la vida que les falte en ese momento.', '000004'),
('000109', 'Sello de malicia', 'Q', '2', '6', 'LeBlanc proyecta un sello que inflige daño y marca al objetivo durante 3,5 s. El sello explota al dañar al objetivo marcado con una habilidad e inflige daño adicional. Si el enemigo muere en algún momento, LeBlanc recupera el coste de maná y parte del enfriamiento restante de este hechizo.', '000005'),
('000110', 'Mimica', 'R', '3', '60', 'LeBlanc lanza una imitación de uno de sus hechizos básicos.', '000005'),
('000111', 'Shuriken navaja', 'Q', '2', '6', 'Tanto Zed como sus sombras lanzan los shurikens. Cada shuriken inflige daño a todos los enemigos que golpea.', '000006'),
('000112', 'Marca de la muerte', 'R', '3', '120', 'No se puede marcar a Zed como objetivo y se desliza hacia un campeón enemigo, marcándolo. Tras 3 segundos, la marca se activa, repitiendo una parte del daño infligido por Zed al objetivo mientras estaba marcado.', '000006');


insert into Linea (Cod_Linea, Nombre, Dificultad, Cod_Campeon) Values
('100000', 'Toplane', '2', '000002'),
('200000', 'Midlane', '3', '000001'),
('300000', 'Jungla', '3', '000005'),
('400000', 'Botlane', '3', '000004');

insert into Rol (Cod_Rol, Nombre, Dificultad, Cod_Linea) Values
('100001', 'Toplaner', '2', '100000'),
('200002', 'Midlaner', '3', '200000'),
('300003', 'Jungla', '3', '300000'),
('400004', 'ADC', '3', '400000'),
('500005', 'Support', '2', '400000');

insert into Skin (Cod_Skin, Nombre, Tipo, Tematica, Cod_Campeon) Values
('700001', 'Leblanc aquelarre', 'Epica', 'Aquelarre', '000005'),
('700002', 'Zed exterminador galactico', 'Legendaria', 'Galactico', '000006'),
('700003', 'Garen reinos mecha de prestigio', 'Legendaria', 'Prestigio', '000003'),
('700004', 'Jinx gato de batalla de prestigio', 'Legendaria', 'Prestigio', '000004'),
('700005', 'Rey dios darius', 'Legendaria', 'Reyes', '000002'),
('700006', 'Akali cazadora de cabezas', 'Epica', 'Cazadores de cabezas', '000001');

