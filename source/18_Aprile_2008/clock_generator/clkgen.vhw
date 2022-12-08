-- C:\USERS\ROBERTO\DESKTOP\CLOCK_GENERATOR
-- VHDL Test Bench created by
-- HDL Bencher 6.1i
-- Sun Sep 01 23:46:05 2013
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

ENTITY clkgen IS
END clkgen;

ARCHITECTURE testbench_arch OF clkgen IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT clk_generator
		PORT (
			CLK : In  std_logic;
			EN : In  std_logic;
			RST : In  std_logic;
			DIN : In  std_logic;
			CAPTURE : In  std_logic_vector (3 DOWNTO 0);
			OUT_CLK : Out  std_logic
		);
	END COMPONENT;

	SIGNAL CLK : std_logic;
	SIGNAL EN : std_logic;
	SIGNAL RST : std_logic;
	SIGNAL DIN : std_logic;
	SIGNAL CAPTURE : std_logic_vector (3 DOWNTO 0);
	SIGNAL OUT_CLK : std_logic;

BEGIN
	UUT : clk_generator
	PORT MAP (
		CLK => CLK,
		EN => EN,
		RST => RST,
		DIN => DIN,
		CAPTURE => CAPTURE,
		OUT_CLK => OUT_CLK
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

		PROCEDURE CHECK_OUT_CLK(
			next_OUT_CLK : std_logic;
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (OUT_CLK /= next_OUT_CLK) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns OUT_CLK="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, OUT_CLK);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_OUT_CLK);
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
		RST <= transport '1';
		DIN <= transport '1';
		CAPTURE <= transport std_logic_vector'("0000"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		EN <= transport '1';
		RST <= transport '0';
		DIN <= transport '0';
		CAPTURE <= transport std_logic_vector'("1000"); --8
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		EN <= transport '1';
		DIN <= transport '1';
		CAPTURE <= transport std_logic_vector'("0010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=300 ns
		CAPTURE <= transport std_logic_vector'("0100"); --4
		-- --------------------
		WAIT FOR 100 ns; -- Time=400 ns
		DIN <= transport '0';
		CAPTURE <= transport std_logic_vector'("0000"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		CAPTURE <= transport std_logic_vector'("0001"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		DIN <= transport '1';
		CAPTURE <= transport std_logic_vector'("0111"); --7
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		DIN <= transport '0';
		CAPTURE <= transport std_logic_vector'("1111"); --F
		-- --------------------
		WAIT FOR 100 ns; -- Time=800 ns
		CAPTURE <= transport std_logic_vector'("1101"); --D
		-- --------------------
		WAIT FOR 100 ns; -- Time=900 ns
		DIN <= transport '1';
		CAPTURE <= transport std_logic_vector'("0001"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=1000 ns
		CAPTURE <= transport std_logic_vector'("1101"); --D
		-- --------------------
		WAIT FOR 100 ns; -- Time=1100 ns
		DIN <= transport '0';
		CAPTURE <= transport std_logic_vector'("0001"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=1200 ns
		DIN <= transport '1';
		CAPTURE <= transport std_logic_vector'("1110"); --E
		-- --------------------
		WAIT FOR 100 ns; -- Time=1300 ns
		CAPTURE <= transport std_logic_vector'("0110"); --6
		-- --------------------
		WAIT FOR 100 ns; -- Time=1400 ns
		DIN <= transport '0';
		CAPTURE <= transport std_logic_vector'("1000"); --8
		-- --------------------
		WAIT FOR 100 ns; -- Time=1500 ns
		DIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=1600 ns
		DIN <= transport '0';
		CAPTURE <= transport std_logic_vector'("0100"); --4
		-- --------------------
		WAIT FOR 100 ns; -- Time=1700 ns
		DIN <= transport '1';
		CAPTURE <= transport std_logic_vector'("1111"); --F
		-- --------------------
		WAIT FOR 100 ns; -- Time=1800 ns
		CAPTURE <= transport std_logic_vector'("1001"); --9
		-- --------------------
		WAIT FOR 100 ns; -- Time=1900 ns
		DIN <= transport '0';
		CAPTURE <= transport std_logic_vector'("0100"); --4
		-- --------------------
		WAIT FOR 100 ns; -- Time=2000 ns
		DIN <= transport '1';
		CAPTURE <= transport std_logic_vector'("0000"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=2100 ns
		CAPTURE <= transport std_logic_vector'("1110"); --E
		-- --------------------
		WAIT FOR 100 ns; -- Time=2200 ns
		EN <= transport '1';
		DIN <= transport '0';
		CAPTURE <= transport std_logic_vector'("1111"); --F
		-- --------------------
		WAIT FOR 100 ns; -- Time=2300 ns
		DIN <= transport '1';
		CAPTURE <= transport std_logic_vector'("0101"); --5
		-- --------------------
		WAIT FOR 100 ns; -- Time=2400 ns
		DIN <= transport '0';
		CAPTURE <= transport std_logic_vector'("0000"); --0
		-- --------------------
		WAIT FOR 100 ns; -- Time=2500 ns
		CAPTURE <= transport std_logic_vector'("0010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=2600 ns
		DIN <= transport '1';
		CAPTURE <= transport std_logic_vector'("1011"); --B
		-- --------------------
		WAIT FOR 100 ns; -- Time=2700 ns
		DIN <= transport '0';
		CAPTURE <= transport std_logic_vector'("1100"); --C
		-- --------------------
		WAIT FOR 100 ns; -- Time=2800 ns
		CAPTURE <= transport std_logic_vector'("0110"); --6
		-- --------------------
		WAIT FOR 100 ns; -- Time=2900 ns
		CAPTURE <= transport std_logic_vector'("1011"); --B
		-- --------------------
		WAIT FOR 200 ns; -- Time=3100 ns
		CAPTURE <= transport std_logic_vector'("1000"); --8
		-- --------------------
		WAIT FOR 100 ns; -- Time=3200 ns
		CAPTURE <= transport std_logic_vector'("0001"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=3300 ns
		CAPTURE <= transport std_logic_vector'("1001"); --9
		-- --------------------
		WAIT FOR 100 ns; -- Time=3400 ns
		CAPTURE <= transport std_logic_vector'("0001"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=3500 ns
		CAPTURE <= transport std_logic_vector'("1001"); --9
		-- --------------------
		WAIT FOR 100 ns; -- Time=3600 ns
		CAPTURE <= transport std_logic_vector'("0010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=3700 ns
		CAPTURE <= transport std_logic_vector'("1101"); --D
		-- --------------------
		WAIT FOR 100 ns; -- Time=3800 ns
		CAPTURE <= transport std_logic_vector'("1100"); --C
		-- --------------------
		WAIT FOR 100 ns; -- Time=3900 ns
		CAPTURE <= transport std_logic_vector'("1111"); --F
		-- --------------------
		WAIT FOR 100 ns; -- Time=4000 ns
		CAPTURE <= transport std_logic_vector'("0111"); --7
		-- --------------------
		WAIT FOR 100 ns; -- Time=4100 ns
		CAPTURE <= transport std_logic_vector'("0110"); --6
		-- --------------------
		WAIT FOR 100 ns; -- Time=4200 ns
		CAPTURE <= transport std_logic_vector'("1100"); --C
		-- --------------------
		WAIT FOR 100 ns; -- Time=4300 ns
		CAPTURE <= transport std_logic_vector'("1011"); --B
		-- --------------------
		WAIT FOR 100 ns; -- Time=4400 ns
		CAPTURE <= transport std_logic_vector'("0010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=4500 ns
		CAPTURE <= transport std_logic_vector'("0100"); --4
		-- --------------------
		WAIT FOR 100 ns; -- Time=4600 ns
		CAPTURE <= transport std_logic_vector'("0010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=4700 ns
		CAPTURE <= transport std_logic_vector'("1100"); --C
		-- --------------------
		WAIT FOR 100 ns; -- Time=4800 ns
		CAPTURE <= transport std_logic_vector'("0011"); --3
		-- --------------------
		WAIT FOR 100 ns; -- Time=4900 ns
		CAPTURE <= transport std_logic_vector'("1000"); --8
		-- --------------------
		WAIT FOR 100 ns; -- Time=5000 ns
		CAPTURE <= transport std_logic_vector'("1101"); --D
		-- --------------------
		WAIT FOR 100 ns; -- Time=5100 ns
		CAPTURE <= transport std_logic_vector'("0010"); --2
		-- --------------------
		WAIT FOR 100 ns; -- Time=5200 ns
		CAPTURE <= transport std_logic_vector'("1000"); --8
		-- --------------------
		WAIT FOR 100 ns; -- Time=5300 ns
		CAPTURE <= transport std_logic_vector'("0001"); --1
		-- --------------------
		WAIT FOR 100 ns; -- Time=5400 ns
		CAPTURE <= transport std_logic_vector'("1101"); --D
		-- --------------------
		WAIT FOR 200 ns; -- Time=5600 ns
		CAPTURE <= transport std_logic_vector'("0011"); --3
		-- --------------------
		WAIT FOR 110 ns; -- Time=5710 ns
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

CONFIGURATION clk_generator_cfg OF clkgen IS
	FOR testbench_arch
	END FOR;
END clk_generator_cfg;
