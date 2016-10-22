`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2016 02:59:10 PM
// Design Name: 
// Module Name: FPGAtop
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define axi_single_signal(interface_name, regular_name, in_out, width, prefix, signal_name) \
  (* X_INTERFACE_INFO = `"xilinx.com:interface:aximm:1.0 interface_name regular_name`" *) \
  in_out [width - 1: 0] prefix``signal_name

`define axi_interface(interface_name, dir1, dir2, prefix) \
	`axi_single_signal(interface_name, AWREADY, dir1, 1, prefix, aw_ready), \
	`axi_single_signal(interface_name, AWVALID, dir2, 1, prefix, aw_valid), \
	`axi_single_signal(interface_name, AWADDR, dir2, 32, prefix, aw_bits_addr), \
	`axi_single_signal(interface_name, AWLEN, dir2, 8, prefix, aw_bits_len), \
	`axi_single_signal(interface_name, AWSIZE, dir2, 3, prefix, aw_bits_size), \
	`axi_single_signal(interface_name, AWBURST, dir2, 2, prefix, aw_bits_burst), \
	`axi_single_signal(interface_name, AWLOCK, dir2, 1, prefix, aw_bits_lock), \
	`axi_single_signal(interface_name, AWCACHE, dir2, 4, prefix, aw_bits_cache), \
	`axi_single_signal(interface_name, AWPROT, dir2, 3, prefix, aw_bits_prot), \
	`axi_single_signal(interface_name, AWQOS, dir2, 4, prefix, aw_bits_qos), \
	`axi_single_signal(interface_name, AWREGION, dir2, 4, prefix, aw_bits_region), \
	`axi_single_signal(interface_name, AWID, dir2, 5, prefix, aw_bits_id), \
	`axi_single_signal(interface_name, AWUSER, dir2, 1, prefix, aw_bits_user), \
	`axi_single_signal(interface_name, WREADY, dir1, 1, prefix, w_ready), \
	`axi_single_signal(interface_name, WVALID, dir2, 1, prefix, w_valid), \
	`axi_single_signal(interface_name, WDATA, dir2, 64, prefix, w_bits_data), \
	`axi_single_signal(interface_name, WLAST, dir2, 1, prefix, w_bits_last), \
	`axi_single_signal(interface_name, WID, dir2, 5, prefix, w_bits_id), \
	`axi_single_signal(interface_name, WSTRB, dir2, 8, prefix, w_bits_strb), \
	`axi_single_signal(interface_name, WUSER, dir2, 1, prefix, w_bits_user), \
	`axi_single_signal(interface_name, BREADY, dir2, 1, prefix, b_ready), \
	`axi_single_signal(interface_name, BVALID, dir1, 1, prefix, b_valid), \
	`axi_single_signal(interface_name, BRESP, dir1, 2, prefix, b_bits_resp), \
	`axi_single_signal(interface_name, BID, dir1, 5, prefix, b_bits_id), \
	`axi_single_signal(interface_name, BUSER, dir1, 1, prefix, b_bits_user), \
	`axi_single_signal(interface_name, ARREADY, dir1, 1, prefix, ar_ready), \
	`axi_single_signal(interface_name, ARVALID, dir2, 1, prefix, ar_valid), \
	`axi_single_signal(interface_name, ARADDR, dir2, 32, prefix, ar_bits_addr), \
	`axi_single_signal(interface_name, ARLEN, dir2, 8, prefix, ar_bits_len), \
	`axi_single_signal(interface_name, ARSIZE, dir2, 3, prefix, ar_bits_size), \
	`axi_single_signal(interface_name, ARBURST, dir2, 2, prefix, ar_bits_burst), \
	`axi_single_signal(interface_name, ARLOCK, dir2, 1, prefix, ar_bits_lock), \
	`axi_single_signal(interface_name, ARCACHE, dir2, 4, prefix, ar_bits_cache), \
	`axi_single_signal(interface_name, ARPROT, dir2, 3, prefix, ar_bits_prot), \
	`axi_single_signal(interface_name, ARQOS, dir2, 4, prefix, ar_bits_qos), \
	`axi_single_signal(interface_name, ARREGION, dir2, 4, prefix, ar_bits_region), \
	`axi_single_signal(interface_name, ARID, dir2, 5, prefix, ar_bits_id), \
	`axi_single_signal(interface_name, ARUSER, dir2, 1, prefix, ar_bits_user), \
	`axi_single_signal(interface_name, RREADY, dir2, 1, prefix, r_ready), \
	`axi_single_signal(interface_name, RVALID, dir1, 1, prefix, r_valid), \
	`axi_single_signal(interface_name, RRESP, dir1, 2, prefix, r_bits_resp), \
	`axi_single_signal(interface_name, RDATA, dir1, 64, prefix, r_bits_data), \
	`axi_single_signal(interface_name, RLAST, dir1, 1, prefix, r_bits_last), \
	`axi_single_signal(interface_name, RID, dir1, 5, prefix, r_bits_id), \
	`axi_single_signal(interface_name, RUSER, dir1, 1, prefix, r_bits_user)

