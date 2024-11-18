-- Tabla de Usuarios (django.contrib.auth.models.User)
CREATE TABLE auth_user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    password VARCHAR(128) NOT NULL,
    last_login DATETIME NULL,
    is_superuser BOOLEAN NOT NULL,
    username VARCHAR(150) NOT NULL UNIQUE,
    first_name VARCHAR(150) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    email VARCHAR(254) NOT NULL,
    is_staff BOOLEAN NOT NULL,
    is_active BOOLEAN NOT NULL,
    date_joined DATETIME NOT NULL
) ENGINE=InnoDB;

-- Tabla de Tipos de Contenido (django.contrib.contenttypes.models.ContentType)
CREATE TABLE django_content_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    app_label VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    UNIQUE (app_label, model)
) ENGINE=InnoDB;

-- Tabla de Permisos (django.contrib.auth.models.Permission)
CREATE TABLE auth_permission (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    content_type_id INT NOT NULL,
    codename VARCHAR(100) NOT NULL,
    UNIQUE (content_type_id, codename),
    FOREIGN KEY (content_type_id) REFERENCES django_content_type (id)
) ENGINE=InnoDB;

-- Tabla de Grupos (django.contrib.auth.models.Group)
CREATE TABLE auth_group (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- Relación entre Usuarios y Grupos
CREATE TABLE auth_user_groups (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    group_id INT NOT NULL,
    UNIQUE (user_id, group_id),
    FOREIGN KEY (user_id) REFERENCES auth_user (id),
    FOREIGN KEY (group_id) REFERENCES auth_group (id)
) ENGINE=InnoDB;

-- Relación entre Grupos y Permisos
CREATE TABLE auth_group_permissions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    group_id INT NOT NULL,
    permission_id INT NOT NULL,
    UNIQUE (group_id, permission_id),
    FOREIGN KEY (group_id) REFERENCES auth_group (id),
    FOREIGN KEY (permission_id) REFERENCES auth_permission (id)
) ENGINE=InnoDB;

-- Relación entre Usuarios y Permisos
CREATE TABLE auth_user_user_permissions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    permission_id INT NOT NULL,
    UNIQUE (user_id, permission_id),
    FOREIGN KEY (user_id) REFERENCES auth_user (id),
    FOREIGN KEY (permission_id) REFERENCES auth_permission (id)
) ENGINE=InnoDB;



-- Tabla de Sesiones (django.contrib.sessions.models.Session)
CREATE TABLE django_session (
    session_key VARCHAR(40) NOT NULL PRIMARY KEY,
    session_data LONGTEXT NOT NULL,
    expire_date DATETIME NOT NULL
) ENGINE=InnoDB;

-- Tabla de Migraciones (django.db.migrations.Migration)
CREATE TABLE django_migrations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    app VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    applied DATETIME NOT NULL
) ENGINE=InnoDB;

CREATE TABLE django_admin_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    action_time DATETIME NOT NULL,
    object_id LONGTEXT NULL,
    object_repr VARCHAR(200) NOT NULL,
    action_flag TINYINT UNSIGNED NOT NULL,
    change_message LONGTEXT NOT NULL,
    content_type_id INT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (content_type_id) REFERENCES django_content_type (id),
    FOREIGN KEY (user_id) REFERENCES auth_user (id)
) ENGINE=InnoDB;

