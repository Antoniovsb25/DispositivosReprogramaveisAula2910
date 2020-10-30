library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity aula2910 is
port(
		signal SW : in std_logic_vector(17 downto 0);
		signal CLOCK_50 : in std_logic;
		signal KEY : in std_logic_vector(3 downto 0);
		signal LEDR : out std_logic_vector(17 downto 0);
		signal HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
		HEX6, HEX7 : out std_logic_vector(6 downto 0)
);
end entity aula2910;

architecture c_aula2910 of aula2910 is

component aula2910_qsys is
		port (
			clk_clk          : in  std_logic                    := 'X';             -- clk
			reset_reset_n    : in  std_logic                    := 'X';             -- reset_n
			sw_avsb_export   : in  std_logic_vector(7 downto 0) := (others => 'X'); -- export
			key_avsb_export  : in  std_logic_vector(3 downto 0) := (others => 'X'); -- export
			ledr_avsb_export : out std_logic_vector(7 downto 0);                    -- export
			hex0_avsb_export : out std_logic_vector(6 downto 0)                     -- export
		);
	end component aula2910_qsys;

	signal clk, reset : std_logic;
	signal s_sw, s_ledr : std_logic_vector(7 downto 0);
	signal s_key : std_logic_vector(3 downto 0);
	signal s_hex0 : std_logic_vector(6 downto 0);

begin

   HEX1 <= "1111111"; HEX2 <= "1111111";
	HEX3 <= "1111111"; HEX4 <= "1111111"; HEX5 <= "1111111";
	HEX6 <= "1111111"; HEX7 <= "1111111";
clk <= CLOCK_50;
reset <= SW(17);	
s_sw <= SW(7 downto 0);
s_key <= KEY;
LEDR(7 downto 0) <= s_ledr;
HEX0 <= not s_hex0;


x1 : aula2910_qsys port map(clk, reset, s_sw, s_key, s_ledr, s_hex0);

end architecture c_aula2910;