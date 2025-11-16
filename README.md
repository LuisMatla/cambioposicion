# 🔄 Práctica 5: Cambio de Posición - PIC16F877A

## 📋 Descripción

Este proyecto implementa un sistema de cambio de posición de nibbles utilizando el microcontrolador **PIC16F877A**. El programa lee un valor de 8 bits desde el **PORTB** y realiza un intercambio de nibbles, mostrando el resultado en el **PORTC**. El comportamiento varía según el estado del bit RB3.

### 🎯 Funcionalidad

- **PORTB** (bits 0-2, 4-7): Configurado como entrada para leer un valor de 8 bits
- **PORTB** (bit 3): Configurado como salida y se usa como selector de modo
- **PORTC** (bits 0-7): Configurado como salida para mostrar el resultado
- **Operación:** Intercambia los nibbles (bits 0-3 ↔ bits 4-7) con o sin inversión según el modo

### 🔄 Funcionamiento

El programa implementa dos modos de operación según el estado del bit RB3:

**Modo BAJO (RB3 = 0):**
- Intercambia los nibbles del PORTB
- Invierte los 4 bits menos significativos mediante XOR con `00001111`
- Muestra el resultado en PORTC

**Modo ALTO (RB3 = 1):**
- Intercambia los nibbles del PORTB
- Muestra el resultado directamente en PORTC (sin inversión)

**Ejemplo:**
- Si `PORTB = 11010010` y `RB3 = 0` → `PORTC = 00101101` (intercambio + inversión del nibble bajo)
- Si `PORTB = 11010010` y `RB3 = 1` → `PORTC = 00101101` (solo intercambio)

## 🔧 Tecnologías Utilizadas

