# Guide - PostgreSQL

---

## **⚡ Comandos Útiles para PostgreSQL**  

### **1️⃣ Comandos desde el Shell (fuera de PostgreSQL)**  
| Comando | Descripción |
| :-----: | :--------- |
| `\! cls` | Limpiar la terminal |
| `\! echo %CD%` | Mostrar la ruta actual |
| `\! cd %USERPROFILE%\Desktop` | Cambiar de directorio |

### **2️⃣ Comandos dentro de PostgreSQL (`psql`)**  
| Comando | Descripción |
| :------: | :--------- |
| `\l` | Listar bases de datos |
| `\c myappstore` | Conectarse a una base de datos |

---

## **🛠️ Gestión de Usuarios y Privilegios**  

### **🔹 Crear y gestionar usuarios**  
```sql
CREATE USER nameUser WITH PASSWORD 'passWord';
ALTER USER nameUser WITH PASSWORD 'newPassWord';
DROP USER nameUser;
```

### **🔹 Modificar permisos**  
```sql
REVOKE ALL PRIVILEGES ON DATABASE nameDB FROM userBefore; 
DROP USER userBefore;
```

### **🔹 Conectarse como un usuario específico**  
```sh
psql -U userAdmin -d nameDB -h localhost
```

---

## **📌 Restauración y Copias de Seguridad**  

### **🔹 Crear un backup estándar**  
```sh
pg_dump -h localhost -U your_user -d nameDB > backup.sql
```

### **🔹 Guardar un backup en una ruta específica**  
```sh
\! pg_dump -h localhost -U your_user -d nameDB > %USERPROFILE%\Desktop\nameDB_backup.sql
```

### **🔹 Backup de solo la estructura de la base de datos**  
```sh
pg_dump -h localhost -U postgres -d arcee --schema-only > src\backup\arcee_backup.sql
```

### **🔹 Restaurar una base de datos desde un backup**  
```sh
psql -h localhost -U postgres -d nameDB -f backup.sql
```

### **🔹 Crear la base de datos si no existe**  
```sh
psql -h localhost -p 5432 -U postgres -c "CREATE DATABASE nameDB"
```

