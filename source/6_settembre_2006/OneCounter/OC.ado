source {C:/Xilinx/data/projnav/scripts/VsimStopServer.tcl}
initIPC 1200
-- Auto Generated by Project Navigator to simulate
-- HDL Bencher Annotated Test Bench
--
vlib work
onbreak {resume}
onerror {quit -code 99 -force}
onElabError {resume}
vcom -93 -explicit  onecounter.vhd
vcom -93 -explicit  OC.ant
vsim -t 1ps  -lib work OC
run -all
quit -force
