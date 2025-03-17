library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity keygen is
    PORT (
        kinput : in std_logic_vector(63 downto 0);
	key1 : out std_logic_vector(31 downto 0);
	key2 : out std_logic_vector(31 downto 0);
	key3 : out std_logic_vector(31 downto 0)
    );
end keygen;

architecture behavioral of keygen is
	component keycompress is Port (
        	input : in std_logic_vector(63 downto 0);
		output : out std_logic_vector(31 downto 0)
	);
	end component;

	signal kcomp_s : std_logic_vector(31 downto 0);
	
	component kp is Port (
        	input : in std_logic_vector(31 downto 0);
		output : out std_logic_vector(31 downto 0)
	);
	end component;

	signal krot1_s : std_logic_vector(31 downto 0);
	signal krot2_s : std_logic_vector(31 downto 0);
	signal kperm1_s : std_logic_vector(31 downto 0);

begin   
	kcompress : keycompress port map (
		input => kinput,
		output => kcomp_s
	);

	key1 <= kcomp_s;
	
	krot1_s <= kcomp_s(20 downto 0) & kcomp_s(31 downto 21);

	permut1 : kp port map (
		input => krot1_s,
		output => kperm1_s
	);
	key2 <= kperm1_s;

	krot2_s <= kperm1_s(5 downto 0) & kperm1_s(31 downto 6);

	permut2 : kp port map (
		input => krot2_s,
		output => key3
	);

end behavioral;