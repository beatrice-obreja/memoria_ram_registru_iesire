`timescale 1ns / 1ps

module ram_registru_iesire(

    input logic clock,
    input logic [5:0] addr_read,
    output logic [7:0] data_read,
    input logic we,
    input logic [5:0] addr_write,
    input logic [7:0] data_write
    );
    
    logic [7:0] memorie_efectiva [0:63]; //memorie cu locatiile [0,63] fiecare pe 8 biti
    
    always_ff @(posedge clock)
    begin   
        if(we==1) begin
            memorie_efectiva[addr_write]<=data_write;
        end
        
        data_read<=memorie_efectiva[addr_read];
    end
    
endmodule
