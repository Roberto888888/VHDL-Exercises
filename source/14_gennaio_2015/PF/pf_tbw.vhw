-- C:\USERS\ASUS\DESKTOP\PF\PF
-- VHDL Test Bench created by
-- HDL Bencher 6.1i
-- Tue Jan 27 02:16:50 2015
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

ENTITY pf_tbw IS
END pf_tbw;

ARCHITECTURE testbench_arch OF pf_tbw IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT pf
		PORT (
			CLK : In  std_logic;
			RST : In  std_logic;
			DIN : In  std_logic;
			DIS : In  std_logic;
			B : Out  std_logic;
			DOUT : Out  std_logic
		);
	END COMPONENT;

	SIGNAL CLK : std_logic;
	SIGNAL RST : std_logic;
	SIGNAL DIN : std_logic;
	SIGNAL DIS : std_logic;
	SIGNAL B : std_logic;
	SIGNAL DOUT : std_logic;

BEGIN
	UUT : pf
	PORT MAP (
		CLK => CLK,
		RST => RST,
		DIN => DIN,
		DIS => DIS,
		B => B,
		DOUT => DOUT
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

		PROCEDURE CHECK_B(
			next_B : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (B /= next_B) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns B="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, B);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_B);
				STD.TEXTIO.write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				STD.TEXTIO.writeline(results, TX_LOC);
				STD.TEXTIO.Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_DOUT(
			next_DOUT : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (DOUT /= next_DOUT) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns DOUT="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, DOUT);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_DOUT);
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
		DIN <= transport '1';
		DIS <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		RST <= transport '1';
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		RST <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 300 ns; -- Time=600 ns
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=800 ns
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=900 ns
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1000 ns
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 200 ns; -- Time=1200 ns
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 200 ns; -- Time=1400 ns
		RST <= transport '1';
		-- --------------------
		WAIT FOR 200 ns; -- Time=1600 ns
		RST <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1700 ns
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1800 ns
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 200 ns; -- Time=2000 ns
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=2100 ns
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 600 ns; -- Time=2700 ns
		RST <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=2800 ns
		RST <= transport '0';
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 200 ns; -- Time=3000 ns
		DIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=3100 ns
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=3200 ns
		DIN <= transport '0';
		DIS <= transport '1';
		-- --------------------
		WAIT FOR 760 ns; -- Time=3960 ns
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

CONFIGURATION pf_cfg OF pf_tbw IS
	FOR testbench_arch
	END FOR;
END pf_cfg;
