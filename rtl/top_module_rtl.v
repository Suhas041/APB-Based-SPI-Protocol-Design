module top_module (pclk,preset_n,paddr,pwrite,psel,penable,pwdata,miso,ss,sclk,spi_interrupt_req,mosi,pr_data,pready,pslverr);
input pclk,preset_n,pwrite,psel,penable,miso;
input[2:0]paddr;
input [7:0]pwdata;
output ss,sclk,spi_interrupt_req,pready,pslverr;
output  mosi;
output [7:0]pr_data;
wire miso,spiswai,cpol,cpha,rcv_data,send_data,lsbfe;
wire[2:0]sppr,spr;
wire[1:0]spi_mode;
wire miso_recieve_sclk,miso_recieve_sclk0,mosi_send_sclk,mosi_send_sclk0,tip,mstr;
wire [11:0]baud_rate_divisor;
wire [7:0]data_mosi;
wire[7:0]data_miso;
//baud_rate_generator blk1(pclk,preset_n,spiswai,cpol,cpha,ss,spi_mode,sppr,spr,sclk,miso_receive_sclk,miso_receive_sclk0,mosi_send_sclk,mosi_send_sclk0,baud_rate_divisor);

baud_rate_generator blk1(
    .pclk(pclk),
    .preset(preset_n),
    .spiswai(spiswai),
    .cpol(cpol),
    .cpha(cpha),
    .ss(ss),
    .spi_mode(spi_mode),
    .sppr(sppr),
    .spr(spr),
    .sclk(sclk),
    .miso_receive_sclk_o(miso_receive_sclk),
    .miso_receive_sclk0_o(miso_receive_sclk0),
    .mosi_send_sclk_o(mosi_send_sclk),
    .mosi_send_sclk0_o(mosi_send_sclk0),
    .baud_rate_divisor(baud_rate_divisor)
);

//shift_register blk2(pclk,preset_n,ss,send_data,lsbfe,cpha,cpol,miso_receive_sclk,miso_receive_sclk0,mosi_send_sclk,mosi_send_sclk0,data_mosi,miso,rcv_data,mosi,data_miso);

shift_register blk2(
    .pclk(pclk),
    .presetn(preset_n),
    .ss_i(ss),
    .send_data_i(send_data),
    .lsbfe_i(lsbfe),
    .cpha_i(cpha),
    .cpol_i(cpol),
    .miso_receive_sclk_i(miso_receive_sclk),
    .miso_receive_sclk0_i(miso_receive_sclk0),
    .mosi_send_sclk_i(mosi_send_sclk),
    .mosi_send_sclk0_i(mosi_send_sclk0),
    .data_mosi_i(data_mosi),
    .miso_i(miso),
    .receive_data_i(rcv_data),
    .mosi_o(mosi),
    .data_miso_o(data_miso)
);
//spi_slave_select blk3(pclk,preset_n,mstr,spiswai,send_data,spi_mode,baud_rate_divisor,tip,rcv_data,ss);
spi_slave_select blk3(
    .pclk(pclk),
    .preset(preset_n),
    .mstr(mstr),
    .spiswai(spiswai),
    .send_data(send_data),
    .spi_mode(spi_mode),
    .baud_rate_divisor(baud_rate_divisor),
    .tip(tip),
    .receive_data(rcv_data),
    .ss(ss)
);

//APB_slave_interface blk4(.pclk(pclk), .presetn(preset_n), .paddr_i(paddr),.pwrite_i(pwrite),.psel_i(psel),.penable_i(penable),.pwdata_i(pwdata),ss_i(ss),miso_data_i(data_miso),receive_data_i(rcv_data),tip_i(tip),prdata_o(pr_data),mstr,cpol,cpha,lsbfe,spiswai,sppr,spr,spi_interrupt_req,pready,pslverr,send_data,data_mosi,spi_mode);

APB_slave_interface blk4(
    .pclk(pclk),
    .presetn(preset_n),
    .paddr_i(paddr),
    .pwrite_i(pwrite),
    .psel_i(psel),
    .penable_i(penable),
    .pwdata_i(pwdata),
    .ss_i(ss),
    .miso_data_i(data_miso),
    .receive_data_i(rcv_data),
    .tip_i(tip),
    .prdata_o(pr_data),
    .mstr_o(mstr),
    .cpol_o(cpol),
    .cpha_o(cpha),
    .lsbfe_o(lsbfe),
    .spiswai_o(spiswai),
    .sppr_o(sppr),
    .spr_o(spr),
    .spi_interrupt_request_o(spi_interrupt_req),
    .pready_o(pready),
    .pslverr_o(pslverr),
    .send_data_o(send_data),
    .mosi_data_o(data_mosi),
    .spi_mode_o(spi_mode)
);
endmodule
