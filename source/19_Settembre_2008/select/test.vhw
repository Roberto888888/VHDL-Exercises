-- C:\USERS\ROBERTO\DESKTOP\SELECT
-- VHDL Test Bench created by
-- HDL Bencher 6.1i
-- Sun Sep 08 18:56:49 2013
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

ENTITY test IS
END test;

ARCHITECTURE testbench_arch OF test IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT selection
		PORT (
			CLK : In  std_logic;
			RST : In  std_logic;
			EN : In  std_logic;
			DIN : In  std_logic;
			ROT : In  std_logic;
			SEL : In  std_logic_vector (1 DOWNTO 0);
			OUT1 : Out  std_logic;
			OUT2 : Out  std_logic;
			OUT3 : Out  std_logic
		);
	END COMPONENT;

	SIGNAL CLK : std_logic;
	SIGNAL RST : std_logic;
	SIGNAL EN : std_logic;
	SIGNAL DIN : std_logic;
	SIGNAL ROT : std_logic;
	SIGNAL SEL : std_logic_vector (1 DOWNTO 0);
	SIGNAL OUT1 : std_logic;
	SIGNAL OUT2 : std_logic;
	SIGNAL OUT3 : std_logic;

BEGIN
	UUT : selection
	PORT MAP (
		CLK => CLK,
		RST => RST,
		EN => EN,
		DIN => DIN,
		ROT => ROT,
		SEL => SEL,
		OUT1 => OUT1,
		OUT2 => OUT2,
		OUT3 => OUT3
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

		PROCEDURE CHECK_OUT1(
			next_OUT1 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (OUT1 /= next_OUT1) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns OUT1="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, OUT1);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_OUT1);
				STD.TEXTIO.write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				STD.TEXTIO.writeline(results, TX_LOC);
				STD.TEXTIO.Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_OUT2(
			next_OUT2 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (OUT2 /= next_OUT2) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns OUT2="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, OUT2);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_OUT2);
				STD.TEXTIO.write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				STD.TEXTIO.writeline(results, TX_LOC);
				STD.TEXTIO.Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_OUT3(
			next_OUT3 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (OUT3 /= next_OUT3) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns OUT3="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, OUT3);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_OUT3);
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
		EN <= transport '0';
		DIN <= transport '0';
		ROT <= transport '0';
		SEL <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		RST <= transport '0';
		DIN <= transport '1';
		SEL <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		DIN <= transport '0';
		SEL <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		DIN <= transport '1';
		SEL <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		DIN <= transport '0';
		ROT <= transport '1';
		SEL <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		ROT <= transport '0';
		SEL <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		DIN <= transport '1';
		SEL <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		EN <= transport '1';
		SEL <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=800 ns
		ROT <= transport '0';
		SEL <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=900 ns
		DIN <= transport '0';
		SEL <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=1000 ns
		DIN <= transport '1';
		ROT <= transport '1';
		SEL <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=1100 ns
		ROT <= transport '0';
		SEL <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=1200 ns
		RST <= transport '0';
		SEL <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=1300 ns
		DIN <= transport '0';
		ROT <= transport '1';
		SEL <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=1400 ns
		ROT <= transport '0';
		SEL <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=1500 ns
		RST <= transport '1';
		DIN <= transport '1';
		ROT <= transport '0';
		SEL <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=1600 ns
		RST <= transport '0';
		SEL <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 200 ns; -- Time=1800 ns
		DIN <= transport '0';
		SEL <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=1900 ns
		DIN <= transport '1';
		SEL <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=2000 ns
		DIN <= transport '0';
		SEL <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 300 ns; -- Time=2300 ns
		SEL <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=2400 ns
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=2500 ns
		SEL <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 20 ns; -- Time=2520 ns
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

CONFIGURATION selection_cfg OF test IS
	FOR testbench_arch
	END FOR;
END selection_cfg;
