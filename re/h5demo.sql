CREATE SCHEMA `h5` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE `h5`.`user` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(18) NOT NULL COMMENT '用户名',
  `is_login` tinyint(4) NOT NULL COMMENT '是否登录',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `phone` varchar(20) NOT NULL COMMENT '手机号码',
  `create_time` date NOT NULL COMMENT '创建时间',
  `last_update_time` date NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) 
ENGINE=InnoDB 
DEFAULT CHARSET=utf8;

CREATE TABLE `h5`.`self_order` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '数据库自增id',
  `order_id` BIGINT NOT NULL,
  `affiliate_confirmation_id` VARCHAR(30) NOT NULL COMMENT '代理自己的订单号',
  `user_id` VARCHAR(16) NOT NULL COMMENT '用户id',
  `status` VARCHAR(2) NOT NULL COMMENT '订单系统状态',
  `show_status` BIGINT NOT NULL COMMENT '订单展示状态',
  `booking_time` DATETIME NOT NULL COMMENT '下单的时间',
  `hotel_id` VARCHAR(10) NOT NULL COMMENT '酒店id',
  `roomtype_id` VARCHAR(4) NOT NULL COMMENT '销售房型id',
  `rateplan_id` INT NOT NULL COMMENT '价格计划id',
  `payment_type` INT NOT NULL COMMENT '付款类型，0-现付，1-预付',
  `hotel_name` VARCHAR(60) NOT NULL COMMENT '酒店名称',
  `room_name` VARCHAR(45) NOT NULL COMMENT '房型名称',
  `rateplan_name` VARCHAR(45) NOT NULL COMMENT '价格计划名称',
  `arrival_date` DATETIME NOT NULL COMMENT '入住日期',
  `departure_date` DATETIME NOT NULL COMMENT '离店日期',
  `total_price` DOUBLE NOT NULL COMMENT '订单总价',
  `currency_code` VARCHAR(21) NOT NULL COMMENT '订单总价的货币类型',
  `hotel_phone` VARCHAR(25) NOT NULL COMMENT '酒店电话',
  `contact_name` VARCHAR(20) NOT NULL COMMENT '联系人姓名',
  `contact_phone` VARCHAR(45) NOT NULL COMMENT '联系人电话',
  `room_num` INT NOT NULL COMMENT '预订房间数量',
  `cancel_time` DATETIME NOT NULL COMMENT '最晚取消时间',
  `cancel_recieve_time` DATETIME NOT NULL COMMENT '收到取消请求的时间',
  `need_pay` TINYINT(1) NOT NULL COMMENT '是否需要支付',
  `pay_status` INT COMMENT '-1,0 -- 无支付信息,1 -- 等待担保或支付,2 -- 担保或支付中,3 -- 担保或支付成功,4 -- 担保或支付失败',
  `pay_amount` DOUBLE COMMENT '需要支付的金额，担保订单为需要担保的金额',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `h5`.`incr_order_manager` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mac_addr` VARCHAR(24) NOT NULL COMMENT '正在更新订单的服务器mac地址',
  `beat_time` DATETIME NOT NULL COMMENT '最近一次心跳时间',
  `last_id` BIGINT NOT NULL COMMENT '最近一次更新的LastId',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

insert into h5.incr_order_manager (mac_addr, beat_time, last_id) values ("", DATE_FORMAT('1970-01-01','%Y-%m-%d'), 0);

