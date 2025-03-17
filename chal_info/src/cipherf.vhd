library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cipherf is
    PORT (
        finput : in std_logic_vector(31 downto 0);
	subkey : in std_logic_vector(31 downto 0);
	foutput : out std_logic_vector(31 downto 0)
    );
end cipherf;

architecture behavioral of cipherf is

begin   
	foutput <= finput xor subkey;
end behavioral;