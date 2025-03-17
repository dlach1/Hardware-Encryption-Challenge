
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity keycompress is
    PORT (
        input : in std_logic_vector(63 downto 0);
	output : out std_logic_vector(31 downto 0)
    );
end keycompress;

architecture behavioral of keycompress is

begin   
output(0) <= input(10);
output(1) <= input(35);
output(2) <= input(38);
output(3) <= input(13);
output(4) <= input(3);
output(5) <= input(60);
output(6) <= input(9);
output(7) <= input(62);

output(8) <= input(7);
output(9) <= input(43);
output(10) <= input(45);
output(11) <= input(44);
output(12) <= input(34);
output(13) <= input(12);
output(14) <= input(54);
output(15) <= input(24);

output(16) <= input(26);
output(17) <= input(42);
output(18) <= input(41);
output(19) <= input(18);
output(20) <= input(8);
output(21) <= input(31);
output(22) <= input(50);
output(23) <= input(32);

output(24) <= input(17);
output(25) <= input(56);
output(26) <= input(47);
output(27) <= input(0);
output(28) <= input(46);
output(29) <= input(49);
output(30) <= input(27);
output(31) <= input(48);

end behavioral;