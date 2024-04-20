module MixColumns_tb();

	reg [127:0] stateIn;
	wire [127:0] stateOut;

	MixColumns mix(stateIn,stateOut);

	initial begin
		stateIn = 128'h6353e08c0960e104cd70b751bacad0e7;
		$monitor("expected: 5f72641557f5bc92f7be3b291db9f91a actual: %h\n",stateOut);
		#2
		stateIn = 128'h84e1dd691a41d76f792d389783fbac70;
		$monitor("expected: 9f487f794f955f662afc86abd7f1ab29 actual: %h\n",stateOut);
		#2
		stateIn = 128'h1fb5430ef0accf64aa370cde3d77792c;
		$monitor("expected: b7a53ecbbf9d75a0c40efc79b674cc11 actual: %h\n",stateOut);


	end

endmodule