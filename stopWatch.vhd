library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity stopWatch is
 Port ( buttonbus : in STD_LOGIC_VECTOR (3 downto 0);--vetor button, utilizat pentru a primi informatii despre starea digits
 CLK : in STD_LOGIC;
 anode : out STD_LOGIC_VECTOR (3 downto 0);
 --anode este semnalul care selecteaza cifra afisata pe care se vor ilumina segmentele 
 cathode : out STD_LOGIC_VECTOR (7 downto 0));
 --cathode este semnalul care selecteaza segmentele 
end stopWatch;
architecture Behavioral of stopWatch is
-----------------------------------------------------------------
 component clockDivider port (CLK : in STD_LOGIC;
 refreshClock, clockDig1 : out STD_LOGIC);
 end component;
 signal refreshSig, dig1Sig : STD_LOGIC;
 ------------------------------------------------------------------
 component display port (refreshClock, clockDig1 : in STD_LOGIC;
 buttonbus : in STD_LOGIC_VECTOR(3 downto 0);
 cathode : out STD_LOGIC_VECTOR(7 downto 0);
 anode : out STD_LOGIC_VECTOR(3 downto 0));
 end component;
begin
 part0 : clockDivider port map (CLK => CLK, refreshClock => refreshSig, clockDig1 => dig1Sig);
 part1 : display port map (refreshClock => refreshSig, clockDig1 => dig1Sig, buttonbus => buttonbus, cathode => cathode, anode => anode);
end Behavioral;