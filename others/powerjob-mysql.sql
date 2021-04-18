


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_info
-- ----------------------------
DROP TABLE IF EXISTS `app_info`;
CREATE TABLE `app_info` (
                            `id` bigint NOT NULL AUTO_INCREMENT,
                            `app_name` varchar(100) DEFAULT NULL,
                            `current_server` varchar(100) DEFAULT NULL,
                            `gmt_create` datetime(6) DEFAULT NULL,
                            `gmt_modified` datetime(6) DEFAULT NULL,
                            `password` varchar(100) DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `idx_app_name` (`app_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for container_info
-- ----------------------------
DROP TABLE IF EXISTS `container_info`;
CREATE TABLE `container_info` (
                                  `id` bigint NOT NULL AUTO_INCREMENT,
                                  `app_id` bigint DEFAULT NULL,
                                  `container_name` varchar(100) DEFAULT NULL,
                                  `gmt_create` datetime(6) DEFAULT NULL,
                                  `gmt_modified` datetime(6) DEFAULT NULL,
                                  `last_deploy_time` datetime(6) DEFAULT NULL,
                                  `source_info` varchar(200) DEFAULT NULL,
                                  `source_type` int DEFAULT NULL,
                                  `status` int DEFAULT NULL,
                                  `version` varchar(200) DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                  KEY `idx_app_id` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for instance_info
-- ----------------------------
DROP TABLE IF EXISTS `instance_info`;
CREATE TABLE `instance_info` (
                                 `id` bigint NOT NULL AUTO_INCREMENT,
                                 `actual_trigger_time` bigint DEFAULT NULL,
                                 `app_id` bigint DEFAULT NULL,
                                 `expected_trigger_time` bigint DEFAULT NULL,
                                 `finished_time` bigint DEFAULT NULL,
                                 `gmt_create` datetime(6) DEFAULT NULL,
                                 `gmt_modified` datetime(6) DEFAULT NULL,
                                 `instance_id` bigint DEFAULT NULL,
                                 `instance_params` longtext,
                                 `job_id` bigint DEFAULT NULL,
                                 `job_params` longtext,
                                 `last_report_time` bigint DEFAULT NULL,
                                 `result` text,
                                 `running_times` bigint DEFAULT NULL,
                                 `status` int DEFAULT NULL,
                                 `task_tracker_address` varchar(200) DEFAULT NULL,
                                 `type` int DEFAULT NULL,
                                 `wf_instance_id` bigint DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `idx_job_id` (`job_id`),
                                 KEY `idx_app_id` (`app_id`),
                                 KEY `idx_instance_id` (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for job_info
-- ----------------------------
DROP TABLE IF EXISTS `job_info`;
CREATE TABLE `job_info` (
                            `id` bigint NOT NULL AUTO_INCREMENT,
                            `app_id` bigint DEFAULT NULL,
                            `concurrency` int DEFAULT NULL,
                            `designated_workers` varchar(200) DEFAULT NULL,
                            `dispatch_strategy` int DEFAULT NULL,
                            `execute_type` int DEFAULT NULL,
                            `extra` varchar(200) DEFAULT NULL,
                            `gmt_create` datetime(6) DEFAULT NULL,
                            `gmt_modified` datetime(6) DEFAULT NULL,
                            `instance_retry_num` int DEFAULT NULL,
                            `instance_time_limit` bigint DEFAULT NULL,
                            `job_description` varchar(200) DEFAULT NULL,
                            `job_name` varchar(200) DEFAULT NULL,
                            `job_params` text,
                            `lifecycle` varchar(200) DEFAULT NULL,
                            `max_instance_num` int DEFAULT NULL,
                            `max_worker_count` int DEFAULT NULL,
                            `min_cpu_cores` double NOT NULL,
                            `min_disk_space` double NOT NULL,
                            `min_memory_space` double NOT NULL,
                            `next_trigger_time` bigint DEFAULT NULL,
                            `notify_user_ids` varchar(200) DEFAULT NULL,
                            `processor_info` varchar(200) DEFAULT NULL,
                            `processor_type` int DEFAULT NULL,
                            `status` int DEFAULT NULL,
                            `task_retry_num` int DEFAULT NULL,
                            `time_expression` varchar(200) DEFAULT NULL,
                            `time_expression_type` int DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            KEY `idx_app_id` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for oms_lock
-- ----------------------------
DROP TABLE IF EXISTS `oms_lock`;
CREATE TABLE `oms_lock` (
                            `id` bigint NOT NULL AUTO_INCREMENT,
                            `gmt_create` datetime(6) DEFAULT NULL,
                            `gmt_modified` datetime(6) DEFAULT NULL,
                            `lock_name` varchar(100) DEFAULT NULL,
                            `max_lock_time` bigint DEFAULT NULL,
                            `ownerip` varchar(200) DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `idx_lock_name` (`lock_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for server_info
-- ----------------------------
DROP TABLE IF EXISTS `server_info`;
CREATE TABLE `server_info` (
                               `id` bigint NOT NULL AUTO_INCREMENT,
                               `gmt_create` datetime(6) DEFAULT NULL,
                               `gmt_modified` datetime(6) DEFAULT NULL,
                               `ip` varchar(100) DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               UNIQUE KEY `idx_ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
                             `id` bigint NOT NULL AUTO_INCREMENT,
                             `email` varchar(100) DEFAULT NULL,
                             `extra` varchar(200) DEFAULT NULL,
                             `gmt_create` datetime(6) DEFAULT NULL,
                             `gmt_modified` datetime(6) DEFAULT NULL,
                             `password` varchar(200) DEFAULT NULL,
                             `phone` varchar(50) DEFAULT NULL,
                             `username` varchar(100) DEFAULT NULL,
                             `web_hook` varchar(200) DEFAULT NULL,
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for workflow_info
-- ----------------------------
DROP TABLE IF EXISTS `workflow_info`;
CREATE TABLE `workflow_info` (
                                 `id` bigint NOT NULL AUTO_INCREMENT,
                                 `app_id` bigint DEFAULT NULL,
                                 `extra` varchar(200) DEFAULT NULL,
                                 `gmt_create` datetime(6) DEFAULT NULL,
                                 `gmt_modified` datetime(6) DEFAULT NULL,
                                 `lifecycle` varchar(200) DEFAULT NULL,
                                 `max_wf_instance_num` int DEFAULT NULL,
                                 `next_trigger_time` bigint DEFAULT NULL,
                                 `notify_user_ids` varchar(200) DEFAULT NULL,
                                 `pedag` text,
                                 `status` int DEFAULT NULL,
                                 `time_expression` varchar(200) DEFAULT NULL,
                                 `time_expression_type` int DEFAULT NULL,
                                 `wf_description` varchar(200) DEFAULT NULL,
                                 `wf_name` varchar(100) DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `idx_app_id` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for workflow_instance_info
-- ----------------------------
DROP TABLE IF EXISTS `workflow_instance_info`;
CREATE TABLE `workflow_instance_info` (
                                          `id` bigint NOT NULL AUTO_INCREMENT,
                                          `actual_trigger_time` bigint DEFAULT NULL,
                                          `app_id` bigint DEFAULT NULL,
                                          `dag` text,
                                          `expected_trigger_time` bigint DEFAULT NULL,
                                          `finished_time` bigint DEFAULT NULL,
                                          `gmt_create` datetime(6) DEFAULT NULL,
                                          `gmt_modified` datetime(6) DEFAULT NULL,
                                          `result` text,
                                          `status` int DEFAULT NULL,
                                          `wf_context` text,
                                          `wf_init_params` text,
                                          `wf_instance_id` bigint DEFAULT NULL,
                                          `workflow_id` bigint DEFAULT NULL,
                                          PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for workflow_node_info
-- ----------------------------
DROP TABLE IF EXISTS `workflow_node_info`;
CREATE TABLE `workflow_node_info` (
                                      `id` bigint NOT NULL AUTO_INCREMENT,
                                      `app_id` bigint NOT NULL,
                                      `enable` bit(1) NOT NULL,
                                      `extra` text,
                                      `gmt_create` datetime(6) NOT NULL,
                                      `gmt_modified` datetime(6) NOT NULL,
                                      `job_id` bigint DEFAULT NULL,
                                      `node_name` varchar(200) DEFAULT NULL,
                                      `node_params` text,
                                      `skip_when_failed` bit(1) NOT NULL,
                                      `type` int DEFAULT NULL,
                                      `workflow_id` bigint DEFAULT NULL,
                                      PRIMARY KEY (`id`),
                                      KEY `idx_app_id` (`app_id`),
                                      KEY `idx_workflow_id` (`workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

SET FOREIGN_KEY_CHECKS = 1;
