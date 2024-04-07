CREATE TABLE `sys_config` (
   `config_id` bigint(20) NOT NULL COMMENT 'Parameter primary key',
   `config_name` varchar(100) DEFAULT '' COMMENT 'Parameter name',
   `config_key` varchar(100) DEFAULT '' COMMENT 'Parameter key name',
   `config_value` varchar(500) DEFAULT '' COMMENT 'Parameter key value',
   `config_type` char(1) DEFAULT 'N' COMMENT 'System built-in (Y=yes, N=no)',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
   PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Parameter configuration table';

INSERT INTO `sys_config` VALUES
(1,'Main frame page-default skin style name','sys.index.skinName','skin-blue','Y','admin','2024-03-01 10:57:45',' ',NULL,'blue skin-blue, green skin-green, purple skin-purple, red skin-red, yellow skin-yellow'),
(2,'User Management-Account Initial Password','sys.user.initPassword','123456','Y','admin','2024-03-01 10:57:45','',NULL, 'Initialization password 123456'),
(3,'Main frame page-sidebar theme','sys.index.sideTheme','theme-dark','Y','admin','2024-03-01 10:57:45',' ',NULL,'dark theme theme-dark, light theme theme-light'),
(4,'Account self-service-verification code switch','sys.account.captchaEnabled','true','Y','admin','2024-03-01 10:57:45','',NULL, 'Whether to turn on the verification code function (true to turn on, false to turn off)'),
(5,'Account self-service-whether to enable user registration function','sys.account.registerUser','false','Y','admin','2024-03-01 10:57:45','', NULL, 'Whether to enable the registered user function (true to enable, false to disable)'),
(11,'OSS preview list resource switch','sys.oss.previewListResource','true','Y','admin','2024-03-01 10:57:45','admin','2024-04-03 09:47:02','true:on, false:off');

CREATE TABLE `sys_dept` (
   `dept_id` bigint(20) NOT NULL COMMENT 'department id',
   `parent_id` bigint(20) DEFAULT '0' COMMENT 'parent department id',
   `ancestors` varchar(500) DEFAULT '' COMMENT 'ancestor list',
   `dept_name` varchar(30) DEFAULT '' COMMENT 'Department name',
   `order_num` int(4) DEFAULT '0' COMMENT 'display order',
   `leader` varchar(20) DEFAULT NULL COMMENT 'leader',
   `phone` varchar(11) DEFAULT NULL COMMENT 'Contact number',
   `email` varchar(50) DEFAULT NULL COMMENT 'email',
   `status` char(1) DEFAULT '0' COMMENT 'Department status (0:normal, 1:disabled)',
   `del_flag` char(1) DEFAULT '0' COMMENT 'Delete flag (0:represents existence, 2:represents deletion)',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Department Table';

CREATE TABLE `sys_dict_data` (
   `dict_code` bigint(20) NOT NULL COMMENT 'Dictionary code',
   `dict_sort` int(4) DEFAULT '0' COMMENT 'Dictionary sort',
   `dict_label` varchar(100) DEFAULT '' COMMENT 'Dictionary label',
   `dict_value` varchar(100) DEFAULT '' COMMENT 'Dictionary key value',
   `dict_type` varchar(100) DEFAULT '' COMMENT 'Dictionary type',
   `css_class` varchar(100) DEFAULT NULL COMMENT 'Style attributes (other style extensions)',
   `list_class` varchar(100) DEFAULT NULL COMMENT 'Table echo style',
   `is_default` char(1) DEFAULT 'N' COMMENT 'Whether it is default (Y=yes, N=no)',
   `status` char(1) DEFAULT '0' COMMENT 'Status (0 normal 1 disabled)',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
   PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Dictionary data table';

INSERT INTO `sys_dict_data` VALUES
(1,1,'Male','0','sys_user_sex','','','Y','0','admin','2024-03-01 10:57:45','' ,NULL,'gender male'),
(2,2,'female','1','sys_user_sex','','','N','0','admin','2024-03-01 10:57:45','' ,NULL,'gender female'),
(3,3,'Unknown','2','sys_user_sex','','','N','0','admin','2024-03-01 10:57:45','' ,NULL,'unknown gender'),
(4,1,'Show','0','sys_show_hide','','primary','Y','0','admin','2024-03-01 10:57:45',' ',NULL,'Show menu'),
(5,2,'hide','1','sys_show_hide','','danger','N','0','admin','2024-03-01 10:57:45',' ',NULL,'Hide menu'),
(6,1,'normal','0','sys_normal_disable','','primary','Y','0','admin','2024-03-01 10:57:45',' ',NULL,'normal state'),
(7,2,'disable','1','sys_normal_disable','','danger','N','0','admin','2024-03-01 10:57:45', '',NULL,'disabled status'),
(12,1,'yes','Y','sys_yes_no','','primary','Y','0','admin','2024-03-01 10:57:45',' ',NULL,'The system default is'),
(13,2,'No','N','sys_yes_no','','danger','N','0','admin','2024-03-01 10:57:45',' ',NULL,'System default is no'),
(14,1,'Notice','1','sys_notice_type','','warning','Y','0','admin','2024-03-01 10:57:45',' ',NULL,'notification'),
(15,2,'Notice','2','sys_notice_type','','success','N','0','admin','2024-03-01 10:57:45',' ',NULL,'Announcement'),
(16,1,'normal','0','sys_notice_status','','primary','Y','0','admin','2024-03-01 10:57:45',' ',NULL,'normal state'),
(17,2,'closed','1','sys_notice_status','','danger','N','0','admin','2024-03-01 10:57:45',' ',NULL,'closed status'),
(18,1,'new','1','sys_oper_type','','info','N','0','admin','2024-03-01 10:57:45', '',NULL,'Add operation'),
(19,2,'Modify','2','sys_oper_type','','info','N','0','admin','2024-03-01 10:57:45',' ',NULL,'Modification operation'),
(20,3,'delete','3','sys_oper_type','','danger','N','0','admin','2024-03-01 10:57:45',' ',NULL,'Delete operation'),
(21,4,'Authorization','4','sys_oper_type','','primary','N','0','admin','2024-03-01 10:57:45',' ',NULL,'Authorization operation'),
(22,5,'export','5','sys_oper_type','','warning','N','0','admin','2024-03-01 10:57:45',' ',NULL,'Export operation'),
(23,6,'import','6','sys_oper_type','','warning','N','0','admin','2024-03-01 10:57:45',' ',NULL,'Import operation'),
(24,7,'Force quit','7','sys_oper_type','','danger','N','0','admin','2024-03-01 10:57:45', '',NULL,'Forced exit operation'),
(25,8,'Generate code','8','sys_oper_type','','warning','N','0','admin','2024-03-01 10:57:45', '',NULL,'Generation operation'),
(26,9,'Clear data','9','sys_oper_type','','danger','N','0','admin','2024-03-01 10:57:45', '',NULL,'Clear operation'),
(27,1,'success','0','sys_common_status','','primary','N','0','admin','2024-03-01 10:57:45',' ',NULL,'normal state'),
(28,2,'Failed','1','sys_common_status','','danger','N','0','admin','2024-03-01 10:57:45',' ',NULL,'Disabled status'),
(29,99,'Other','0','sys_oper_type','','info','N','0','admin','2024-03-01 10:57:45',' ',NULL,'Other operations'),
(101,1,'Browse lobby','1','cms_quest_daily_category',NULL,'primary','N','0','admin','2024-04-03 00:00:00',' admin','2024-04-03 00:00:00',NULL),
(102,2,'Browse official recommendation','2','cms_quest_daily_category',NULL,'success','N','0','admin','2024-04-03 00:00:00', 'admin','2024-04-03 00:00:00',NULL);

CREATE TABLE `sys_dict_type` (
   `dict_id` bigint(20) NOT NULL COMMENT 'Dictionary primary key',
   `dict_name` varchar(100) DEFAULT '' COMMENT 'Dictionary name',
   `dict_type` varchar(100) DEFAULT '' COMMENT 'Dictionary type',
   `status` char(1) DEFAULT '0' COMMENT 'Status (0=normal, 1=disabled)',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
   PRIMARY KEY (`dict_id`),
   UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Dictionary type table';

INSERT INTO `sys_dict_type` VALUES
(1,'User gender','sys_user_sex','0','admin','2024-03-01 10:57:45','',NULL,'User gender list'),
(2,'Menu status','sys_show_hide','0','admin','2024-03-01 10:57:45','',NULL,'Menu status list'),
(3,'System switch','sys_normal_disable','0','admin','2024-03-01 10:57:45','',NULL,'System switch list'),
(6,'System yes','sys_yes_no','0','admin','2024-03-01 10:57:45','',NULL,'System list'),
(7,'Notice type','sys_notice_type','0','admin','2024-03-01 10:57:45','',NULL,'Notification type list'),
(8,'Notice status','sys_notice_status','0','admin','2024-03-01 10:57:45','',NULL,'Notification status list'),
(9,'Operation type','sys_oper_type','0','admin','2024-03-01 10:57:45','',NULL,'Operation type list'),
(10,'System status','sys_common_status','0','admin','2024-03-01 10:57:45','',NULL,'Login status list'),
(21,'CMS_Daily Task Category','cms_quest_daily_category','0','admin','2024-04-03 00:00:00','admin','2024-04-03 00:00:00',NULL);

CREATE TABLE `sys_logininfor` (
   `info_id` bigint(20) NOT NULL COMMENT 'Access ID',
   `user_name` varchar(50) DEFAULT '' COMMENT 'User account',
   `ipaddr` varchar(128) DEFAULT '' COMMENT 'Login IP address',
   `login_location` varchar(255) DEFAULT '' COMMENT 'Login location',
   `browser` varchar(50) DEFAULT '' COMMENT 'browser type',
   `os` varchar(50) DEFAULT '' COMMENT 'operating system',
   `status` char(1) DEFAULT '0' COMMENT 'Login status (0=successful, 1=failed)',
   `msg` varchar(255) DEFAULT '' COMMENT 'Prompt message',
   `login_time` datetime DEFAULT NULL COMMENT 'Access time',
   PRIMARY KEY (`info_id`),
   KEY `idx_sys_logininfor_s` (`status`),
   KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='System access record';

CREATE TABLE `sys_menu` (
   `menu_id` bigint(20) NOT NULL COMMENT 'Menu ID',
   `menu_name` varchar(50) NOT NULL COMMENT 'menu name',
   `parent_id` bigint(20) DEFAULT '0' COMMENT 'Parent menu ID',
   `order_num` int(4) DEFAULT '0' COMMENT 'display order',
   `path` varchar(200) DEFAULT '' COMMENT 'Routing address',
   `component` varchar(255) DEFAULT NULL COMMENT 'component path',
   `query_param` varchar(255) DEFAULT NULL COMMENT 'Route parameter',
   `is_frame` int(1) DEFAULT '1' COMMENT 'Whether it is an external link (0=yes, 1=no)',
   `is_cache` int(1) DEFAULT '0' COMMENT 'Whether to cache (0=cache, 1=not cache)',
   `menu_type` char(1) DEFAULT '' COMMENT 'Menu type (M=directory, C=menu, F=button)',
   `visible` char(1) DEFAULT '0' COMMENT 'Display status (0=shows, 1=hides)',
   `status` char(1) DEFAULT '0' COMMENT 'Menu status (0=normal, 1=disabled)',
   `perms` varchar(100) DEFAULT NULL COMMENT 'Permission ID',
   `icon` varchar(100) DEFAULT '#' COMMENT 'menu icon',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(500) DEFAULT '' COMMENT 'Remarks',
   PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Menu permission table';

INSERT INTO `sys_menu` VALUES 
(1,'System Management',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2024-03-01 10:57:44','',NULL,'System Management Directory'),
(2,'System Monitoring',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2024-03-01 10:57:44','',NULL,'System monitoring directory'),
(3,'System Tools',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2024-03-01 10:57:44','',NULL,'System Tool Directory'),
(4,'Game Management',0,4,'bot',NULL,'',1,0,'M','0','0','','game','admin','2023-10-20 13:19:29','',NULL,'Game management directory'),
(100,'User Management',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list' ,'user','admin','2024-03-01 10:57:44','',NULL,'User management menu'),
(101,'Role Management',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list' ,'peoples','admin','2024-03-01 10:57:44','',NULL,'Role Management Menu'),
(102,'Menu management',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list' ,'tree-table','admin','2024-03-01 10:57:44','',NULL,'Menu management menu'),
(103,'Department Management',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list' ,'tree','admin','2024-03-01 10:57:44','',NULL,'Department Management Menu'),
(104,'Post Management',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list' ,'post','admin','2024-03-01 10:57:44','',NULL,'Post management menu'),
(105,'Dictionary management',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list' ,'dict','admin','2024-03-01 10:57:44','',NULL,'Dictionary management menu'),
(106,'Parameter settings',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list' ,'edit','admin','2024-03-01 10:57:44','',NULL,'Parameter setting menu'),
(107,'Notice',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list' ,'message','admin','2024-03-01 10:57:44','',NULL,'Notification Announcement Menu'),
(108,'Log Management',1,9,'log','','',1,0,'M','0','0','','log','admin',' 2024-03-01 10:57:44','',NULL,'Log management menu'),
(109,'Online users',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list' ,'online','admin','2024-03-01 10:57:44','',NULL,'Online user menu'),
(112,'cache list',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list' ,'redis-list','admin','2024-03-01 10:57:44','',NULL,'cache list menu'),
(113,'cache monitoring',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list' ,'redis','admin','2024-03-01 10:57:44','',NULL,'cache monitoring menu'),
(114,'Form Build',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list' ,'build','admin','2024-03-01 10:57:44','',NULL,'Form build menu'),
(115,'Code generation',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list' ,'code','admin','2024-03-01 10:57:44','',NULL,'Code generation menu'),
(117,'Admin monitoring',2,5,'Admin','monitor/admin/index','',1,0,'C','0','0','monitor:admin:list' ,'dashboard','admin','2024-03-01 10:57:44','',NULL,'Admin monitoring menu'),
(118,'File Management',1,10,'oss','system/oss/index','',1,0,'C','0','0','system:oss:list' ,'upload','admin','2024-03-01 10:57:44','',NULL,'File management menu'),
(120,'Task Scheduling Center',2,5,'XxlJob','monitor/xxljob/index','',1,0,'C','0','0','monitor:xxljob:list ','job','admin','2024-03-01 10:57:44','',NULL,'Xxl-Job console menu'),
(201,'Basic configuration',4,1,'config/base','cms/config/base/index','',1,0,'C','0','0','cms:config.base:list','list','admin','2023-10-25 14:33:22','',NULL,'Basic configuration management menu'),
(203,'User Management',4,3,'user','cms/user/index','',1,0,'C','0','0','cms:user:list' ,'list','admin','2023-10-25 14:33:22','',NULL,'User management menu'),
(204,'Daily Task',4,4,'quest/daily','cms/quest/daily/index','',1,0,'C','0','0','cms:quest.daily:list','list','admin','2023-10-25 14:33:22','',NULL,'Daily task management menu'),
(500,'Operation log',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list' ,'form','admin','2024-03-01 10:57:44','',NULL,'Operation log menu'),
(501,'Logininfor',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list' ,'logininfor','admin','2024-03-01 10:57:44','',NULL,'Login log menu'),
(1001,'User query',100,1,'','','',1,0,'F','0','0','system:user:query','#',' admin','2024-03-01 10:57:44','',NULL,''),
(1002,'User added',100,2,'','','',1,0,'F','0','0','system:user:add','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1003,'User modification',100,3,'','','',1,0,'F','0','0','system:user:edit','#',' admin','2024-03-01 10:57:44','',NULL,''),
(1004,'User delete',100,4,'','','',1,0,'F','0','0','system:user:remove','#',' admin','2024-03-01 10:57:44','',NULL,''),
(1005,'User export',100,5,'','','',1,0,'F','0','0','system:user:export','#',' admin','2024-03-01 10:57:44','',NULL,''),
(1006,'User import',100,6,'','','',1,0,'F','0','0','system:user:import','#',' admin','2024-03-01 10:57:44','',NULL,''),
(1007,'Reset password',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1008,'Role Query',101,1,'','','',1,0,'F','0','0','system:role:query','#',' admin','2024-03-01 10:57:44','',NULL,''),
(1009,'Added role',101,2,'','','',1,0,'F','0','0','system:role:add','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1010,'Role modification',101,3,'','','',1,0,'F','0','0','system:role:edit','#',' admin','2024-03-01 10:57:44','',NULL,''),
(1011,'Role Delete',101,4,'','','',1,0,'F','0','0','system:role:remove','#',' admin','2024-03-01 10:57:44','',NULL,''),
(1012,'Role export',101,5,'','','',1,0,'F','0','0','system:role:export','#',' admin','2024-03-01 10:57:44','',NULL,''),
(1013,'Menu query',102,1,'','','',1,0,'F','0','0','system:menu:query','#',' admin','2024-03-01 10:57:44','',NULL,''),
(1014,'Menu added',102,2,'','','',1,0,'F','0','0','system:menu:add','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1015,'Menu modification',102,3,'','','',1,0,'F','0','0','system:menu:edit','#',' admin','2024-03-01 10:57:44','',NULL,''),
(1016,'Menu delete',102,4,'','','',1,0,'F','0','0','system:menu:remove','#',' admin','2024-03-01 10:57:44','',NULL,''),
(1017,'Department Query',103,1,'','','',1,0,'F','0','0','system:dept:query','#',' admin','2024-03-01 10:57:44','',NULL,''),
(1018,'Department added',103,2,'','','',1,0,'F','0','0','system:dept:add','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1019,'Department modification',103,3,'','','',1,0,'F','0','0','system:dept:edit','#',' admin','2024-03-01 10:57:44','',NULL,''),
(1020,'Delete department',103,4,'','','',1,0,'F','0','0','system:dept:remove','#',' admin','2024-03-01 10:57:44','',NULL,''),
(1021,'Position query',104,1,'','','',1,0,'F','0','0','system:post:query','#',' admin','2024-03-01 10:57:44','',NULL,''),
(1022,'Position added',104,2,'','','',1,0,'F','0','0','system:post:add','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1023,'Position modification',104,3,'','','',1,0,'F','0','0','system:post:edit','#',' admin','2024-03-01 10:57:44','',NULL,''),
(1024,'Post deleted',104,4,'','','',1,0,'F','0','0','system:post:remove','#',' admin','2024-03-01 10:57:44','',NULL,''),
(1025,'Position export',104,5,'','','',1,0,'F','0','0','system:post:export','#',' admin','2024-03-01 10:57:44','',NULL,''),
(1026,'Dictionary query',105,1,'#','','',1,0,'F','0','0','system:dict:query','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1027,'Dictionary added',105,2,'#','','',1,0,'F','0','0','system:dict:add','#' ,'admin','2024-03-01 10:57:44','',NULL,''),
(1028,'Dictionary modification',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1029,'Dictionary delete',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1030,'Dictionary export',105,5,'#','','',1,0,'F','0','0','system:dict:export','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1031,'Parameter query',106,1,'#','','',1,0,'F','0','0','system:config:query','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1032,'Parameter added',106,2,'#','','',1,0,'F','0','0','system:config:add','#' ,'admin','2024-03-01 10:57:44','',NULL,''),
(1033,'Parameter modification',106,3,'#','','',1,0,'F','0','0','system:config:edit','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1034,'Parameter removal',106,4,'#','','',1,0,'F','0','0','system:config:remove','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1035,'Parameter export',106,5,'#','','',1,0,'F','0','0','system:config:export','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1036,'Notice Query',107,1,'#','','',1,0,'F','0','0','system:notice:query','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1037,'Notice added',107,2,'#','','',1,0,'F','0','0','system:notice:add','#' ,'admin','2024-03-01 10:57:44','',NULL,''),
(1038,'Notice modification',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1039,'Notice to delete',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1040,'Operation query',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1041,'Operation delete',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1042,'Log export',500,4,'#','','',1,0,'F','0','0','monitor:operlog:export','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1043,'Logininfor:query',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1044,'Logininfor:remove',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1045,'Log export',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1046,'Online Query',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1047,'Batch Logout',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#' ,'admin','2024-03-01 10:57:44','',NULL,''),
(1048,'Single forced logout',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#' ,'admin','2024-03-01 10:57:44','',NULL,''),
(1050,'Account Unlock',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1055,'Generate query',115,1,'#','','',1,0,'F','0','0','tool:gen:query','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1056,'Generate modification',115,2,'#','','',1,0,'F','0','0','tool:gen:edit','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1057,'Generate delete',115,3,'#','','',1,0,'F','0','0','tool:gen:remove','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1058,'Import code',115,2,'#','','',1,0,'F','0','0','tool:gen:import','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1059,'Preview code',115,4,'#','','',1,0,'F','0','0','tool:gen:preview','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1060,'Generate code',115,5,'#','','',1,0,'F','0','0','tool:gen:code','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1600,'File query',118,1,'#','','',1,0,'F','0','0','system:oss:query','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1601,'File upload',118,2,'#','','',1,0,'F','0','0','system:oss:upload','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1602,'File download',118,3,'#','','',1,0,'F','0','0','system:oss:download','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1603,'File deleted',118,4,'#','','',1,0,'F','0','0','system:oss:remove','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1604,'Configuration Add',118,5,'#','','',1,0,'F','0','0','system:oss:add','#', 'admin','2024-03-01 10:57:44','',NULL,''),
(1605,'Configuration Edit',118,6,'#','','',1,0,'F','0','0','system:oss:edit','#', 'admin','2024-03-01 10:57:44','',NULL,'');

CREATE TABLE `sys_notice` (
   `notice_id` bigint(20) NOT NULL COMMENT 'Notice ID',
   `notice_title` varchar(50) NOT NULL COMMENT 'Notice title',
   `notice_type` char(1) NOT NULL COMMENT 'Notice type (1=notice, 2=notice)',
   `notice_content` longblob COMMENT 'Notice content',
   `status` char(1) DEFAULT '0' COMMENT 'Announcement status (0=normal, 1=closed)',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(255) DEFAULT NULL COMMENT 'remark',
   PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Notification Announcement Table';

CREATE TABLE `sys_oper_log` (
   `oper_id` bigint(20) NOT NULL COMMENT 'Log primary key',
   `title` varchar(50) DEFAULT '' COMMENT 'Module title',
   `business_type` int(2) DEFAULT '0' COMMENT 'Business type (0=other, 1=new, 2=modified, 3=deleted)',
   `method` varchar(100) DEFAULT '' COMMENT 'Method name',
   `request_method` varchar(10) DEFAULT '' COMMENT 'Request method',
   `operator_type` int(1) DEFAULT '0' COMMENT 'Operation category (0=other, 1=background user, 2=mobile user)',
   `oper_name` varchar(50) DEFAULT '' COMMENT 'operator',
   `dept_name` varchar(50) DEFAULT '' COMMENT 'Department name',
   `oper_url` varchar(255) DEFAULT '' COMMENT 'Request URL',
   `oper_ip` varchar(128) DEFAULT '' COMMENT 'Host address',
   `oper_location` varchar(255) DEFAULT '' COMMENT 'Operation location',
   `oper_param` varchar(2000) DEFAULT '' COMMENT 'Request parameter',
   `json_result` varchar(2000) DEFAULT '' COMMENT 'return parameter',
   `status` int(1) DEFAULT '0' COMMENT 'Operation status (0=normal, 1=abnormal)',
   `error_msg` varchar(2000) DEFAULT '' COMMENT 'error message',
   `oper_time` datetime DEFAULT NULL COMMENT 'Operation time',
   PRIMARY KEY (`oper_id`),
   KEY `idx_sys_oper_log_bt` (`business_type`),
   KEY `idx_sys_oper_log_s` (`status`),
   KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Operation logging';

CREATE TABLE `sys_oss` (
   `oss_id` bigint(20) NOT NULL COMMENT 'Object storage primary key',
   `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'filename',
   `original_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'original name',
   `file_suffix` varchar(10) NOT NULL DEFAULT '' COMMENT 'File suffix name',
   `url` varchar(500) NOT NULL COMMENT 'URL address',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Uploader',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'Update by',
   `service` varchar(20) NOT NULL DEFAULT 'minio' COMMENT 'service provider',
   PRIMARY KEY (`oss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='OSS object storage table';

CREATE TABLE `sys_oss_config` (
   `oss_config_id` bigint(20) NOT NULL COMMENT 'Main Builder',
   `config_key` varchar(20) NOT NULL DEFAULT '' COMMENT 'Configuration key',
   `access_key` varchar(255) DEFAULT '' COMMENT 'accessKey',
   `secret_key` varchar(255) DEFAULT '' COMMENT 'secret key',
   `bucket_name` varchar(255) DEFAULT '' COMMENT 'bucket name',
   `prefix` varchar(255) DEFAULT '' COMMENT 'prefix',
   `endpoint` varchar(255) DEFAULT '' COMMENT 'Visit site',
   `domain` varchar(255) DEFAULT '' COMMENT 'custom domain name',
   `is_https` char(1) DEFAULT 'N' COMMENT 'Whether https (Y=yes, N=no)',
   `region` varchar(255) DEFAULT '' COMMENT 'region',
   `access_policy` char(1) NOT NULL DEFAULT '1' COMMENT 'Bucket permission type (0=private 1=public 2=custom)',
   `status` char(1) DEFAULT '1' COMMENT 'Whether it is default (0=yes, 1=no)',
   `ext1` varchar(255) DEFAULT '' COMMENT 'Extended field',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
   PRIMARY KEY (`oss_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Object Storage Configuration Table';

INSERT INTO `sys_oss_config` VALUES (1,'minio','wyDCSnBKssPzGOi92sVe','vB4spGy9wQr88FCxNboRWUYLJe0tiC8v9bA4jUuO','metabot','','127.0.0.1:9000','api.tstt.xyz','N','','1','0','','admin','2024-03-01 10:57:45','admin','2024-04-03 09:40:46','');

CREATE TABLE `sys_post` (
   `post_id` bigint(20) NOT NULL COMMENT 'Post ID',
   `post_code` varchar(64) NOT NULL COMMENT 'Post code',
   `post_name` varchar(50) NOT NULL COMMENT 'Post name',
   `post_sort` int(4) NOT NULL COMMENT 'display order',
   `status` char(1) NOT NULL COMMENT 'Status (0 normal, 1 disabled)',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
   PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Position Information Table';

CREATE TABLE `sys_role` (
   `role_id` bigint(20) NOT NULL COMMENT 'role ID',
   `role_name` varchar(30) NOT NULL COMMENT 'role name',
   `role_key` varchar(100) NOT NULL COMMENT 'Role permission string',
   `role_sort` int(4) NOT NULL COMMENT 'display order',
   `data_scope` char(1) DEFAULT '1' COMMENT 'Data scope (1:All data permissions 2:Custom data permissions 3:This department data permissions 4:This department and the following data permissions)',
   `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT 'Whether menu tree selection items are displayed in association',
   `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT 'Whether the department tree selection items are displayed in association',
   `status` char(1) NOT NULL COMMENT 'Character status (0 normal, 1 disabled)',
   `del_flag` char(1) DEFAULT '0' COMMENT 'Delete flag (0 represents existence, 2 represents deletion)',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
   PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Role Information Table';

INSERT INTO `sys_role` VALUES (1,'Super Administrator','admin',1,'1',1,1,'0','0','admin','2024-03-01 10:57:44','',NULL,'Super Administrator');

CREATE TABLE `sys_role_dept` (
   `role_id` bigint(20) NOT NULL COMMENT 'role ID',
   `dept_id` bigint(20) NOT NULL COMMENT 'Department ID',
   PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Role and department association table';

CREATE TABLE `sys_role_menu` (
   `role_id` bigint(20) NOT NULL COMMENT 'role ID',
   `menu_id` bigint(20) NOT NULL COMMENT 'Menu ID',
   PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Role and menu association table';

CREATE TABLE `sys_user` (
   `user_id` bigint(20) NOT NULL COMMENT 'User ID',
   `dept_id` bigint(20) DEFAULT NULL COMMENT 'Department ID',
   `user_name` varchar(30) NOT NULL COMMENT 'user account',
   `nick_name` varchar(30) NOT NULL COMMENT 'User Nickname',
   `user_type` varchar(10) DEFAULT 'sys_user' COMMENT 'User type (sys_user system user)',
   `email` varchar(50) DEFAULT '' COMMENT 'User email',
   `phonenumber` varchar(11) DEFAULT '' COMMENT 'Mobile phone number',
   `sex` char(1) DEFAULT '0' COMMENT 'User gender (0 male, 1 female, 2 unknown)',
   `avatar` varchar(100) DEFAULT '' COMMENT 'avatar address',
   `password` varchar(100) DEFAULT '' COMMENT 'password',
   `status` char(1) DEFAULT '0' COMMENT 'Account status (0 normal, 1 disabled)',
   `del_flag` char(1) DEFAULT '0' COMMENT 'Delete flag (0 represents existence, 2 represents deletion)',
   `login_ip` varchar(128) DEFAULT '' COMMENT 'Last login IP',
   `login_date` datetime DEFAULT NULL COMMENT 'Last login time',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
   PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='User Information Table';

INSERT INTO `sys_user` VALUES (1,NULL,'admin','MetaBot','sys_user','','','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','43.198.93.190','2024-04-05 07:40:06','admin','2024-03-01 10:57:44','admin','2024-04-05 07:40:06','admin');

CREATE TABLE `sys_user_post` (
   `user_id` bigint(20) NOT NULL COMMENT 'User ID',
   `post_id` bigint(20) NOT NULL COMMENT 'Post ID',
   PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='User and position association table';

CREATE TABLE `sys_user_role` (
   `user_id` bigint(20) NOT NULL COMMENT 'User ID',
   `role_id` bigint(20) NOT NULL COMMENT 'role ID',
   PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='User and role association table';

INSERT INTO `sys_user_role` VALUES (1,1);

CREATE TABLE `x_bot_type` (
   `id` bigint(20) NOT NULL COMMENT 'type number',
   `name` varchar(32) NOT NULL COMMENT 'Robot name',
   `icon` bigint(20) NOT NULL COMMENT 'robot icon',
   `action_idle` bigint(20) DEFAULT NULL COMMENT 'Robot form_idle',
   `action_sleep` bigint(20) DEFAULT NULL COMMENT 'Robot form_lie down',
   `action_run` bigint(20) DEFAULT NULL COMMENT 'Robot form_run',
   `action_skill` bigint(20) DEFAULT NULL COMMENT 'Robot form_skill',
   `status` char(1) DEFAULT '0' COMMENT 'Robot status (0:normal, 1:disabled)',
   `del_flag` char(1) DEFAULT '0' COMMENT 'Delete flag (0:represents existence, 2:represents deletion)',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MetaBot_Robot type table';

INSERT INTO `x_bot_type` VALUES 
(1000,'ME-36 Worker',1775537225879617538,0,0,0,0,'0','0','admin','2024-03-14 22:14:41','dmin','2024-03-14 22:14:47','test'),
(1001,'MT-27 Attacker',1775537385502244866,0,0,0,0,'0','0','admin','2024-03-14 22:14:41','dmin','2024-03-14 22:14:47','test'),
(1002,'MA-14 Invader',1775537269164834817,0,0,0,0,'0','0','admin','2024-03-14 22:14:41','dmin','2024-03-14 22:14:47','test'),
(1003,'MB-68 Defender',1775537318817005569,0,0,0,0,'0','0','admin','2024-03-14 22:14:41','dmin','2024-03-14 22:14:47','test');

CREATE TABLE `x_config_base` (
   `id` int(11) NOT NULL COMMENT 'Configuration number',
   `level_max` int(4) DEFAULT '0' COMMENT 'Highest level',
   `level_upgrade` varchar(500) DEFAULT '' COMMENT 'Upgrade consumption',
   `loss_rate` int(11) DEFAULT '0' COMMENT 'Robot loss rate (seconds)',
   `fee_bot` decimal(20,10) DEFAULT '0.0000000000' COMMENT 'Purchase robot handling fee',
   `fee_props` decimal(20,10) DEFAULT '0.0000000000' COMMENT 'Props purchase fee',
   `fee_upgrade` decimal(20,10) DEFAULT '0.0000000000' COMMENT 'Robot upgrade fee',
   `gas_trx` decimal(20,10) DEFAULT '0.0000000000' COMMENT 'Transfer Gas fee',
   `gas_mint` decimal(20,10) DEFAULT '0.0000000000' COMMENT 'NFT mint Gas fee',
   `del_flag` char(1) DEFAULT '0' COMMENT 'Delete flag (0:represents existence, 2:represents deletion)',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MetaBot_Basic Configuration Table';

INSERT INTO `x_config_base` VALUES (1,50,'0,10,15,25,35,50,150,45,59,76,98,129,167,217,283,367,477,620,807,1048,1363,1772,2303,8519,5139,5624,9477,6191,5154,9340',43200,0.5000000000,0.0500000000,0.0500000000,0.0000050000,0.0000200000,'0','admin','2024-03-23 22:07:25','admin','2024-03-23 22:07:28',NULL);

CREATE TABLE `x_config_chain` (
   `id` int(11) NOT NULL COMMENT 'chain number',
   `name` varchar(32) NOT NULL COMMENT 'chain name',
   `network` varchar(32) NOT NULL COMMENT 'chain network',
   `rpc_url` varchar(500) NOT NULL COMMENT 'RPC address',
   `status` char(1) DEFAULT '0' COMMENT 'Chain status (0:normal, 1:disabled)',
   `del_flag` char(1) DEFAULT '0' COMMENT 'Delete flag (0:represents existence, 2:represents deletion)',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MetaBot_Chain configuration table';

INSERT INTO `x_config_chain` VALUES 
(10001,'solana','main','https://api.mainnet-beta.solana.com','0','0','admin','2024-03-27 00:05:00','admin','2024-03-27 00:05:07','test'),
(10002,'solana','devnet','https://api.devnet.solana.com','0','0','admin','2024-03-27 00:05:00','admin','2024-03-27 00:05:07','test'),
(10003,'solana','testnet','https://api.testnet.solana.com','0','0','admin','2024-03-27 00:05:00','admin','2024-03-27 00:05:07','test');

CREATE TABLE `x_props_type` (
   `id` bigint(20) NOT NULL COMMENT 'Prop type number',
   `name` varchar(32) NOT NULL COMMENT 'props name',
   `icon` bigint(20) NOT NULL COMMENT 'prop icon',
   `hp` int(2) DEFAULT '6' COMMENT 'Prop health tank',
   `status` char(1) DEFAULT '0' COMMENT 'Prop status (0:normal, 1:disabled)',
   `del_flag` char(1) DEFAULT '0' COMMENT 'Delete flag (0:represents existence, 2:represents deletion)',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MetaBot_Prop type table';

INSERT INTO `x_props_type` VALUES 
(3001,'Ultra Powerful Battery',1775531658972856322,6,'0','0','admin','2024-03-17 15:09:28','admin','2024-03-17 15:09:45',NULL),
(3002,'Rechargeable Battery',1775531705626099714,4,'0','0','admin','2024-03-17 15:09:32','admin','2024-03-17 15:09:48',NULL),
(3003,'Simple Battery',1775531744737984514,2,'0','0','admin','2024-03-17 15:09:35','admin','2024-03-17 15:09:51',NULL);

CREATE TABLE `x_quest_daily` (
   `id` bigint(20) NOT NULL COMMENT 'task number',
   `title` varchar(64) NOT NULL COMMENT 'Task title',
   `subtitle` varchar(500) DEFAULT '' COMMENT 'Task introduction',
   `link_url` varchar(500) DEFAULT '' COMMENT 'Jump address',
   `reward_count` int(4) NOT NULL COMMENT 'Total number of treasure chests',
   `token_prob` int(4) DEFAULT '0' COMMENT 'Probability of obtaining game currency',
   `token_min` decimal(20,10) DEFAULT '0.0000000000' COMMENT 'Lower limit of game currency',
   `token_max` decimal(20,10) DEFAULT '0.0000000000' COMMENT 'Upper limit of game currency',
   `props_min` int(4) DEFAULT '0' COMMENT 'Lower limit of props quantity',
   `props_max` int(4) DEFAULT '0' COMMENT 'Maximum number of props',
   `category` char(1) DEFAULT '0' COMMENT 'Task classification (1 browse the lobby 2 browse official recommendations)',
   `status` char(1) DEFAULT '0' COMMENT 'Task status (0:normal, 1:disabled)',
   `del_flag` char(1) DEFAULT '0' COMMENT 'Delete flag (0:represents existence, 2:represents deletion)',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MetaBot_Daily Task List';

INSERT INTO `x_quest_daily` VALUES 
(1001,'Browse your home tweets','Every day you can claim 3 Treasures in our Twitter profile.','https://twitter.com/home',3,10,10.0000000000,50.0000000000,1,5,'1','0','0','admin','2024-03-14 15:35:47','admin','2024-04-03 15:42:01','test'),
(1002,'Browse the official tweets','Every day you can claim 2 Treasures in our Twitter profile.','https://twitter.com/Meta2150s',2,30,20.0000000000,100.0000000000,1,5,'2','0','0','admin','2024-03-14 15:35:47','admin','2024-04-03 15:42:21','test');

CREATE TABLE `x_quest_newbie` (
   `id` bigint(20) NOT NULL COMMENT 'task number',
   `parent_id` bigint(20) DEFAULT '0' COMMENT 'parent task number',
   `title` varchar(500) NOT NULL COMMENT 'Task title',
   `subtitle` varchar(500) DEFAULT '' COMMENT 'Task introduction',
   `link_url` varchar(500) DEFAULT '' COMMENT 'Task jump address',
   `reward_token` decimal(20,10) DEFAULT '0.0000000000' COMMENT 'Number of task reward tokens',
   `reward_props_type` bigint(20) DEFAULT NULL COMMENT 'Task reward props type',
   `reward_props_num` int(11) DEFAULT NULL COMMENT 'Number of task reward props',
   `category` char(1) DEFAULT '0' COMMENT 'Task classification (1:follow, 2:push, 3:likes)',
   `status` char(1) DEFAULT '0' COMMENT 'Task status (0:normal, 1:disabled)',
   `del_flag` char(1) DEFAULT '0' COMMENT 'Delete flag (0:represents existence, 2:represents deletion)',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MetaBot_Newbie Task List';

INSERT INTO `x_quest_newbie` VALUES 
(1000,0,'Newbie Treasures','Complete Newbie Treasures first to see other Treasures','',30.0000000000,3001,3,'0','0','0','admin','2024-03-14 15:35:47','admin','2024-03-14 15:35:49','test'),
(1001,1000,'Follow {{@Meta2150s}} on Twitter','','https://twitter.com/Meta2150s',0.0000000000,NULL,NULL,'1','0','0','admin','2024-03-14 15:35:47','admin','2024-03-14 15:35:49','test'),
(1002,1000,'Active Notifications on {{@Meta2150s}} profile','','https://twitter.com/Meta2150s',0.0000000000,NULL,NULL,'2','0','0','admin','2024-03-14 15:35:47','admin','2024-03-14 15:35:49','test'),
(1003,1000,'Like and Comment our tweet','','https://twitter.com/Meta2150s',0.0000000000,NULL,NULL,'3','0','0','admin','2024-03-14 15:35:47','admin','2024-03-14 15:35:49','test');

CREATE TABLE `x_shop_bot` (
   `id` bigint(20) NOT NULL COMMENT 'Shelf number',
   `bot_type_id` bigint(20) NOT NULL COMMENT 'Robot type number',
   `level` int(4) NOT NULL COMMENT 'Robot level',
   `price` decimal(20,10) NOT NULL COMMENT 'Robot price',
   `status` char(1) DEFAULT '0' COMMENT 'Shelf status (0:normal, 1:disabled)',
   `del_flag` char(1) DEFAULT '0' COMMENT 'Delete flag (0:represents existence, 2:represents deletion)',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MetaBot_Store Robot Table';

INSERT INTO `x_shop_bot` VALUES 
(2601,1000,7,294.0000000000,'0','0','admin','2024-03-17 22:05:00','admin','2024-03-17 22:05:03','test'),
(2602,1001,8,341.0000000000,'0','0','admin','2024-03-17 22:05:17','admin','2024-03-17 22:05:15','test'),
(2603,1002,9,401.0000000000,'0','0','admin','2024-03-17 22:05:24','admin','2024-03-17 22:05:23','test'),
(2604,1003,14,1104.0000000000,'0','0','admin','2024-03-17 22:05:30','admin','2024-03-17 22:05:28','test');

CREATE TABLE `x_shop_props` (
   `id` bigint(20) NOT NULL COMMENT 'Shelf number',
   `props_type_id` bigint(20) NOT NULL COMMENT 'props type number',
   `price` decimal(20,10) NOT NULL COMMENT 'Prop price',
   `status` char(1) DEFAULT '0' COMMENT 'Shelf status (0:normal, 1:disabled)',
   `del_flag` char(1) DEFAULT '0' COMMENT 'Delete flag (0:represents existence, 2:represents deletion)',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MetaBot_Store Item Table';

INSERT INTO `x_shop_props` VALUES 
(2701,3001,40.0000000000,'0','0','admin','2024-03-17 22:34:33','admin','2024-03-17 22:34:36','test'),
(2702,3002,20.0000000000,'0','0','admin','2024-03-17 22:34:33','admin','2024-03-17 22:34:36','test'),
(2703,3003,10.0000000000,'0','0','admin','2024-03-17 22:34:33','admin','2024-03-17 22:34:36','test');

CREATE TABLE `x_user` (
   `id` bigint(20) NOT NULL COMMENT 'User number',
   `parent_id` bigint(20) DEFAULT NULL COMMENT 'Superior user',
   `x_id` bigint(20) NOT NULL COMMENT 'Twitter user ID',
   `account` varchar(64) NOT NULL COMMENT 'Twitter user account',
   `nickname` varchar(64) DEFAULT '' COMMENT 'Twitter user nickname',
   `avatar` varchar(500) DEFAULT '' COMMENT 'Twitter user avatar',
   `referral_code` varchar(16) NOT NULL COMMENT 'invitation code',
   `referral_reward` decimal(20,10) DEFAULT '0.0000000000' COMMENT 'Total invitation reward',
   `google_auth_enable` char(1) DEFAULT '0' COMMENT 'Whether to enable Google Authenticator',
   `google_secret` varchar(128) DEFAULT '' COMMENT 'Google verification secret key',
   `status` char(1) DEFAULT '0' COMMENT 'User status (0:normal, 1:disabled)',
   `del_flag` char(1) DEFAULT '0' COMMENT 'Delete flag (0:represents existence, 2:represents deletion)',
   `login_ip` varchar(128) DEFAULT '' COMMENT 'Last login IP',
   `login_date` datetime DEFAULT NULL COMMENT 'Last login time',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
   PRIMARY KEY (`id`) USING BTREE,
   UNIQUE KEY `referral_code` (`referral_code`) USING BTREE COMMENT 'Invitation code index'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MetaBot_User table';

CREATE TABLE `x_user_bot` (
   `bot_id` bigint(20) NOT NULL COMMENT 'Robot number',
   `bot_type_id` bigint(20) NOT NULL COMMENT 'Robot type number',
   `user_id` bigint(20) NOT NULL COMMENT 'user number',
   `level` int(4) DEFAULT '1' COMMENT 'Robot level',
   `hp` int(2) DEFAULT '6' COMMENT 'Robot health tank',
   `loss_time` datetime DEFAULT NULL COMMENT 'Last loss time',
   `mint_hash` varchar(128) DEFAULT '' COMMENT 'NFT Mint hash',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
   PRIMARY KEY (`bot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MetaBot_User Backpack Robot Table';

CREATE TABLE `x_user_props` (
   `props_id` bigint(20) NOT NULL COMMENT 'props number',
   `props_type_id` bigint(20) NOT NULL COMMENT 'props type number',
   `user_id` bigint(20) NOT NULL COMMENT 'user number',
   `status` char(1) DEFAULT '0' COMMENT 'Usage status (0:unused, 1:used)',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
   PRIMARY KEY (`props_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MetaBot_User Backpack Item Table';

CREATE TABLE `x_user_quest_daily` (
   `user_id` bigint(20) NOT NULL COMMENT 'user number',
   `quest_id` bigint(20) NOT NULL COMMENT 'task number',
   `tweet_id` bigint(20) NOT NULL COMMENT 'Tweet number',
   `reward_token` decimal(20,10) DEFAULT '0.0000000000' COMMENT 'Number of task reward tokens',
   `reward_props_type` bigint(20) DEFAULT NULL COMMENT 'Task reward props type',
   `reward_props_num` int(11) DEFAULT NULL COMMENT 'Number of task reward props',
   `done_date` date NOT NULL COMMENT 'Task completion date',
   `done_time` datetime DEFAULT NULL COMMENT 'task completion time',
   KEY `user_id` (`user_id`) USING BTREE COMMENT 'User number index',
   KEY `quest_id` (`quest_id`) USING BTREE COMMENT 'Task number index',
   KEY `done_date` (`done_date`) USING BTREE COMMENT 'Complete date index'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MetaBot_User Daily Task List';

CREATE TABLE `x_user_quest_newbie` (
   `user_id` bigint(20) NOT NULL COMMENT 'user number',
   `quest_id` bigint(20) NOT NULL COMMENT 'task number',
   `child_quest_ids` varchar(500) DEFAULT '' COMMENT 'Task details number',
   `reward_token` decimal(20,10) DEFAULT '0.0000000000' COMMENT 'Number of task reward tokens',
   `reward_props_type` bigint(20) DEFAULT NULL COMMENT 'Task reward props type',
   `reward_props_num` int(11) DEFAULT NULL COMMENT 'Number of task reward props',
   `reward_open` char(1) DEFAULT '0' COMMENT 'Obtain task reward (0:no, 1:yes)',
   `update_time` datetime DEFAULT NULL COMMENT 'task update time',
   `done_time` datetime DEFAULT NULL COMMENT 'task completion time',
   UNIQUE KEY `user_id_quest_id` (`user_id`,`quest_id`) USING BTREE COMMENT 'user number_task number_joint index'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MetaBot_User Novice Task List';

CREATE TABLE `x_user_wallet` (
   `user_id` bigint(20) NOT NULL COMMENT 'user number',
   `public_key` varchar(64) NOT NULL COMMENT 'wallet address',
   `secret_key` varchar(255) NOT NULL COMMENT 'Wallet private key',
   `sol_token_balance` decimal(20,10) DEFAULT '0.0000000000' COMMENT 'Solana native token balance',
   `temp_token_balance` decimal(20,10) DEFAULT '0.0000000000' COMMENT 'Off-chain game currency balance',
   `game_token_balance` decimal(20,10) DEFAULT '0.0000000000' COMMENT 'Game currency balance on the chain',
   `platform_token_balance` decimal(20,10) DEFAULT '0.0000000000' COMMENT 'On-chain governance coin balance',
   `status` char(1) DEFAULT '0' COMMENT 'Account status (0:normal, 1:disabled)',
   `del_flag` char(1) DEFAULT '0' COMMENT 'Delete flag (0:represents existence, 2:represents deletion)',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(500) DEFAULT NULL COMMENT 'remark',
   PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MetaBot_User Wallet Table';

CREATE TABLE `x_user_wallet_log` (
   `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'record number',
   `user_id` bigint(20) NOT NULL COMMENT 'user number',
   `category` char(2) DEFAULT '0' COMMENT 'Transaction category',
   `token_type` char(1) DEFAULT '0' COMMENT 'Token type (0:unknown, 1:platform currency, 2:off-chain currency, 3:game currency, 4:governance currency)',
   `amount` decimal(20,10) DEFAULT '0.0000000000' COMMENT 'Transaction amount',
   `fee` decimal(20,10) DEFAULT '0.0000000000' COMMENT 'Transaction fee',
   `balance_before` decimal(20,10) DEFAULT '0.0000000000' COMMENT 'Available balance before transaction',
   `balance_after` decimal(20,10) DEFAULT '0.0000000000' COMMENT 'Available balance after transaction',
   `memo` varchar(500) DEFAULT '' COMMENT 'Transaction content',
   `tx_hash` varchar(500) DEFAULT '' COMMENT 'Transaction Hash',
   `status` char(1) DEFAULT '0' COMMENT 'Extraction status (0:not extracted, 1:extracted)',
   `create_by` varchar(64) DEFAULT '' COMMENT 'Creator',
   `create_time` datetime DEFAULT NULL COMMENT 'Creation time',
   `update_by` varchar(64) DEFAULT '' COMMENT 'updater',
   `update_time` datetime DEFAULT NULL COMMENT 'update time',
   `remark` varchar(500) DEFAULT '' COMMENT 'Remarks',
   PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='MetaBot_User Wallet Record Table';

