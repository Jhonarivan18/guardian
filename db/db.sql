USE guardian
CREATE TABLE IF NOT EXISTS `softvigilan3`.`empresa` (
  `nitempresa` INT NOT NULL,
  `nombre_empresa` VARCHAR(45) NULL,
  PRIMARY KEY (`nitempresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `softvigilan3`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `softvigilan3`.`usuario` (
  `idvigilantes` INT NOT NULL AUTO_INCREMENT,
  `nomb_vigi` VARCHAR(45) NULL,
  `celular_vigi` BIGINT(19) NULL UNIQUE,
  `email_vigi` VARCHAR(45) NULL UNIQUE,
  `contraseña` VARCHAR(90) NOT NULL,
  `create_at` TIMESTAMP(0) NOT NULL,
  `updated_at` TIMESTAMP(0) NOT NULL,
  `empresa_nitempresa` INT NOT NULL,
  PRIMARY KEY (`idvigilantes`, `empresa_nitempresa`),
  INDEX `fk_usuario_empresa1_idx` (`empresa_nitempresa` ASC) ,
  CONSTRAINT `fk_usuario_empresa1`
    FOREIGN KEY (`empresa_nitempresa`)
    REFERENCES `softvigilan3`.`empresa` (`nitempresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `softvigilan3`.`propietario_dispositivos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `softvigilan3`.`propietario_dispositivos` (
  `id_num_documento` INT NOT NULL,
  `nombre_usuario` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `celular` BIGINT(18) NOT NULL,
  `tipo_usuario` VARCHAR(45) NOT NULL,
  `serrial_dev` VARCHAR(45) NULL,
  `usuarios_idvigilantes` INT NOT NULL,

  PRIMARY KEY (`id_num_documento`, `usuarios_idvigilantes`),
  UNIQUE INDEX `serrial_dev_UNIQUE` (`serrial_dev` ASC) ,
  INDEX `fk_propietario_dispositivos_usuarios1_idx` (`usuarios_idvigilantes` ASC) ,
  CONSTRAINT `fk_propietario_dispositivos_usuarios1`
    FOREIGN KEY (`usuarios_idvigilantes`)
    REFERENCES `softvigilan3`.`usuario` (`idvigilantes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `softvigilan3`.`dispositivos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `softvigilan3`.`dispositivos` (
  `serial_dispositivo` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `color_dispositivo` VARCHAR(45) NOT NULL,
  `detalle` VARCHAR(45) NOT NULL,
  `propietario_dispositivos_id_num_documento` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`serial_dispositivo`, `propietario_dispositivos_id_num_documento`),
  INDEX `fk_dispositivos_propietario_dispositivos_idx` (`propietario_dispositivos_id_num_documento` ASC) ,
  CONSTRAINT `fk_dispositivos_propietario_dispositivos`
    FOREIGN KEY (`propietario_dispositivos_id_num_documento`)
    REFERENCES `softvigilan3`.`propietario_dispositivos` (`id_num_documento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
