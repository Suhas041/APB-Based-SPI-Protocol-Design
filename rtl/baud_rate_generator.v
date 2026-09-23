module baud_rate_generator(input pclk, preset, spiswai, cpol, cpha, ss,
	input [1:0]spi_mode,
	input [2:0] sppr,spr,
	output reg sclk, miso_receive_sclk_o, miso_receive_sclk0_o, mosi_send_sclk_o, mosi_send_sclk0_o, 
	output[11:0] baud_rate_divisor);
	wire pre_sclk;
	reg [11:0] count;
	assign baud_rate_divisor = (sppr+1)*2**(spr+1);
	assign pre_sclk = cpol?1:0;
	always @(posedge pclk or negedge preset)
	begin
		if(!preset)
		begin
			count <= 12'b0;
			sclk <= pre_sclk;
		end
		else if( !ss && (spi_mode == 2'b00 || spi_mode == 2'b01 && !spiswai))
		begin
			if(count == (baud_rate_divisor/2)-1)
			begin
				sclk <= ~sclk;
				count <= 12'b0;
			end
			else
				count <= count+1;
		end
		else
			begin
			sclk <= sclk;
			count <= 12'b0;
		end
	
	end
	always @(posedge pclk or negedge preset)
	begin
		if(!preset)
		begin
			miso_receive_sclk_o <= 0;
			miso_receive_sclk0_o <= 0;
		end
		else if((!cpha & cpol)|| (cpha & !cpol))
		begin
			
			if(sclk & count == (baud_rate_divisor/2)-1)
				miso_receive_sclk0_o <= 1;
			else
				miso_receive_sclk0_o <= 0;
		end
		else if((cpha & cpol) || (!cpha & !cpol))
		begin
			if(~sclk & count == (baud_rate_divisor/2)-1)
				miso_receive_sclk_o <= 1;
			else
				miso_receive_sclk_o <= 0;
		end
		else
		begin
			miso_receive_sclk_o <= 0;
			miso_receive_sclk0_o <= 0;
		end
	end
		always @(posedge pclk or negedge preset)
	begin
		if(!preset)
		begin
			mosi_send_sclk_o <= 0;
			mosi_send_sclk0_o <= 0;
		end
		else if((!cpha & cpol)|| (cpha & !cpol))
		begin
			
			if(sclk & count == (baud_rate_divisor/2)-2)
				mosi_send_sclk0_o <= 1;
			else
				mosi_send_sclk0_o <= 0;
		end
		else if((cpha & cpol) || (!cpha & !cpol))
		begin
			if(~sclk & count == (baud_rate_divisor/2)-2)
				mosi_send_sclk_o <= 1;
			else
				mosi_send_sclk_o <= 0;
		end
		else
		begin
			mosi_send_sclk_o <= 0;
			mosi_send_sclk0_o <= 0;
		end
	end
	endmodule




			


