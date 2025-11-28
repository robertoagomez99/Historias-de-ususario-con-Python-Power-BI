# 🚀 Análisis de Datos End-to-End: Riwi Ventas

![Python](https://img.shields.io/badge/Python-3.9%2B-blue)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-336791)
![Power BI](https://img.shields.io/badge/Power_BI-Desktop-F2C811)
![Machine Learning](https://img.shields.io/badge/Sklearn-MICE%20%26%20Trees-orange)

## 📋 Descripción del Proyecto

Este proyecto es una solución completa de **Ingeniería y Análisis de Datos** para la empresa "Riwi". El objetivo fue transformar un conjunto de datos crudo de ventas (CSV) con graves problemas de calidad (ruido, nulos, inconsistencias) en un **Modelo de Datos Estrella** confiable en **PostgreSQL**, para finalmente alimentar un Dashboard interactivo en **Power BI**.

El flujo de trabajo abarca desde la limpieza avanzada usando **técnicas híbridas (Matemáticas + Machine Learning)** hasta la visualización de alto nivel.

---

## 🛠️ Tecnologías Utilizadas

*   **Lenguaje:** Python (Pandas, NumPy, Matplotlib, Seaborn).
*   **Machine Learning (Imputación):** Scikit-Learn (IterativeImputer/MICE, DecisionTreeClassifier).
*   **Base de Datos:** PostgreSQL (SQLAlchemy, Psycopg2).
*   **Visualización:** Power BI & Seaborn.
*   **Entorno:** Jupyter Notebook, VS Code.

---

## ⚙️ Arquitectura de la Solución (Workflow)

El proyecto se dividió en 5 Historias de Usuario (HU):

### 1️⃣ Ingesta y Conexión (HU 1)
*   Carga de datos crudos desde archivos CSV.
*   Corrección de **Mojibake** (errores de codificación de caracteres) usando mapeo optimizado.
*   Configuración de variables de entorno (`.env`) para conexión segura a base de datos.

### 2️⃣ Limpieza e Imputación Avanzada (HU 2) 🧠
Esta fue la fase más crítica. Se implementó una **Estrategia Híbrida de Recuperación de Datos** para tratar los valores faltantes (Missing Values) sin eliminar filas valiosas:

1.  **Recuperación Matemática (Álgebra):** Se usaron las fórmulas de negocio ($Total = Precio \times Cantidad \times (1-Descuento)$) para despejar y recuperar el 99% de los valores numéricos exactos.
2.  **Imputación Cualitativa con IA:** Se entrenaron **Árboles de Decisión (Decision Trees)** para predecir la `Ciudad` y el `Tipo_Cliente` basándose en el costo de envío y el volumen de compra.
3.  **Imputación Numérica (MICE):** Para casos complejos donde la matemática no aplicaba, se utilizó **MICE (Multiple Imputation by Chained Equations)**.
4.  **Lógica de Negocio:** Segmentación estadística (Medianas por grupo) para imputar costos de envío y descuentos según el perfil del cliente.

> **Resultado:** Se recuperaron más de **10,000 celdas vacías** y se eliminaron caracteres basura (`@#*`) y duplicados, logrando un dataset 100% limpio.

### 3️⃣ Análisis Exploratorio (EDA) (HU 3)
*   Generación de métricas descriptivas.
*   Detección de **Outliers** (Ventas "Ballena" de clientes gubernamentales/mayoristas) usando Boxplots logarítmicos.
*   Visualización de tendencias temporales y Top 5 Productos.

### 4️⃣ Modelado de Datos (HU 4)
*   Normalización de la base de datos a un **Esquema Estrella (Star Schema)**.
*   Separación en tablas dimensionales (`dim_producto`, `dim_cliente`) y tabla de hechos (`fact_ventas`).
*   Creación de **SKUs** y generación de llaves primarias/foráneas en PostgreSQL.

### 5️⃣ Dashboarding (HU 5)
*   Conexión de Power BI a PostgreSQL.
*   Creación de medidas DAX y visualizaciones interactivas.

---

## 📂 Estructura del Repositorio

```bash
├── data/                   # Archivos CSV crudos y procesados
├── notebooks/
│   ├── 1_limpieza_avanzada.ipynb   # ETL: Limpieza, IA y Matemáticas
│   ├── 2_visualizaciones_eda.ipynb # Análisis exploratorio con Python
├── sql/
│   ├── create_tables.sql   # Script DDL para PostgreSQL
├── .env.example            # Ejemplo de variables de entorno
├── requirements.txt        # Librerías necesarias
└── README.md               # Documentación del proyecto









