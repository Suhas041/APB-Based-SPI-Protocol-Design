module shift_register_tb();
	reg pclk;
	reg preset;
	reg ss;
	reg send_data;
	reg lsbfe;
	reg cpha; 
	reg cpol;
	wire miso_receive_sclk_o;
	wire miso_receive_sclk0_o;
	wire mosi_send_sclk_o;
	wire mosi_send_sclk0_o;
	reg [7:0] data_mosi;
	reg miso;
	reg receive_data;
	wire mosi;
	wire [7:0] data_miso;
	wire [11:0] baud_rate_divisor;
	reg spiswai;
	reg [2:0] sppr;
	reg [2:0] spr;
	reg [1:0]spi_mode;
	wire sclk;
		
	shift_reg dut(pclk, preset, ss, send_data,lsbfe, cpha, cpol, miso_receive_sclk_o, miso_receive_sclk0_o, mosi_send_sclk_o, mosi_send_sclk0_o, miso, receive_data, data_mosi, mosi, data_miso);

	baud_rate_generator dut1( pclk, preset, spiswai, cpol, cpha, ss,spi_mode, sppr,spr,sclk, miso_receive_sclk_o, miso_receive_sclk0_o, mosi_send_sclk_o, mosi_send_sclk0_o, baud_rate_divisor);


	initial
	begin
		pclk = 0;
		forever #5 pclk = ~pclk;
	end

	task reset();
		begin
			@(negedge pclk);
			preset = 1'b0;
			@(negedge pclk);
			preset = 1'b1;
		end
	endtask	

	task initialize();
		begin
			pclk = 0;
			preset = 0;
			ss = 1;
			send_data = 0;
			lsbfe = 0;
			cpha = 0;
			cpol = 0;
			data_mosi = 1;
			spr = 0;
			sppr = 0;
			spi_mode = 0;
			spiswai = 0;
		end
	endtask

	task stimulus();
		begin
		@(negedge pclk)
		ss = 0;
		spr = 3'b1;
		sppr = 3'b1;
		spi_mode = 2'b01;
		spiswai = 1'b0;
		cpha = 1;
		cpol = 1;
		end
	endtask

	task send_stimulus(input [7:0] data, input lsb );
		begin
			@(negedge pclk)
			send_data = 1;
			data_mosi = data;
			lsbfe = lsb;
			@(negedge pclk)
			send_data = 0;
		end
	endtask

	task receive();
		begin
			@(negedge pclk)
			receive_data  = 1'b1;
			@(negedge pclk)
			receive_data = 1'b0;
		end
	endtask


	task receive_stimulus(input reg [7:0] data);
		integer i;
		begin
			miso = 1'bz;
			wait(~ss);
			//miso = data[7];
			for(i=0; i<=7; i=i+1)
			begin
				@(posedge pclk)
				miso = data[i];
			end

		end
	endtask

	

	initial
	begin
		initialize;
		reset;
		stimulus;
		send_stimulus(8'hfa,1'b1);
		receive_stimulus(8'hAA);
		receive();
		#10000;
		$finish;
	end
	endmodule

		

