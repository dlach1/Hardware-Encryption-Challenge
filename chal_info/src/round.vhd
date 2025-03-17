library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity round is
    PORT (
	lhin : in std_logic_vector(31 downto 0);
	rhin : in std_logic_vector(31 downto 0);
        subkey : in std_logic_vector(31 downto 0);
	lhout : out std_logic_vector(31 downto 0);
	rhout : out std_logic_vector(31 downto 0)
    );
end round;

architecture structural of round is
	component cipherf is
	Port(
		finput : in std_logic_vector(31 downto 0);
		subkey : in std_logic_vector(31 downto 0);
		foutput : out std_logic_vector(31 downto 0)
	);
	end component;
	signal xorright : std_logic_vector(31 downto 0);

begin   
	f : cipherf port map (
		finput => rhin,
		subkey => subkey,
		foutput => xorright
	);
	
	rhout <= xorright xor lhin;	
	lhout <= rhin;	

end structural;