library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity kp is
    PORT (
        input : in std_logic_vector(31 downto 0);
	output : out std_logic_vector(31 downto 0)
    );
end kp;

architecture behavioral of kp is

begin   
output(0) <= input(31);
output(1) <= input(11);
output(2) <= input(22);
output(3) <= input(25);
output(4) <= input(21);
output(5) <= input(28);
output(6) <= input(0);
output(7) <= input(19);

output(8) <= input(12);
output(9) <= input(14);
output(10) <= input(17);
output(11) <= input(10);
output(12) <= input(6);
output(13) <= input(9);
output(14) <= input(20);
output(15) <= input(18);

output(16) <= input(24);
output(17) <= input(1);
output(18) <= input(7);
output(19) <= input(26);
output(20) <= input(23);
output(21) <= input(15);
output(22) <= input(27);
output(23) <= input(4);

output(24) <= input(29);
output(25) <= input(5);
output(26) <= input(2);
output(27) <= input(3);
output(28) <= input(30);
output(29) <= input(16);
output(30) <= input(13);
output(31) <= input(8);

end behavioral;