-- C:\USERS\ASUS\DESKTOP\P_TO_S
-- VHDL Test Bench created by
-- HDL Bencher 6.1i
-- Wed Nov 19 12:36:08 2014
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
	COMPONENT p_to_s
		PORT (
			CLK : In  std_logic;
			EN : In  std_logic;
			DIN : In  std_logic_vector (3 DOWNTO 0);
			SEL : In  std_logic_vector (1 DOWNTO 0);
			DOUT : Out  std_logic;
			PULSE : Out  std_logic
		);
	END COMPONENT;

	SIGNAL CLK : std_logic;
	SIGNAL EN : std_logic;
	SIGNAL DIN : std_logic_vector (3 DOWNTO 0);
	SIGNAL SEL : std_logic_vector (1 DOWNTO 0);
	SIGNAL DOUT : std_logic;
	SIGNAL PULSE : std_logic;

BEGIN
	UUT : p_to_s
	PORT MAP (
		CLK => CLK,
		EN => EN,
		DIN => DIN,
		SEL => SEL,
		DOUT => DOUT,
		PULSE => PULSE
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

		PROCEDURE CHECK_PULSE(
			next_PULSE : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (PULSE /= next_PULSE) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns PULSE="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, PULSE);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_PULSE);
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
		DIN <= transport std_logic_vector'("0000"); --0
		SEL <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		DIN <= transport std_logic_vector'("0101"); --5
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		DIN <= transport std_logic_vector'("1000"); --8
		SEL <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		DIN <= transport std_logic_vector'("0101"); --5
		SEL <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		DIN <= transport std_logic_vector'("1100"); --C
		SEL <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		EN <= transport '1';
		DIN <= transport std_logic_vector'("0000"); --0
		SEL <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		SEL <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		DIN <= transport std_logic_vector'("1110"); --E
		SEL <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=800 ns
		DIN <= transport std_logic_vector'("1011"); --B
		SEL <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=900 ns
		DIN <= transport std_logic_vector'("0100"); --4
		SEL <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=1000 ns
		DIN <= transport std_logic_vector'("1100"); --C
		-- --------------------
		WAIT FOR 100 ns; -- Time=1100 ns
		DIN <= transport std_logic_vector'("1000"); --8
		-- --------------------
		WAIT FOR 100 ns; -- Time=1200 ns
		DIN <= transport std_logic_vector'("1100"); --C
		SEL <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=1300 ns
		DIN <= transport std_logic_vector'("1110"); --E
		-- --------------------
		WAIT FOR 100 ns; -- Time=1400 ns
		DIN <= transport std_logic_vector'("0010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=1500 ns
		DIN <= transport std_logic_vector'("1101"); --D
		-- --------------------
		WAIT FOR 100 ns; -- Time=1600 ns
		DIN <= transport std_logic_vector'("0101"); --5
		-- --------------------
		WAIT FOR 20 ns; -- Time=1620 ns
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

CONFIGURATION p_to_s_cfg OF test IS
	FOR testbench_arch
	END FOR;
END p_to_s_cfg;
