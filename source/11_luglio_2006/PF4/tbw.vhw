-- C:\USERS\ROBERTO\DESKTOP\PF4
-- VHDL Test Bench created by
-- HDL Bencher 6.1i
-- Wed Aug 28 01:07:31 2013
-- 
-- Notes:
-- 1) This testbench has been automatically generated from
--   your Test Bench Waveform
-- 2) To use this as a user modifiable testbench do the following:
--   - Save it as a file with a .vhd extension (i.e. File->Save As...)
--   - Add it to your project as a testbench source (i.e. Project->Add Source...)
-- 

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY tbw IS
END tbw;

ARCHITECTURE testbench_arch OF tbw IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT pf4
		PORT (
			CLK : In  std_logic;
			RST : In  std_logic;
			sel : In  std_logic_vector (1 DOWNTO 0);
			A : In  std_logic_vector (3 DOWNTO 0);
			B : In  std_logic_vector (3 DOWNTO 0);
			out1 : Out  std_logic;
			out2 : Out  std_logic
		);
	END COMPONENT;

	SIGNAL CLK : std_logic;
	SIGNAL RST : std_logic;
	SIGNAL sel : std_logic_vector (1 DOWNTO 0);
	SIGNAL A : std_logic_vector (3 DOWNTO 0);
	SIGNAL B : std_logic_vector (3 DOWNTO 0);
	SIGNAL out1 : std_logic;
	SIGNAL out2 : std_logic;

