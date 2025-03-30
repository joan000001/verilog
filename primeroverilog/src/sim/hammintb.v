`timescale 1ns / 1ps

module tb_top;
    reg [6:0] dataRaw;
    wire [6:0] led;

    // Instancia del módulo top
    top uut (
        .dataRaw(dataRaw),
        .led(led)
    );

    initial begin
        $dumpfile("tb_top.vcd");
        $dumpvars(0, tb_top);
        
        // Caso 1: Entrada sin error
        dataRaw = 7'b1010101;
        #10;
        
        // Caso 2: Introducir un error en el bit 1
        dataRaw = 7'b1010100;
        #10;
        
        // Caso 3: Introducir un error en el bit 3
        dataRaw = 7'b1000101;
        #10;
        
        // Caso 4: Introducir un error en el bit 6
        dataRaw = 7'b0010101;
        #10;
        
        // Finalizar simulación
        $finish;
    end
endmodule
