LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY controler IS
    PORT (
          CLK: IN STD_LOGIC;	
          RST: IN STD_LOGIC;
          IDR: IN STD_LOGIC_VECTOR(4 DOWNTO 0);   -- current micro address
          IRD: IN STD_LOGIC_VECTOR(7 DOWNTO 4);   -- current instruction
          ODR : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)  -- output next micro address
    );
END controler;
ARCHITECTURE behav OF controler IS
    SIGNAL M:STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN
	PROCESS(RST,CLK,IDR,IRD)
	BEGIN
		IF RST='1' THEN
			 M<="00001";
		ELSE
			IF CLK'event and CLK='1' THEN
				IF IDR="00011" THEN  -- current micro address
					IF IRD = "0000" THEN M<="00011"; END IF;    -- M: next micro address
					IF IRD = "0001" THEN M<="00100"; END IF;
					IF IRD = "0010" THEN M<="00110"; END IF;
					IF IRD = "0011" THEN M<="01000"; END IF;
					IF IRD = "0100" THEN M<="01011"; END IF;
					IF IRD = "0101" THEN M<="01110"; END IF;
					IF IRD = "0110" THEN M<="10001"; END IF;
					IF IRD = "0111" THEN M<="10011"; END IF;
					IF IRD = "1000" THEN M<="10101"; END IF;
					IF IRD = "1001" THEN M<="10110"; END IF;
				ELSE 
					M<=IDR;
				END IF;
			END IF;
		END IF;
	ODR<=M;
	END PROCESS;
END behav;
