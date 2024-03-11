library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity clockDivider is
 Port ( CLK : in STD_LOGIC;
 refreshClock : out STD_LOGIC;
 clockDig1 : out STD_LOGIC);
end clockDivider;
architecture Behavioral of clockDivider is
 signal count1: integer:=0;
 signal count2: integer:=0;
 --contoare pentru a masura numarul de cicluri ale semnalului de ceas.
 signal tmp1 : std_logic:='0';
 signal tmp2 : std_logic:='0';
 -- valorile temporare care vor fi actualizate ?i utilizate pentru generarea semnalelor de ie?ire.
begin
 frequencyDivider : process(CLK)
 begin
 if rising_edge(CLK) then
 --procesul este activat la fiecare front de urcare (rising_edge) al semnalului CLK.
 count1 <= count1+1;
 count2 <= count2+1;
 -- incrementarea contoarelor
 if (count1 = 208334)--50000000/240 
 then
 tmp1 <= NOT tmp1;
 count1 <= 0;
 --au trecut un numar specific de cicluri de ceas si se inverseaza valoarea semnalului tmp1 prin utilizarea operatorului NOT, se reseteaza count1.
 end if;
 if (count2 = 500000) then
 tmp2 <= NOT tmp2;
 count2 <= 0;
 --valoarea lui count2 ajunge la 500000, se inverseaza valoarea semnalului tmp2 si se reseteaza contorul count2.
 end if;
 end if;
 end process;
 refreshClock <= tmp1;
 --Semnalul refreshClock primeste valoarea semnalului tmp1 si este utilizat pentru a actualiza afisajul.
 clockDig1 <= tmp2;
 --Semnalul clockDig1 primeste valoarea semnalului tmp2 si controleaza afisarea cifrei pe afisaj.
end Behavioral;