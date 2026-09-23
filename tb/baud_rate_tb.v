module baud_rate_tb();
	reg [1:0] spi_mode;
	reg [2:0] sppr,spr;
	reg pclk, preset, spiswai, cpol, cpha, ss;
	wire sclk, miso_receive_sclk_o, miso_receive_sclk0_o, mosi_send_sclk_o, mosi_send_sclk0_o;
	wire [11:0] baud_rate_divisor;
	baud_rate_generator dut(pclk, preset, spiswai, cpol, cpha, ss, spi_mode, sppr, spr, sclk, miso_receive_sclk_o,  miso_receive_sclk0_o, mosi_send_sclk_o, mosi_send_sclk0_o, baud_rate_divisor);
	initial
	begin
		pclk = 0;
		forever 
		#5 pclk = ~pclk;
	end

	task reset();
		begin
			@(negedge pclk);
			preset = 0;
			@(negedge pclk);
			preset = 1;
		end
	endtask

	task initialise();
		begin
			@(negedge pclk);
			spi_mode = 2'b0;
			spiswai = 0;
			sppr = 3'b0;
			spr = 3'b0;
			cpol = 0;
			cpha = 0;
			ss = 0;
		end
	endtask
	task stimulus(input [2:0]i,j, input cpo,cph);
		begin
			@(negedge pclk);
			sppr = i;
			spr = j;
			cpol = cpo;
			cpha = cph;
		end
	endtask
	initial
	begin
		initialise();
		reset();
		stimulus(3'b1,3'b1,1'b0,1'b0);
		repeat(100) @(posedge pclk);
		stimulus(3'b010,3'b011,1'b0,1'b1);
		repeat(100) @(posedge pclk);
		$finish;
	end
	endmodule





