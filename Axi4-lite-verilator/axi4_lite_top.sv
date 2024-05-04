module axi4_lite_top#(
    parameter DATA_WIDTH = 32,
    parameter ADDRESS = 32
    )(
        input                           ACLK,
        input                           ARESETN,
        input                           read_s,
        input                           write_s,
        input    [ADDRESS-1:0]          address,
        input    [DATA_WIDTH-1:0]       W_data
    );

    logic  M_ARREADY,S_RVALID,M_ARVALID,M_RREADY,S_AWREADY,S_BVALID,M_AWVALID,M_BREADY,M_WVALID,S_WREADY;
    logic [ADDRESS-1 : 0] M_ARADDR;
    logic [ADDRESS-1 : 0] M_AWADDR;
    logic [DATA_WIDTH-1:0]M_WDATA;
    logic [DATA_WIDTH-1:0]S_RDATA;
    logic [3:0]M_WSTRB;
    logic [1:0]S_RRESP,S_BRESP;

    axi4_lite_master u_axi4_lite_master0
    (
        .ACLK(ACLK),
        .ARESETN(ARESETN),
        .START_READ(read_s),
        .address(address),
        .W_data(W_data),
        .M_ARREADY(M_ARREADY),
        .M_RDATA(S_RDATA),
        .M_RRESP(S_RRESP),
        .M_RVALID(S_RVALID),
        .M_ARADDR(M_ARADDR),
        .M_ARVALID(M_ARVALID),
        .M_RREADY(M_RREADY),
        .START_WRITE(write_s),
        .M_AWREADY(S_AWREADY),
        .M_WVALID(M_WVALID),
        .M_WREADY(S_WREADY),
        .M_BRESP(S_BRESP),
        .M_BVALID(S_BVALID),
        .M_AWADDR(M_AWADDR),
        .M_AWVALID(M_AWVALID),
        .M_WDATA(M_WDATA),
        .M_WSTRB(M_WSTRB),
        .M_BREADY(M_BREADY)
    );

    axi4_lite_slave u_axi4_lite_slave0
    (
        .ACLK(ACLK),
        .ARESETN(ARESETN),
        .S_ARREADY(M_ARREADY),
        .S_RDATA(S_RDATA),
        .S_RRESP(S_RRESP),
        .S_RVALID(S_RVALID),
        .S_ARADDR(M_ARADDR),
        .S_ARVALID(M_ARVALID),
        .S_RREADY(M_RREADY),
        .S_AWREADY(S_AWREADY),
        .S_WVALID(M_WVALID),
        .S_WREADY(S_WREADY),
        .S_BRESP(S_BRESP),
        .S_BVALID(S_BVALID),
        .S_AWADDR(M_AWADDR),
        .S_AWVALID(M_AWVALID),
        .S_WDATA(M_WDATA),
        .S_WSTRB(M_WSTRB),
        .S_BREADY(M_BREADY)
    );
endmodule