`include "request_unit_if.vh"

module request_unit(
  input logic CLK, nRST,
  request_unit_if.ru ruif
);
always_ff @ (posedge CLK, negedge nRST) begin
  if(!nRST) begin
    ruif.dmWEN <= 0;
    ruif.dmREN <= 0;
  end
  else if(ruif.dhit | ruif.halt) begin
    ruif.dmWEN <= 0;
    ruif.dmREN <= 0;
  end
  else if(ruif.ihit) begin
    ruif.dmWEN <= ruif.dWEN;
    ruif.dmREN <= ruif.dREN;
  end
end
endmodule

