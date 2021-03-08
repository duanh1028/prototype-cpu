`include "datapath_cache_if.vh"
`include "caches_if.vh"
`include "cpu_types_pkg.vh"
`timescale 1 ns / 1 ns

module icache_tb;
  parameter PERIOD = 10;
  logic CLK = 0;
  logic nRST;
  always #(PERIOD/2) CLK++;
  datapath_cache_if dcif();
  caches_if cif();
  test PROG(nRST, dcif, cif);
  icache DUT(CLK, nRST, dcif, cif);
endmodule

program test(
  output logic nRST,
  datapath_cache_if dcif,
  caches_if cif
);

string tb_test_case;
parameter PERIOD = 10;

initial begin
  //test nRST
  tb_test_case = "reset test";
  dcif.halt = 0;
  cif.iwait = 1;
  nRST = 1;
  #(PERIOD);
  nRST = 0;
  #(PERIOD);
  nRST = 1;

  //test memory fetch
  tb_test_case = "try to fetch and store in addr f0f0";
  dcif.imemaddr = 32'hf0f0;
  dcif.imemREN = 1;
  #(PERIOD);
  cif.iwait = 0;
  cif.iload = 32'h1212;
  tb_test_case = "try to fetch and store in addr e0e0";
  #(PERIOD);
  cif.iwait = 1;
  cif.iload = '0;
  dcif.imemaddr = 32'he0e0;
  dcif.imemREN = 1;
  #(PERIOD);
  cif.iwait = 0;
  cif.iload = 32'h1313;
  #(PERIOD)
  tb_test_case = "try to read f0f0 again, expect 1212";
  cif.iwait = 1;
  cif.iload = '0;
  dcif.imemaddr = 32'hf0f0;
  dcif.imemREN = 1;
  #(PERIOD);
  #(PERIOD);



end

endprogram

