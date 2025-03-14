
# Guide - SQL (PostgreSQL)

## Tipos de datos

## Caracteres

- Explicación del Texto sobre Tipos de Caracteres en PostgreSQL (`CHAR`, `VARCHAR`, `TEXT`)

### **🔹 Tipos de Caracteres en PostgreSQL**
PostgreSQL ofrece **tres tipos principales** de datos para almacenar texto:

| **Tipo**               | **Descripción** |
|----------------------|----------------|
| `character varying(n)` o `varchar(n)` | Longitud variable, con un límite `n`. |
| `character(n)` o `char(n)` | Longitud fija, rellena con espacios en blanco si la cadena es más corta que `n`. |
| `text` | Longitud variable sin límite específico. |

### **🔹 Tamaño Máximo de los Tipos de Texto en PostgreSQL**
| **Tipo**      | **Tamaño Máximo** |
|--------------|----------------|
| `CHAR(n)`    | Hasta **1 GB** de almacenamiento |
| `VARCHAR(n)` | Hasta **1 GB**, pero `n` suele ser menor |
| `TEXT`       | Hasta **1 GB** (sin límite real de caracteres) |

📌 **Detalles técnicos**:
- **PostgreSQL almacena los valores de texto con una sobrecarga de 4 bytes**.
- **Los valores muy grandes se comprimen y almacenan en páginas separadas**, evitando problemas de rendimiento.
- **Si necesitas cadenas largas, usa `TEXT` en lugar de `VARCHAR(n)` con un límite arbitrario**.

📌 **Conclusión sobre rendimiento**:
- PostgreSQL **almacena internamente todos estos tipos de la misma manera** (con una sobrecarga de 4 bytes para el tamaño de la cadena).
- **NO hay ventaja en usar `CHAR(n)`, salvo si migras desde otra base de datos** que lo necesite.
- **Recomendación**: Usa `TEXT` o `VARCHAR` en la mayoría de los casos.

### **🔹 Recomendaciones Prácticas**
#### **✅ Cuándo Usar `TEXT`**
- Si el tamaño máximo de la cadena **no está claramente definido**.
- Para **grandes volúmenes de texto** (`descriptions`, `comments`, `articles`, etc.).
- Cuando necesitas **flexibilidad sin preocuparte por límites arbitrarios**.

#### **✅ Cuándo Usar `VARCHAR(n)`**
- Si **quieres definir un límite** pero sin perder eficiencia.
- Para **validar datos** con restricciones (`email VARCHAR(255)`, `username VARCHAR(50)`).
- En situaciones donde `n` tiene un significado **lógico**.

#### **✅ Cuándo Usar `CHAR(n)`**
- Si **migras datos desde otra base de datos** que depende de `CHAR(n)`.
- Si **todas las cadenas son del mismo tamaño exacto** (Ejemplo: códigos de estado de 2 letras, como `US`, `MX`).
- **En la mayoría de los casos, es mejor usar `VARCHAR(n)` en lugar de `CHAR(n)`**.

### **🔥 Conclusión**
🎯 **PostgreSQL trata `TEXT`, `VARCHAR(n)`, y `VARCHAR` de la misma manera internamente, por lo que usar `TEXT` es la opción más flexible.**  
✅ **Si necesitas un límite, usa `VARCHAR(n)`, pero no esperes mejoras de rendimiento.**  
✅ **Evita `CHAR(n)` a menos que sea estrictamente necesario**.  
✅ **El tipo `"char"` (con comillas) es un tipo especial de PostgreSQL y no se usa en datos normales.**  

---
