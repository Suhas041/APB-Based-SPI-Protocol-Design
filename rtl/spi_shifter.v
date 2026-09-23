module shift_reg( input pclk, preset, ss, send_data,lsbfe, cpha, cpol, miso_receive_sclk, miso_receive_sclk0, mosi_send_sclk, mosi_send_sclk0, miso, receive_data, input [7:0]data_mosi, output reg mosi, output [7:0] data_miso);
	reg [7:0] shift_reg, temp_reg;
	reg [2:0] count, count1, count2, count3;

	always @(posedge pclk or negedge preset)
	begin
		if(!preset)
		begin
			shift_reg <= 8'b0;
		end
		else
		begin
			if(send_data)
			begin
				shift_reg <= data_mosi;
			end
			else
				shift_reg <= shift_reg;
		end
	end

	assign data_miso = receive_data? temp_reg: 8'h00;

	always@(posedge pclk or negedge preset)
	begin
		if(!preset)
		begin
			mosi <= 1'b0;
			count <= 3'b000;
			count1 <= 3'b111;
		end
		else
		begin
			if(!ss)
			begin
				if((!cpha && cpol) || (cpha && !cpol))
				begin
					if(lsbfe)
					begin
						if(count <= 3'd7)
						begin
							if(mosi_send_sclk0)
							begin
								mosi <= shift_reg[count];
								count <= count + 1;
							end
							else
							begin
								mosi <= mosi;
								count <= count;
							end
						end
						else
						begin
							mosi <= 3'd0;
							count <= 3'd0;
						end
					end
					else
					begin
						if(count1 >=3'd0)
						begin
							if(mosi_send_sclk0)
							begin
								mosi <= shift_reg[count1];
								count1 <= count1 - 1;
							end
							else
							begin
								mosi <= mosi;
								count1 <= count1;
							end
						end
						else
						begin
							mosi <= 3'd7;
							count1 <= 3'd7;
						end
					end
				end
				else
				begin
				  		if(lsbfe)
						begin
							if(count <= 3'd7)
							begin
								if(mosi_send_sclk)
								begin
									mosi <= shift_reg[count];
									count <= count + 1;
								end
								else
								begin
									mosi <= mosi;
									count <= count;
								end
							end
							else
							begin
								mosi <= 3'd0;
								count <= 3'd0;
							end
						end
						else
						begin
							if(count1 >=3'd0)
							begin
								if(mosi_send_sclk)
								begin
									mosi <= shift_reg[count1];
									count1 <= count1 - 1;
								end
								else
								begin
									mosi <= mosi;
									count1 <= count1;
								end
							end
							else
							begin
								mosi <= 3'd7;
								count1 <= count1;
							end
						end
				end
			end
			else
			begin
				mosi <= mosi;
				count <= count;
				count1 <= count1;
			end
		end
	end

		always@(posedge pclk or negedge preset)
	begin
		if(!preset)
		begin
	
			temp_reg <= 8'b0;
			count2 <= 3'b000;
			count3 <= 3'b111;
		end
		else
		begin
			if(!ss)
			begin
				if((!cpha && cpol) || (cpha && !cpol))
				begin
					if(lsbfe)
					begin
						if(count2 <= 3'd7)
						begin
							if(miso_receive_sclk0)
							begin
								temp_reg[count2] <= miso;
								count2 <= count2 + 1;
							end
							else
							begin
								temp_reg[count2] <= temp_reg[count2];
								count2 <= count2;
							end
						end
						else
						begin
							temp_reg[count2] <= 3'd0;
							count2 <= 3'd0;
						end
					end
					else
					begin
						if(count3 >=3'd0)
						begin
							if(miso_receive_sclk0)
							begin
								temp_reg[count3] <= miso;
								count3 <= count3 - 1;
							end
							else
							begin
								temp_reg[count3] <= temp_reg[count3];
								count3 <= count3;
							end
						end
						else
						begin
							temp_reg[count3] <= 3'd7;
							count3 <= 3'd7;
						end
					end
				end
				else
				begin
				  		if(lsbfe)
						begin
							if(count <= 3'd7)
							begin
								if(miso_receive_sclk)
								begin
									temp_reg[count2] <= miso;
									count3 <= count3 + 1;
								end
								else
								begin
									temp_reg[count2] <= temp_reg[count2];
									count2 <= count2;
		    						end
							end
							else
							begin
								temp_reg[count2] <= 3'd0;
								count2 <= 3'd0;
							end
						end
						else
						begin
							if(count3 >=3'd0)
							begin
								if(miso_receive_sclk)
								begin
									temp_reg[count3] <= miso;
									count3 <= count3 - 1;
								end
								else
								begin
									temp_reg[count3] <= temp_reg[count3];
									count3 <= count3;
								end
							end
							else
							begin
								temp_reg[count3] <= 3'd7;
								count3 <= count3;
							end
						end
				end
			end
			else
			begin
				temp_reg[count2] <= temp_reg[count2];
				temp_reg[count3] <= temp_reg[count3];
				count2 <= count2;
				count3 <= count3;
			end
		end
	end
	endmodule


