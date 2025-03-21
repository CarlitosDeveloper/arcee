# Guide - ERD (Diagram.io)

---

## **📊 Notas para Diagram.io - Modelado de Bases de Datos**

- Apuntes para diagrama y modelar "bases de datos" en la plataforma `Diagram.io`

### **1️⃣ Tipos de Índices**  
- `btree`, `hash` (PostgreSQL admite otros, pero estos son los más comunes).  
- `name`: Nombre del índice.  
- `unique`: Índice único.  
- `pk`: Clave primaria.  

### **2️⃣ Representación de Relaciones**  
- `<` → Uno a muchos (ej: `users.id < posts.user_id`).  
- `>` → Muchos a uno (ej: `posts.user_id > users.id`).  
- `-` → Uno a uno (ej: `users.id - user_infos.user_id`).  
- `<>` → Muchos a muchos (ej: `authors.id <> books.id`).  

### **3️⃣ Configuraciones de Columnas**  
- `note`: `'Texto de nota'` → Agrega metadatos.  
- `pk`: Clave primaria.  
- `null / not null`: Define si la columna permite valores nulos.  
- `unique`: Marca la columna como única.  
- `default: valor`: Define un valor por defecto.  
- `increment`: Autoincremental.  

🔹 **Ejemplo de uso en diagram.io**:  
```plaintext
id "bigint unsigned" [pk]
```
