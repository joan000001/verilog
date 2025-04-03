`timescale 1ns / 1ps

module top (
    input  [3:0] in,              // 4 bits de datos originales
    input  [6:0] dataRaw,     // Código Hamming con error manual (7 switches)
    input        selector,        // 0 = usar encoder | 1 = usar switches con error
    output [6:0] led              // Muestra los 7 bits corregidos
);

    // Señales internas
    wire [6:0] dataRaw_from_encoder;
    wire [6:0] dataRaw_muxed;
    wire [2:0] posError;
    wire [6:0] dataCorregido;
    wire [3:0] dataCorrecta;

    // Codificador Hamming 7,4
    hamming74 encoder (
        .in(in),
        .ou(dataRaw_from_encoder)
    );

    // Multiplexor para elegir entre encoder o switches externos
    assign dataRaw_muxed = selector ? dataRaw : dataRaw_from_encoder;

    // Detección de errores
    hamming_detection detector (
        .dataRaw(dataRaw_muxed),
        .posError(posError)
    );

    // Corrección de errores
    correccion_error corrector (
        .dataRaw(dataRaw_muxed),
        .sindrome(posError),
        .correccion(dataCorregido),
        .dataCorrecta(dataCorrecta)
    );

    // Mostrar los bits corregidos en LED
    display_7bits_leds display (
        .coregido(dataCorregido),
        .led(led)
    );

endmodule