
drop table if exists "fact_ventas" cascade;
drop table if exists "dim_producto" cascade;
drop table if exists "dim_cliente" cascade;

create table if not exists "dim_producto" (
"ID_Producto" integer primary key,  
"SKU" varchar(50),                 
"Producto" varchar(255),
"Tipo_Producto" varchar(100)
);

create table if not exists "dim_cliente" (
"ID_Cliente" integer primary key,   
"Ciudad" varchar(100),
"Tipo_Cliente" varchar(100)
);

create table if not exists "fact_ventas" (
"ID_Venta" integer primary key,     
"ID_Producto" integer,
"ID_Cliente" integer,
"Fecha" date,
"Tipo_Venta" varchar(50),
"Cantidad" integer,                
"Precio_Unitario" numeric(15, 2),   
"Descuento" numeric(5, 2),         
"Costo_Envio" numeric(15, 2),
"Venta_Total" numeric(15, 2),   
"Origen_Dato" varchar(100),
constraint fk_producto foreign key ("ID_Producto")
    references "dim_producto" ("ID_Producto"),       
constraint fk_cliente foreign key ("ID_Cliente")
    references "dim_cliente" ("ID_Cliente")
);