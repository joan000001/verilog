# Hamming74

## 1. Abreviaturas y definiciones
- **FPGA**: Field Programmable Gate Arrays

## 2. Referencias
[0] David Harris y Sarah Harris. *Digital Design and Computer Architecture. RISC-V Edition.* Morgan Kaufmann, 2022. ISBN: 978-0-12-820064-3

## 3. Desarrollo
 Joan Franco Sandoval 
 Diego Navarro






### 3.0 Descripción general del sistema

### 3.1 Módulo 1

#### 1. Encabezado del módulo
```SystemVerilog
- module hamming74 (
  input logic [3:0] in,
  output logic [6:0] ou
);
```
#### 2. Parámetros
in

ou

#### 3. Entradas y salidas:
- in: Se resive una señal de 4 bit, esta señal proviente de un swicth de 4 interuptores donde al estar en corto generqa la entrada 1 al modulo

- ou: Se depliega una señal de 7 bit, conformada por los 4 bit resividos en la señal de entrada y la paridad calculada en el modulo 

#### 4. Criterios de diseño

#### 4.1 Introducción

El código implementa un codificador Hamming (7,4) en Verilog, el cual toma una entrada de 4 bits de datos y genera una salida de 7 bits, incluyendo bits de paridad para detección y corrección de errores.

#### 4.2 Explicación del Código

El módulo hamming74 codifica un conjunto de 4 bits de datos en un formato de 7 bits, agregando bits de paridad según el código de Hamming (7,4).

#### 4.3 Diagrama del Codificador Hamming (7,4)
https://github.com/joan000001/verilog.githttps://github.com/joan000001/verilog.githttps://github.com/joan000001/verilog.githttps://github.com/joan000001/verilog.git


#### 5. Testbench
Descripción y resultados de las pruebas hechas



### 3.2 Módulo 2

#### 1. Encabezado del módulo

```SystemVerilog
module hamming74 (
  input logic [3:0] in,
  output logic [6:0] ou
);
```

#### 2. Parámetros
- dataRaw
- posError

#### 3. Entradas y salidas:
- idataRaw: Se recibe una señal de entrada dirigida de un switch de 7 interuptores el cual nos permite crear un código de haming basado en el original obtenido en el primer módulo pero introduciendo un pequeño error esto con el fin de buscar una corrección 

- posError: Generar una señal de 3 bits la cual da lugar a la posición el cual se encuentra el Beat de error introducido en la señal de entrada

#### 4. Criterios de diseño

#### 4.1 Introducción

- El módulo hamming_detection recibe como entrada un vector de 7 bits (dataRaw), correspondiente a una palabra codificada con Hamming (7,4). Como salida, genera un vector de 3 bits (posError), que indica la posición del bit erróneo en el código recibido.

#### 4.2 Explicación del Código

- Se definen dos señales: dataRaw (entrada) y posError (salida).

- La lógica combinacional recalcula los bits de paridad y genera posError, que indica la posición del bit erróneo.

- El error se puede localizar decodificando posError como un número binario.

#### 4.3 Diagrama del Codificador Hamming (7,4)



#### 5. Testbench
Descripción y resultados de las pruebas hechas























### 3.3 Módulo 3

#### 1. Encabezado del módulo
```SystemVerilog
- module correccion_error(
  input  logic [6:0] dataRaw,
  input  logic [2:0] sindrome,
  output logic [6:0] correccion,
  output logic [3:0] dataCorrecta
);
```
#### 2. Parámetros
- Entradas

- dataRaw
- sindrome

- Salidas 

-correccion
-DataCorrecta


#### 3. Entradas y salidas:
- Entradas

- dataRaw: Se reciben los 7 bits de la palabra de entrada uno de ellos con el error inducido
- sindrome: Se recibe una señal de 3 bits el cual representa la posición del error en la palabra

- Salidas 

-correccion: Se despliega una señal de 7 bits que representa la señal de entrada corregida
-DataCorrecta

#### 4. Criterios de diseño

#### 4.1 Introducción

- El diseño del módulo correccion_error se basa en la implementación de un sistema de corrección de errores utilizando la paridad de los bit.

#### 4.2 Explicación del Código

- Se asigna dataRaw a correccion.

- Si sindrome es diferente de 000, se identifica el bit erróneo y se invierte usando una estructura case.

- Se seleccionan los bits de información según la posición en correccion y se almacenan en dataCorrecta.

#### 4.3 Diagrama del Codificador Hamming (7,4)


#### 5. Testbench
Descripción y resultados de las pruebas hechas




### 3.4 Módulo 4

#### 1. Encabezado del módulo
```SystemVerilog
- module display_7bits_leds (
  input  logic [6:0] coregido,
    output logic [6:0] led
);
```
#### 2. Parámetros

- coregido
- led


#### 3. Entradas y salidas:

- coregido: Se recibe una señal de 4 bits, esta señal proporciona de un interruptor de 4 interruptores donde al estar en corto genera la entrada 1 al módulo
- led: Se despliega una señal dirigida hacia los led de la fpga, que representará la palabra que se recibe en el módulo


#### 4. Criterios de diseño

#### 4.1 Introducción

- El display_7bits_leds busca desplegar una señal hacia los leds físicos de la fpga con el fin de que estos muestren la palabra recibida..

#### 4.2 Explicación del Código

- Se recibe la señal de entrada que representa la palabra se le igualan los valores a una señal de la salida llamada led la cual mediante el archivo .cst, es asignada a los leds de la fpga.

#### 4.3 Diagrama del Codificador Hamming (7,4)


#### 5. Testbench
Descripción y resultados de las pruebas hechas






















## 4. Consumo de recursos

## 5. Problemas encontrados durante el proyecto

## Apendices:
### Apendice 1:
texto, imágen, etc
