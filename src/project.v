module tt_um_benoitlx(a,b,op,o);
    
    // Module arguments
    input wire  [7:0] a;
    input wire  [7:0] b;
    input wire  [1:0] op;
    output reg  [7:0] o;
    
    // Enums
    localparam Operation$Addition = 0;
    localparam Operation$Substraction = 1;
    localparam Operation$And = 2;
    localparam Operation$Or = 3;
    
    // Update code
    always @(*) begin
        case (op)
            Operation$Addition:
                begin
                    o = a + b;
                end
            Operation$Substraction:
                begin
                    o = a - b;
                end
            Operation$And:
                begin
                    o = a & b;
                end
            Operation$Or:
                begin
                    o = a | b;
                end
        endcase
    end
    
endmodule // top

