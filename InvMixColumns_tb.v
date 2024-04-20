module InvMixColumns_tb();

	reg [127:0] stateIn;
	wire [127:0] stateOut;

	InvMixColumns mix(stateIn,stateOut);

	initial begin
		stateIn = 128'hbd6e7c3df2b5779e0b61216e8b10b689;
		$monitor("expected: 4773b91ff72f354361cb018ea1e6cf2c actual: %h\n",stateOut);
		#2
		stateIn = 128'hfde3bad205e5d0d73547964ef1fe37f1;
		$monitor("expected: 2d7e86a339d9393ee6570a1101904e16 actual: %h\n",stateOut);
		#2
		stateIn = 128'hd1876c0f79c4300ab45594add66ff41f;
		$monitor("expected: 39daee38f4f1a82aaf432410c36d45b9 actual: %h\n",stateOut);


	end

endmodule