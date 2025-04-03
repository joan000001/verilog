`timescale 1ns / 1ps

module top_tb;
    reg [3:0] in;
    reg [6:0] dataRaw;
    reg selector;
    wire [6:0] led;
    
    // Instancia del DUT (Device Under Test)
    top uut (
        .in(in),
        .dataRaw(dataRaw),
        .selector(selector),
        .led(led)
    );
    
    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
        $display("Iniciando pruebas...");
        
        // Caso 1: Sin error, selector en 0 (usar encoder)
        in = 4'b1010; 
        selector = 0;
        #10;
        $display("Caso 1 - Sin error | Entrada: %b | Salida: %b", in, led);
        
        // Caso 2: Con error manual en un bit, selector en 1
        selector = 1;
        dataRaw = 7'b0000001; // Introducimos un error 
        #10;
        $display("Caso 2 - Con error | Entrada: %b | Salida: %b", dataRaw, led);
        
        // Caso 3: Otro valor con error
        in = 4'b1101;
        selector = 0;
        #10;
        dataRaw = 7'b1110001; // Error en otro bit
        selector = 1;
        #10;
        $display("Caso 3 - Otro valor con error | Entrada: %b | Salida: %b", dataRaw, led);
        
        $display("Fin de la simulación");
        $finish;
    end
endmodule
