CREATE DATABASE IF NOT EXISTS tienda;

USE tienda;

CREATE TABLE IF NOT EXISTS t_usuarios(
    id_usuario INT(11) auto_increment NOT NULL,
    Nombre VARCHAR (100) NOT NULL,
    Apellido VARCHAR (100) NOT NULL,
    Email VARCHAR (200) NOT NULL,
    Contraseña VARCHAR(255) NOT NULL,
    Rol VARCHAR(20),
    Imagen VARCHAR(255),
    CONSTRAINT  pk_usuario  Primary key (id_usuario),
    CONSTRAINT  uq_email UNIQUE(Email)

)ENGINE=InnoDB;

INSERT INTO t_usuarios VALUES(NULL,'admin','admin','admin@admin.com','1234','admin','imagen');

CREATE TABLE IF NOT EXISTS t_categorias(
    id_categoria INT(11) auto_increment NOT NULL,
    Nombre_categoria VARCHAR (100) NOT NULL,
    CONSTRAINT  pk_categoria  Primary key (id_categoria)
)ENGINE=InnoDB;

INSERT INTO t_categorias VALUES(NULL,'construccion'),(NULL,'electricos'),(NULL,'pisos');

CREATE TABLE IF NOT EXISTS t_productos(
    id_producto INT(11) auto_increment NOT NULL,
    Nombre_producto VARCHAR (100) NOT NULL,
    Descripcion VARCHAR (200) NOT NULL,
    Precio FLOAT (100,2) NOT NULL,
    Stock INT (100) NOT NULL,
    Oferta  VARCHAR(50) NOT NULL,
    Fecha DATE NOT NULL,
    Imagen VARCHAR(255),
    id_categoria INT(11) NOT NULL, 
    CONSTRAINT pk_producto  Primary key (id_producto),
    CONSTRAINT fk_producto_categoria FOREIGN KEY(id_categoria) REFERENCES t_categorias(id_categoria)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS t_pedidos(
    id_pedido INT(11) auto_increment NOT NULL,
    id_usuario INT(11) NOT NULL, 
    Ciudad VARCHAR(100) NOT NULL,
    Direccion VARCHAR(200) NOT NULL,
    Costo FLOAT(100,2) NOT NULL,
    Estado VARCHAR(20) NOT NULL,
    Fecha DATE NOT NULL,
    Hora TIME,
    CONSTRAINT pk_pedidos  Primary key (id_pedido),
    CONSTRAINT fk_usuario_pedido FOREIGN KEY(id_usuario) REFERENCES t_usuarios(id_usuario)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS t_detallepedidos(
    id_detallepedido INT(11) auto_increment NOT NULL,
    id_pedido INT(11) NOT NULL,
    id_producto INT(11) NOT NULL,
    Unidades INT(100) NOT NULL,
    CONSTRAINT pk_detalle_pedido PRIMARY KEY(id_detallepedido),
    CONSTRAINT fk_detalle_pedido FOREIGN KEY(id_pedido) REFERENCES t_pedidos(id_pedido),
    CONSTRAINT fk_detalle_producto FOREIGN KEY(id_producto) REFERENCES t_productos(id_producto)

)ENGINE=InnoDB;
