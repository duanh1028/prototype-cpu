//branch target buffer with 2bit saturating predictor

`include "cpu_types_pkg.vh"
`include "branch_target_predictor_if.vh"

module branch_target_predictor (
		      input logic CLK,
		      input logic nRST,
              branch_target_predictor_if btpif
);
    import cpu_types_pkg::*;
    
    typedef enum logic[1:0] {STRONG_NT, WEAK_NT, WEAK_T, STRONG_T} state;
    state prediction_state, next_prediction_state;

    always_comb begin
        if(btpif.next_pc == btpif.branchAddr) 
            btpif.ifbranch = 1;
        else
            btpif.ifbranch = 0;
    end

// 2bit saturating predictor
    always_comb begin
        case(prediction_state)
            STRONG_NT: begin
                btpif.branch_prediction = 0;
                if(btpif.branch_taken)
                    next_prediction_state = WEAK_NT;
                else 
                    next_prediction_state = STRONG_NT;
            end
            WEAK_NT: begin
                btpif.branch_prediction = 0;
                if(btpif.branch_taken)
                    next_prediction_state = WEAK_T;
                else 
                    next_prediction_state = STRONG_NT;
            end
            WEAK_T: begin
                btpif.branch_prediction = 1;
                if(btpif.branch_taken)
                    next_prediction_state = STRONG_T;
                else 
                    next_prediction_state = WEAK_NT;
            end
            STRONG_T: begin
                btpif.branch_prediction = 1;
                if(btpif.branch_taken)
                    next_prediction_state = STRONG_T;
                else
                    next_prediction_state = WEAK_T;                
            end
            default:  begin
                btpif.branch_prediction = 0;
                next_prediction_state = prediction_state;
            end
        endcase
    end

    always_comb begin
        btpif.penalty_cycles = 0;
        case(btpif.ifbranch) 
            1: begin
                if(btpif.branch_prediction == 0 & btpif.branch_taken == 0)
                    btpif.penalty_cycles = 0;
                else if(btpif.branch_taken == 1)
                    btpif.penalty_cycles = 2'd2;
            end
            0: begin
                if(btpif.branch_prediction == 1 & btpif.branch_taken == 1)
                    btpif.penalty_cycles = 0;
                else if(btpif.branch_prediction == 1 & btpif.branch_taken == 0)
                    btpif.penalty_cycles = 2'd2;
            end
        endcase

    end
    
    always_ff @ (posedge CLK, negedge nRST) begin
        if(!nRST) 
            prediction_state <= STRONG_NT;
        else
            prediction_state <= next_prediction_state;
    end

endmodule