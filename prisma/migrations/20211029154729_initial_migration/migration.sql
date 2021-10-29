-- CreateTable
CREATE TABLE `action_plan_notes` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `customer_product_id` INTEGER UNSIGNED NULL,
    `user_id` INTEGER UNSIGNED NULL,
    `text` LONGTEXT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    INDEX `action_plan_notes_customer_product_id_foreign`(`customer_product_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ap_entities` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `label` TEXT NOT NULL,
    `product_id` INTEGER UNSIGNED NULL,
    `href` TEXT NOT NULL,
    `type` ENUM('product', 'href', 'other') NOT NULL,
    `plan_id` INTEGER NOT NULL,
    `rating` INTEGER NULL,
    `section_id` INTEGER UNSIGNED NOT NULL,
    `ordinal` INTEGER NOT NULL,
    `visible` BOOLEAN NOT NULL DEFAULT true,
    `description` TEXT NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `pills_json` TEXT NOT NULL,

    INDEX `ap_entities_product_id_foreign`(`product_id`),
    INDEX `ap_entities_section_id_foreign`(`section_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ap_goals` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `text` LONGTEXT NOT NULL,
    `ap_plan_id` INTEGER UNSIGNED NOT NULL,
    `customer_id` INTEGER UNSIGNED NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    INDEX `ap_goals_ap_plan_id_foreign`(`ap_plan_id`),
    INDEX `ap_goals_customer_id_foreign`(`customer_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ap_map_plan_section` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `plan_id` INTEGER UNSIGNED NOT NULL,
    `section_id` INTEGER UNSIGNED NOT NULL,
    `ordinal` INTEGER NOT NULL,
    `visible` BOOLEAN NOT NULL DEFAULT true,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    INDEX `ap_map_plan_section_plan_id_foreign`(`plan_id`),
    INDEX `ap_map_plan_section_section_id_foreign`(`section_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ap_notes` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `text` LONGTEXT NOT NULL,
    `entity_id` INTEGER UNSIGNED NOT NULL,
    `customer_id` INTEGER UNSIGNED NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    INDEX `ap_notes_customer_id_foreign`(`customer_id`),
    INDEX `ap_notes_entity_id_foreign`(`entity_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ap_pills` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `text` TEXT NOT NULL,
    `color` TEXT NOT NULL,
    `entity_id` INTEGER UNSIGNED NOT NULL,
    `product_is_visible` INTEGER NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    INDEX `ap_pills_entity_id_foreign`(`entity_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ap_plan_types` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `label` TEXT NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ap_plans` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `customer_id` INTEGER UNSIGNED NOT NULL,
    `plan_type_id` INTEGER UNSIGNED NOT NULL,
    `goals` LONGTEXT NOT NULL,
    `progress` LONGTEXT NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    INDEX `ap_plans_customer_id_foreign`(`customer_id`),
    INDEX `ap_plans_plan_type_id_foreign`(`plan_type_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ap_progress` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `text` LONGTEXT NOT NULL,
    `ap_plan_id` INTEGER UNSIGNED NOT NULL,
    `customer_id` INTEGER UNSIGNED NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    INDEX `ap_progress_ap_plan_id_foreign`(`ap_plan_id`),
    INDEX `ap_progress_customer_id_foreign`(`customer_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ap_sections` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `plan_type_id` INTEGER UNSIGNED NOT NULL,
    `academic_skills_ids` TEXT NULL,
    `product_types_ids` TEXT NULL,
    `themes_ids` TEXT NULL,
    `ordinal` INTEGER NOT NULL,
    `label` TEXT NOT NULL,
    `description` TEXT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    INDEX `ap_sections_plan_type_id_foreign`(`plan_type_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `api_keys` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `key` VARCHAR(40) NOT NULL,
    `level` SMALLINT NOT NULL,
    `ignore_limits` BOOLEAN NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `deleted_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `api_keys_key_unique`(`key`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `api_logs` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `api_key_id` INTEGER UNSIGNED NULL,
    `route` VARCHAR(50) NOT NULL,
    `method` VARCHAR(6) NOT NULL,
    `params` TEXT NOT NULL,
    `ip_address` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `api_logs_api_key_id_foreign`(`api_key_id`),
    INDEX `api_logs_method_index`(`method`),
    INDEX `api_logs_route_index`(`route`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `assessments` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `token` VARCHAR(255) NOT NULL,
    `customer_id` INTEGER UNSIGNED NULL,
    `data` LONGTEXT NULL,
    `completed` BOOLEAN NOT NULL DEFAULT false,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    INDEX `assessments_customer_id_foreign`(`customer_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `browser_log` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `logged_in_user` INTEGER UNSIGNED NULL,
    `customer_id` INTEGER UNSIGNED NULL,
    `browscap` LONGTEXT NULL,
    `server` LONGTEXT NULL,
    `ip_details` LONGTEXT NULL,
    `plugins` LONGTEXT NULL,
    `created_at` VARCHAR(255) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cache` (
    `key` VARCHAR(255) NOT NULL,
    `value` TEXT NOT NULL,
    `expiration` INTEGER NOT NULL,

    UNIQUE INDEX `cache_key_unique`(`key`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `clinician_summary_jobs` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `customer_id` INTEGER NOT NULL,
    `learning_profile_id` INTEGER NOT NULL,
    `attempts` INTEGER NOT NULL DEFAULT 0,
    `last_error` LONGTEXT NULL,
    `reserved_at` TIMESTAMP(0) NULL,
    `completed_at` TIMESTAMP(0) NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `coupons` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(100) NOT NULL DEFAULT '',
    `type` VARCHAR(100) NOT NULL DEFAULT '',
    `value` DECIMAL(5, 2) NOT NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customer_cognitive_skills_lookup` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `customer_id` INTEGER UNSIGNED NOT NULL,
    `family_id` INTEGER UNSIGNED NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `learning_profile_id` INTEGER UNSIGNED NOT NULL,
    `assessed_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `data` LONGTEXT NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customer_customer` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `customer_id_adult` INTEGER NOT NULL,
    `customer_id_child` INTEGER NOT NULL,
    `can_administer_assessment` BOOLEAN NOT NULL DEFAULT false,

    UNIQUE INDEX `customer_id_adult_customer_id_children`(`customer_id_adult`, `customer_id_child`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customer_product` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `customer_id` INTEGER NULL,
    `product_id` INTEGER NULL,
    `completed` BOOLEAN NOT NULL DEFAULT false,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `type` ENUM('product', 'resource') NOT NULL DEFAULT 'product',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customer_profile_dimensions_lookup` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `family_id` INTEGER UNSIGNED NOT NULL,
    `customer_id` INTEGER UNSIGNED NOT NULL,
    `learning_profile_id` INTEGER UNSIGNED NOT NULL,
    `dimension_id` INTEGER UNSIGNED NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `final_score` VARCHAR(255) NOT NULL,
    `final_range` VARCHAR(255) NOT NULL,
    `data` LONGTEXT NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `top_products` VARCHAR(255) NULL,
    `is_processed` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customer_profile_dimensions_lookup_feb19` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `family_id` INTEGER UNSIGNED NOT NULL,
    `customer_id` INTEGER UNSIGNED NOT NULL,
    `learning_profile_id` INTEGER UNSIGNED NOT NULL,
    `dimension_id` INTEGER UNSIGNED NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `final_score` VARCHAR(255) NOT NULL,
    `final_range` VARCHAR(255) NOT NULL,
    `data` LONGTEXT NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `top_products` VARCHAR(255) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customer_profile_dimensions_lookup_top_products` (
    `id` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `family_id` INTEGER UNSIGNED NOT NULL,
    `customer_id` INTEGER UNSIGNED NOT NULL,
    `learning_profile_id` INTEGER UNSIGNED NOT NULL,
    `dimension_id` INTEGER UNSIGNED NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `final_score` VARCHAR(255) NOT NULL,
    `final_range` VARCHAR(255) NOT NULL,
    `data` LONGTEXT NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `top_products` VARCHAR(255) NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customer_resources` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `customer_id` INTEGER UNSIGNED NOT NULL,
    `resource_url` LONGTEXT NULL,
    `title` TEXT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    INDEX `customer_resources_customer_id_foreign`(`customer_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customers` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `family_id` INTEGER UNSIGNED NOT NULL,
    `nwea_bid` VARCHAR(64) NULL,
    `member` INTEGER NOT NULL DEFAULT 1,
    `plan_id` INTEGER UNSIGNED NULL,
    `plan_expires` INTEGER UNSIGNED NULL,
    `primary` BOOLEAN NULL,
    `is_business_override` BOOLEAN NOT NULL DEFAULT false,
    `can_assess` TINYINT UNSIGNED NULL DEFAULT 0,
    `active` BOOLEAN NOT NULL DEFAULT true,
    `email` VARCHAR(100) NULL,
    `username` LONGTEXT NULL,
    `password` VARCHAR(100) NULL,
    `logins` INTEGER NOT NULL DEFAULT 0,
    `token` VARCHAR(100) NULL,
    `first_name` LONGTEXT NULL,
    `last_name` LONGTEXT NULL,
    `display_name` LONGTEXT NULL,
    `display_name_expanded` BOOLEAN NOT NULL DEFAULT true,
    `type` ENUM('child', 'adult') NOT NULL DEFAULT 'adult',
    `gender` ENUM('male', 'female') NULL,
    `birthdate` DATE NULL,
    `evaluation_date` DATE NULL,
    `questionnaire` TEXT NULL,
    `learning_profile` TEXT NULL,
    `interests` TEXT NULL,
    `coupon_code` VARCHAR(100) NULL DEFAULT '',
    `remember_token` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,
    `persona` VARCHAR(255) NULL,
    `username_hash` VARCHAR(255) NULL,
    `last_login_at` TIMESTAMP(0) NULL,
    `is_active` BOOLEAN NULL DEFAULT true,
    `external_identifier` VARCHAR(255) NULL DEFAULT '',
    `state` VARCHAR(255) NULL,
    `school_name` VARCHAR(255) NULL,
    `is_expired` BOOLEAN NOT NULL DEFAULT false,
    `code` VARCHAR(255) NULL DEFAULT '',
    `deleted_at` DATETIME(0) NULL,

    UNIQUE INDEX `family_id_member`(`family_id`, `member`),
    UNIQUE INDEX `family_id_primary`(`family_id`, `primary`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customers_backup` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `family_id` INTEGER UNSIGNED NOT NULL,
    `member` INTEGER NOT NULL DEFAULT 1,
    `plan_id` INTEGER UNSIGNED NULL,
    `plan_expires` INTEGER UNSIGNED NULL,
    `primary` BOOLEAN NULL,
    `is_business_override` BOOLEAN NOT NULL DEFAULT false,
    `can_assess` TINYINT UNSIGNED NULL DEFAULT 0,
    `active` BOOLEAN NOT NULL DEFAULT true,
    `email` VARCHAR(100) NULL,
    `username` LONGTEXT NULL,
    `password` VARCHAR(100) NULL,
    `logins` INTEGER NOT NULL DEFAULT 0,
    `token` VARCHAR(100) NULL,
    `first_name` LONGTEXT NULL,
    `last_name` LONGTEXT NULL,
    `display_name` LONGTEXT NULL,
    `display_name_expanded` BOOLEAN NOT NULL DEFAULT true,
    `type` ENUM('child', 'adult') NOT NULL DEFAULT 'adult',
    `gender` ENUM('male', 'female') NULL,
    `birthdate` DATE NULL,
    `evaluation_date` DATE NULL,
    `questionnaire` TEXT NULL,
    `learning_profile` TEXT NULL,
    `interests` TEXT NULL,
    `coupon_code` VARCHAR(100) NULL DEFAULT '',
    `remember_token` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,
    `persona` VARCHAR(255) NULL,
    `username_hash` VARCHAR(255) NULL,
    `last_login_at` TIMESTAMP(0) NULL,
    `is_active` BOOLEAN NULL DEFAULT true,
    `external_identifier` VARCHAR(255) NOT NULL,

    UNIQUE INDEX `family_id_member`(`family_id`, `member`),
    UNIQUE INDEX `family_id_primary`(`family_id`, `primary`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `dashboards` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `internal_name` VARCHAR(255) NULL,
    `external_name` VARCHAR(255) NULL,
    `dimension_sets` VARCHAR(255) NULL,
    `min_age` INTEGER NULL,
    `max_age` INTEGER NULL,
    `use_as_grade` BOOLEAN NOT NULL DEFAULT true,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `dashboards_archive` (
    `id` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `internal_name` VARCHAR(255) NULL,
    `external_name` VARCHAR(255) NULL,
    `dimension_sets` VARCHAR(255) NULL,
    `min_age` INTEGER NULL,
    `max_age` INTEGER NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `deactivation_log` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `deactivating_customer_id` INTEGER NOT NULL,
    `customer_being_deactivated` INTEGER NOT NULL,
    `created_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `dimension_archive` (
    `id` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `code` VARCHAR(255) NULL,
    `name` VARCHAR(255) NULL,
    `note` VARCHAR(255) NULL,
    `weight_primary` VARCHAR(255) NOT NULL DEFAULT '3',
    `weight_secondary` VARCHAR(255) NOT NULL DEFAULT '2',
    `weight_tertiary` VARCHAR(255) NOT NULL DEFAULT '1',
    `strength_range_start` VARCHAR(255) NOT NULL DEFAULT '27',
    `weakness_range_start` VARCHAR(255) NOT NULL DEFAULT '-27',
    `point_match` TEXT NULL,
    `dimension_data_map` TEXT NULL,
    `academic_topics` VARCHAR(255) NULL,
    `product_types` VARCHAR(255) NULL,
    `themes` VARCHAR(255) NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `dimension_sets` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `internal_name` VARCHAR(255) NULL,
    `external_name` VARCHAR(255) NULL,
    `dimensions` VARCHAR(255) NULL,
    `custom_label_for_support` VARCHAR(255) NULL,
    `custom_label_for_watch` VARCHAR(255) NULL,
    `custom_label_for_nurture` VARCHAR(255) NULL,
    `custom_description_for_support` VARCHAR(255) NULL,
    `custom_description_for_watch` VARCHAR(255) NULL,
    `custom_description_for_nurture` VARCHAR(255) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `dimension_sets_archive` (
    `id` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `internal_name` VARCHAR(255) NULL,
    `external_name` VARCHAR(255) NULL,
    `dimensions` VARCHAR(255) NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `dimensions` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(255) NULL,
    `name` VARCHAR(255) NULL,
    `note` VARCHAR(255) NULL,
    `weight_primary` VARCHAR(255) NOT NULL DEFAULT '3',
    `weight_secondary` VARCHAR(255) NOT NULL DEFAULT '2',
    `weight_tertiary` VARCHAR(255) NOT NULL DEFAULT '1',
    `strength_range_start` VARCHAR(255) NOT NULL DEFAULT '27',
    `weakness_range_start` VARCHAR(255) NOT NULL DEFAULT '-27',
    `point_match` TEXT NULL,
    `dimension_data_map` TEXT NULL,
    `academic_topics` VARCHAR(255) NULL,
    `product_types` VARCHAR(255) NULL,
    `themes` VARCHAR(255) NULL,
    `give_support` VARCHAR(255) NULL,
    `watch_carefully` VARCHAR(255) NULL,
    `continue_strengthen` VARCHAR(255) NULL,
    `tooltip_text` VARCHAR(255) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ea_external_assessments` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `mindprint_customer_id` INTEGER NOT NULL,
    `family_id` INTEGER NULL,
    `test_session_date` DATE NULL,
    `student_grade` INTEGER NULL,
    `english_language_learner` BOOLEAN NULL,
    `special_education` BOOLEAN NULL,
    `economically_disadvantaged` BOOLEAN NULL,
    `migrant` BOOLEAN NULL,
    `extended_time` BOOLEAN NULL,
    `test_name` VARCHAR(255) NULL,
    `untimed` BOOLEAN NULL,
    `test_subject` VARCHAR(255) NULL,
    `test_topic` VARCHAR(255) NULL,
    `test_term` VARCHAR(255) NULL,
    `test_academic_year_start` INTEGER NULL,
    `test_academic_year_end` INTEGER NULL,
    `student_age` INTEGER NULL,
    `student_diagnostic_score` INTEGER NULL,
    `student_percentile_score` FLOAT NULL,
    `projected_growth` INTEGER NULL,
    `actual_growth` INTEGER NULL,
    `performance_categorization` VARCHAR(255) NULL,
    `diagnostic_time_on_task` INTEGER NULL,
    `diagnostic_rush_flag` BOOLEAN NULL,
    `diagnostic_placement` VARCHAR(255) NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `email_queue` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `uid_type` VARCHAR(255) NOT NULL,
    `uid_value` VARCHAR(255) NOT NULL,
    `queue_name` VARCHAR(255) NOT NULL,
    `recipient_email` VARCHAR(255) NOT NULL,
    `email_subject` VARCHAR(255) NOT NULL,
    `html` LONGTEXT NOT NULL,
    `send_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `sent` BOOLEAN NOT NULL DEFAULT false,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `entrust_assigned_roles` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `role_id` INTEGER UNSIGNED NOT NULL,

    INDEX `entrust_assigned_roles_role_id_foreign`(`role_id`),
    INDEX `entrust_assigned_roles_user_id_foreign`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `entrust_permission_role` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `permission_id` INTEGER UNSIGNED NOT NULL,
    `role_id` INTEGER UNSIGNED NOT NULL,

    INDEX `entrust_permission_role_permission_id_foreign`(`permission_id`),
    INDEX `entrust_permission_role_role_id_foreign`(`role_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `entrust_permissions` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `display_name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    UNIQUE INDEX `entrust_permissions_name_unique`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `entrust_roles` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    UNIQUE INDEX `entrust_roles_name_unique`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `event_tracking` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `data` LONGTEXT NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `families` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `confirmation` TEXT NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `feature_academic_features` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `entry` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `feature_academic_skills` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `parent_id` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `entry` VARCHAR(100) NOT NULL,
    `search_terms` VARCHAR(255) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `feature_cognitive_features` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `entry` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `feature_cognitive_skills` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `entry` VARCHAR(255) NOT NULL,
    `details` VARCHAR(255) NOT NULL,
    `article_id` INTEGER UNSIGNED NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `feature_cognitive_skills_aliases` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `cognitive_skill_id` INTEGER UNSIGNED NOT NULL,
    `alias` TEXT NOT NULL,
    `score_base` INTEGER NOT NULL,
    `score_extra` INTEGER NOT NULL,

    INDEX `feature_cognitive_skills_aliases_cognitive_skill_id_foreign`(`cognitive_skill_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `feature_enjoyability` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `entry` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `feature_game_types` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `entry` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `feature_interests` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `category` VARCHAR(255) NULL,
    `entry` VARCHAR(255) NOT NULL,
    `search_terms` VARCHAR(255) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `feature_not_recommended_elements` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `entry` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `feature_requirements` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `entry` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `feature_tags` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `entry` VARCHAR(255) NOT NULL DEFAULT '',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `feature_themes` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `entry` TEXT NOT NULL,
    `icon` TEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `feature_to_feature` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `feature_1` VARCHAR(255) NOT NULL,
    `entry_1` INTEGER NOT NULL,
    `feature_2` VARCHAR(255) NOT NULL,
    `entry_2` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `feature_usability` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `entry` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `feature_warnings` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `entry` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `generic_groups` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `org_id` INTEGER UNSIGNED NOT NULL,
    `parent_id` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `name` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `grade` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `groupable_members` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `group_id` INTEGER UNSIGNED NOT NULL,
    `group_type` VARCHAR(255) NOT NULL,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `groupable_roles` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `group_id` INTEGER UNSIGNED NOT NULL,
    `group_type` VARCHAR(255) NOT NULL,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `role` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `groupables` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `group_id` INTEGER UNSIGNED NOT NULL,
    `group_type` VARCHAR(255) NOT NULL,
    `groupable_id` INTEGER UNSIGNED NOT NULL,
    `groupable_type` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `impersonators` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `admin_user_id` INTEGER UNSIGNED NULL,
    `customer_id` INTEGER UNSIGNED NULL,
    `token` TEXT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `used` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `type` VARCHAR(255) NOT NULL DEFAULT 'admin',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `learning_profile_copy_blocks` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `test` VARCHAR(255) NULL,
    `category` VARCHAR(255) NULL,
    `body` TEXT NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `learning_profile_notes` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `learning_profile_id` INTEGER NOT NULL,
    `user_id` INTEGER NULL,
    `text` LONGTEXT NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `learning_profile_templates` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `body` MEDIUMTEXT NOT NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `learning_profiles` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `customer_id` INTEGER UNSIGNED NOT NULL,
    `family_id` INTEGER UNSIGNED NOT NULL,
    `member_id` INTEGER UNSIGNED NOT NULL,
    `user_id` INTEGER UNSIGNED NULL,
    `user_id_approved` INTEGER UNSIGNED NULL,
    `learning_profile_template_id` INTEGER UNSIGNED NULL DEFAULT 1,
    `subid` VARCHAR(25) NOT NULL DEFAULT '',
    `results` TEXT NULL,
    `compiled` LONGTEXT NULL,
    `status` ENUM('test_started', 'test_finished', 'review_started', 'review_finished', 'review_sent', 'batch_processing_hold') NULL,
    `report_text` TEXT NULL,
    `clinician_summary` TEXT NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,
    `completed_at` DATETIME(0) NULL,
    `due_at` DATETIME(0) NULL,
    `assigned_at` DATETIME(0) NULL,
    `approved_at` DATETIME(0) NULL,
    `visual_motor_speed_accuracy` DECIMAL(10, 4) NULL,
    `visual_motor_speed_speed` DECIMAL(10, 4) NULL,
    `visual_motor_speed_validity` BOOLEAN NULL,
    `flexible_thinking_accuracy` DECIMAL(10, 4) NULL,
    `flexible_thinking_speed` DECIMAL(10, 4) NULL,
    `flexible_thinking_efficiency` DECIMAL(10, 4) NULL,
    `flexible_thinking_validity` BOOLEAN NULL,
    `spatial_perception_validity` BOOLEAN NULL,
    `attention_accuracy` DECIMAL(10, 4) NULL,
    `attention_speed` DECIMAL(10, 4) NULL,
    `attention_efficiency` DECIMAL(10, 4) NULL,
    `attention_validity` BOOLEAN NULL,
    `working_memory_accuracy` DECIMAL(10, 4) NULL,
    `working_memory_speed` DECIMAL(10, 4) NULL,
    `working_memory_efficiency` DECIMAL(10, 4) NULL,
    `working_memory_validity` BOOLEAN NULL,
    `visual_memory_accuracy` DECIMAL(10, 4) NULL,
    `visual_memory_speed` DECIMAL(10, 4) NULL,
    `visual_memory_validity` BOOLEAN NULL,
    `verbal_memory_accuracy` DECIMAL(10, 4) NULL,
    `verbal_memory_speed` DECIMAL(10, 4) NULL,
    `verbal_memory_validity` BOOLEAN NULL,
    `abstract_reasoning_accuracy` DECIMAL(10, 4) NULL,
    `abstract_reasoning_speed` DECIMAL(10, 4) NULL,
    `abstract_reasoning_validity` BOOLEAN NULL,
    `verbal_reasoning_accuracy` DECIMAL(10, 4) NULL,
    `verbal_reasoning_speed` DECIMAL(10, 4) NULL,
    `verbal_reasoning_validity` BOOLEAN NULL,
    `spatial_perception_accuracy` DECIMAL(10, 4) NULL,
    `spatial_perception_speed` DECIMAL(10, 4) NULL,
    `spatial_perception_efficiency` DECIMAL(10, 4) NULL,
    `processing_speed_speed` DECIMAL(10, 4) NULL,
    `processing_speed_validity` BOOLEAN NULL,
    `reversals` DECIMAL(10, 0) NULL,
    `display_mode` ENUM('default', 'mindprint-scores', 'mindprint-assist', 'mindprint-att-screener', 'mindprint-etswm', 'mindprint-etsvrwmvmspa') NULL DEFAULT 'default',
    `proctor_feedback` LONGTEXT NULL,
    `clinician_summary_strengths` LONGTEXT NULL,
    `clinician_summary_needs` LONGTEXT NULL,
    `clinician_summary_recommendations` LONGTEXT NULL,
    `is_trial` BOOLEAN NOT NULL DEFAULT false,
    `has_cnb_records` BOOLEAN NOT NULL DEFAULT false,
    `has_cnb_records_timestamp` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `clinician_summary_overall` LONGTEXT NULL,
    `clinician_summary_reading` LONGTEXT NULL,
    `clinician_summary_english` LONGTEXT NULL,
    `clinician_summary_math` LONGTEXT NULL,
    `clinician_summary_science` LONGTEXT NULL,
    `nwea_predict_scores` LONGTEXT NULL,
    `deleted_at` DATETIME(0) NULL,

    INDEX `customer_id`(`customer_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `learning_profiles_backup` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `customer_id` INTEGER UNSIGNED NOT NULL,
    `family_id` INTEGER UNSIGNED NOT NULL,
    `member_id` INTEGER UNSIGNED NOT NULL,
    `user_id` INTEGER UNSIGNED NULL,
    `user_id_approved` INTEGER UNSIGNED NULL,
    `learning_profile_template_id` INTEGER UNSIGNED NULL DEFAULT 1,
    `subid` VARCHAR(25) NOT NULL DEFAULT '',
    `results` TEXT NULL,
    `compiled` TEXT NULL,
    `status` ENUM('test_started', 'test_finished', 'review_started', 'review_finished', 'review_sent', 'batch_processing_hold') NULL,
    `report_text` TEXT NULL,
    `clinician_summary` TEXT NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,
    `completed_at` DATETIME(0) NULL,
    `due_at` DATETIME(0) NULL,
    `assigned_at` DATETIME(0) NULL,
    `approved_at` DATETIME(0) NULL,
    `visual_motor_speed_accuracy` DECIMAL(10, 4) NULL,
    `visual_motor_speed_speed` DECIMAL(10, 4) NULL,
    `visual_motor_speed_validity` BOOLEAN NULL,
    `flexible_thinking_accuracy` DECIMAL(10, 4) NULL,
    `flexible_thinking_speed` DECIMAL(10, 4) NULL,
    `flexible_thinking_efficiency` DECIMAL(10, 4) NULL,
    `flexible_thinking_validity` BOOLEAN NULL,
    `attention_accuracy` DECIMAL(10, 4) NULL,
    `attention_speed` DECIMAL(10, 4) NULL,
    `attention_efficiency` DECIMAL(10, 4) NULL,
    `attention_validity` BOOLEAN NULL,
    `working_memory_accuracy` DECIMAL(10, 4) NULL,
    `working_memory_speed` DECIMAL(10, 4) NULL,
    `working_memory_efficiency` DECIMAL(10, 4) NULL,
    `working_memory_validity` BOOLEAN NULL,
    `visual_memory_accuracy` DECIMAL(10, 4) NULL,
    `visual_memory_speed` DECIMAL(10, 4) NULL,
    `visual_memory_validity` BOOLEAN NULL,
    `verbal_memory_accuracy` DECIMAL(10, 4) NULL,
    `verbal_memory_speed` DECIMAL(10, 4) NULL,
    `verbal_memory_validity` BOOLEAN NULL,
    `abstract_reasoning_accuracy` DECIMAL(10, 4) NULL,
    `abstract_reasoning_speed` DECIMAL(10, 4) NULL,
    `abstract_reasoning_validity` BOOLEAN NULL,
    `verbal_reasoning_accuracy` DECIMAL(10, 4) NULL,
    `verbal_reasoning_speed` DECIMAL(10, 4) NULL,
    `verbal_reasoning_validity` BOOLEAN NULL,
    `spatial_perception_accuracy` DECIMAL(10, 4) NULL,
    `spatial_perception_speed` DECIMAL(10, 4) NULL,
    `spatial_perception_efficiency` DECIMAL(10, 4) NULL,
    `spatial_perception_validity` BOOLEAN NULL,
    `processing_speed_speed` DECIMAL(10, 4) NULL,
    `processing_speed_validity` BOOLEAN NULL,
    `reversals` DECIMAL(10, 0) NULL,
    `display_mode` ENUM('default', 'mindprint-scores', 'mindprint-assist', 'mindprint-att-screener') NULL DEFAULT 'default',
    `proctor_feedback` LONGTEXT NULL,
    `clinician_summary_strengths` LONGTEXT NULL,
    `clinician_summary_needs` LONGTEXT NULL,
    `clinician_summary_recommendations` LONGTEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `lti2_consumer` (
    `consumer_pk` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `consumer_key256` VARCHAR(256) NOT NULL,
    `consumer_key` TEXT NULL,
    `secret` VARCHAR(1024) NOT NULL,
    `lti_version` VARCHAR(10) NULL,
    `consumer_name` VARCHAR(255) NULL,
    `consumer_version` VARCHAR(255) NULL,
    `consumer_guid` VARCHAR(1024) NULL,
    `profile` TEXT NULL,
    `tool_proxy` TEXT NULL,
    `settings` TEXT NULL,
    `protected` BOOLEAN NOT NULL,
    `enabled` BOOLEAN NOT NULL,
    `enable_from` DATETIME(0) NULL,
    `enable_until` DATETIME(0) NULL,
    `last_access` DATE NULL,
    `created` DATETIME(0) NOT NULL,
    `updated` DATETIME(0) NOT NULL,

    UNIQUE INDEX `lti2_consumer_consumer_key_UNIQUE`(`consumer_key256`),
    PRIMARY KEY (`consumer_pk`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `lti2_context` (
    `context_pk` INTEGER NOT NULL AUTO_INCREMENT,
    `consumer_pk` INTEGER NOT NULL,
    `lti_context_id` VARCHAR(255) NOT NULL,
    `settings` TEXT NULL,
    `created` DATETIME(0) NOT NULL,
    `updated` DATETIME(0) NOT NULL,

    INDEX `lti2_context_consumer_id_IDX`(`consumer_pk`),
    PRIMARY KEY (`context_pk`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `lti2_nonce` (
    `consumer_pk` INTEGER NOT NULL,
    `value` VARCHAR(32) NOT NULL,
    `expires` DATETIME(0) NOT NULL,

    PRIMARY KEY (`consumer_pk`, `value`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `lti2_resource_link` (
    `resource_link_pk` INTEGER NOT NULL AUTO_INCREMENT,
    `context_pk` INTEGER NULL,
    `consumer_pk` INTEGER NULL,
    `lti_resource_link_id` VARCHAR(255) NOT NULL,
    `settings` TEXT NULL,
    `primary_resource_link_pk` INTEGER NULL,
    `share_approved` BOOLEAN NULL,
    `created` DATETIME(0) NOT NULL,
    `updated` DATETIME(0) NOT NULL,

    INDEX `lti2_resource_link_consumer_pk_IDX`(`consumer_pk`),
    INDEX `lti2_resource_link_context_pk_IDX`(`context_pk`),
    INDEX `lti2_resource_link_lti2_resource_link_FK1`(`primary_resource_link_pk`),
    PRIMARY KEY (`resource_link_pk`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `lti2_share_key` (
    `share_key_id` VARCHAR(32) NOT NULL,
    `resource_link_pk` INTEGER NOT NULL,
    `auto_approve` BOOLEAN NOT NULL,
    `expires` DATETIME(0) NOT NULL,

    INDEX `lti2_share_key_resource_link_pk_IDX`(`resource_link_pk`),
    PRIMARY KEY (`share_key_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `lti2_tool_proxy` (
    `tool_proxy_pk` INTEGER NOT NULL AUTO_INCREMENT,
    `tool_proxy_id` VARCHAR(32) NOT NULL,
    `consumer_pk` INTEGER NOT NULL,
    `tool_proxy` TEXT NOT NULL,
    `created` DATETIME(0) NOT NULL,
    `updated` DATETIME(0) NOT NULL,

    UNIQUE INDEX `lti2_tool_proxy_tool_proxy_id_UNIQUE`(`tool_proxy_id`),
    INDEX `lti2_tool_proxy_consumer_id_IDX`(`consumer_pk`),
    PRIMARY KEY (`tool_proxy_pk`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `lti2_user_result` (
    `user_pk` INTEGER NOT NULL AUTO_INCREMENT,
    `resource_link_pk` INTEGER NOT NULL,
    `lti_user_id` VARCHAR(255) NOT NULL,
    `lti_result_sourcedid` VARCHAR(1024) NOT NULL,
    `created` DATETIME(0) NOT NULL,
    `updated` DATETIME(0) NOT NULL,

    INDEX `lti2_user_result_resource_link_pk_IDX`(`resource_link_pk`),
    PRIMARY KEY (`user_pk`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `magento_orders` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `magento_order_id` INTEGER UNSIGNED NULL,
    `magento_customer_id` INTEGER UNSIGNED NULL,
    `magento_product_sku` VARCHAR(255) NULL,
    `magento_product_name` VARCHAR(255) NULL,
    `magento_product_attr_plan_id` INTEGER UNSIGNED NULL,
    `magento_product_attr_plan_expire_days` INTEGER UNSIGNED NULL,
    `magento_product_purchase_date` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `magento_product_attr_plan_activation` ENUM('on-purchase', 'on-assignment') NOT NULL DEFAULT 'on-purchase',
    `magento_coupon_code` VARCHAR(255) NULL,
    `mindprint_purchaser_customer_id` INTEGER UNSIGNED NULL,
    `mindprint_assigned_to_customer_id` INTEGER UNSIGNED NULL,
    `mindprint_product_assignment_date` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `mindprint_product_expiration_date` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `mindprint_status` ENUM('purchased', 'assigned') NOT NULL DEFAULT 'purchased',
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `magento_product_attr_display_mode` ENUM('default', 'mindprint-scores', 'mindprint-assist', 'mindprint-att-screener', 'mindprint-etswm', 'mindprint-etsvrwmvmspa') NULL DEFAULT 'default',
    `is_upgraded` BOOLEAN NOT NULL DEFAULT false,
    `is_api_order` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `migrations` (
    `migration` VARCHAR(255) NOT NULL,
    `batch` INTEGER NOT NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `notification_jobs` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `notification_name` TEXT NOT NULL,
    `notification_datetime` DATETIME(0) NOT NULL,
    `notification_type` TEXT NOT NULL,
    `job_status` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `oa_accounts` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `oa_aggregate_stats` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER NULL,
    `organization_id` INTEGER NULL,
    `family_id` INTEGER NULL,
    `org_name` VARCHAR(255) NULL,
    `family_name` VARCHAR(255) NULL,
    `active_student_count` INTEGER NULL,
    `not_started` INTEGER NULL,
    `in_progress` INTEGER NULL,
    `completed` INTEGER NULL,
    `comprehensive_count` INTEGER NULL,
    `scores_count` INTEGER NULL,
    `extension_count` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `oa_credits` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER UNSIGNED NOT NULL,
    `organization_id` INTEGER UNSIGNED NOT NULL,
    `magento_order_id` INTEGER UNSIGNED NULL,
    `magento_product_sku` VARCHAR(255) NOT NULL,
    `magento_product_name` VARCHAR(255) NOT NULL,
    `magento_product_id` INTEGER UNSIGNED NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `username` VARCHAR(255) NOT NULL,

    INDEX `account_id`(`account_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `oa_map_account_org` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER UNSIGNED NOT NULL,
    `organization_id` INTEGER UNSIGNED NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    INDEX `oa_map_account_org_account_id_foreign`(`account_id`),
    INDEX `oa_map_account_org_organization_id_foreign`(`organization_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `oa_users` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `account_id` INTEGER UNSIGNED NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NULL,
    `password` LONGTEXT NOT NULL,
    `first_name` VARCHAR(255) NULL,
    `last_name` VARCHAR(255) NULL,
    `remember_token` VARCHAR(255) NULL,
    `active` BOOLEAN NOT NULL DEFAULT true,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    INDEX `oa_users_account_id_foreign`(`account_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `opened` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `mindprint_academic_skill_id` INTEGER NULL,
    `mindprint_cognitive_skill_id` VARCHAR(255) NULL,
    `mindprint_product_type_id` VARCHAR(255) NULL,
    `opened_academic_topic` VARCHAR(255) NULL,
    `common_core_opened_drop_down` VARCHAR(255) NULL,
    `common_core_standards` VARCHAR(255) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `orders` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `customer_id` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `stripe_charge_id` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `org_customers` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `organization_id` INTEGER NOT NULL,
    `customer_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `org_toolbox_categories` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `organization_id` INTEGER NOT NULL,
    `toolbox_category_id` INTEGER NOT NULL,
    `sort_order` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `organizations` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `org_code` LONGTEXT NULL,
    `org_name` LONGTEXT NULL,
    `org_short_name` LONGTEXT NULL,
    `child_show_free_products_only` BOOLEAN NOT NULL DEFAULT false,
    `child_safe_mode_exclude_list` VARCHAR(255) NULL,
    `subscription_plan` BOOLEAN NOT NULL DEFAULT false,
    `subscription_toolboxes_count` INTEGER NULL,
    `reading_plan_age_limit` INTEGER NULL,
    `override_tpl` BOOLEAN NOT NULL DEFAULT false,
    `batch_profile_processing` BOOLEAN NOT NULL DEFAULT false,
    `test_taking_plan_age_limit` INTEGER NULL,
    `group_mode` ENUM('school', 'section') NOT NULL DEFAULT 'section',
    `show_beta_features` BOOLEAN NOT NULL DEFAULT false,
    `excluded_dashboard_ids` VARCHAR(255) NULL,
    `included_action_plan_ids` VARCHAR(255) NULL DEFAULT '2',
    `org_notes` LONGTEXT NULL,
    `lti_consumer_key` TEXT NOT NULL,
    `show_renewals` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `payload_jobs` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `job_id` VARCHAR(255) NOT NULL,
    `ordinal` INTEGER UNSIGNED NOT NULL,
    `data` LONGTEXT NOT NULL,
    `status` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `plan_extensions` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `plan_id` INTEGER UNSIGNED NULL,
    `default_extension_days` INTEGER UNSIGNED NULL,
    `magento_product_id` INTEGER UNSIGNED NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `plan_queue` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `customer_id` INTEGER NOT NULL,
    `plan_type_id` INTEGER NOT NULL,
    `section_ids` VARCHAR(255) NOT NULL,
    `queue_status` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `plan_upgrades` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `from_plan_id` INTEGER UNSIGNED NULL,
    `to_plan_id` INTEGER UNSIGNED NULL,
    `magento_product_id` INTEGER UNSIGNED NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `magento_from_product_sku` VARCHAR(255) NULL,
    `status_transition` VARCHAR(255) NULL,
    `new_assignment` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `plans` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL DEFAULT '',
    `magento_name` TEXT NULL,
    `description` VARCHAR(255) NOT NULL DEFAULT '',
    `magento_description` TEXT NULL,
    `type` ENUM('child', 'adult') NOT NULL DEFAULT 'adult',
    `duration` INTEGER NOT NULL DEFAULT 0,
    `requires_evaluation` TINYINT NOT NULL DEFAULT 0,
    `default` TINYINT NULL DEFAULT 0,
    `price` DECIMAL(10, 0) NOT NULL DEFAULT 0,
    `price_discounted` DECIMAL(10, 0) NOT NULL DEFAULT 0,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `portal_customers` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `customer_id` INTEGER NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `skip_questionnaire` BOOLEAN NOT NULL DEFAULT false,
    `assessment_portal_status` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `priorities` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `priority_score` DOUBLE NOT NULL,
    `priority_label` VARCHAR(255) NOT NULL,
    `priority_description` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `priority_determinants` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `cognitive_skill_id` INTEGER NOT NULL,
    `data_source` VARCHAR(255) NOT NULL DEFAULT 'score',
    `data_formula` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_features` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `product_id` INTEGER UNSIGNED NOT NULL,
    `feature` VARCHAR(255) NOT NULL,
    `entry` INTEGER UNSIGNED NOT NULL,

    UNIQUE INDEX `product_id`(`product_id`, `feature`, `entry`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_priority_map` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `product_id` INTEGER NOT NULL,
    `skill_id` INTEGER NOT NULL,
    `skill_component` VARCHAR(255) NOT NULL DEFAULT 'score',
    `priority_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_product_type` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `product_id` INTEGER UNSIGNED NULL,
    `product_type_id` INTEGER UNSIGNED NULL,

    INDEX `product_product_type_product_type_id_foreign`(`product_type_id`),
    UNIQUE INDEX `product_product_type_product_id_product_type_id_unique`(`product_id`, `product_type_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_types` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_types2` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `parent_id` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `old_type_id` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `image_url` VARCHAR(255) NULL,
    `name_alt` VARCHAR(255) NULL,
    `sort_order` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `products` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `status` VARCHAR(100) NOT NULL DEFAULT 'To Be Reviewed',
    `high_priority` VARCHAR(255) NOT NULL DEFAULT '',
    `user_id` INTEGER UNSIGNED NOT NULL DEFAULT 0,
    `user_id_modified` INTEGER UNSIGNED NULL,
    `review_feedback` MEDIUMTEXT NULL,
    `time_approved` INTEGER NULL,
    `paid` TINYINT UNSIGNED NOT NULL DEFAULT 0,
    `payment_note` VARCHAR(255) NOT NULL DEFAULT '',
    `type` INTEGER NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` MEDIUMTEXT NULL,
    `mindprint_age_range_start` TINYINT UNSIGNED NULL,
    `mindprint_age_range_end` TINYINT UNSIGNED NULL,
    `manufacturer_age_range_start` TINYINT UNSIGNED NULL,
    `manufacturer_age_range_end` TINYINT UNSIGNED NULL,
    `api_result` MEDIUMTEXT NULL,
    `mindprint_review` MEDIUMTEXT NULL,
    `mindprint_review_2` MEDIUMTEXT NULL,
    `user_review` MEDIUMTEXT NULL,
    `sysdevplat` MEDIUMTEXT NULL,
    `specific_pros_1` MEDIUMTEXT NULL,
    `specific_pros_2` MEDIUMTEXT NULL,
    `specific_pros_3` MEDIUMTEXT NULL,
    `specific_cons_1` MEDIUMTEXT NULL,
    `specific_cons_2` MEDIUMTEXT NULL,
    `specific_cons_3` MEDIUMTEXT NULL,
    `specific_pros_1_2` MEDIUMTEXT NULL,
    `specific_pros_2_2` MEDIUMTEXT NULL,
    `specific_pros_3_2` MEDIUMTEXT NULL,
    `specific_cons_1_2` MEDIUMTEXT NULL,
    `specific_cons_2_2` MEDIUMTEXT NULL,
    `specific_cons_3_2` MEDIUMTEXT NULL,
    `mindprint_rating` DECIMAL(2, 1) NULL,
    `user_rating` DECIMAL(2, 1) NULL,
    `manufacturer` VARCHAR(255) NULL,
    `publisher` VARCHAR(255) NULL,
    `company` VARCHAR(255) NULL,
    `author` VARCHAR(255) NULL,
    `version` VARCHAR(255) NULL,
    `url` VARCHAR(255) NULL,
    `url_image` VARCHAR(255) NULL,
    `url_image_optimized` VARCHAR(255) NULL,
    `url_itunes` VARCHAR(255) NULL,
    `url_amazon` VARCHAR(255) NULL,
    `url_play` VARCHAR(255) NULL,
    `retail_id_amazon` VARCHAR(255) NULL,
    `retail_id_itunes` VARCHAR(255) NULL,
    `retail_id_play` VARCHAR(255) NULL,
    `isbn` VARCHAR(255) NULL,
    `copyright` VARCHAR(255) NULL,
    `pricing` VARCHAR(10) NULL,
    `price` DECIMAL(10, 2) NULL,
    `primary_theme_id` INTEGER UNSIGNED NULL,
    `tags` TEXT NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,
    `scanned_at` DATETIME(0) NULL,
    `last_scan_status` VARCHAR(255) NULL,
    `icon_background_color` VARCHAR(255) NULL,
    `booster` INTEGER NOT NULL DEFAULT 0,
    `customer_must_have_these_cognitive_strengths` VARCHAR(255) NULL,
    `customer_must_have_these_cognitive_weaknesses` VARCHAR(255) NULL,
    `cognitive_strengths_operator` ENUM('one_or_more', 'all') NOT NULL DEFAULT 'one_or_more',
    `cognitive_weaknesses_operator` ENUM('one_or_more', 'all') NOT NULL DEFAULT 'one_or_more',
    `quote_slug` TEXT NULL,
    `quote_author` TEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `products_by_skill` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `school_level` VARCHAR(11) NOT NULL DEFAULT '',
    `academic_section` VARCHAR(32) NOT NULL DEFAULT '',
    `verb_reas_acc` INTEGER NULL,
    `verb_reas_spd` INTEGER NULL,
    `verb_mem_acc` INTEGER NULL,
    `attention_acc` INTEGER NULL,
    `verb_reas_eff` INTEGER NULL,
    `spa_percep_acc` INTEGER NULL,
    `work_mem_acc` INTEGER NULL,
    `attention_spd` INTEGER NULL,
    `abs_reas_acc` INTEGER NULL,
    `abs_reas_eff` INTEGER NULL,
    `flex_think_acc` INTEGER NULL,
    `vis_motor_spd` INTEGER NULL,
    `vis_mem_eff` INTEGER NULL,
    `performance_prediction` VARCHAR(11) NOT NULL DEFAULT '',
    `product_1` INTEGER NOT NULL,
    `product_2` INTEGER NOT NULL,
    `product_3` INTEGER NOT NULL,
    `more_products` VARCHAR(256) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `q_instances` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `customer_id` INTEGER UNSIGNED NOT NULL,
    `questionnaire_id` INTEGER UNSIGNED NOT NULL,
    `question_id` INTEGER UNSIGNED NOT NULL,
    `option_id` INTEGER UNSIGNED NULL,
    `option_key` TEXT NULL,
    `option_val` LONGTEXT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    INDEX `q_instances_customer_id_foreign`(`customer_id`),
    INDEX `q_instances_option_id_foreign`(`option_id`),
    INDEX `q_instances_question_id_foreign`(`question_id`),
    INDEX `q_instances_questionnaire_id_foreign`(`questionnaire_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `q_map_customer_questionnaire` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `customer_id` INTEGER UNSIGNED NULL,
    `questionnaire_id` INTEGER UNSIGNED NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    INDEX `q_map_customer_questionnaire_customer_id_foreign`(`customer_id`),
    INDEX `q_map_customer_questionnaire_questionnaire_id_foreign`(`questionnaire_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `q_map_option_cognitive_skill` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `feature_cognitive_skill_id` INTEGER UNSIGNED NOT NULL,
    `q_option_id` INTEGER UNSIGNED NOT NULL,

    INDEX `q_map_option_cognitive_skill_feature_cognitive_skill_id_foreign`(`feature_cognitive_skill_id`),
    INDEX `q_map_option_cognitive_skill_q_option_id_foreign`(`q_option_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `q_map_option_question` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `option_id` INTEGER UNSIGNED NOT NULL,
    `question_id` INTEGER UNSIGNED NOT NULL,
    `trigger_question_id` INTEGER UNSIGNED NULL,
    `show_in_lp` BOOLEAN NOT NULL DEFAULT false,
    `ordinal` INTEGER NOT NULL,

    INDEX `q_map_option_question_option_id_foreign`(`option_id`),
    INDEX `q_map_option_question_question_id_foreign`(`question_id`),
    INDEX `q_map_option_question_trigger_question_id_foreign`(`trigger_question_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `q_map_question_questionnaire` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `question_id` INTEGER UNSIGNED NOT NULL,
    `questionnaire_id` INTEGER UNSIGNED NULL,
    `section_id` INTEGER UNSIGNED NULL,
    `type` ENUM('select', 'radio', 'text', 'textarea', 'checkbox') NOT NULL,
    `limit` INTEGER NULL,
    `show_in_lp` BOOLEAN NOT NULL DEFAULT false,
    `ordinal` INTEGER NOT NULL,
    `show_as_self_reported_weakness` BOOLEAN NOT NULL DEFAULT false,

    INDEX `q_map_question_questionnaire_question_id_foreign`(`question_id`),
    INDEX `q_map_question_questionnaire_questionnaire_id_foreign`(`questionnaire_id`),
    INDEX `q_map_question_questionnaire_section_id_foreign`(`section_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `q_map_questionnaire_section` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `questionnaire_id` INTEGER UNSIGNED NOT NULL,
    `section_id` INTEGER UNSIGNED NOT NULL,
    `ordinal` INTEGER NOT NULL,

    INDEX `q_map_questionnaire_section_questionnaire_id_foreign`(`questionnaire_id`),
    INDEX `q_map_questionnaire_section_section_id_foreign`(`section_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `q_options` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `label` TEXT NOT NULL,
    `key` TEXT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `q_questionnaires` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` TEXT NOT NULL,
    `subtitle` TEXT NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `override` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `q_questions` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `label` TEXT NOT NULL,
    `subtext` TEXT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `q_sections` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `label` TEXT NOT NULL,
    `subtext` TEXT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `q_shared` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` TEXT NULL,
    `email` TEXT NOT NULL,
    `customer_id` INTEGER UNSIGNED NOT NULL,
    `questionnaire_id` INTEGER UNSIGNED NOT NULL,
    `token` TEXT NOT NULL,
    `viewed_at` TIMESTAMP(0) NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    INDEX `q_shared_customer_id_foreign`(`customer_id`),
    INDEX `q_shared_questionnaire_id_foreign`(`questionnaire_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `r_instances` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `type` ENUM('student', 'class') NULL,
    `customer_id` INTEGER NULL,
    `organization_id` INTEGER NULL,
    `generic_group_id` INTEGER NULL,
    `note` LONGTEXT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `regen_queue` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `family_id` INTEGER NULL,
    `organization_id` INTEGER NULL,
    `job_status` INTEGER NOT NULL DEFAULT 0,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reviews` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `product_id` INTEGER NOT NULL,
    `customer_id` INTEGER NULL,
    `fake_display_name` VARCHAR(100) NULL,
    `fake_tagline` VARCHAR(100) NULL,
    `rating` DECIMAL(2, 1) NULL,
    `review` MEDIUMTEXT NULL,
    `reported` BOOLEAN NULL DEFAULT false,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `role_user` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `role_id` INTEGER UNSIGNED NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    INDEX `role_user_role_id_foreign`(`role_id`),
    INDEX `role_user_user_id_foreign`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `roles` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    UNIQUE INDEX `roles_name_unique`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `rules_engine_data` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `datasetid` VARCHAR(255) NOT NULL,
    `mongo` TEXT NOT NULL,
    `rule` TEXT NOT NULL,
    `strengths` TEXT NOT NULL,
    `needs` TEXT NOT NULL,
    `recommendations` TEXT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `rule_match` VARCHAR(255) NULL,
    `products` VARCHAR(255) NULL,
    `overall` LONGTEXT NULL,
    `reading` LONGTEXT NULL,
    `english` LONGTEXT NULL,
    `math` LONGTEXT NULL,
    `science` LONGTEXT NULL,
    `values` LONGTEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `rules_engine_matches` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `rules_datasetid` VARCHAR(255) NOT NULL,
    `cnb_datasetid` VARCHAR(255) NOT NULL,
    `customer_id` INTEGER UNSIGNED NULL,
    `created_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `rules_engine_matches_content` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `strengths` TEXT NOT NULL,
    `needs` TEXT NOT NULL,
    `recommendations` TEXT NULL,
    `next_steps` TEXT NOT NULL,
    `cnb_datasetid` VARCHAR(255) NOT NULL,
    `customer_id` INTEGER UNSIGNED NULL,
    `overall` LONGTEXT NULL,
    `reading` LONGTEXT NULL,
    `english` LONGTEXT NULL,
    `math` LONGTEXT NULL,
    `science` LONGTEXT NULL,
    `values` LONGTEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `rules_engine_rules` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `datasetid` VARCHAR(255) NOT NULL,
    `field` VARCHAR(255) NOT NULL,
    `label` VARCHAR(255) NOT NULL,
    `operator` VARCHAR(255) NOT NULL,
    `val` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `shared_learning_profiles` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `customer_id` INTEGER NULL,
    `name` VARCHAR(255) NULL,
    `email` VARCHAR(255) NULL,
    `token` VARCHAR(255) NULL,
    `viewed_at` DATETIME(0) NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,
    `type` VARCHAR(255) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `static_assets_with_token` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `token` VARCHAR(255) NOT NULL,
    `blob` BLOB NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `url` VARCHAR(255) NOT NULL,
    `views` INTEGER NOT NULL DEFAULT 0,
    `created_at` DATETIME(0) NOT NULL,
    `last_viewed` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `t_registrants` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `passcode` VARCHAR(255) NOT NULL,
    `logins` INTEGER NOT NULL DEFAULT 0,
    `organization_id` INTEGER UNSIGNED NULL,
    `remember_token` VARCHAR(255) NULL,
    `active` BOOLEAN NOT NULL DEFAULT true,
    `note` LONGTEXT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `t_registrants_learning_profiles` (
    `t_registrant_id` INTEGER UNSIGNED NULL,
    `learning_profile_id` INTEGER UNSIGNED NULL,
    `learning_profile_sent_to_email` VARCHAR(255) NULL,
    `learning_profile_date_sent` DATETIME(0) NULL,
    `token` VARCHAR(255) NULL,
    `updated_at` DATETIME(0) NULL,
    `created_at` DATETIME(0) NULL
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `temp` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `label` TEXT NOT NULL,
    `key` TEXT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `test_sessions` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `test_session_id` INTEGER NULL,
    `test_session_date` TEXT NULL,
    `test_name` TEXT NOT NULL,
    `test_results` LONGTEXT NOT NULL,
    `mindprint_customer_id` INTEGER NULL,
    `family_id` INTEGER NULL,
    `student_name` TEXT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `testimonials` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `body` TEXT NOT NULL,
    `status` VARCHAR(255) NOT NULL DEFAULT 'submitted',
    `school_id` INTEGER UNSIGNED NOT NULL,
    `course_id` INTEGER UNSIGNED NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    INDEX `testimonials_course_id_foreign`(`course_id`),
    INDEX `testimonials_school_id_foreign`(`school_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tmp_12025` (
    `last_name` VARCHAR(255) NULL,
    `first_name` VARCHAR(255) NULL,
    `gender` VARCHAR(1) NULL,
    `birthdate` VARCHAR(32) NULL,
    `customer_id` VARCHAR(7) NULL,
    `id` INTEGER NOT NULL AUTO_INCREMENT,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `toolbox_categories` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NULL,
    `description` VARCHAR(255) NULL,
    `headline_html` VARCHAR(255) NULL,
    `page_type` VARCHAR(255) NOT NULL DEFAULT 'keyword_search',
    `list_type` VARCHAR(255) NOT NULL DEFAULT 'multi',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `toolbox_category_picklist_map` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `toolbox_category_id` INTEGER UNSIGNED NOT NULL,
    `toolbox_picklist_id` INTEGER UNSIGNED NOT NULL,
    `sort_order` INTEGER UNSIGNED NOT NULL,
    `org_id` INTEGER UNSIGNED NOT NULL DEFAULT 1,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `toolbox_picklists` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(255) NULL,
    `description` VARCHAR(255) NULL,
    `search_terms` VARCHAR(255) NULL,
    `product_types` VARCHAR(255) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `top_products_feb20_2019` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `family_id` INTEGER UNSIGNED NOT NULL,
    `customer_id` INTEGER UNSIGNED NOT NULL,
    `learning_profile_id` INTEGER UNSIGNED NOT NULL,
    `dimension_id` INTEGER UNSIGNED NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `final_score` VARCHAR(255) NOT NULL,
    `final_range` VARCHAR(255) NOT NULL,
    `data` LONGTEXT NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `top_products` VARCHAR(255) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `top_products_final` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `family_id` INTEGER UNSIGNED NOT NULL,
    `customer_id` INTEGER UNSIGNED NOT NULL,
    `learning_profile_id` INTEGER UNSIGNED NOT NULL,
    `dimension_id` INTEGER UNSIGNED NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `final_score` VARCHAR(255) NOT NULL,
    `final_range` VARCHAR(255) NOT NULL,
    `data` LONGTEXT NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `top_products` VARCHAR(255) NULL,
    `is_processed` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `top_products_mar_6_2019` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `family_id` INTEGER UNSIGNED NOT NULL,
    `customer_id` INTEGER UNSIGNED NOT NULL,
    `learning_profile_id` INTEGER UNSIGNED NOT NULL,
    `dimension_id` INTEGER UNSIGNED NOT NULL,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `final_score` VARCHAR(255) NOT NULL,
    `final_range` VARCHAR(255) NOT NULL,
    `data` LONGTEXT NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `top_products` VARCHAR(255) NULL,
    `is_processed` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tp_reports` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `customer_id` INTEGER UNSIGNED NOT NULL,
    `learning_profile_id` INTEGER UNSIGNED NOT NULL,
    `type_id` INTEGER UNSIGNED NOT NULL,
    `data_for_render` LONGTEXT NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    INDEX `tp_reports_customer_id_foreign`(`customer_id`),
    INDEX `tp_reports_learning_profile_id_foreign`(`learning_profile_id`),
    INDEX `tp_reports_type_id_foreign`(`type_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tp_sat_act_conversions` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `act` FLOAT NOT NULL,
    `sat` FLOAT NOT NULL,
    `sat_math` FLOAT NULL,
    `single` BOOLEAN NOT NULL DEFAULT false,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tp_types` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `label` TEXT NOT NULL,
    `product_name` TEXT NOT NULL,
    `created_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,
    `updated_at` TIMESTAMP(0) NOT NULL DEFAULT 0000-00-00 00:00:00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `type_entries` (
    `feature` VARCHAR(255) NOT NULL,
    `entry` INTEGER UNSIGNED NOT NULL,
    `type` INTEGER UNSIGNED NOT NULL,

    UNIQUE INDEX `feature`(`feature`, `entry`, `type`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `active` TINYINT NOT NULL DEFAULT 1,
    `level` TINYINT UNSIGNED NOT NULL DEFAULT 1,
    `password` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `tagline` VARCHAR(100) NOT NULL DEFAULT '',
    `remember_token` VARCHAR(255) NULL,
    `created_at` DATETIME(0) NULL,
    `updated_at` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `v2_boost` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `type` ENUM('checklist', 'strategy') NOT NULL,
    `subject` ENUM('math', 'sel', 'reading', 'writing', 'test_taking') NULL,
    `category` ENUM('habit', 'help') NULL,
    `title` VARCHAR(256) NULL,
    `subtitle` VARCHAR(256) NULL,
    `cognitive_eval` VARCHAR(256) NULL,
    `media` VARCHAR(256) NULL,
    `video` VARCHAR(256) NULL,
    `content` TEXT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `deleted_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `v2_code` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(11) NULL,
    `ref_id` INTEGER NULL,
    `type` ENUM('boost', 'lift') NOT NULL,
    `crreated_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `deleted_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `v2_integrations` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `auth_id` VARCHAR(255) NULL,
    `reference_id` INTEGER NULL,
    `external_id` VARCHAR(255) NULL,
    `type` ENUM('testprep') NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `deleted_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `v2_trial_accounts` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `trial_id` INTEGER NOT NULL,
    `email` VARCHAR(100) NULL,
    `token` VARCHAR(255) NULL,
    `subid` VARCHAR(100) NULL,
    `test_type` VARCHAR(100) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,
    `completed_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `v2_trials` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `passcode` VARCHAR(255) NOT NULL DEFAULT '',
    `active` BOOLEAN NOT NULL DEFAULT true,
    `logins` INTEGER NOT NULL DEFAULT 0,
    `organization_id` INTEGER NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `v2_users` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `customer_id` INTEGER NULL,
    `email` VARCHAR(256) NULL,
    `username` VARCHAR(256) NULL,
    `password` VARCHAR(256) NULL,
    `first_name` VARCHAR(256) NULL,
    `last_name` VARCHAR(256) NULL,
    `role_level` INTEGER NULL,
    `school_student_id` VARCHAR(256) NULL,
    `birthdate` VARCHAR(256) NULL,
    `gender` VARCHAR(256) NULL,
    `group` VARCHAR(256) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `action_plan_notes` ADD CONSTRAINT `action_plan_notes_customer_product_id_foreign` FOREIGN KEY (`customer_product_id`) REFERENCES `customer_product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ap_entities` ADD CONSTRAINT `ap_entities_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ap_entities` ADD CONSTRAINT `ap_entities_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `ap_sections`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ap_goals` ADD CONSTRAINT `ap_goals_ap_plan_id_foreign` FOREIGN KEY (`ap_plan_id`) REFERENCES `ap_plans`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ap_goals` ADD CONSTRAINT `ap_goals_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ap_map_plan_section` ADD CONSTRAINT `ap_map_plan_section_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `ap_plans`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ap_map_plan_section` ADD CONSTRAINT `ap_map_plan_section_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `ap_sections`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ap_notes` ADD CONSTRAINT `ap_notes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ap_notes` ADD CONSTRAINT `ap_notes_entity_id_foreign` FOREIGN KEY (`entity_id`) REFERENCES `ap_entities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ap_pills` ADD CONSTRAINT `ap_pills_entity_id_foreign` FOREIGN KEY (`entity_id`) REFERENCES `ap_entities`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ap_plans` ADD CONSTRAINT `ap_plans_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ap_plans` ADD CONSTRAINT `ap_plans_plan_type_id_foreign` FOREIGN KEY (`plan_type_id`) REFERENCES `ap_plan_types`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ap_progress` ADD CONSTRAINT `ap_progress_ap_plan_id_foreign` FOREIGN KEY (`ap_plan_id`) REFERENCES `ap_plans`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ap_progress` ADD CONSTRAINT `ap_progress_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ap_sections` ADD CONSTRAINT `ap_sections_plan_type_id_foreign` FOREIGN KEY (`plan_type_id`) REFERENCES `ap_plan_types`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `api_logs` ADD CONSTRAINT `api_logs_api_key_id_foreign` FOREIGN KEY (`api_key_id`) REFERENCES `api_keys`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `assessments` ADD CONSTRAINT `assessments_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `customer_resources` ADD CONSTRAINT `customer_resources_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `entrust_assigned_roles` ADD CONSTRAINT `entrust_assigned_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `entrust_roles`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `entrust_assigned_roles` ADD CONSTRAINT `entrust_assigned_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `customers`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `entrust_permission_role` ADD CONSTRAINT `entrust_permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `entrust_permissions`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `entrust_permission_role` ADD CONSTRAINT `entrust_permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `entrust_roles`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `feature_cognitive_skills_aliases` ADD CONSTRAINT `feature_cognitive_skills_aliases_cognitive_skill_id_foreign` FOREIGN KEY (`cognitive_skill_id`) REFERENCES `feature_cognitive_skills`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `lti2_context` ADD CONSTRAINT `lti2_context_lti2_consumer_FK1` FOREIGN KEY (`consumer_pk`) REFERENCES `lti2_consumer`(`consumer_pk`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `lti2_nonce` ADD CONSTRAINT `lti2_nonce_lti2_consumer_FK1` FOREIGN KEY (`consumer_pk`) REFERENCES `lti2_consumer`(`consumer_pk`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `lti2_resource_link` ADD CONSTRAINT `lti2_resource_link_lti2_context_FK1` FOREIGN KEY (`context_pk`) REFERENCES `lti2_context`(`context_pk`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `lti2_resource_link` ADD CONSTRAINT `lti2_resource_link_lti2_resource_link_FK1` FOREIGN KEY (`primary_resource_link_pk`) REFERENCES `lti2_resource_link`(`resource_link_pk`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `lti2_share_key` ADD CONSTRAINT `lti2_share_key_lti2_resource_link_FK1` FOREIGN KEY (`resource_link_pk`) REFERENCES `lti2_resource_link`(`resource_link_pk`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `lti2_tool_proxy` ADD CONSTRAINT `lti2_tool_proxy_lti2_consumer_FK1` FOREIGN KEY (`consumer_pk`) REFERENCES `lti2_consumer`(`consumer_pk`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `lti2_user_result` ADD CONSTRAINT `lti2_user_result_lti2_resource_link_FK1` FOREIGN KEY (`resource_link_pk`) REFERENCES `lti2_resource_link`(`resource_link_pk`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `oa_map_account_org` ADD CONSTRAINT `oa_map_account_org_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `oa_accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `oa_map_account_org` ADD CONSTRAINT `oa_map_account_org_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `oa_users` ADD CONSTRAINT `oa_users_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `oa_accounts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_product_type` ADD CONSTRAINT `product_product_type_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_product_type` ADD CONSTRAINT `product_product_type_product_type_id_foreign` FOREIGN KEY (`product_type_id`) REFERENCES `product_types2`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `q_instances` ADD CONSTRAINT `q_instances_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `q_instances` ADD CONSTRAINT `q_instances_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `q_options`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `q_instances` ADD CONSTRAINT `q_instances_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `q_questions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `q_instances` ADD CONSTRAINT `q_instances_questionnaire_id_foreign` FOREIGN KEY (`questionnaire_id`) REFERENCES `q_questionnaires`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `q_map_customer_questionnaire` ADD CONSTRAINT `q_map_customer_questionnaire_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `q_map_customer_questionnaire` ADD CONSTRAINT `q_map_customer_questionnaire_questionnaire_id_foreign` FOREIGN KEY (`questionnaire_id`) REFERENCES `q_questionnaires`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `q_map_option_cognitive_skill` ADD CONSTRAINT `q_map_option_cognitive_skill_feature_cognitive_skill_id_foreign` FOREIGN KEY (`feature_cognitive_skill_id`) REFERENCES `feature_cognitive_skills`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `q_map_option_cognitive_skill` ADD CONSTRAINT `q_map_option_cognitive_skill_q_option_id_foreign` FOREIGN KEY (`q_option_id`) REFERENCES `q_options`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `q_map_option_question` ADD CONSTRAINT `q_map_option_question_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `q_options`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `q_map_option_question` ADD CONSTRAINT `q_map_option_question_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `q_questions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `q_map_option_question` ADD CONSTRAINT `q_map_option_question_trigger_question_id_foreign` FOREIGN KEY (`trigger_question_id`) REFERENCES `q_questions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `q_map_question_questionnaire` ADD CONSTRAINT `q_map_question_questionnaire_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `q_questions`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `q_map_question_questionnaire` ADD CONSTRAINT `q_map_question_questionnaire_questionnaire_id_foreign` FOREIGN KEY (`questionnaire_id`) REFERENCES `q_questionnaires`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `q_map_question_questionnaire` ADD CONSTRAINT `q_map_question_questionnaire_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `q_sections`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `q_map_questionnaire_section` ADD CONSTRAINT `q_map_questionnaire_section_questionnaire_id_foreign` FOREIGN KEY (`questionnaire_id`) REFERENCES `q_questionnaires`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `q_map_questionnaire_section` ADD CONSTRAINT `q_map_questionnaire_section_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `q_sections`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `q_shared` ADD CONSTRAINT `q_shared_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `q_shared` ADD CONSTRAINT `q_shared_questionnaire_id_foreign` FOREIGN KEY (`questionnaire_id`) REFERENCES `q_questionnaires`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `role_user` ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `role_user` ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tp_reports` ADD CONSTRAINT `tp_reports_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tp_reports` ADD CONSTRAINT `tp_reports_learning_profile_id_foreign` FOREIGN KEY (`learning_profile_id`) REFERENCES `learning_profiles`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `tp_reports` ADD CONSTRAINT `tp_reports_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `tp_types`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
