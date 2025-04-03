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
module top (
    input  [3:0] in,              // 4 bits de datos originales
    input  [6:0] dataRaw,     // Código Hamming con error manual (7 switches)
    input        selector,        // 0 = usar encoder | 1 = usar switches con error
    output [6:0] led              // Muestra los 7 bits corregidos
);
```
#### 2. Parámetros

in
dataRaw
Selector
Led

#### 3. Entradas y salidas:

in:
Descripción: Esta es una entrada de 4 bits que representa los datos originales que se desean codificar utilizando el código Hamming.
Uso: Se utiliza como entrada para el codificador Hamming (módulo hamming74), que generará un código de 7 bits a partir de estos 4 bits.

dataRaw:
Descripción: Esta entrada de 7 bits representa un código Hamming que puede contener un error.
Uso: Se utiliza como entrada para el módulo de detección y corrección de errores, permitiendo que el sistema corrija cualquier error presente en el código.

selector:
Descripción: Esta es una señal de control de un solo bit que determina la fuente de los datos a procesar.
0: Utiliza el código Hamming generado por la entrada in.
1: Utiliza el código Hamming proporcionado la entrada dataRaw.

led:
Descripción: Esta salida de 7 bits muestra los datos corregidos que se han procesado. Se utiliza para visualizar el resultado en un conjunto de LEDs.
Uso: Permite al usuario ver el resultado de la corrección de errores, mostrando el código Hamming corregido en formato visual.
#### 4. Criterios de diseño

1. Modularidad
Separación de Funciones: Cada componente (codificador, detector de errores, corrector de errores, y visualizador) debe ser un módulo independiente. Esto facilita la reutilización y el mantenimiento del código.
Interfaz Clara: Cada módulo debe tener una interfaz bien definida con entradas y salidas claras, lo que facilita la integración y el entendimiento del sistema.
2. Simplicidad
Código Claro y Conciso: Evitar la complejidad innecesaria en el diseño. Utilizar nombres de señales y módulos que sean descriptivos para mejorar la legibilidad.
Estructura Lógica: Organizar el código de manera que siga un flujo lógico, facilitando la comprensión del proceso de codificación y corrección de errores.
3. Eficiencia
Uso de Recursos: Minimizar el uso de recursos lógicos (como LUTs y flip-flops) en la implementación del módulo, asegurando que el diseño sea adecuado para su implementación en hardware.
Velocidad de Operación: Optimizar el diseño para que funcione a la máxima frecuencia posible, teniendo en cuenta las limitaciones del hardware.
4. Robustez
Manejo de Errores: Implementar mecanismos para manejar situaciones inesperadas, como entradas no válidas o condiciones de error en la detección y corrección.
Pruebas y Verificación: Incluir pruebas unitarias y de integración para asegurar que cada módulo funcione correctamente y que el sistema en su conjunto cumpla con los requisitos.
5. Escalabilidad
Facilidad de Expansión: Diseñar el sistema de tal manera que sea fácil agregar nuevas funcionalidades o modificar las existentes sin necesidad de reescribir grandes partes del código.

#### 4.1 Introducción

El código implementa un codificador Hamming (7,4) en Verilog, el cual toma una entrada de 4 bits de datos y genera una salida de 7 bits, incluyendo bits de paridad para detección y corrección de errores.

#### 4.2 Explicación del Código

El módulo hamming74 codifica un conjunto de 4 bits de datos en un formato de 7 bits, agregando bits de paridad según el código de Hamming (7,4).

#### 4.3 Diagrama del Codificador Hamming (7,4)
https://github.com/joan000001/verilog.githttps://github.com/joan000001/verilog.githttps://github.com/joan000001/verilog.githttps://github.com/joan000001/verilog.git


#### 5. Testbench
Descripción y resultados de las pruebas hechas


### 3.1 Módulo 2

#### 1. Encabezado del módulo
```SystemVerilog
- module hamming74 (
  input logic [3:0] in,
  output logic [6:0] ou
);
```
#### 2. Parámetros

El módulo hamming74 implementa un código de Hamming (7,4), que es un esquema de corrección de errores que permite detectar y corregir errores en la transmisión de datos. Este código toma 4 bits de datos de entrada y genera 7 bits de salida, que incluyen los bits de datos originales y los bits de paridad necesarios para la corrección de errores.

#### 3. Entradas y salidas
Entradas:
in: Un vector de 4 bits que representa los datos de entrada. Se espera que los bits de entrada sean in[3], in[2], in[1], y in[0].
Salidas:
ou: Un vector de 7 bits que representa la salida codificada. Los bits de salida son organizados de la siguiente manera:
ou[6]: Bit de datos 3 (d7)
ou[5]: Bit de datos 2 (d6)
ou[4]: Bit de datos 1 (d5)
ou[3]: Bit de paridad 4 (p4)
ou[2]: Bit de datos 0 (d3)
ou[1]: Bit de paridad 2 (p2)
ou[0]: Bit de paridad 1 (p1)

#### 4. Criterios de diseño
El diseño del módulo se basa en las propiedades del código de Hamming, que permite la detección y corrección de errores mediante el uso de bits de paridad. Los criterios de diseño incluyen:

Simplicidad: El código debe ser fácil de entender y mantener.
Eficiencia: El cálculo de los bits de paridad debe ser rápido y no consumir muchos recursos.
Corrección de errores: El código debe ser capaz de detectar y corregir errores en la transmisión de datos.


#### 4.1 Introducción
El código de Hamming (7,4) es un método de corrección de errores que permite la transmisión de datos de manera más confiable. Este código agrega bits de paridad a los datos originales para que, en caso de que se produzca un error durante la transmisión, se pueda detectar y corregir el error. En este módulo, se implementa la lógica necesaria para calcular los bits de paridad y organizar los bits de salida.

#### 4.2 Explicación del Código
El código se implementa en Verilog y se compone de un módulo llamado hamming74. A continuación se detalla la lógica del código:

Declaración de Entradas y Salidas:
Se declaran las entradas y salidas del módulo. in es un vector de 4 bits y ou es un vector de 7 bits.
Registros Internos:
Se declaran registros internos (d3, d5, d6, d7, p1, p2, p4) que se utilizan para almacenar los bits de datos y los bits de paridad.
Lógica de Cálculo:
En el bloque always @(*), se realiza la lógica de cálculo de los bits de paridad:
d7, d6, d5, y d3 se asignan a los bits de entrada correspondientes.
Los bits de paridad p1, p2, y p4 se calculan utilizando operaciones XOR sobre los bits de datos y otros bits de paridad.
Asignación de Salida:
Finalmente, los bits de salida ou se asignan en el orden correcto, combinando los bits de datos y los bits de paridad.

El módulo hamming74 codifica un conjunto de 4 bits de datos en un formato de 7 bits, agregando bits de paridad según el código de Hamming (7,4).

#### 4.3 Diagrama del Codificador Hamming (7,4)
https://github.com/joan000001/verilog.githttps://github.com/joan000001/verilog.githttps://github.com/joan000001/verilog.githttps://github.com/joan000001/verilog.git


#### 5. Testbench
Descripción y resultados de las pruebas hechas



### 3.2 Módulo 3

#### 1. Encabezado del módulo

```SystemVerilog
module hamming_detection (
  input [6:0] dataRaw,
  output reg [2:0] posError
);
```

#### 2. Parámetros
Su funcionamiento se basa en la estructura del código de Hamming, el cual permite la detección de errores en la transmisión de datos mediante la paridad. Recibe una palabra de 7 bits con un error inducido y despliega un arreglo de 3 bits con la posición del síndrome.

#### 3. Entradas y salidas
Entradas:
dataRaw: Un vector de 7 bits que representa los datos codificados que se han recibido. Este vector puede contener errores que deben ser detectados.
Salidas:
posError: Un vector de 3 bits que indica la posición del error detectado. Si no se detecta ningún error, el valor de posError será 000.
#### 4. Criterios de diseño
El diseño del módulo se basa en la capacidad del código de Hamming para detectar errores. Los criterios de diseño incluyen:

Detección de errores: El módulo debe ser capaz de identificar la posición de un solo error en los datos recibidos.
Simplicidad: La implementación debe ser clara y fácil de entender.
Eficiencia: La lógica de detección debe ser rápida y no consumir muchos recursos.
#### 4.1 Introducción
El código de Hamming permite no solo la corrección de errores, sino también la detección de errores en la transmisión de datos. Este módulo se encarga de calcular la posición del error en los datos recibidos, utilizando los bits de paridad que se generaron en el proceso de codificación.

#### 4.2 Explicación del Código
El código se implementa en Verilog y se compone de un módulo llamado hamming_detection. A continuación se detalla la lógica del código:

Declaración de Entradas y Salidas:
Se declaran las entradas y salidas del módulo. dataRaw es un vector de 7 bits que representa los datos recibidos, y posError es un vector de 3 bits que indicará la posición del error.
Lógica de Detección:
En el bloque always @(*), se realiza la lógica para calcular la posición del error:
posError[0] se calcula como la XOR de los bits de paridad correspondientes a la posición 1 (bit 0), 3 (bit 2), 5 (bit 4) y 7 (bit 6).
posError[1] se calcula como la XOR de los bits de paridad correspondientes a la posición 2 (bit 1), 3 (bit 2), 6 (bit 5) y 7 (bit 6).
posError[2] se calcula como la XOR de los bits de paridad correspondientes a la posición 4 (bit 3), 5 (bit 4), 6 (bit 5) y 7 (bit 6).
Interpretación de la Salida:
El resultado en posError indica la posición del error en el vector dataRaw. Si posError es 000, no se ha detectado ningún error. Si tiene un valor diferente, indica la posición del bit erróneo (1-indexado).

#### 4.3 Diagrama del Codificador Hamming (7,4)



#### 5. Testbench
Descripción y resultados de las pruebas hechas


### 3.3 Módulo 4

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
El módulo no tiene parámetros configurables, pero su funcionamiento se basa en la estructura del código de Hamming, que permite la corrección de errores.

#### 3. Entradas y salidas
Entradas:
dataRaw: Un vector de 7 bits que representa los datos codificados que se han recibido, que pueden contener errores.
sindrome: Un vector de 3 bits que indica la posición del error detectado. Si no se detecta ningún error, el valor de sindrome será 000.
Salidas:
correccion: Un vector de 7 bits que representa los datos corregidos. Este vector es una copia de dataRaw, pero con el bit erróneo corregido si se detectó un error.
dataCorrecta: Un vector de 4 bits que representa los datos originales extraídos de los datos corregidos.
#### 4. Criterios de diseño
El diseño del módulo se basa en la capacidad del código de Hamming para corregir errores. Los criterios de diseño incluyen:

Corrección de errores: El módulo debe ser capaz de corregir un solo error en los datos recibidos.
Simplicidad: La implementación debe ser clara y fácil de entender.
Eficiencia: La lógica de corrección debe ser rápida y no consumir muchos recursos.
#### 4.1 Introducción
El código de Hamming no solo permite la detección de errores, sino que también permite la corrección de un solo error en los datos transmitidos. Este módulo se encarga de corregir el error en los datos recibidos utilizando el síndrome, que indica la posición del bit erróneo.

#### 4.2 Explicación del Código
El código se implementa en Verilog y se compone de un módulo llamado correccion_error. A continuación se detalla la lógica del código:

Declaración de Entradas y Salidas:
Se declaran las entradas y salidas del módulo. dataRaw es un vector de 7 bits que representa los datos recibidos, sindrome es un vector de 3 bits que indica la posición del error, correccion es un vector de 7 bits que contendrá los datos corregidos, y dataCorrecta es un vector de 4 bits que contendrá los datos originales.
Lógica de Corrección:
En el bloque always @(*), se inicializa correccion con el valor de dataRaw.
Si el sindrome no es 000, se utiliza una estructura case para determinar qué bit debe ser corregido:
Cada caso corresponde a un valor del síndrome que indica la posición del bit erróneo. Se utiliza la operación de negación (~) para corregir el bit correspondiente en correccion.
Por ejemplo, si sindrome es 3'b001, se corrige el primer bit (correccion[0]).
Extracción de Datos Originales:
Después de la corrección, se extraen los 4 bits de datos originales de los bits corregidos. Los bits de datos originales se asignan a dataCorrecta en el orden correspondiente.
#### 4.3 Diagrama del Codificador Hamming (7,4)


#### 5. Testbench
Descripción y resultados de las pruebas hechas




### 3.4 Módulo 5

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
