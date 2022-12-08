-- C:\USERS\ROBERTO\DESKTOP\DUTY_CYCLE
-- VHDL Test Bench created by
-- HDL Bencher 6.1i
-- Sat Sep 07 21:09:23 2013
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

ENTITY DC IS
END DC;

ARCHITECTURE testbench_arch OF DC IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT duty_cycle
		PORT (
			RST : In  std_logic;
			CLK : In  std_logic;
			DIN : In  std_logic;
			EN : In  std_logic;
			DUTY1 : Out  std_logic;
			DUTY2 : Out  std_logic;
			DUTY4 : Out  std_logic;
			DUTY10 : Out  std_logic
		);
	END COMPONENT;

	SIGNAL RST : std_logic;
	SIGNAL CLK : std_logic;
	SIGNAL DIN : std_logic;
	SIGNAL EN : std_logic;
	SIGNAL DUTY1 : std_logic;
	SIGNAL DUTY2 : std_logic;
	SIGNAL DUTY4 : std_logic;
	SIGNAL DUTY10 : std_logic;

BEGIN
	UUT : duty_cycle
	PORT MAP (
		RST => RST,
		CLK => CLK,
		DIN => DIN,
		EN => EN,
		DUTY1 => DUTY1,
		DUTY2 => DUTY2,
		DUTY4 => DUTY4,
		DUTY10 => DUTY10
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

		PROCEDURE CHECK_DUTY1(
			next_DUTY1 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (DUTY1 /= next_DUTY1) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns DUTY1="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, DUTY1);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_DUTY1);
				STD.TEXTIO.write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				STD.TEXTIO.writeline(results, TX_LOC);
				STD.TEXTIO.Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_DUTY2(
			next_DUTY2 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (DUTY2 /= next_DUTY2) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns DUTY2="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, DUTY2);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_DUTY2);
				STD.TEXTIO.write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				STD.TEXTIO.writeline(results, TX_LOC);
				STD.TEXTIO.Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_DUTY4(
			next_DUTY4 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (DUTY4 /= next_DUTY4) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns DUTY4="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, DUTY4);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_DUTY4);
				STD.TEXTIO.write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				STD.TEXTIO.writeline(results, TX_LOC);
				STD.TEXTIO.Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_DUTY10(
			next_DUTY10 : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (DUTY10 /= next_DUTY10) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns DUTY10="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, DUTY10);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_DUTY10);
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
		DIN <= transport '0';
		EN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		RST <= transport '0';
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 200 ns; -- Time=500 ns
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=800 ns
		RST <= transport '1';
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=900 ns
		RST <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1000 ns
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1100 ns
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1200 ns
		DIN <= transport '1';
		EN <= transport '0';
		-- --------------------
		WAIT FOR 300 ns; -- Time=1500 ns
		DIN <= transport '0';
		EN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1600 ns
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 4520 ns; -- Time=6120 ns
		CHECK_DUTY4('0',6120);
		-- --------------------
		WAIT FOR 5180 ns; -- Time=11300 ns
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

CONFIGURATION duty_cycle_cfg OF DC IS
	FOR testbench_arch
	END FOR;
END duty_cycle_cfg;
