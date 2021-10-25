// Emulation of standard TTL logic devices
// Christopher F. Moran

// 74138
module em_74138(out, e1, e2, e3, a) ;
	input [2:0]a ;
	input e1 ;
	input e2 ;
	input e3 ;
	output [7:0]out ;
	reg [7:0] out ;
	
	always @ (a or e1 or e2 or e3)
	begin
		out = 8'd0 ;
		case(a)
			3'd0 : out = 8'd1 ;
			3'd1 : out = 8'd2 ;
			3'd2 : out = 8'd4 ;
			3'd3 : out = 8'd8 ;
			3'd4 : out = 8'd16 ;
			3'd5 : out = 8'd32 ;
			3'd6 : out = 8'd64 ;
			3'd7 : out = 8'd128 ;
			default : $display("Impossible condition\n") ;
		endcase ;
		if(!e1 && !e2 && e3)
			out = 8'd0 ;
	end
endmodule

// 74154
module em_74154(out, e1, e2, a) ;
	input [3:0]a ;
	input e1 ;
	input e2 ;
	output [15:0]out ;
	reg [15:0] out ;
	
	always @ (a or e1 or e2)
	begin
		out = 16'd0 ;
		case(a)
			4'd0 : out = 16'd1 ;
			4'd1 : out = 16'd2 ;
			4'd2 : out = 16'd4 ;
			4'd3 : out = 16'd8 ;
			4'd4 : out = 16'd16 ;
			4'd5 : out = 16'd32 ;
			4'd6 : out = 16'd64 ;
			4'd7 : out = 16'd128 ;
			4'd8 : out = 16'd256 ;
			4'd9 : out = 16'd512 ;
			4'd10 : out = 16'd1024 ;
			4'd11 : out = 16'd2048 ;
			4'd12 : out = 16'd4096 ;
			4'd13 : out = 16'd8192 ;
			4'd14 : out = 16'd16384 ;
			4'd15 : out = 16'd32768 ;
			default : $display("Impossible condition\n") ;
		endcase ;
		if(!e1 && !e2)
			out = 16'd0 ;
	end
endmodule


// 74161 Synchronous up counter
module em_74161(clk, nclr, nload, ent, enp, rco, count, parallel_in) ;
	input clk ;
	input nclr ;
	input nload ;
	input ent ;
	input enp ;
	input [3:0] parallel_in ;
	output rco ;
	output [3:0] count ;
	reg [3:0] count ;
	reg rco;
	
	always @ (count or ent)
	if((count == 15) && (ent == 1'b1))
		rco = 1'b1 ;
	else
		rco = 1'b0 ;
		
	always @ (posedge clk or negedge nclr)
	begin
		if(nclr == 1'b0)
			count <= 4'd0 ;
		else if(nload == 1'b0)
			count <= parallel_in ;
		else if((ent == 1'b1) && (enp == 1'b1))
			count <= (count + 1) % 16 ;
	end
	
endmodule
