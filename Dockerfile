FROM mysql:8.0

# Crear el script de inicialización directamente
RUN echo "CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password'; GRANT ALL PRIVILEGES ON *.* TO 'user'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;" > /docker-entrypoint-initdb.d/permissions.sql

# Exponer el puerto de MySQL
EXPOSE 3306