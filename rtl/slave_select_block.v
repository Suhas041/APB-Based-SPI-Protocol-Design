module spi_slave_select(input pclk, preset, mstr, spiswai, send_data, 
	input [1:0] spi_mode,
	input [11:0] baud_rate_divisor,
	output  tip,
	output reg receive_data, ss);
	wire [15:0] target;
	reg [15:0] count;
	reg rcv;
	assign target = 8*baud_rate_divisor;
	always @(posedge pclk or negedge preset)
	begin
		if(!preset)
		begin
			ss <= 1'b1;
			count <= 16'hffff;
		end
		else if(mstr & (spi_mode == 2'b00 || spi_mode == 2'b01 && !spiswai))
		begin
			if(send_data)
			begin
			
				ss <= 1'b0;
				count <= 16'h0;
			end
			else if(count < target-1'b1)
			begin
				ss <= 1'b0;
				count <= count + 1;
			end
			else
			begin
				ss <= 1'b1;
				count <= 16'hfff;
			end
		end
		else 
		begin
			ss <= 1'b1;
			count <= 16'hfff;
		end
	end
		always @(posedge pclk or negedge preset)
	begin
		if(!preset)
		begin
			rcv <= 1'b0;
		end
		else if(mstr & (spi_mode == 2'b00 || spi_mode == 2'b01 && !spiswai))
		begin
			if(send_data)
			begin
				rcv <= 1'b0;
			end
			else if(count == target-1)
			begin
				rcv <= 1'b1;

			end
			else
			begin
				rcv <= 1'b0;	
			end
		end
		else
			rcv <= 1'b0;
	end
	always @(posedge pclk or negedge preset)
	begin
		if(!preset)
		begin
			receive_data <= 1'b0;
		end
		else
		begin
			receive_data <= rcv;
		end
	end
	assign tip = ~ss;

	endmodule


