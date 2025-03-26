
entity g15_7_segment_decoder is
	
	port ( value : in std_logic_vector(3 downto 0);
			RB_In : in std_logic;
			RB_Out : out std_logic;
			segments : out std_logic_vector(6 downto 0));

end g15_7_segment_decoder;

architecture behavior of g15_7_segment_decoder is

begin
	P1: process(value) 
		begin
			case value is
				when "0000" => segments <="1000000"
				when "0001" => segments <="1111001"
				when "0010" => segments <="0100100"
				when "0011" => segments <="0110000"
				when "0100" => segments <="0011001"
				when "0101" => segments <="0010010"
				when "0110" => segments <="0100100"
				when "0011" => segments <="0110000"