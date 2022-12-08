-- C:\USERS\ASUS\DESKTOP\ONECOUNTER
-- VHDL Test Bench created by
-- HDL Bencher 6.1i
-- Tue Nov 18 11:30:16 2014
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

ENTITY OC IS
END OC;

ARCHITECTURE testbench_arch OF OC IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT onecounter
		PORT (
			CLK : In  std_logic;
			RST : In  std_logic;
			SDIN : In  std_logic;
			EN : In  std_logic;
			OUTBCD : Out  std_logic
		);
	END COMPONENT;

	SIGNAL CLK : std_logic;
	SIGNAL RST : std_logic;
	SIGNAL SDIN : std_logic;
	SIGNAL EN : std_logic;
	SIGNAL OUTBCD : std_logic;

BEGIN
	UUT : onecounter
	PORT MAP (
		CLK => CLK,
		RST => RST,
		SDIN => SDIN,
		EN => EN,
		OUTBCD => OUTBCD
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

		PROCEDURE CHECK_OUTBCD(
			next_OUTBCD : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (OUTBCD /= next_OUTBCD) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns OUTBCD="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, OUTBCD);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_OUTBCD);
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
		RST <= transport '0';
		SDIN <= transport '1';
		EN <= transport '0';
		-- --------------------
		WAIT FOR 200 ns; -- Time=200 ns
		SDIN <= transport '0';
		EN <= transport '1';
		-- --------------------
		WAIT FOR 200 ns; -- Time=400 ns
		SDIN <= transport '1';
		-- --------------------
		WAIT FOR 200 ns; -- Time=600 ns
		SDIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		SDIN <= transport '1';
		-- --------------------
		WAIT FOR 200 ns; -- Time=900 ns
		SDIN <= transport '0';
		-- --------------------
		WAIT FOR 200 ns; -- Time=1100 ns
		SDIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1200 ns
		SDIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1300 ns
		SDIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1400 ns
		SDIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1500 ns
		SDIN <= transport '1';
		-- --------------------
		WAIT FOR 300 ns; -- Time=1800 ns
		SDIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1900 ns
		SDIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=2000 ns
		SDIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=2100 ns
		SDIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=2200 ns
		SDIN <= transport '0';
		-- --------------------
		WAIT FOR 200 ns; -- Time=2400 ns
		SDIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=2500 ns
		SDIN <= transport '0';
		-- --------------------
		WAIT FOR 200 ns; -- Time=2700 ns
		SDIN <= transport '1';
		-- --------------------
		WAIT FOR 200 ns; -- Time=2900 ns
		SDIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=3000 ns
		SDIN <= transport '1';
		-- --------------------
		WAIT FOR 200 ns; -- Time=3200 ns
		SDIN <= transport '0';
		-- --------------------
		WAIT FOR 300 ns; -- Time=3500 ns
		SDIN <= transport '1';
		-- --------------------
		WAIT FOR 200 ns; -- Time=3700 ns
		SDIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=3800 ns
		SDIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=3900 ns
		SDIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=4000 ns
		SDIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=4100 ns
		SDIN <= transport '0';
		-- --------------------
		WAIT FOR 300 ns; -- Time=4400 ns
		RST <= transport '1';
		-- --------------------
		WAIT FOR 20 ns; -- Time=4420 ns
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

CONFIGURATION onecounter_cfg OF OC IS
	FOR testbench_arch
	END FOR;
END onecounter_cfg;
