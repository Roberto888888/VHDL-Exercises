-- C:\USERS\ROBERTO\DESKTOP\PWM
-- VHDL Test Bench created by
-- HDL Bencher 6.1i
-- Sat Sep 07 01:22:52 2013
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

ENTITY pwmtb IS
END pwmtb;

ARCHITECTURE testbench_arch OF pwmtb IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT pwm
		PORT (
			CLK : In  std_logic;
			RST : In  std_logic;
			EN : In  std_logic;
			DATAIN : In  std_logic_vector (2 DOWNTO 0);
			DUALPWM : Out  std_logic
		);
	END COMPONENT;

	SIGNAL CLK : std_logic;
	SIGNAL RST : std_logic;
	SIGNAL EN : std_logic;
	SIGNAL DATAIN : std_logic_vector (2 DOWNTO 0);
	SIGNAL DUALPWM : std_logic;

BEGIN
	UUT : pwm
	PORT MAP (
		CLK => CLK,
		RST => RST,
		EN => EN,
		DATAIN => DATAIN,
		DUALPWM => DUALPWM
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

		PROCEDURE CHECK_DUALPWM(
			next_DUALPWM : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (DUALPWM /= next_DUALPWM) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns DUALPWM="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, DUALPWM);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_DUALPWM);
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
		EN <= transport '1';
		DATAIN <= transport std_logic_vector'("111"); --7
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		RST <= transport '0';
		DATAIN <= transport std_logic_vector'("101"); --5
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		DATAIN <= transport std_logic_vector'("001"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		DATAIN <= transport std_logic_vector'("101"); --5
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		EN <= transport '0';
		DATAIN <= transport std_logic_vector'("001"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		DATAIN <= transport std_logic_vector'("110"); --6
		-- --------------------
		WAIT FOR 200 ns; -- Time=700 ns
		DATAIN <= transport std_logic_vector'("000"); --0
		-- --------------------
		WAIT FOR 200 ns; -- Time=900 ns
		EN <= transport '1';
		-- --------------------
		WAIT FOR 300 ns; -- Time=1200 ns
		DATAIN <= transport std_logic_vector'("110"); --6
		-- --------------------
		WAIT FOR 100 ns; -- Time=1300 ns
		RST <= transport '1';
		DATAIN <= transport std_logic_vector'("010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=1400 ns
		RST <= transport '0';
		DATAIN <= transport std_logic_vector'("110"); --6
		-- --------------------
		WAIT FOR 100 ns; -- Time=1500 ns
		DATAIN <= transport std_logic_vector'("101"); --5
		-- --------------------
		WAIT FOR 100 ns; -- Time=1600 ns
		DATAIN <= transport std_logic_vector'("011"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=1700 ns
		DATAIN <= transport std_logic_vector'("100"); --4
		-- --------------------
		WAIT FOR 100 ns; -- Time=1800 ns
		DATAIN <= transport std_logic_vector'("101"); --5
		-- --------------------
		WAIT FOR 100 ns; -- Time=1900 ns
		DATAIN <= transport std_logic_vector'("011"); --3
		-- --------------------
		WAIT FOR 200 ns; -- Time=2100 ns
		DATAIN <= transport std_logic_vector'("010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=2200 ns
		DATAIN <= transport std_logic_vector'("101"); --5
		-- --------------------
		WAIT FOR 2020 ns; -- Time=4220 ns
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

CONFIGURATION pwm_cfg OF pwmtb IS
	FOR testbench_arch
	END FOR;
END pwm_cfg;
