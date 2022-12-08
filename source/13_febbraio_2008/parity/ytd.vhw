-- C:\USERS\ROBERTO\DESKTOP\PARITY
-- VHDL Test Bench created by
-- HDL Bencher 6.1i
-- Sat Aug 31 22:45:59 2013
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

ENTITY ytd IS
END ytd;

ARCHITECTURE testbench_arch OF ytd IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT parity
		PORT (
			CLK : In  std_logic;
			RST : In  std_logic;
			EN : In  std_logic;
			sel : In  std_logic;
			Din : In  std_logic_vector (1 DOWNTO 0);
			P0e : Out  std_logic;
			P0o : Out  std_logic;
			P1e : Out  std_logic;
			P1o : Out  std_logic
		);
	END COMPONENT;

	SIGNAL CLK : std_logic;
	SIGNAL RST : std_logic;
	SIGNAL EN : std_logic;
	SIGNAL sel : std_logic;
	SIGNAL Din : std_logic_vector (1 DOWNTO 0);
	SIGNAL P0e : std_logic;
	SIGNAL P0o : std_logic;
	SIGNAL P1e : std_logic;
	SIGNAL P1o : std_logic;

BEGIN
	UUT : parity
	PORT MAP (
		CLK => CLK,
		RST => RST,
		EN => EN,
		sel => sel,
		Din => Din,
		P0e => P0e,
		P0o => P0o,
		P1e => P1e,
		P1o => P1o
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

		PROCEDURE CHECK_P0e(
			next_P0e : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (P0e /= next_P0e) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns P0e="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, P0e);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_P0e);
				STD.TEXTIO.write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				STD.TEXTIO.writeline(results, TX_LOC);
				STD.TEXTIO.Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_P0o(
			next_P0o : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (P0o /= next_P0o) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns P0o="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, P0o);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_P0o);
				STD.TEXTIO.write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				STD.TEXTIO.writeline(results, TX_LOC);
				STD.TEXTIO.Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_P1e(
			next_P1e : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (P1e /= next_P1e) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns P1e="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, P1e);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_P1e);
				STD.TEXTIO.write(TX_LOC, string'(" "));
				TX_STR(TX_LOC.all'range) := TX_LOC.all;
				STD.TEXTIO.writeline(results, TX_LOC);
				STD.TEXTIO.Deallocate(TX_LOC);
				ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
				TX_ERROR := TX_ERROR + 1;
			END IF;
		END;

		PROCEDURE CHECK_P1o(
			next_P1o : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (P1o /= next_P1o) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns P1o="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, P1o);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_P1o);
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
		sel <= transport '0';
		Din <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		RST <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		EN <= transport '1';
		Din <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		sel <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		sel <= transport '1';
		Din <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		Din <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		sel <= transport '0';
		Din <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		Din <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=800 ns
		sel <= transport '1';
		Din <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 200 ns; -- Time=1000 ns
		Din <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=1100 ns
		sel <= transport '0';
		Din <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=1200 ns
		Din <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=1300 ns
		sel <= transport '1';
		Din <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=1400 ns
		EN <= transport '1';
		sel <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1500 ns
		Din <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 200 ns; -- Time=1700 ns
		EN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1800 ns
		Din <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=1900 ns
		Din <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=2000 ns
		Din <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=2100 ns
		RST <= transport '1';
		Din <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=2200 ns
		Din <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=2300 ns
		Din <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 200 ns; -- Time=2500 ns
		Din <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=2600 ns
		Din <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=2700 ns
		Din <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=2800 ns
		Din <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=2900 ns
		Din <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=3000 ns
		Din <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=3100 ns
		Din <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=3200 ns
		Din <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 200 ns; -- Time=3400 ns
		Din <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=3500 ns
		Din <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=3600 ns
		Din <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 200 ns; -- Time=3800 ns
		Din <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=3900 ns
		Din <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=4000 ns
		Din <= transport std_logic_vector'("10"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=4100 ns
		Din <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 200 ns; -- Time=4300 ns
		Din <= transport std_logic_vector'("11"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=4400 ns
		Din <= transport std_logic_vector'("00"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=4500 ns
		Din <= transport std_logic_vector'("01"); --1
		-- --------------------
		WAIT FOR 20 ns; -- Time=4520 ns
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

CONFIGURATION parity_cfg OF ytd IS
	FOR testbench_arch
	END FOR;
END parity_cfg;
