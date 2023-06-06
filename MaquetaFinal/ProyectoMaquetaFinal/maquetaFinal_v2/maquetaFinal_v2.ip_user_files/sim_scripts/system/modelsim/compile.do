vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_6
vlib modelsim_lib/msim/zynq_ultra_ps_e_vip_v1_0_6
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/generic_baseblocks_v2_1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_20
vlib modelsim_lib/msim/fifo_generator_v13_2_5
vlib modelsim_lib/msim/axi_data_fifo_v2_1_19
vlib modelsim_lib/msim/axi_crossbar_v2_1_21
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13
vlib modelsim_lib/msim/axi_bram_ctrl_v4_1_2
vlib modelsim_lib/msim/blk_mem_gen_v8_4_4
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/interrupt_control_v3_1_4
vlib modelsim_lib/msim/axi_gpio_v2_0_22
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_20
vlib modelsim_lib/msim/axi_clock_converter_v2_1_19
vlib modelsim_lib/msim/axi_dwidth_converter_v2_1_20

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_6 modelsim_lib/msim/axi_vip_v1_1_6
vmap zynq_ultra_ps_e_vip_v1_0_6 modelsim_lib/msim/zynq_ultra_ps_e_vip_v1_0_6
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap generic_baseblocks_v2_1_0 modelsim_lib/msim/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_20 modelsim_lib/msim/axi_register_slice_v2_1_20
vmap fifo_generator_v13_2_5 modelsim_lib/msim/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_19 modelsim_lib/msim/axi_data_fifo_v2_1_19
vmap axi_crossbar_v2_1_21 modelsim_lib/msim/axi_crossbar_v2_1_21
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13
vmap axi_bram_ctrl_v4_1_2 modelsim_lib/msim/axi_bram_ctrl_v4_1_2
vmap blk_mem_gen_v8_4_4 modelsim_lib/msim/blk_mem_gen_v8_4_4
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_4 modelsim_lib/msim/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_22 modelsim_lib/msim/axi_gpio_v2_0_22
vmap axi_protocol_converter_v2_1_20 modelsim_lib/msim/axi_protocol_converter_v2_1_20
vmap axi_clock_converter_v2_1_19 modelsim_lib/msim/axi_clock_converter_v2_1_19
vmap axi_dwidth_converter_v2_1_20 modelsim_lib/msim/axi_dwidth_converter_v2_1_20

vlog -work xilinx_vip -64 -incr -sv -L axi_vip_v1_1_6 -L zynq_ultra_ps_e_vip_v1_0_6 -L xilinx_vip "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2019.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -incr -sv -L axi_vip_v1_1_6 -L zynq_ultra_ps_e_vip_v1_0_6 -L xilinx_vip "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/0eaf/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/0eaf/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_6 -64 -incr -sv -L axi_vip_v1_1_6 -L zynq_ultra_ps_e_vip_v1_0_6 -L xilinx_vip "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/0eaf/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/dc12/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_6 -64 -incr -sv -L axi_vip_v1_1_6 -L zynq_ultra_ps_e_vip_v1_0_6 -L xilinx_vip "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/0eaf/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/0eaf/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/0eaf/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_zynq_ultra_ps_e_0_0/sim/system_zynq_ultra_ps_e_0_0_vip_wrapper.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/system/ipshared/574b/hdl/HALL_21_22.vhd" \
"../../../bd/system/ipshared/574b/hdl/MY_IP_HALL_21_22_v1_0_S00_AXI.vhd" \
"../../../bd/system/ipshared/574b/hdl/MY_IP_HALL_21_22_v1_0.vhd" \
"../../../bd/system/ip/system_MY_IP_HALL_21_22_0_0/sim/system_MY_IP_HALL_21_22_0_0.vhd" \
"../../../bd/system/ipshared/b732/hdl/MY_IP_HC_SR04.vhd" \
"../../../bd/system/ipshared/b732/hdl/MY_IP_HC_SR04_v1_0_S00_AXI.vhd" \
"../../../bd/system/ipshared/b732/hdl/MY_IP_HC_SR04_v1_0.vhd" \
"../../../bd/system/ip/system_MY_IP_HC_SR04_0_0/sim/system_MY_IP_HC_SR04_0_0.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 -incr "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/0eaf/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_20 -64 -incr "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/0eaf/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/72d4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5 -64 -incr "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/0eaf/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -64 -93 \
"../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5 -64 -incr "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/0eaf/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_19 -64 -incr "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/0eaf/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/60de/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_21 -64 -incr "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/0eaf/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/6b0d/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/0eaf/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_xbar_0/sim/system_xbar_0.v" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/system/ip/system_rst_ps8_0_100M_0/sim/system_rst_ps8_0_100M_0.vhd" \
"../../../bd/system/ipshared/15da/hdl/MOTORDC_DIR.vhd" \
"../../../bd/system/ipshared/15da/hdl/MYIP_MOTORDC_DIR_v1_0_S00_AXI.vhd" \
"../../../bd/system/ipshared/15da/hdl/MYIP_MOTORDC_DIR_v1_0.vhd" \
"../../../bd/system/ip/system_MYIP_MOTORDC_DIR_0_0/sim/system_MYIP_MOTORDC_DIR_0_0.vhd" \
"../../../bd/system/ipshared/4b95/hdl/MY_IP_STEPPER_v1_0_S00_AXI.vhd" \
"../../../bd/system/ipshared/4b95/hdl/STEPPER.vhd" \
"../../../bd/system/ipshared/4b95/hdl/MY_IP_STEPPER_v1_0.vhd" \
"../../../bd/system/ip/system_MY_IP_STEPPER_0_0/sim/system_MY_IP_STEPPER_0_0.vhd" \
"../../../bd/system/ipshared/5a10/hdl/CONTADOR_21_22.vhd" \
"../../../bd/system/ipshared/5a10/hdl/MY_IP_CONTADOR_21_22_v1_0_S00_AXI.vhd" \
"../../../bd/system/ipshared/5a10/hdl/MY_IP_CONTADOR_21_22_v1_0.vhd" \
"../../../bd/system/ip/system_MY_IP_CONTADOR_21_22_0_1/sim/system_MY_IP_CONTADOR_21_22_0_1.vhd" \
"../../../bd/system/ipshared/075f/hdl/FILTRO_21_22.vhd" \
"../../../bd/system/ipshared/075f/hdl/MY_IP_FILTRO_21_22_v1_0_S00_AXI.vhd" \
"../../../bd/system/ipshared/075f/hdl/MY_IP_FILTRO_21_22_v1_0.vhd" \
"../../../bd/system/ip/system_MY_IP_FILTRO_21_22_0_0/sim/system_MY_IP_FILTRO_21_22_0_0.vhd" \
"../../../bd/system/ipshared/6132/hdl/my_ip_temperatura.vhd" \
"../../../bd/system/ipshared/6132/hdl/my_ip_temperatura_v1_0_S00_AXI.vhd" \
"../../../bd/system/ipshared/6132/hdl/my_ip_temperatura_v1_0.vhd" \
"../../../bd/system/ip/system_my_ip_temperatura_0_0/sim/system_my_ip_temperatura_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/0eaf/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/system/sim/system.v" \