BEGIN
	UUT : pf4
	PORT MAP (
		CLK => CLK,
		RST => RST,
		sel => sel,
		A => A,
		B => B,
		out1 => out1,
		out2 => out2
	);

	PROCESS -- clock process for CLK,
	BEGIN
		CLOCK_LOOP : LOOP
		CLK <= transport '0';
		WAIT FOR 10 ns;
		CLK <= transport '1';
		WAIT FOR 10 ns;
		WAIT FOR 40 ns;
		CLK <= transport '0';
		WAIT FOR 40 ns;
		END LOOP CLOCK_LOOP;
	END PROCESS;

	PROCESS   -- Process for CLK
		VARIABLE TX_OUT : LINE;
		VARIABLE TX_ERROR : INTEGER := 0;

		PROCEDURE CHECK_out1(
			next_out1 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (out1 /= next_out1) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns out1="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, out1);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_out1);
				STD.TEXTIO.write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				STD.TEXTIO.writeline(results, TX_LOC);
				STD.TEXTIO.Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_out2(
			next_out2 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (out2 /= next_out2) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns out2="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, out2);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_out2);
				STD.TEXTIO.write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				STD.TEXTIO.writeline(results, TX_LOC);
				STD.TEXTIO.Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		BEGIN
		-- --------------------
		RST <= transport '1';
		sel <= transport std_logic_vector'("11"); --3
		A <= transport std_logic_vector'("0000"); --0
		B <= transport std_logic_vector'("1110"); --E
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		RST <= transport '0';
		sel <= transport std_logic_vector'("01"); --1
		A <= transport std_logic_vector'("1110"); --E
		B <= transport std_logic_vector'("0110"); --6
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		sel <= transport std_logic_vector'("11"); --3
		A <= transport std_logic_vector'("0010"); --2
		B <= transport std_logic_vector'("1000"); --8
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		sel <= transport std_logic_vector'("01"); --1
		A <= transport std_logic_vector'("0101"); --5
		B <= transport std_logic_vector'("1101"); --D
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		A <= transport std_logic_vector'("1101"); --D
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		sel <= transport std_logic_vector'("00"); --0
		A <= transport std_logic_vector'("1111"); --F
		B <= transport std_logic_vector'("0001"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		sel <= transport std_logic_vector'("11"); --3
		A <= transport std_logic_vector'("0000"); --0
		B <= transport std_logic_vector'("0011"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		sel <= transport std_logic_vector'("10"); --2
		A <= transport std_logic_vector'("0100"); --4
		B <= transport std_logic_vector'("1100"); --C
		-- --------------------
		WAIT FOR 100 ns; -- Time=800 ns
		sel <= transport std_logic_vector'("11"); --3
		A <= transport std_logic_vector'("1100"); --C
		B <= transport std_logic_vector'("1100"); --C
		-- --------------------
		WAIT FOR 100 ns; -- Time=900 ns
		A <= transport std_logic_vector'("0000"); --0
		B <= transport std_logic_vector'("0100"); --4
		-- --------------------
		WAIT FOR 100 ns; -- Time=1000 ns
		RST <= transport '1';
		sel <= transport std_logic_vector'("10"); --2
		B <= transport std_logic_vector'("0011"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=1100 ns
		RST <= transport '0';
		A <= transport std_logic_vector'("1101"); --D
		B <= transport std_logic_vector'("1101"); --D
		-- --------------------
		WAIT FOR 100 ns; -- Time=1200 ns
		sel <= transport std_logic_vector'("00"); --0
		A <= transport std_logic_vector'("1001"); --9
		B <= transport std_logic_vector'("0111"); --7
		-- --------------------
		WAIT FOR 100 ns; -- Time=1300 ns
		sel <= transport std_logic_vector'("01"); --1
		A <= transport std_logic_vector'("0101"); --5
		-- --------------------
		WAIT FOR 100 ns; -- Time=1400 ns
		A <= transport std_logic_vector'("0001"); --1
		B <= transport std_logic_vector'("0000"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=1500 ns
		RST <= transport '0';
		sel <= transport std_logic_vector'("10"); --2
		A <= transport std_logic_vector'("1111"); --F
		B <= transport std_logic_vector'("1001"); --9
		-- --------------------
		WAIT FOR 100 ns; -- Time=1600 ns
		sel <= transport std_logic_vector'("00"); --0
		B <= transport std_logic_vector'("0101"); --5
		-- --------------------
		WAIT FOR 100 ns; -- Time=1700 ns
		sel <= transport std_logic_vector'("10"); --2
		A <= transport std_logic_vector'("0011"); --3
		B <= transport std_logic_vector'("1011"); --B
		-- --------------------
		WAIT FOR 100 ns; -- Time=1800 ns
		RST <= transport '1';
		sel <= transport std_logic_vector'("11"); --3
		A <= transport std_logic_vector'("1100"); --C
		B <= transport std_logic_vector'("1111"); --F
		-- --------------------
		WAIT FOR 100 ns; -- Time=1900 ns
		RST <= transport '0';
		sel <= transport std_logic_vector'("00"); --0
		A <= transport std_logic_vector'("1010"); --A
		B <= transport std_logic_vector'("0110"); --6
		-- --------------------
		WAIT FOR 100 ns; -- Time=2000 ns
		A <= transport std_logic_vector'("1111"); --F
		B <= transport std_logic_vector'("0101"); --5
		-- --------------------
		WAIT FOR 100 ns; -- Time=2100 ns
		RST <= transport '0';
		sel <= transport std_logic_vector'("10"); --2
		A <= transport std_logic_vector'("1011"); --B
		B <= transport std_logic_vector'("0010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=2200 ns
		sel <= transport std_logic_vector'("00"); --0
		A <= transport std_logic_vector'("0000"); --0
		B <= transport std_logic_vector'("0000"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=2300 ns
		RST <= transport '1';
		sel <= transport std_logic_vector'("11"); --3
		A <= transport std_logic_vector'("1110"); --E
		B <= transport std_logic_vector'("0110"); --6
		-- --------------------
		WAIT FOR 100 ns; -- Time=2400 ns
		RST <= transport '0';
		sel <= transport std_logic_vector'("11"); --3
		A <= transport std_logic_vector'("0111"); --7
		B <= transport std_logic_vector'("1000"); --8
		-- --------------------
		WAIT FOR 100 ns; -- Time=2500 ns
		sel <= transport std_logic_vector'("11"); --3
		A <= transport std_logic_vector'("1100"); --C
		B <= transport std_logic_vector'("1010"); --A
		-- --------------------
		WAIT FOR 100 ns; -- Time=2600 ns
		sel <= transport std_logic_vector'("10"); --2
		A <= transport std_logic_vector'("1010"); --A
		B <= transport std_logic_vector'("0010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=2700 ns
		sel <= transport std_logic_vector'("01"); --1
		A <= transport std_logic_vector'("1110"); --E
		B <= transport std_logic_vector'("1110"); --E
		-- --------------------
		WAIT FOR 100 ns; -- Time=2800 ns
		sel <= transport std_logic_vector'("00"); --0
		A <= transport std_logic_vector'("1010"); --A
		B <= transport std_logic_vector'("1101"); --D
		-- --------------------
		WAIT FOR 100 ns; -- Time=2900 ns
		sel <= transport std_logic_vector'("01"); --1
		A <= transport std_logic_vector'("1101"); --D
		B <= transport std_logic_vector'("0010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=3000 ns
		sel <= transport std_logic_vector'("00"); --0
		A <= transport std_logic_vector'("0100"); --4
		B <= transport std_logic_vector'("1100"); --C
		-- --------------------
		WAIT FOR 100 ns; -- Time=3100 ns
		sel <= transport std_logic_vector'("11"); --3
		A <= transport std_logic_vector'("1010"); --A
		B <= transport std_logic_vector'("1101"); --D
		-- --------------------
		WAIT FOR 100 ns; -- Time=3200 ns
		sel <= transport std_logic_vector'("01"); --1
		A <= transport std_logic_vector'("1110"); --E
		B <= transport std_logic_vector'("1000"); --8
		-- --------------------
		WAIT FOR 100 ns; -- Time=3300 ns
		sel <= transport std_logic_vector'("10"); --2
		A <= transport std_logic_vector'("1000"); --8
		B <= transport std_logic_vector'("0000"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=3400 ns
		A <= transport std_logic_vector'("1100"); --C
		B <= transport std_logic_vector'("1001"); --9
		-- --------------------
		WAIT FOR 100 ns; -- Time=3500 ns
		sel <= transport std_logic_vector'("11"); --3
		A <= transport std_logic_vector'("0101"); --5
		B <= transport std_logic_vector'("1110"); --E
		-- --------------------
		WAIT FOR 100 ns; -- Time=3600 ns
		sel <= transport std_logic_vector'("10"); --2
		A <= transport std_logic_vector'("1110"); --E
		B <= transport std_logic_vector'("1100"); --C
		-- --------------------
		WAIT FOR 100 ns; -- Time=3700 ns
		sel <= transport std_logic_vector'("11"); --3
		B <= transport std_logic_vector'("0001"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=3800 ns
		sel <= transport std_logic_vector'("00"); --0
		A <= transport std_logic_vector'("1111"); --F
		B <= transport std_logic_vector'("1001"); --9
		-- --------------------
		WAIT FOR 100 ns; -- Time=3900 ns
		sel <= transport std_logic_vector'("10"); --2
		A <= transport std_logic_vector'("1010"); --A
		B <= transport std_logic_vector'("0010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=4000 ns
		A <= transport std_logic_vector'("1001"); --9
		-- --------------------
		WAIT FOR 20 ns; -- Time=4020 ns
		-- --------------------

		IF (TX_ERROR = 0) THEN 
			STD.TEXTIO.write(TX_OUT,string'("No errors or warnings"));
			STD.TEXTIO.writeline(results, TX_OUT);
			ASSERT (FALSE) REPORT
				"Simulation successful (not a failure).  No problems detected. "
				SEVERITY FAILURE;
		ELSE
			STD.TEXTIO.write(TX_OUT, TX_ERROR);
			STD.TEXTIO.write(TX_OUT, string'(
				" errors found in simulation"));
			STD.TEXTIO.writeline(results, TX_OUT);
			ASSERT (FALSE) REPORT
				"Errors found during simulation"
				SEVERITY FAILURE;
		END IF;
	END PROCESS;
END testbench_arch;

CONFIGURATION pf4_cfg OF tbw IS
	FOR testbench_arch
	END FOR;
END pf4_cfg;
