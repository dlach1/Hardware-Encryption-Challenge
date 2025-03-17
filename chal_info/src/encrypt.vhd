library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity encrypt is
    PORT (
	plaintext : in std_logic_vector(63 downto 0);
	keyin : in std_logic_vector(63 downto 0);
	ciphertext : out std_logic_vector(63 downto 0)
    );
end encrypt;

architecture behavioral of encrypt is
	component keygen is
	Port (
		kinput : in std_logic_vector(63 downto 0);
		key1 : out std_logic_vector(31 downto 0);
		key2 : out std_logic_vector(31 downto 0);
		key3 : out std_logic_vector(31 downto 0)
	);
	end component;

	component ip is
	Port (
		input : in std_logic_vector(63 downto 0);
		output : out std_logic_vector(63 downto 0)
	);
	end component;

	signal ipout : std_logic_vector(63 downto 0);
	signal lip : std_logic_vector(31 downto 0);
	signal rip : std_logic_vector(31 downto 0);

	component round is
	Port (
		lhin : in std_logic_vector(31 downto 0);
		rhin : in std_logic_vector(31 downto 0);
        	subkey : in std_logic_vector(31 downto 0);
		lhout : out std_logic_vector(31 downto 0);
		rhout : out std_logic_vector(31 downto 0)
	);
	end component;
	
	signal loutr1 : std_logic_vector(31 downto 0);
	signal routr1 : std_logic_vector(31 downto 0);

	signal loutr2 : std_logic_vector(31 downto 0);
	signal routr2 : std_logic_vector(31 downto 0);

	signal loutf : std_logic_vector(31 downto 0);
	signal routf : std_logic_vector(31 downto 0);
	
	signal fout : std_logic_vector(63 downto 0);

	component fp is
	Port (
		input : in std_logic_vector(63 downto 0);
		output : out std_logic_vector(63 downto 0)
	);
	end component;

	signal kout1 : std_logic_vector(31 downto 0);
	signal kout2 : std_logic_vector(31 downto 0);
	signal kout3 : std_logic_vector(31 downto 0);

begin   
	key : keygen port map (
		kinput => keyin,
		key1 => kout1,
		key2 => kout2,
		key3 => kout3
	);

	ip_inst : ip port map (
		input => plaintext,
		output => ipout
	);
	lip <= ipout(63 downto 32);
	rip <= ipout(31 downto 0);
	
	rnd1 : round port map (
		lhin => lip,
		rhin => rip,
		subkey => kout1,
		lhout => loutr1,
		rhout => routr1
	);

	rnd2 : round port map (
		lhin => loutr1,
		rhin => routr1,
		subkey => kout2,
		lhout => loutr2,
		rhout => routr2
	);

	rnd3 : round port map (
		lhin => loutr2,
		rhin => routr2,
		subkey => kout3,
		lhout => loutf,
		rhout => routf
	);
	
	fout <= loutf & routf;
	
	fp_inst : fp port map (
		input => fout,
		output => ciphertext
	);
	
end behavioral;