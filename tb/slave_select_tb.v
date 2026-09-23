module spi_slave_select_tb();
	reg [1:0] spi_mode;
	reg [11:0] baud_rate_divisor;
	reg pclk, preset, mstr, spiswai, send_data;
	wire receive_data, ss, tip;
	spi_slave_select dut(pclk, preset,mstr, spiswai, send_data, spi_mode, baud_rate_divisor, tip, receive_data, ss);
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
			//@(negedge pclk);
			mstr = 1'b1;
		        spi_mode = 2'b00;
			spiswai = 0;
			send_data = 1'b0;
			baud_rate_divisor = 12'b011;
			
		end
	endtask
	
	task senddata();
		begin
			@(negedge pclk);
			send_data = 1'b1;
			@(negedge pclk);
			send_data = 1'b0;
		end
	endtask

	task stimulus(input [11:0] rate_divisor);
		begin
			//@(negedge pclk);
			baud_rate_divisor = rate_divisor;
		end
	endtask

	initial begin
		reset();
		initialise();
		senddata();
		stimulus(12'b1000);
		repeat(100) @(posedge pclk);
		senddata();
		stimulus(12'b1111);
		repeat(100) @(posedge pclk);
		#10000 $finish;
	end
	endmodule
	    
	    	    
