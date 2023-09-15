ALTER TABLE km_product
ADD CONSTRAINT fk_km_product_cate2
FOREIGN KEY (prodCate2)
REFERENCES km_product_cate2(cate2);


CREATE TABLE `km_member` (
  `uid` VARCHAR(20) NOT NULL,
  `pass` VARCHAR(255) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `gender` TINYINT NOT NULL,
  `hp` CHAR(13) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `type` TINYINT NOT NULL,
  `point` INT NULL DEFAULT 0,
  `level` TINYINT NULL,
  `zip` VARCHAR(10) NULL,
  `addr1` VARCHAR(255) NULL,
  `addr2` VARCHAR(255) NULL,
  `company` VARCHAR(20) NULL,
  `ceo` VARCHAR(20) NULL,
  `bizRegNum` CHAR(12) NULL,
  `comRegNum` INT NULL,
  `tel` VARCHAR(20) NULL,
  `manager` VARCHAR(20) NULL,
  `managerHp` CHAR(13) NULL,
  `fax` VARCHAR(20) NULL,
  `regip` VARCHAR(100) NOT NULL,
  `wdate` DATETIME NULL,
  `rdate` DATETIME NOT NULL,
  `etc1` INT NULL,
  `etc2` INT NULL,
  `etc3` VARCHAR(10) NULL,
  `etc4` VARCHAR(20) NULL,
  `etc5` VARCHAR(30) NULL,
  PRIMARY KEY (`uid`));
​
​
-- -----------------------------------------------------
-- Table `Kmarket`.`km_product_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kmarket`.`km_product_order` (
  `ordNo` INT NOT NULL AUTO_INCREMENT,
  `ordUid` VARCHAR(20) NOT NULL,
  `ordCount` INT NULL DEFAULT 0,
  `ordPrice` INT NULL DEFAULT 0,
  `ordDiscount` INT NULL DEFAULT 0,
  `savePoint` INT NULL DEFAULT 0,
  `usedPoint` INT NULL DEFAULT 0,
  `ordTotPrice` INT NULL DEFAULT 0,
  `recipName` VARCHAR(20) NOT NULL,
  `recipHp` CHAR(13) NOT NULL,
  `recipZip` CHAR(5) NOT NULL,
  `recipAddr1` VARCHAR(255) NOT NULL,
  `recipAddr2` VARCHAR(255) NOT NULL,
  `ordPayment` TINYINT NOT NULL,
  `ordComplete` TINYINT NOT NULL,
  `ordDate` DATETIME NOT NULL,
  PRIMARY KEY (`ordNo`),
  INDEX `fk_km_product_order_km_member1_idx` (`ordUid` ASC) VISIBLE,
  CONSTRAINT `fk_km_product_order_km_member1`
    FOREIGN KEY (`ordUid`)
    REFERENCES `Kmarket`.`km_member` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
​
​
-- -----------------------------------------------------
-- Table `Kmarket`.`km_member_point`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kmarket`.`km_member_point` (
  `pointNo` INT NOT NULL AUTO_INCREMENT,
  `uid` VARCHAR(20) NOT NULL,
  `ordNo` INT NOT NULL,
  `point` INT NOT NULL,
  `porintDate` DATETIME NOT NULL,
  PRIMARY KEY (`pointNo`),
  INDEX `fk_kim_member_point_km_member_idx` (`uid` ASC) VISIBLE,
  INDEX `fk_kim_member_point_km_product_order1_idx` (`ordNo` ASC) VISIBLE,
  CONSTRAINT `fk_kim_member_point_km_member`
    FOREIGN KEY (`uid`)
    REFERENCES `Kmarket`.`km_member` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_kim_member_point_km_product_order1`
    FOREIGN KEY (`ordNo`)
    REFERENCES `Kmarket`.`km_product_order` (`ordNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
​
​
-- -----------------------------------------------------
-- Table `Kmarket`.`terms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kmarket`.`terms` (
  `terms` TEXT NOT NULL,
  `privacy` TEXT NULL,
  `location` TEXT NULL,
  `finance` TEXT NULL,
  `tax` TEXT NULL)
ENGINE = InnoDB;
​
​
-- -----------------------------------------------------
-- Table `Kmarket`.`km_product_cate1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kmarket`.`km_product_cate1` (
  `cate1` INT NOT NULL,
  `c1Name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`cate1`))
