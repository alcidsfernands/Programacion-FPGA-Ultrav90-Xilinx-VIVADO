//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Mon Nov 22 12:38:23 2021
//Host        : E118L14 running 64-bit major release  (build 9200)
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (dir_sal_0,
    ds_data_bus_0,
    echo_0,
    enable_sal_0,
    entrada_0,
    gpio_rtl_tri_i,
    pwm_dc_motor_negro_0,
    pwm_dc_motor_rojo_0,
    sensor_hall_azul_0,
    sensor_hall_verde_0,
    servo_pwm_0,
    step_0,
    trigger_0);
  output dir_sal_0;
  inout ds_data_bus_0;
  input echo_0;
  output enable_sal_0;
  input entrada_0;
  input [1:0]gpio_rtl_tri_i;
  output pwm_dc_motor_negro_0;
  output pwm_dc_motor_rojo_0;
  input sensor_hall_azul_0;
  input sensor_hall_verde_0;
  output servo_pwm_0;
  output step_0;
  output trigger_0;

  wire dir_sal_0;
  wire ds_data_bus_0;
  wire echo_0;
  wire enable_sal_0;
  wire entrada_0;
  wire [1:0]gpio_rtl_tri_i;
  wire pwm_dc_motor_negro_0;
  wire pwm_dc_motor_rojo_0;
  wire sensor_hall_azul_0;
  wire sensor_hall_verde_0;
  wire servo_pwm_0;
  wire step_0;
  wire trigger_0;

  system system_i
       (.dir_sal_0(dir_sal_0),
        .ds_data_bus_0(ds_data_bus_0),
        .echo_0(echo_0),
        .enable_sal_0(enable_sal_0),
        .entrada_0(entrada_0),
        .gpio_rtl_tri_i(gpio_rtl_tri_i),
        .pwm_dc_motor_negro_0(pwm_dc_motor_negro_0),
        .pwm_dc_motor_rojo_0(pwm_dc_motor_rojo_0),
        .sensor_hall_azul_0(sensor_hall_azul_0),
        .sensor_hall_verde_0(sensor_hall_verde_0),
        .servo_pwm_0(servo_pwm_0),
        .step_0(step_0),
        .trigger_0(trigger_0));
endmodule
