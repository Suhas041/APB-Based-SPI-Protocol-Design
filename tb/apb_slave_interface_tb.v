/*`timescale 1ns/1ns

module APB_slave_interface_tb();
reg pclk,presetn,pwrite_i,psel_i,penable_i,ss_i,receive_data_i,tip_i;
reg [2:0]paddr_i;
reg [7:0]pwdata_i,miso_data_i;

wire mstr_o,cpol_o,cpha_o,lsbfe_o,spiswai_o,pready_o,pslverr_o;
wire send_data_o,spi_interrupt_request_o;
wire  [1:0] spi_mode_o;
wire [7:0] prdata_o,mosi_data_o;
wire [2:0] sppr_o,spr_o;

parameter t=40;



APB_slave_interface DUT(pclk,presetn,paddr_i,pwrite_i,psel_i,penable_i,pwdata_i,ss_i,miso_data_i,receive_data_i,tip_i,prdata_o,mstr_o,cpol_o,cpha_o,lsbfe_o,spiswai_o,sppr_o,spr_o,spi_interrupt_request_o,pready_o,pslverr_o,send_data_o,mosi_data_o,spi_mode_o);

initial
begin
	pclk=1'b0;
	forever #(t/2) pclk=~pclk;
end

task reset();
	begin
		@(negedge pclk)
		presetn=1'b0;
		@(negedge pclk)
		presetn=1'b1;
	end
endtask

task initialize();
begin
	pwrite_i=1'b0;
	psel_i=1'b0;
	penable_i=1'b0;
	ss_i=1'b0;
	receive_data_i=1'b0;
	miso_data_i = 1'b0;
	tip_i = 1'b0;
end
endtask
	
task APB_config_write(input [2:0]addr,input [7:0]data);
	begin
		@(negedge pclk)
			psel_i=1'b1;
			penable_i=1'b0;
			paddr_i=addr;
			pwdata_i=data;
			pwrite_i=1'b1;
		@(negedge pclk)
			penable_i=1'b1;
		@(negedge pclk)
			psel_i=1'b0;
			penable_i=1'b0;
	end
endtask


task APB_config_read(input [2:0]rd_addr);
	begin
		@(negedge pclk)
			psel_i=1'b1;
			penable_i=1'b0;
			paddr_i=rd_addr;
			pwrite_i=1'b0;
		@(negedge pclk)
			penable_i=1'b1;
		@(negedge pclk)
			psel_i=1'b0;
			penable_i=1'b0;
	end
endtask

initial
	begin
		reset();
		initialize();
		APB_config_write(3'b000,8'd9);
		APB_config_read	(3'b000);
	end
endmodule
*/


module APB_slave_interface_tb();
reg pclk,presetn,pwrite_i,psel_i,penable_i,ss_i,receive_data_i,tip_i;
reg [2:0]paddr_i;
reg [7:0]pwdata_i,miso_data_i;

wire mstr_o,cpol_o,cpha_o,lsbfe_o,spiswai_o,pready_o,pslverr_o;
wire send_data_o,spi_interrupt_request_o;
wire  [1:0] spi_mode_o;
wire [7:0] prdata_o,mosi_data_o;
wire [2:0] sppr_o,spr_o;

APB_slave_interface DUT(pclk,presetn,paddr_i,pwrite_i,psel_i,penable_i,pwdata_i,ss_i,miso_data_i,receive_data_i,tip_i,prdata_o,mstr_o,cpol_o,cpha_o,lsbfe_o,spiswai_o,sppr_o,spr_o,spi_interrupt_request_o,pready_o,pslverr_o,send_data_o,mosi_data_o,spi_mode_o);

parameter cr1 = 3'd0;
parameter cr2 = 3'd1;
parameter br = 3'd2;
parameter sr = 3'd3;
parameter dr = 3'd5;

initial
begin

pclk = 0;
forever #5 pclk = ~pclk;
end

task initialize; 
begin
	paddr_i = 0;
	pwdata_i = 0;
	pwrite_i = 0;
	psel_i = 0;
	penable_i = 0;
	ss_i = 1;
	miso_data_i = 0;
	receive_data_i = 0;
	tip_i = 0;
end
endtask
	
task reset;
begin
	@(negedge pclk);
	presetn = 1'b0;
	@(negedge pclk);
	presetn = 1'b1;
end
endtask

task apb_write(input [2:0] addr, input [7:0] data);
begin
	paddr_i = addr;
	pwdata_i  = data;
	pwrite_i = 1'b1;
	psel_i = 1'b1;
	penable_i = 1'b0;
	
	@(negedge pclk);
	penable_i = 1'b1;
	@(negedge pclk);
	psel_i = 1'b0;
	penable_i = 1'b0;
end
endtask

task apb_read([2:0] addr);
begin
	@(negedge pclk);
	paddr_i = addr;
	pwrite_i = 1'b0;
	psel_i = 1'b1;
	penable_i = 1'b0;
	@(negedge pclk);
	penable_i = 1'b1;
	@(negedge pclk);
	psel_i = 1'b0;
	penable_i = 1'b0;
end
endtask


initial 
begin

	initialize;
	reset;
	apb_write(cr1,8'b01111011);
	apb_write(cr2, 8'b00010010);
	apb_write(br,8'b01110101);
	apb_write(dr,8'ha5);
	apb_read(cr1);
	apb_read(cr2);
	apb_read(br);
	apb_read(sr);
	apb_read(dr);
	@(negedge pclk);
	miso_data_i = 8'h3c;
	receive_data_i = 1'b1;
	@(negedge pclk)
	receive_data_i = 1'b0;
	apb_read(dr);
	ss_i= 0;
	tip_i = 1;
	@(negedge pclk);
	#100 $finish;
end
endmodule
