-- C:\USERS\ASUS\DESKTOP\TICTACTOE
-- VHDL Test Bench created by
-- HDL Bencher 6.1i
-- Tue Nov 18 20:28:15 2014
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

ENTITY TTT IS
END TTT;

ARCHITECTURE testbench_arch OF TTT IS
-- If you get a compiler error on the following line,
-- from the menu do Options->Configuration select VHDL 87
FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";
	COMPONENT tictactoe
		PORT (
			CLK : In  std_logic;
			LOAD : In  std_logic;
			STOP : In  std_logic;
			DATAIN : In  std_logic;
			tris_0 : Out  std_logic_vector (3 DOWNTO 0)
		);
	END COMPONENT;

	SIGNAL CLK : std_logic;
	SIGNAL LOAD : std_logic;
	SIGNAL STOP : std_logic;
	SIGNAL DATAIN : std_logic;
	SIGNAL tris_0 : std_logic_vector (3 DOWNTO 0);

BEGIN
	UUT : tictactoe
	PORT MAP (
		CLK => CLK,
		LOAD => LOAD,
		STOP => STOP,
		DATAIN => DATAIN,
		tris_0 => tris_0
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

		PROCEDURE CHECK_tris_0(
			next_tris_0 : std_logic_vector (3 DOWNTO 0);
			TX_TIME : INTEGER
		) IS
			VARIABLE TX_STR : String(1 to 4096);
			VARIABLE TX_LOC : LINE;
		BEGIN
			-- If compiler error ("/=" is ambiguous) occurs in the next line of code
			-- change compiler settings to use explicit declarations only
			IF (tris_0 /= next_tris_0) THEN 
				STD.TEXTIO.write(TX_LOC,string'("Error at time="));
				STD.TEXTIO.write(TX_LOC, TX_TIME);
				STD.TEXTIO.write(TX_LOC,string'("ns tris_0="));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, tris_0);
				STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
				IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_tris_0);
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
		LOAD <= transport '1';
		STOP <= transport '1';
		DATAIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=100 ns
		STOP <= transport '0';
		DATAIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=200 ns
		DATAIN <= transport '0';
		-- --------------------
		WAIT FOR 200 ns; -- Time=400 ns
		DATAIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=500 ns
		DATAIN <= transport '0';
		-- --------------------
		WAIT FOR 100 ns; -- Time=600 ns
		DATAIN <= transport '1';
		-- --------------------
		WAIT FOR 100 ns; -- Time=700 ns
		DATAIN <= transport '0';
		-- --------------------
		WAIT FOR 200 ns; -- Time=900 ns
		DATAIN <= transport '1';
		-- --------------------
		WAIT FOR 4210 ns; -- Time=5110 ns
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

CONFIGURATION tictactoe_cfg OF TTT IS
	FOR testbench_arch
	END FOR;
END tictactoe_cfg;