vcom -work axi_bram_ctrl_v4_1_2 -64 -93 \
"../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/a002/hdl/axi_bram_ctrl_v4_1_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/system/ip/system_axi_bram_ctrl_0_0/sim/system_axi_bram_ctrl_0_0.vhd" \

vlog -work blk_mem_gen_v8_4_4 -64 -incr "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/0eaf/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/0eaf/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_axi_bram_ctrl_0_bram_0/sim/system_axi_bram_ctrl_0_bram_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -64 -93 \
"../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_22 -64 -93 \
"../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/f71e/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/system/ip/system_axi_gpio_0_0/sim/system_axi_gpio_0_0.vhd" \
"../../../bd/system/ipshared/8cd5/hdl/MY_IP_SERVO_v1_0_S00_AXI.vhd" \
"../../../bd/system/ipshared/8cd5/hdl/my_servo.vhd" \
"../../../bd/system/ipshared/8cd5/hdl/MY_IP_SERVO_v1_0.vhd" \
"../../../bd/system/ip/system_MY_IP_SERVO_0_0/sim/system_MY_IP_SERVO_0_0.vhd" \
"../../../bd/system/ipshared/1ac7/hdl/PID_IP_v1_0_S00_AXI.vhd" \
"../../../bd/system/ipshared/1ac7/hdl/PID_VHDL.vhd" \
"../../../bd/system/ipshared/1ac7/hdl/PID_IP_v1_0.vhd" \
"../../../bd/system/ip/system_PID_IP_0_0/sim/system_PID_IP_0_0.vhd" \

vlog -work axi_protocol_converter_v2_1_20 -64 -incr "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/0eaf/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/c4a6/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work axi_clock_converter_v2_1_19 -64 -incr "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/0eaf/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/9e81/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work axi_dwidth_converter_v2_1_20 -64 -incr "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/0eaf/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/d394/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/ec67/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ipshared/0eaf/hdl" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0/sim_tlm" "+incdir+../../../../maquetaFinal_v2.srcs/sources_1/bd/system/ip/system_zynq_ultra_ps_e_0_0" "+incdir+C:/Xilinx/Vivado/2019.2/data/xilinx_vip/include" \
"../../../bd/system/ip/system_auto_ds_0/sim/system_auto_ds_0.v" \
"../../../bd/system/ip/system_auto_pc_0/sim/system_auto_pc_0.v" \
"../../../bd/system/ip/system_auto_ds_1/sim/system_auto_ds_1.v" \
"../../../bd/system/ip/system_auto_pc_1/sim/system_auto_pc_1.v" \
"../../../bd/system/ip/system_auto_ds_2/sim/system_auto_ds_2.v" \
"../../../bd/system/ip/system_auto_pc_2/sim/system_auto_pc_2.v" \
"../../../bd/system/ip/system_auto_ds_3/sim/system_auto_ds_3.v" \
"../../../bd/system/ip/system_auto_pc_3/sim/system_auto_pc_3.v" \
"../../../bd/system/ip/system_auto_ds_4/sim/system_auto_ds_4.v" \
"../../../bd/system/ip/system_auto_pc_4/sim/system_auto_pc_4.v" \
"../../../bd/system/ip/system_auto_ds_5/sim/system_auto_ds_5.v" \
"../../../bd/system/ip/system_auto_pc_5/sim/system_auto_pc_5.v" \
"../../../bd/system/ip/system_auto_ds_6/sim/system_auto_ds_6.v" \
"../../../bd/system/ip/system_auto_pc_6/sim/system_auto_pc_6.v" \
"../../../bd/system/ip/system_auto_ds_7/sim/system_auto_ds_7.v" \
"../../../bd/system/ip/system_auto_ds_8/sim/system_auto_ds_8.v" \
"../../../bd/system/ip/system_auto_pc_7/sim/system_auto_pc_7.v" \
"../../../bd/system/ip/system_auto_ds_9/sim/system_auto_ds_9.v" \
"../../../bd/system/ip/system_auto_pc_8/sim/system_auto_pc_8.v" \
"../../../bd/system/ip/system_auto_ds_10/sim/system_auto_ds_10.v" \
"../../../bd/system/ip/system_auto_pc_9/sim/system_auto_pc_9.v" \

vlog -work xil_defaultlib \
"glbl.v"

