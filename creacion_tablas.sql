CREATE TABLE IF NOT EXISTS nodos (
    `id_nodo` int(11) NOT NULL AUTO_INCREMENT,
    `nombre` varchar(15) NOT NULL,
    `descripcion` varchar(20) NOT NULL,
    `latitud` float(10) NOT NULL,
    `longitud` float(10) NOT NULL,
    PRIMARY KEY (`id_nodo`)
);

CREATE TABLE IF NOT EXISTS variables (
    `id_variable` int(11) NOT NULL AUTO_INCREMENT,
    `nombre` varchar(15) NOT NULL,
    `descripcion` varchar(20) NOT NULL,
    `unidad de medida` varchar(20) NOT NULL,
    PRIMARY KEY (`id_variable`)
);

CREATE TABLE IF NOT EXISTS monitoreo (
    `id_monitoreo` int(11) NOT NULL AUTO_INCREMENT,
    `id_nodo` int(10) NOT NULL,
    `id_variable` int(10) NOT NULL,
    `valor` float(10) NOT NULL,
    `fecha_hora` datetime NOT NULL,
    PRIMARY KEY (`id_monitoreo`),
    FOREIGN KEY (id_nodo) REFERENCES nodos (id_nodo),
    FOREIGN KEY (id_variable) REFERENCES variables (id_variable)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
