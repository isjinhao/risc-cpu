LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY ALU IS       --ALU
    PORT (
          IQa,IQb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);   
          S: IN STD_LOGIC_VECTOR(2 DOWNTO 0);               
          CQ : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)     );          
END ALU;
ARCHITECTURE behav OF ALU IS
    SIGNAL M,A,B:STD_LOGIC_VECTOR(8 DOWNTO 0);
BEGIN
   PROCESS(IQa,IQb,S)
   BEGIN
   A<='0'&IQa;
   B<='0'&IQb;

       CASE S IS
       WHEN "000" => M<=A AND B;
       WHEN "001" => M<=NOT(A OR B);
       WHEN "010" => M<=A + 1;
       WHEN "011" => M<=A - 1;
       WHEN "100" => M<=A XOR B;
       WHEN "101" => M<=NOT(A XOR B);
       WHEN "110" => M<=A + B;
       WHEN "111" => M<=A - B;
       WHEN OTHERS => M<="000000000";
       END CASE;

    CQ<=M(7 DOWNTO 0);
   END PROCESS;
END behav;
