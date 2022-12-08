-- C:\USERS\ROBERTO\DESKTOP\CHRONOMETER
-- VHDL Test Bench created by
-- HDL Bencher 6.1i
-- Fri Sep 06 19:54:08 2013
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

ENTITY chr IS
END chr;

ARCHITECTURE testbench_arch OF chr IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT chrono
		PORT (
			CLK : In  std_logic;
			START_STOP : In  std_logic;
			ZERO : In  std_logic;
			TPARZ : In  std_logic;
			SYNC : Out  std_logic;
			OUT_T : Out  std_logic
		);
	END COMPONENT;

	SIGNAL CLK : std_logic;
	SIGNAL START_STOP : std_logic;
	SIGNAL ZERO : std_logic;
	SIGNAL TPARZ : std_logic;
	SIGNAL SYNC : std_logic;
	SIGNAL OUT_T : std_logic;

BEGIN
	UUT : chrono
	PORT MAP (
		CLK => CLK,
		START_STOP => START_STOP,
		ZERO => ZERO,
		TPARZ => TPARZ,
		SYNC => SYNC,
		OUT_T => OUT_T
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

		PROCEDURE CHECK_SYNC(
			next_SYNC : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (SYNC /= next_SYNC) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns SYNC="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, SYNC);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_SYNC);
				STD.TEXTIO.write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				STD.TEXTIO.writeline(results, TX_LOC);
				STD.TEXTIO.Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_OUT_T(
			next_OUT_T : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (OUT_T /= next_OUT_T) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns OUT_T="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, OUT_T);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_OUT_T);
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
		START_STOP <= transport '0';
		ZERO <= transport '0';
		TPARZ <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		START_STOP <= transport '1';
		-- --------------------
		WAIT FOR 400 ns; -- Time=500 ns
		TPARZ <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		TPARZ <= transport '0';
		-- --------------------
		WAIT FOR 300 ns; -- Time=900 ns
		TPARZ <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1000 ns
		ZERO <= transport '0';
		-- --------------------
		WAIT FOR 400 ns; -- Time=1400 ns
		TPARZ <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1500 ns
		TPARZ <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1600 ns
		TPARZ <= transport '0';
		-- --------------------
		WAIT FOR 700 ns; -- Time=2300 ns
		TPARZ <= transport '0';
		-- --------------------
		WAIT FOR 4700 ns; -- Time=7000 ns
		TPARZ <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=7100 ns
		TPARZ <= transport '0';
		-- --------------------
		WAIT FOR 200 ns; -- Time=7300 ns
		ZERO <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=7400 ns
		ZERO <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=7500 ns
		ZERO <= transport '0';
		-- --------------------
		WAIT FOR 4600 ns; -- Time=12100 ns
		START_STOP <= transport '0';
		-- --------------------
		WAIT FOR 5400 ns; -- Time=17500 ns
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

CONFIGURATION chrono_cfg OF chr IS
	FOR testbench_arch
	END FOR;
END chrono_cfg;