![PIC16F877A](https://img.shields.io/badge/PIC16F877A-Microcontroller-blue?style=flat-square)
![Assembly](https://img.shields.io/badge/Assembly-Language-green?style=flat-square)
![MPLAB](https://img.shields.io/badge/MPLAB_X-IDE-orange?style=flat-square)
![Proteus](https://img.shields.io/badge/Proteus-Simulation-purple?style=flat-square)

## 🛠️ Materiales Necesarios

### Componentes Electrónicos

- 🔹 **1x Microcontrolador PIC16F877A**
- 🔹 **1x Cristal oscilador 4MHz** (o según configuración)
- 🔹 **2x Capacitores cerámicos 22pF** (para el cristal)
- 🔹 **1x Resistencia pull-up 10kΩ** (opcional, para MCLR)
- 🔹 **8x Interruptores o DIP switch** (para PORTB, bits 0-2, 4-7)
- 🔹 **1x LED o indicador** (para PORTB.3, opcional)
- 🔹 **8x LEDs** con resistencias limitadoras (220Ω - 1kΩ) para visualizar el resultado en PORTC
- 🔹 **8x Resistencias 220Ω - 1kΩ** (para los LEDs)
- 🔹 **1x Capacitor electrolítico 100µF** (filtro de alimentación)
- 🔹 **1x Capacitor cerámico 0.1µF** (desacoplamiento)
- 🔹 **Fuente de alimentación 5V DC** o regulador 7805
- 🔹 **Cables dupont o protoboard** para conexiones

### Herramientas y Software

- 💻 **MPLAB X IDE** o **MPLAB IDE**
- 🔧 **Compilador XC8** o **MPASM**
- 📡 **Programador PIC** (PICKit, ICD, etc.)
- 🔌 **Proteus ISIS** o **Proteus Professional** (para simulación)
- 📐 **Protoboard** o **PCB** para montaje
- 🔨 **Soldador** (si se usa PCB)

## 📁 Estructura del Proyecto

```
practica(5)/
├── README.md                    # Este archivo
├── pract5.pdsprj               # Proyecto de Proteus
├── practica5.X/
│   └── prac5.asm               # Código fuente en ensamblador
└── dist/
    └── default/
        └── production/
            └── practica5.X.production.hex  # Archivo HEX para programar
```

## 💻 Código

El código está escrito en **ensamblador PIC** y está completamente comentado línea por línea para facilitar su comprensión.

### Características del Código

- ✅ Configuración de puertos (PORTB como entrada parcial, PORTC como salida)
- ✅ Manejo de bancos de memoria del PIC
- ✅ Intercambio de nibbles mediante instrucción SWAPF
- ✅ Operación XOR para inversión de bits
- ✅ Subrutinas modulares según el estado de RB3
- ✅ Bucle principal infinito para lectura continua
- ✅ Comentarios descriptivos en cada línea

### Algoritmo de Cambio de Posición

El programa implementa el cambio de posición de la siguiente manera:

**Modo BAJO (RB3 = 0):**
```assembly
valor = PORTB
resultado = SWAP(valor) XOR 00001111
PORTC = resultado
```

**Modo ALTO (RB3 = 1):**
```assembly
valor = PORTB
resultado = SWAP(valor)
PORTC = resultado
```

## 🚀 Instalación y Uso

### 1. Clonar el Repositorio

```bash
git clone https://github.com/LuisMatla/cambioposicion.git
cd cambioposicion
```

### 2. Abrir en MPLAB X

1. Abre **MPLAB X IDE**
2. File → Open Project
3. Selecciona el proyecto `practica5.X` o importa el proyecto

### 3. Compilar el Proyecto

1. Build → Build Main Project (F11)
2. Verifica que no haya errores en la compilación
3. El archivo `.hex` se generará en `dist/default/production/`

### 4. Programar el PIC

1. Conecta tu programador PIC al microcontrolador
2. Tools → Select Tool → [Tu Programador]
3. Production → Build and Program Main Project
4. Espera a que termine la programación

### 5. Simular en Proteus (Opcional)

1. Abre `pract5.pdsprj` en **Proteus ISIS**
2. Ejecuta la simulación
3. Prueba cambiando los valores en PORTB y observa el resultado en PORTC

## 🔧 Configuración del Hardware

### Conexiones PORTB (Entradas y Control)

Los bits del PORTB se configuran de la siguiente manera:

```
PORTB.0 → DIP Switch bit 0 o Interruptor 1 (entrada)
PORTB.1 → DIP Switch bit 1 o Interruptor 2 (entrada)
PORTB.2 → DIP Switch bit 2 o Interruptor 3 (entrada)
PORTB.3 → LED o indicador (salida - selector de modo)
PORTB.4 → DIP Switch bit 4 o Interruptor 4 (entrada)
PORTB.5 → DIP Switch bit 5 o Interruptor 5 (entrada)
PORTB.6 → DIP Switch bit 6 o Interruptor 6 (entrada)
PORTB.7 → DIP Switch bit 7 o Interruptor 7 (entrada)
```

### Conexiones PORTC (Salidas)

El PORTC muestra el resultado de la operación (8 bits):

```
PORTC.0 → LED 0 (con resistencia 220Ω) → GND
PORTC.1 → LED 1 (con resistencia 220Ω) → GND
PORTC.2 → LED 2 (con resistencia 220Ω) → GND
PORTC.3 → LED 3 (con resistencia 220Ω) → GND
PORTC.4 → LED 4 (con resistencia 220Ω) → GND
PORTC.5 → LED 5 (con resistencia 220Ω) → GND
PORTC.6 → LED 6 (con resistencia 220Ω) → GND
PORTC.7 → LED 7 (con resistencia 220Ω) → GND
```

### Alimentación

```
VDD (Pin 11, 32) → +5V
VSS (Pin 12, 31) → GND
```

### Oscilador

```
OSC1 (Pin 13) → Cristal 4MHz
OSC2 (Pin 14) → Cristal 4MHz
Capacitores 22pF desde cada pin a GND
```

### Configuración de Fusibles

El programa configura los siguientes fusibles:

- **WDT:** Deshabilitado (Watchdog Timer OFF)
- **PWRTE:** Habilitado (Power-up Timer ON)
- **OSC:** Oscilador XT (Cristal)
- **LVP:** Deshabilitado (Low Voltage Programming OFF)
- **CP:** Deshabilitado (Code Protection OFF)

## 📊 Tabla de Valores

### Modo BAJO (RB3 = 0) - Con Inversión

| Entrada (PORTB) | Nibble Alto | Nibble Bajo | Intercambio | XOR 00001111 | Salida (PORTC) |
|----------------|-------------|-------------|-------------|--------------|----------------|
| 11010010       | 1101        | 0010        | 00101101    | 00100010     | 00100010       |
| 10101010       | 1010        | 1010        | 10101010    | 10100101     | 10100101       |
| 11110000       | 1111        | 0000        | 00001111    | 00001111     | 00001111       |

### Modo ALTO (RB3 = 1) - Sin Inversión

| Entrada (PORTB) | Nibble Alto | Nibble Bajo | Intercambio | Salida (PORTC) |
|----------------|-------------|-------------|-------------|----------------|
| 11010010       | 1101        | 0010        | 00101101    | 00101101       |
| 10101010       | 1010        | 1010        | 10101010    | 10101010       |
| 11110000       | 1111        | 0000        | 00001111    | 00001111       |

## 🧪 Pruebas

### Prueba Básica

1. ✅ Alimenta el circuito con 5V
2. ✅ Configura el DIP switch en PORTB con un valor (ej: 11010010)
3. ✅ Configura RB3 en 0 (modo BAJO) y verifica el resultado en PORTC
4. ✅ Configura RB3 en 1 (modo ALTO) y verifica el resultado en PORTC
5. ✅ Compara los resultados de ambos modos

### Ejemplo de Prueba

- **Entrada:** PORTB = `11010010` (210 decimal)
- **Modo BAJO (RB3 = 0):**
  - Intercambio: `00101101`
  - XOR con `00001111`: `00100010` (34 decimal)
  - **Salida esperada:** PORTC = `00100010`
- **Modo ALTO (RB3 = 1):**
  - Intercambio: `00101101` (45 decimal)
  - **Salida esperada:** PORTC = `00101101`

## 📝 Notas Técnicas

- El programa utiliza un **bucle infinito** para leer continuamente las entradas
- La operación de intercambio se realiza mediante la instrucción **SWAPF** (intercambia nibbles)
- El código maneja correctamente los **bancos de memoria** del PIC16F877A
- La configuración de puertos se realiza en el **banco 1** (TRISB, TRISC)
- Las operaciones de lectura/escritura se realizan en el **banco 0** (PORTB, PORTC)
- Se utiliza la operación **XOR** para invertir los bits menos significativos en modo BAJO
- El bit RB3 actúa como selector de modo (0 = BAJO con inversión, 1 = ALTO sin inversión)

## 👨‍💻 Autores

**Luis Fernando Contreras Matla.**

**Samuel Obed García Velandia.**

## 📚 Información Académica

Esta práctica fue desarrollada como parte de la Experiencia Educativa:

- **Materia:** Microprocesadores y Microcontroladores
- **Universidad:** Universidad Veracruzana
- **Facultad:** Ingeniería Eléctrica y Electrónica
- **Docente:** Rosa María Woo García

## 📄 Licencia

Este proyecto es de uso educativo y académico.