ENGINE = InnoDB;
​
​
-- -----------------------------------------------------
-- Table `Kmarket`.`km_product_cate2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kmarket`.`km_product_cate2` (
  `cate1` INT NOT NULL,
  `cate2` INT NOT NULL,
  `c2Name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`cate1`),
  INDEX `fk_km_product_cate_km_product_cate11_idx` (`cate1` ASC) VISIBLE,
  CONSTRAINT `fk_km_product_cate_km_product_cate11`
    FOREIGN KEY (`cate1`)
    REFERENCES `Kmarket`.`km_product_cate1` (`cate1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
​
​
-- -----------------------------------------------------
-- Table `Kmarket`.`km_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kmarket`.`km_product` (
  `prodNo` INT NOT NULL AUTO_INCREMENT,
  `prodCate1` INT NOT NULL,
  `prodCate2` INT NOT NULL,
  `prodName` VARCHAR(100) NOT NULL,
  `descript` VARCHAR(100) NOT NULL,
  `company` VARCHAR(100) NOT NULL,
  `uid` VARCHAR(20) NOT NULL,
  `price` INT NOT NULL,
  `discount` TINYINT NULL DEFAULT 0,
  `point` INT NULL DEFAULT 0,
  `stock` INT NULL DEFAULT 0,
  `sold` INT NULL DEFAULT 0,
  `delivery` INT NULL DEFAULT 0,
  `hit` INT NULL DEFAULT 0,
  `score` TINYINT NULL DEFAULT 0,
  `review` INT NULL DEFAULT 0,
  `thumb1` VARCHAR(255) NOT NULL,
  `thumb2` VARCHAR(255) NOT NULL,
  `thumb3` VARCHAR(255) NOT NULL,
  `detail` VARCHAR(255) NOT NULL,
  `status` VARCHAR(20) NULL DEFAULT '새상품',
  `duty` VARCHAR(20) NULL DEFAULT '과세상품',
  `receipt` VARCHAR(30) NULL DEFAULT '발행가능 - 신용카드 전표, 온라인 현금영수증',
  `bizType` VARCHAR(20) NULL DEFAULT '사업자 판매자',
  `ip` VARCHAR(20) NOT NULL,
  `etc1` INT NULL,
  `etc2` INT NULL,
  `etc3` VARCHAR(10) NULL,
  `etc4` VARCHAR(20) NULL,
  PRIMARY KEY (`prodNo`),
  INDEX `fk_km_product_km_product_cate1_idx` (`prodCate1` ASC) VISIBLE,
  INDEX `fk_km_product_km_member1_idx` (`uid` ASC) VISIBLE,
  CONSTRAINT `fk_km_product_km_product_cate1`
    FOREIGN KEY (`prodCate1`)
    REFERENCES `Kmarket`.`km_product_cate2` (`cate1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_km_product_km_member1`
    FOREIGN KEY (`uid`)
    REFERENCES `Kmarket`.`km_member` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
​
​
-- -----------------------------------------------------
-- Table `Kmarket`.`km_product_cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kmarket`.`km_product_cart` (
  `cartNo` INT NOT NULL AUTO_INCREMENT,
  `uid` VARCHAR(20) NOT NULL,
  `prodNo` INT NOT NULL,
  `count` INT NOT NULL,
  `price` INT NOT NULL,
  `discount` INT NOT NULL,
  `point` INT NOT NULL,
  `delivery` INT NOT NULL,
  `total` INT NOT NULL,
  `rdate` DATETIME NOT NULL,
  PRIMARY KEY (`cartNo`),
  INDEX `fk_km_product_cart_km_product1_idx` (`prodNo` ASC) VISIBLE,
  INDEX `fk_km_product_cart_km_member1_idx` (`uid` ASC) VISIBLE,
  CONSTRAINT `fk_km_product_cart_km_product1`
    FOREIGN KEY (`prodNo`)
    REFERENCES `Kmarket`.`km_product` (`prodNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_km_product_cart_km_member1`
    FOREIGN KEY (`uid`)
    REFERENCES `Kmarket`.`km_member` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
​
​
-- -----------------------------------------------------
-- Table `Kmarket`.`km_product_order_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kmarket`.`km_product_order_item` (
  `ordNo` INT NOT NULL,
  `prodNo` INT NOT NULL,
  `count` INT NOT NULL,
  `price` INT NOT NULL,
  `discount` TINYINT NOT NULL,
  `point` INT NOT NULL,
  `delivery` INT NOT NULL,
  `total` INT NOT NULL,
  `km_product_order_ordNo` INT NOT NULL,
  INDEX `fk_km_product_order_item_km_product_order1_idx` (`km_product_order_ordNo` ASC) VISIBLE,
  CONSTRAINT `fk_km_product_order_item_km_product1`
    FOREIGN KEY (`prodNo`)
    REFERENCES `Kmarket`.`km_product` (`prodNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_km_product_order_item_km_product_order1`
    FOREIGN KEY (`km_product_order_ordNo`)
    REFERENCES `Kmarket`.`km_product_order` (`ordNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
​
​
-- -----------------------------------------------------
-- Table `Kmarket`.`km_product_review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Kmarket`.`km_product_review` (
  `revNo` INT NOT NULL AUTO_INCREMENT,
  `prodNo` INT NOT NULL,
  `content` VARCHAR(255) NOT NULL,
  `uid` VARCHAR(20) NOT NULL,
  `rating` TINYINT NOT NULL,
  `regip` VARCHAR(100) NOT NULL,
  `rdate` DATETIME NOT NULL,
  PRIMARY KEY (`revNo`),
  INDEX `fk_km_product_review_km_product1_idx` (`prodNo` ASC) VISIBLE,
  INDEX `fk_km_product_review_km_member1_idx` (`uid` ASC) VISIBLE,
  CONSTRAINT `fk_km_product_review_km_product1`
    FOREIGN KEY (`prodNo`)
    REFERENCES `Kmarket`.`km_product` (`prodNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_km_product_review_km_member1`
    FOREIGN KEY (`uid`)
    REFERENCES `Kmarket`.`km_member` (`uid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
​
​
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


SELECT a.*, b.level FROM `km_product` AS a JOIN `km_member` AS b ON a.seller=b.uid WHERE `stock` > 0 LIMIT 6, 10;



SELECT * FROM `km_product_cate1` WHERE `cate1`=12;

SELECT * FROM `km_product_cate2` WHERE `cate2`=12;

SELECT * FROM `km_product_cate2`WHERE `cate1`=13 ORDER BY `cate2`;

INSERT INTO `km_product` SET `prodCate1`=?,`prodCate2`=?,`prodName`=?,`descript`=?,`company`=?,`seller`=?,`price`=?,`discount`=?,`point`=?,`stock`=?,`delivery`=?,`thumb1`=?,`thumb2`=?,`thumb3`=?,`detail`=?,`status`=?,`duty`=?,`receipt`=?,`bizType`=?,`origin`=?;

SELECT a.*, b.level, b.company FROM `km_product` AS a JOIN `km_member` AS b ON a.seller=b.uid WHERE `stock` > 0 AND `prodCate1`=12 LIMIT 0, 10;

SELECT * FROM `km_product` WHERE `prodCate1`=12 ;

ALTER TABLE `km_product` RENAME COLUMN `company` TO `prodCompany`; 

SELECT COUNT(*) FROM `km_product` WHERE `stock` > 0 AND `prodCate1`=12;

SELECT a.*, b.level, b.company FROM `km_product` AS a JOIN `km_member` AS b ON a.seller=b.uid WHERE `stock` > 0 AND `prodCate1`=12 AND `prodCate2`=10 AND `prodNo`=86;