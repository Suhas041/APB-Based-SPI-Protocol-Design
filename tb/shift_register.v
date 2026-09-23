module shift_register_tb();
	reg pclk;
	reg preset;
	reg ss;
	reg send_data;
	reg lsbfe;
	reg cpha; 
	reg cpol;
	reg miso_receive_sclk;
	reg miso_receive_sclk0;
	reg mosi_send_sclk;
	reg mosi_send_sclk0;
	reg [7:0] data_mosi;
	reg miso;
	reg receive_data;
	wire mosi;
	wire [7:0] data_miso;

	

