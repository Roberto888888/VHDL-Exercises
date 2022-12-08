-- C:\USERS\ASUS\DESKTOP\STEPTOSTEP
-- VHDL Test Bench created by
-- HDL Bencher 6.1i
-- Tue Nov 18 14:09:53 2014
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

ENTITY test_ss IS
END test_ss;

ARCHITECTURE testbench_arch OF test_ss IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT steptostep
		PORT (
			CLK : In  std_logic;
			EN : In  std_logic;
			DIN : In  std_logic_vector (1 DOWNTO 0);
			POR : Out  std_logic;
			PANT : Out  std_logic;
			POR10 : Out  std_logic;
			PANT10 : Out  std_logic
		);
	END COMPONENT;

	SIGNAL CLK : std_logic;
	SIGNAL EN : std_logic;
	SIGNAL DIN : std_logic_vector (1 DOWNTO 0);
	SIGNAL POR : std_logic;
	SIGNAL PANT : std_logic;
	SIGNAL POR10 : std_logic;
	SIGNAL PANT10 : std_logic;

BEGIN
	UUT : steptostep
	PORT MAP (
		CLK => CLK,
		EN => EN,
		DIN => DIN,
		POR => POR,
		PANT => PANT,
		POR10 => POR10,
		PANT10 => PANT10
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

		PROCEDURE CHECK_POR(
			next_POR : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (POR /= next_POR) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns POR="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, POR);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_POR);
				STD.TEXTIO.write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				STD.TEXTIO.writeline(results, TX_LOC);
				STD.TEXTIO.Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_PANT(
			next_PANT : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (PANT /= next_PANT) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns PANT="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, PANT);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_PANT);
				STD.TEXTIO.write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				STD.TEXTIO.writeline(results, TX_LOC);
				STD.TEXTIO.Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_POR10(
			next_POR10 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (POR10 /= next_POR10) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns POR10="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, POR10);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_POR10);
				STD.TEXTIO.write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				STD.TEXTIO.writeline(results, TX_LOC);
				STD.TEXTIO.Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_PANT10(
			next_PANT10 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (PANT10 /= next_PANT10) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns PANT10="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, PANT10);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_PANT10);
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
		EN <= transport '0';
		DIN <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		DIN <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		EN <= transport '1';
		DIN <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		DIN <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		DIN <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		DIN <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		DIN <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		DIN <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=800 ns
		DIN <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=900 ns
		DIN <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=1000 ns
		DIN <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=1100 ns
		DIN <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=1200 ns
		DIN <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=1300 ns
		DIN <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=1400 ns
		DIN <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=1500 ns
		DIN <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=1600 ns
		DIN <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=1700 ns
		DIN <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=1800 ns
		DIN <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=1900 ns
		DIN <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=2000 ns
		DIN <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=2100 ns
		DIN <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=2200 ns
		DIN <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=2300 ns
		DIN <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=2400 ns
		DIN <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=2500 ns
		DIN <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=2600 ns
		DIN <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=2700 ns
		DIN <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=2800 ns
		DIN <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=2900 ns
		DIN <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=3000 ns
		DIN <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=3100 ns
		DIN <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=3200 ns
		DIN <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=3300 ns
		DIN <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=3400 ns
		DIN <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=3500 ns
		DIN <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=3600 ns
		DIN <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=3700 ns
		DIN <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=3800 ns
		DIN <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=3900 ns
		DIN <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=4000 ns
		DIN <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=4100 ns
		DIN <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=4200 ns
		DIN <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=4300 ns
		DIN <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 420 ns; -- Time=4720 ns
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

CONFIGURATION steptostep_cfg OF test_ss IS
	FOR testbench_arch
	END FOR;
END steptostep_cfg;
