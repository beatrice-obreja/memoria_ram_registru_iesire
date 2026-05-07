`timescale 1ns / 1ps

module tb_ram_reg_iesire();

logic clock;
logic [5:0] addr_read;
logic [7:0] data_read;
logic we;
logic [5:0] addr_write;
logic [7:0] data_write;

ram_registru_iesire ram_registru_iesire_0(.*);

initial begin
    clock=0;
    forever begin #5 clock=~clock;
end
end

initial begin
    we<=0;
    data_write<=0;
    addr_read<=0;
    addr_write<=0;
    
    repeat(5) begin
        @(posedge clock);
    end
    we<=1;
    addr_write<=10;
    data_write<=5;
    addr_read <= 11; // citind de la o adresa nescrisa inca, iesirea e necunoscuta
	@(posedge clock);
	we <= 0;			// scrierea asta nu se face deoarece nu am write enable activ	
	addr_write <= 11;
	data_write <= 10;	
	@(posedge clock);
	data_write <= 11;	// nici asta
	@(posedge clock);
	data_write <= 12;	// nici asta
	@(posedge clock);
	we <= 1;
	addr_write <= 20; // scriere ok 
	data_write <= 42;	// scriu data 42 la adresa 20
	@(posedge clock);
	data_write <= 51;	// si asta; suprascriu datele anterioare la adresa 20.
	@(posedge clock);
	addr_write <= 21;
	data_write <= 11;	// scriere ok
	addr_read <= 20; // citesc de la adresa 20, scrisa anteior deci voi vedea date cunoscute pe iesire.
	@(posedge clock);
	addr_write <= 23;
	data_write <= 14;	// scriere ok 
	addr_read <= 21; // variez adresa de citire si pot parcurge memorie locatie cu locatie
	@(posedge clock);	
	we <= 0;	// opresc scrierea
	
	repeat(5) // dupa 5 cicli de ceas
		begin
		@(posedge clock);
		end
	$stop();
    
    
end

endmodule