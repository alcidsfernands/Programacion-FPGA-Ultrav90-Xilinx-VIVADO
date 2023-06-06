

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "MY_IP_DS18B20" "NUM_INSTANCES" "DEVICE_ID"  "C_S00_AXI_BASEADDR" "C_S00_AXI_HIGHADDR"
}
