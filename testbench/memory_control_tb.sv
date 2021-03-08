`include "cpu_types_pkg.vh"
`include "cache_control_if.vh"
`include "cpu_ram_if.vh"

`timescale 1 ns / 1 ns

module memory_control_tb;
  parameter PERIOD = 10;
  logic CLK = 0;
  logic nRST;
  always #(PERIOD/2) CLK++;
  caches_if cif0();
  caches_if cif1();
  cache_control_if ccif(cif0, cif1);
  cpu_ram_if ramif();
  test PROG (.CLK, .nRST, .ccif, .ramif);
  memory_control DUT(CLK, nRST, ccif);
  ram RAM(CLK, nRST, ramif);
  always_comb begin
    ramif.ramaddr = ccif.ramaddr;
    ramif.ramstore = ccif.ramstore;
    ramif.ramREN = ccif.ramREN;
    ramif.ramWEN = ccif.ramWEN;
    ccif.ramstate = ramif.ramstate;
    ccif.ramload = ramif.ramload;
  end
endmodule

program test(
  input logic CLK,
  output logic nRST,
  cache_control_if ccif,
  cpu_ram_if ramif
);
  import cpu_types_pkg::*;
  parameter PERIOD = 10;

initial begin
  //reset
  nRST = 0;
  #(PERIOD);
  nRST = 1;
  cif0.dstore = '0;
  cif0.dREN = '0;
  cif0.dWEN = '0;
  cif0.iREN = '0;
  cif0.daddr = '0;
  cif0.iaddr = '0;
  cif0.ccwrite = '0;
  cif0.cctrans = '0;
  cif1.dstore = '0;
  cif1.dREN = '0;
  cif1.dWEN = '0;
  cif1.iREN = '0;
  cif1.daddr = '0;
  cif1.iaddr = '0;
  cif1.ccwrite = '0;
  cif1.cctrans = '0;
  //test sendbusread and read_writeback instructions
  #(PERIOD);

  #(PERIOD)
  cif0.dREN = 1;
  #(PERIOD)
  cif1.cctrans = 1;
  cif1.dWEN = 1;
  #(PERIOD)
  #(PERIOD)
  #(PERIOD)
  @(negedge CLK)
  nRST = 0;
  cif0.dstore = '0;
  cif0.dREN = '0;
  cif0.dWEN = '0;
  cif0.iREN = '0;
  cif0.daddr = '0;
  cif0.iaddr = '0;
  cif0.ccwrite = '0;
  cif0.cctrans = '0;
  cif1.dstore = '0;
  cif1.dREN = '0;
  cif1.dWEN = '0;
  cif1.iREN = '0;
  cif1.daddr = '0;
  cif1.iaddr = '0;
  cif1.ccwrite = '0;
  cif1.cctrans = '0;
  #(PERIOD);    //this test case should expect memory control's state go through
  //IDLE, SENDBUSRD, READ_WRITEBACK1, READ_WRIBACK1, IDLE

//test sendbusrdx
  nRST = 1;
  #(PERIOD)
    cif0.ccwrite = 1;
    cif0.dREN = 1;
  #(PERIOD)
    cif1.cctrans = 1;
    cif1.dWEN = 0;
  #(PERIOD)
  #(PERIOD)
  #(PERIOD)
  @(negedge CLK)
  nRST = 0;
  cif0.dstore = '0;
  cif0.dREN = '0;
  cif0.dWEN = '0;
  cif0.iREN = '0;
  cif0.daddr = '0;
  cif0.iaddr = '0;
  cif0.ccwrite = '0;
  cif0.cctrans = '0;
  cif1.dstore = '0;
  cif1.dREN = '0;
  cif1.dWEN = '0;
  cif1.iREN = '0;
  cif1.daddr = '0;
  cif1.iaddr = '0;
  cif1.ccwrite = '0;
  cif1.cctrans = '0;
  #(PERIOD);

//test purewriteback
  nRST = 1;
  #(PERIOD)
    cif0.dWEN = 1;
  #(PERIOD)
  #(PERIOD)
  #(PERIOD);

  @(negedge CLK)
  nRST = 0;
  cif0.dstore = '0;
  cif0.dREN = '0;
  cif0.dWEN = '0;
  cif0.iREN = '0;
  cif0.daddr = '0;
  cif0.iaddr = '0;
  cif0.ccwrite = '0;
  cif0.cctrans = '0;
  cif1.dstore = '0;
  cif1.dREN = '0;
  cif1.dWEN = '0;
  cif1.iREN = '0;
  cif1.daddr = '0;
  cif1.iaddr = '0;
  cif1.ccwrite = '0;
  cif1.cctrans = '0;
  #(PERIOD);
  @(posedge CLK)
  nRST = 1;
  cif0.iREN = 1;
  cif1.iREN = 1;
  @(posedge CLK)
  @(posedge CLK)
  @(posedge CLK);

end

endprogram
/*

task automatic dump_memory();
    string filename = "memcpu.hex";
    int memfd;


    //syif.tbCTRL = 1;
    cif0.daddr = 0;
    cif0.dWEN = 0;
    cif0.dREN = 0;

    memfd = $fopen(filename,"w");

    if (memfd)
      $display("Starting memory dump.");
    else
      begin $display("Failed to open %s.",filename); $finish; end

    for (int unsigned i = 0; memfd && i < 16384; i++)
    begin
      int chksum = 0;
      bit [7:0][7:0] values;
      string ihex;

      cif0.daddr = i << 2;
      cif0.dREN = 1;

      repeat (4) @(posedge CLK);
      if (cif0.dload === 0)
        continue;
      values = {8'h04,16'(i),8'h00,cif0.dload};
      foreach (values[j])
        chksum += values[j];
      chksum = 16'h100 - chksum;
      ihex = $sformatf(":04%h00%h%h",16'(i),cif0.dload,8'(chksum));
      $fdisplay(memfd,"%s",ihex.toupper());
    end //for
    if (memfd)
    begin
      //syif.tbCTRL = 0;
      cif0.dREN = 0;

      $fdisplay(memfd,":00000001FF");
      $fclose(memfd);
      $display("Finished memory dump.");
    end
  endtask
*/





