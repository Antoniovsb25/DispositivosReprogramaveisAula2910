# Legal Notice: (C)2020 Altera Corporation. All rights reserved.  Your
# use of Altera Corporation's design tools, logic functions and other
# software and tools, and its AMPP partner logic functions, and any
# output files any of the foregoing (including device programming or
# simulation files), and any associated documentation or information are
# expressly subject to the terms and conditions of the Altera Program
# License Subscription Agreement or other applicable license agreement,
# including, without limitation, that your use is for the sole purpose
# of programming logic devices manufactured by Altera and sold by Altera
# or its authorized distributors.  Please refer to the applicable
# agreement for further details.

#**************************************************************
# Timequest JTAG clock definition
#   Uncommenting the following lines will define the JTAG
#   clock in TimeQuest Timing Analyzer
#**************************************************************

#create_clock -period 10MHz {altera_internal_jtag|tckutap}
#set_clock_groups -asynchronous -group {altera_internal_jtag|tckutap}

#**************************************************************
# Set TCL Path Variables 
#**************************************************************

set 	aula2910_qsys_nios2_qsys_avsb 	aula2910_qsys_nios2_qsys_avsb:*
set 	aula2910_qsys_nios2_qsys_avsb_oci 	aula2910_qsys_nios2_qsys_avsb_nios2_oci:the_aula2910_qsys_nios2_qsys_avsb_nios2_oci
set 	aula2910_qsys_nios2_qsys_avsb_oci_break 	aula2910_qsys_nios2_qsys_avsb_nios2_oci_break:the_aula2910_qsys_nios2_qsys_avsb_nios2_oci_break
set 	aula2910_qsys_nios2_qsys_avsb_ocimem 	aula2910_qsys_nios2_qsys_avsb_nios2_ocimem:the_aula2910_qsys_nios2_qsys_avsb_nios2_ocimem
set 	aula2910_qsys_nios2_qsys_avsb_oci_debug 	aula2910_qsys_nios2_qsys_avsb_nios2_oci_debug:the_aula2910_qsys_nios2_qsys_avsb_nios2_oci_debug
set 	aula2910_qsys_nios2_qsys_avsb_wrapper 	aula2910_qsys_nios2_qsys_avsb_jtag_debug_module_wrapper:the_aula2910_qsys_nios2_qsys_avsb_jtag_debug_module_wrapper
set 	aula2910_qsys_nios2_qsys_avsb_jtag_tck 	aula2910_qsys_nios2_qsys_avsb_jtag_debug_module_tck:the_aula2910_qsys_nios2_qsys_avsb_jtag_debug_module_tck
set 	aula2910_qsys_nios2_qsys_avsb_jtag_sysclk 	aula2910_qsys_nios2_qsys_avsb_jtag_debug_module_sysclk:the_aula2910_qsys_nios2_qsys_avsb_jtag_debug_module_sysclk
set 	aula2910_qsys_nios2_qsys_avsb_oci_path 	 [format "%s|%s" $aula2910_qsys_nios2_qsys_avsb $aula2910_qsys_nios2_qsys_avsb_oci]
set 	aula2910_qsys_nios2_qsys_avsb_oci_break_path 	 [format "%s|%s" $aula2910_qsys_nios2_qsys_avsb_oci_path $aula2910_qsys_nios2_qsys_avsb_oci_break]
set 	aula2910_qsys_nios2_qsys_avsb_ocimem_path 	 [format "%s|%s" $aula2910_qsys_nios2_qsys_avsb_oci_path $aula2910_qsys_nios2_qsys_avsb_ocimem]
set 	aula2910_qsys_nios2_qsys_avsb_oci_debug_path 	 [format "%s|%s" $aula2910_qsys_nios2_qsys_avsb_oci_path $aula2910_qsys_nios2_qsys_avsb_oci_debug]
set 	aula2910_qsys_nios2_qsys_avsb_jtag_tck_path 	 [format "%s|%s|%s" $aula2910_qsys_nios2_qsys_avsb_oci_path $aula2910_qsys_nios2_qsys_avsb_wrapper $aula2910_qsys_nios2_qsys_avsb_jtag_tck]
set 	aula2910_qsys_nios2_qsys_avsb_jtag_sysclk_path 	 [format "%s|%s|%s" $aula2910_qsys_nios2_qsys_avsb_oci_path $aula2910_qsys_nios2_qsys_avsb_wrapper $aula2910_qsys_nios2_qsys_avsb_jtag_sysclk]
set 	aula2910_qsys_nios2_qsys_avsb_jtag_sr 	 [format "%s|*sr" $aula2910_qsys_nios2_qsys_avsb_jtag_tck_path]

#**************************************************************
# Set False Paths
#**************************************************************

set_false_path -from [get_keepers *$aula2910_qsys_nios2_qsys_avsb_oci_break_path|break_readreg*] -to [get_keepers *$aula2910_qsys_nios2_qsys_avsb_jtag_sr*]
set_false_path -from [get_keepers *$aula2910_qsys_nios2_qsys_avsb_oci_debug_path|*resetlatch]     -to [get_keepers *$aula2910_qsys_nios2_qsys_avsb_jtag_sr[33]]
set_false_path -from [get_keepers *$aula2910_qsys_nios2_qsys_avsb_oci_debug_path|monitor_ready]  -to [get_keepers *$aula2910_qsys_nios2_qsys_avsb_jtag_sr[0]]
set_false_path -from [get_keepers *$aula2910_qsys_nios2_qsys_avsb_oci_debug_path|monitor_error]  -to [get_keepers *$aula2910_qsys_nios2_qsys_avsb_jtag_sr[34]]
set_false_path -from [get_keepers *$aula2910_qsys_nios2_qsys_avsb_ocimem_path|*MonDReg*] -to [get_keepers *$aula2910_qsys_nios2_qsys_avsb_jtag_sr*]
set_false_path -from *$aula2910_qsys_nios2_qsys_avsb_jtag_sr*    -to *$aula2910_qsys_nios2_qsys_avsb_jtag_sysclk_path|*jdo*
set_false_path -from sld_hub:*|irf_reg* -to *$aula2910_qsys_nios2_qsys_avsb_jtag_sysclk_path|ir*
set_false_path -from sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1] -to *$aula2910_qsys_nios2_qsys_avsb_oci_debug_path|monitor_go
