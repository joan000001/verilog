module top (
    input  [6:0] dataRaw,  // Entrada de datos sin procesar
    output [6:0] led       // LEDs para mostrar datos corregidos
);
    // Señales internas
    wire [2:0] posError;       // Síndrome calculado
    wire [6:0] dataCorrecta;   // Datos corregidos
    wire [6:0] dataCorregido;  // Datos luego de la corrección

    // Señal de prueba para dataRaw (simulación)
    wire [6:0] test_input;

    // Asignamos un valor de prueba a test_input para simular dataRaw
    assign test_input = 7'b1010101;  // Ejemplo de valor (puedes cambiarlo para probar diferentes entradas)

    // Instanciamos el módulo de detección de errores
    hamming_detection hamming_inst (
        .dataRaw(test_input),  // Usamos test_input para simular dataRaw
        .posError(posError)
    );
    
    // Instanciamos el módulo de corrección de errores
    correccion_error correccion_inst (
        .dataRaw(test_input),  // Usamos test_input para simular dataRaw
        .sindrome(posError),
        .correccion(dataCorregido),
        .dataCorrecta(dataCorrecta)
    );
    
    // Instanciamos el módulo de visualización en LEDs
    display_7bits_leds display_inst (
        .coregido(dataCorregido),
        .led(led)
    );

endmodule
