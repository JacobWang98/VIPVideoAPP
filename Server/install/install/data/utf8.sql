# 影视网数据表结构
DROP TABLE IF EXISTS `ap_adduser`;
CREATE TABLE `ap_adduser` (
  `uid` int(11) DEFAULT NULL,
  `ctime` int(11) DEFAULT NULL,
  `time` char(10) DEFAULT NULL,
  `lasttime` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_advert`;
CREATE TABLE `ap_advert` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_app`;
CREATE TABLE `ap_app` (
  `id` int(1) NOT NULL DEFAULT '0',
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_banner`;
CREATE TABLE `ap_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '1',
  `cid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `linkurl` varchar(255) DEFAULT NULL,
  `picurl` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `del` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_category`;
CREATE TABLE `ap_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(100) DEFAULT NULL COMMENT '类名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_count`;
CREATE TABLE `ap_count` (
  `day` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_dianka`;
CREATE TABLE `ap_dianka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dianka` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL,
  `ctime` int(11) NOT NULL,
  `y` int(1) NOT NULL,
  `yid` int(1) DEFAULT NULL,
  `time` int(11) NOT NULL,
  `type` int(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `stime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`dianka`),
  UNIQUE KEY `dianka` (`dianka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_fxtb`;
CREATE TABLE `ap_fxtb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `linkurl` varchar(255) DEFAULT NULL,
  `picurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_jilu`;
CREATE TABLE `ap_jilu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `time` varchar(255) NOT NULL,
  `ping` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_kai`;
CREATE TABLE `ap_kai` (
  `uid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `ctime` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_kamifx`;
CREATE TABLE `ap_kamifx` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `qitian` decimal(11,3) NOT NULL,
  `yigeyue` decimal(11,3) NOT NULL,
  `sangeyue` decimal(11,3) NOT NULL,
  `liugeyue` decimal(11,3) NOT NULL,
  `yinian` decimal(11,3) NOT NULL,
  `yongjiu` decimal(11,3) NOT NULL,
  `miaoshu` varchar(100) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_login_code`;
CREATE TABLE `ap_login_code` (
  `uid` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_mn`;
CREATE TABLE `ap_mn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `url` text,
  `img` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_money_get`;
CREATE TABLE `ap_money_get` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL COMMENT '反钱 级别 1 2  3',
  `u_id` int(11) DEFAULT NULL COMMENT '充值代理的用户',
  `get_u_id` int(11) DEFAULT NULL COMMENT '得到钱的用户id',
  `create_time` int(11) DEFAULT NULL COMMENT '反钱的时间',
  `money` DECIMAL(11,3) DEFAULT NULL COMMENT '反钱的金额',
  `order_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_moneylog`;
CREATE TABLE `ap_moneylog` (
  `uid` int(11) NOT NULL,
  `money` decimal(11,2) NOT NULL,
  `cid` int(11) NOT NULL,
  `ctime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_opentj`;
CREATE TABLE `ap_opentj` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `time` varchar(100) NOT NULL,
  `os` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_pass_log`;
CREATE TABLE `ap_pass_log` (
  `ip` varchar(50) NOT NULL,
  `ctime` int(11) NOT NULL,
  `uid` varchar(11) NOT NULL,
  `old_pass` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `aid` int(11) NOT NULL,
  `web` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_pay`;
CREATE TABLE `ap_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outtrade` varchar(200) NOT NULL,
  `trade` varchar(200) NOT NULL,
  `type` char(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `money` decimal(11,2) NOT NULL,
  `trade_status` varchar(100) NOT NULL,
  `cid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `kami` varchar(15) DEFAULT NULL,
  `time` int(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_rebate`;
CREATE TABLE `ap_rebate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` int(11) NOT NULL DEFAULT '0',
  `rebate` int(11) NOT NULL DEFAULT '0',
  `rebate2` int(11) NOT NULL DEFAULT '0',
  `rebate3` int(11) NOT NULL DEFAULT '0',
  `rebate4` int(11) NOT NULL DEFAULT '0',
  `rebate5` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_sad`;
CREATE TABLE `ap_sad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `title` varchar(225) NOT NULL,
  `linkurl` varchar(255) DEFAULT NULL,
  `picurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_share`;
CREATE TABLE `ap_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_shop`;
CREATE TABLE `ap_shop` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `picurl` varchar(100) NOT NULL,
  `miaoshu` varchar(999) NOT NULL,
  `money` double(10,3) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='商品';

DROP TABLE IF EXISTS `ap_shopdingdan`;
CREATE TABLE `ap_shopdingdan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `oderid` varchar(50) NOT NULL,
  `money` decimal(10,3) NOT NULL,
  `spid` int(10) NOT NULL,
  `time` varchar(50) NOT NULL,
  `type` int(10) NOT NULL,
  `dizhi` varchar(255) NOT NULL,
  `fahuoxinxi` varchar(255) NOT NULL DEFAULT '暂未发货',
  `picurl` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_stop`;
CREATE TABLE `ap_stop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_tanchuang`;
CREATE TABLE `ap_tanchuang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `neirong` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `kaiguan` int(1) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_timelog`;
CREATE TABLE `ap_timelog` (
  `uid` int(11) DEFAULT NULL,
  `ctime` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `money` decimal(11,2) DEFAULT NULL,
  `day` varchar(11) DEFAULT NULL,
  `lasttime` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_tixian`;
CREATE TABLE `ap_tixian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `moneys` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `money_time` int(11) DEFAULT NULL,
  `state` smallint(5) DEFAULT '1' COMMENT '状态1 2  1为未到账 2为以到账',
  `number` text COMMENT '提现账号',
  `name` varchar(40) DEFAULT NULL COMMENT '体现姓名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_tongji`;
CREATE TABLE `ap_tongji` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `os` varchar(255) NOT NULL,
  `imei` varchar(255) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_tuijian`;
CREATE TABLE `ap_tuijian` (
  `id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `img` text NOT NULL,
  `url` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_tv`;
CREATE TABLE `ap_tv` (
  `title` varchar(255) NOT NULL,
  `img` text NOT NULL,
  `url` text NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_user`;
CREATE TABLE `ap_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nick_name` varchar(255) NOT NULL DEFAULT '',
  `power` varchar(255) NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT '0',
  `parentid` int(11) NOT NULL DEFAULT '0',
  `ctime` int(11) NOT NULL DEFAULT '0',
  `logintime` int(11) NOT NULL DEFAULT '0',
  `lasttime` int(11) NOT NULL DEFAULT '0',
  `money` decimal(11,2) NOT NULL DEFAULT '0.00',
  `type` int(1) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `imei` varchar(255) DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `sign` int(11) DEFAULT '0',
  `share_ma` varchar(255) DEFAULT NULL,
  `weichat` varchar(255) DEFAULT NULL,
  `url` text,
  `url1` text,
  `url2` text,
  `url3` text,
  `url4` text,
  `url5` text,
  `url6` text,
  `url7` text,
  `key` varchar(255) DEFAULT NULL,
  `moneys` decimal(11,3) NOT NULL DEFAULT '0.000',
  `cate` varchar(255) NOT NULL,
  `qiandaotime` varchar(100) NOT NULL,
  `kamioff` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_video`;
CREATE TABLE `ap_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `img` text NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_zce`;
CREATE TABLE `ap_zce` (
  `phone` varchar(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  UNIQUE KEY `phone` (`phone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ap_zhibo`;
CREATE TABLE `ap_zhibo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `url` text,
  `img` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;