`define axi_out_interface(interface_name, prefix) \
	`axi_interface(interface_name, input, output, prefix)

`define axi_in_interface(interface_name, prefix) \
	`axi_interface(interface_name, output, input, prefix)

`define axi_connect_single_signal(io_prefix, wire_prefix, signal_name) \
	.io_prefix``signal_name(wire_prefix``signal_name)

`define axi_connect_interface(io_prefix, wire_prefix) \
	`axi_connect_single_signal(io_prefix, wire_prefix, aw_ready), \
	`axi_connect_single_signal(io_prefix, wire_prefix, aw_valid), \
	`axi_connect_single_signal(io_prefix, wire_prefix, aw_bits_addr), \
	`axi_connect_single_signal(io_prefix, wire_prefix, aw_bits_len), \
	`axi_connect_single_signal(io_prefix, wire_prefix, aw_bits_size), \
	`axi_connect_single_signal(io_prefix, wire_prefix, aw_bits_burst), \
	`axi_connect_single_signal(io_prefix, wire_prefix, aw_bits_lock), \
	`axi_connect_single_signal(io_prefix, wire_prefix, aw_bits_cache), \
	`axi_connect_single_signal(io_prefix, wire_prefix, aw_bits_prot), \
	`axi_connect_single_signal(io_prefix, wire_prefix, aw_bits_qos), \
	`axi_connect_single_signal(io_prefix, wire_prefix, aw_bits_region), \
	`axi_connect_single_signal(io_prefix, wire_prefix, aw_bits_id), \
	`axi_connect_single_signal(io_prefix, wire_prefix, aw_bits_user), \
	`axi_connect_single_signal(io_prefix, wire_prefix, w_ready), \
	`axi_connect_single_signal(io_prefix, wire_prefix, w_valid), \
	`axi_connect_single_signal(io_prefix, wire_prefix, w_bits_data), \
	`axi_connect_single_signal(io_prefix, wire_prefix, w_bits_last), \
	`axi_connect_single_signal(io_prefix, wire_prefix, w_bits_id), \
	`axi_connect_single_signal(io_prefix, wire_prefix, w_bits_strb), \
	`axi_connect_single_signal(io_prefix, wire_prefix, w_bits_user), \
	`axi_connect_single_signal(io_prefix, wire_prefix, b_ready), \
	`axi_connect_single_signal(io_prefix, wire_prefix, b_valid), \
	`axi_connect_single_signal(io_prefix, wire_prefix, b_bits_resp), \
	`axi_connect_single_signal(io_prefix, wire_prefix, b_bits_id), \
	`axi_connect_single_signal(io_prefix, wire_prefix, b_bits_user), \
	`axi_connect_single_signal(io_prefix, wire_prefix, ar_ready), \
	`axi_connect_single_signal(io_prefix, wire_prefix, ar_valid), \
	`axi_connect_single_signal(io_prefix, wire_prefix, ar_bits_addr), \
	`axi_connect_single_signal(io_prefix, wire_prefix, ar_bits_len), \
	`axi_connect_single_signal(io_prefix, wire_prefix, ar_bits_size), \
	`axi_connect_single_signal(io_prefix, wire_prefix, ar_bits_burst), \
	`axi_connect_single_signal(io_prefix, wire_prefix, ar_bits_lock), \
	`axi_connect_single_signal(io_prefix, wire_prefix, ar_bits_cache), \
	`axi_connect_single_signal(io_prefix, wire_prefix, ar_bits_prot), \
	`axi_connect_single_signal(io_prefix, wire_prefix, ar_bits_qos), \
	`axi_connect_single_signal(io_prefix, wire_prefix, ar_bits_region), \
	`axi_connect_single_signal(io_prefix, wire_prefix, ar_bits_id), \
	`axi_connect_single_signal(io_prefix, wire_prefix, ar_bits_user), \
	`axi_connect_single_signal(io_prefix, wire_prefix, r_ready), \
	`axi_connect_single_signal(io_prefix, wire_prefix, r_valid), \
	`axi_connect_single_signal(io_prefix, wire_prefix, r_bits_resp), \
	`axi_connect_single_signal(io_prefix, wire_prefix, r_bits_data), \
	`axi_connect_single_signal(io_prefix, wire_prefix, r_bits_last), \
	`axi_connect_single_signal(io_prefix, wire_prefix, r_bits_id), \
	`axi_connect_single_signal(io_prefix, wire_prefix, r_bits_user)

module rocketchip_top(
  input coreclk,
  input corerst,
	(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 uncoreclk CLK" *)
	(* X_INTERFACE_PARAMETER = "ASSOCIATED_BUSIF M_AXI_MEM:M_AXI_MMIO, ASSOCIATED_RESET reset, FREQ_HZ 80000000" *)
  input   uncoreclk,
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 uncorerst RST" *)
  (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_HIGH" *)
  input   uncorerst,

  `axi_out_interface(M_AXI_MEM, io_mem_axi_0_),
  `axi_out_interface(M_AXI_MMIO, axi_uart_),
  input   io_interrupts_0,
  input   io_interrupts_1,
  output  io_debug_req_ready,
  input   io_debug_req_valid,
  input  [4:0] io_debug_req_bits_addr,
  input  [1:0] io_debug_req_bits_op,
  input  [33:0] io_debug_req_bits_data,
  input   io_debug_resp_ready,
  output  io_debug_resp_valid,
  output [1:0] io_debug_resp_bits_resp,
  output [33:0] io_debug_resp_bits_data
);

ExampleMultiClockTop top(
   .clock(uncoreclk),
   .reset(uncorerst),
   .io_coreclk(coreclk),
   .io_corerst(corerst),
   .io_interrupts_0(io_interrupts_0),
   .io_interrupts_1(io_interrupts_1),

   `axi_connect_interface(io_mem_axi_0_, io_mem_axi_0_),
   `axi_connect_interface(io_mmio_axi_0_, axi_uart_),

   .io_debug_req_ready(io_debug_req_ready),
   .io_debug_req_valid(io_debug_req_valid),
   .io_debug_req_bits_addr(io_debug_req_bits_addr),
   .io_debug_req_bits_op(io_debug_req_bits_op),
   .io_debug_req_bits_data(io_debug_req_bits_data),
   .io_debug_resp_ready(io_debug_resp_ready),
   .io_debug_resp_valid(io_debug_resp_valid),
   .io_debug_resp_bits_resp(io_debug_resp_bits_resp),
   .io_debug_resp_bits_data(io_debug_resp_bits_data)
);

endmodule
