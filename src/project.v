`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    
    // Module arguments
    wire  [3:0] a = ui_in[3:0];
    wire  [3:0] b = ui_in[7:4];

    assign uio_oe  = 8'b0;
    wire  [1:0] op = uio_in[1:0];

    reg  [7:0] o;

    assign uo_out = o;

    
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

