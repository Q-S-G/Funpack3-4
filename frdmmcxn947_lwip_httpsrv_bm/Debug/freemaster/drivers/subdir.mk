################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../freemaster/drivers/freemaster_flexcan.c \
../freemaster/drivers/freemaster_mcan.c \
../freemaster/drivers/freemaster_mscan.c \
../freemaster/drivers/freemaster_net_lwip_tcp.c \
../freemaster/drivers/freemaster_net_lwip_udp.c \
../freemaster/drivers/freemaster_net_segger_rtt.c \
../freemaster/drivers/freemaster_serial_lpsci.c \
../freemaster/drivers/freemaster_serial_lpuart.c \
../freemaster/drivers/freemaster_serial_miniusart.c \
../freemaster/drivers/freemaster_serial_uart.c \
../freemaster/drivers/freemaster_serial_usart.c \
../freemaster/drivers/freemaster_serial_usb.c 

C_DEPS += \
./freemaster/drivers/freemaster_flexcan.d \
./freemaster/drivers/freemaster_mcan.d \
./freemaster/drivers/freemaster_mscan.d \
./freemaster/drivers/freemaster_net_lwip_tcp.d \
./freemaster/drivers/freemaster_net_lwip_udp.d \
./freemaster/drivers/freemaster_net_segger_rtt.d \
./freemaster/drivers/freemaster_serial_lpsci.d \
./freemaster/drivers/freemaster_serial_lpuart.d \
./freemaster/drivers/freemaster_serial_miniusart.d \
./freemaster/drivers/freemaster_serial_uart.d \
./freemaster/drivers/freemaster_serial_usart.d \
./freemaster/drivers/freemaster_serial_usb.d 

OBJS += \
./freemaster/drivers/freemaster_flexcan.o \
./freemaster/drivers/freemaster_mcan.o \
./freemaster/drivers/freemaster_mscan.o \
./freemaster/drivers/freemaster_net_lwip_tcp.o \
./freemaster/drivers/freemaster_net_lwip_udp.o \
./freemaster/drivers/freemaster_net_segger_rtt.o \
./freemaster/drivers/freemaster_serial_lpsci.o \
./freemaster/drivers/freemaster_serial_lpuart.o \
./freemaster/drivers/freemaster_serial_miniusart.o \
./freemaster/drivers/freemaster_serial_uart.o \
./freemaster/drivers/freemaster_serial_usart.o \
./freemaster/drivers/freemaster_serial_usb.o 


# Each subdirectory must supply rules for building sources it contributes
freemaster/drivers/%.o: ../freemaster/drivers/%.c freemaster/drivers/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_MCXN947VDF -DCPU_MCXN947VDF_cm33 -DCPU_MCXN947VDF_cm33_core0 -DPRINTF_ADVANCED_ENABLE=1 -DMCUXPRESSO_SDK -DLWIP_DISABLE_PBUF_POOL_SIZE_SANITY_CHECKS=1 -DSDK_DEBUGCONSOLE=1 -DPRINTF_FLOAT_ENABLE=1 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -DSDK_OS_BAREMETAL -DSERIAL_PORT_TYPE_UART=1 -DDEBUG_CONSOLE_RX_ENABLE=0 -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\phy" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\utilities" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\drivers\flash" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\component\silicon_id" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\lwip\port" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\lwip\src" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\lwip\src\include" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\drivers" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\device" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\startup" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\component\uart" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\component\lists" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\component\phy" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\component\gpio" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\lwip\src\apps\http" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\lwip\src\include\lwip\apps" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\CMSIS" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\component\p3t1755" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\freemaster" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\source" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\freemaster\platforms" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\freemaster\drivers" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\component\serial_manager" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\lwip\template" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\board" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\source\user" -O0 -fno-common -g3 -gdwarf-4 -mcpu=cortex-m33 -c -ffunction-sections -fdata-sections -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-freemaster-2f-drivers

clean-freemaster-2f-drivers:
	-$(RM) ./freemaster/drivers/freemaster_flexcan.d ./freemaster/drivers/freemaster_flexcan.o ./freemaster/drivers/freemaster_mcan.d ./freemaster/drivers/freemaster_mcan.o ./freemaster/drivers/freemaster_mscan.d ./freemaster/drivers/freemaster_mscan.o ./freemaster/drivers/freemaster_net_lwip_tcp.d ./freemaster/drivers/freemaster_net_lwip_tcp.o ./freemaster/drivers/freemaster_net_lwip_udp.d ./freemaster/drivers/freemaster_net_lwip_udp.o ./freemaster/drivers/freemaster_net_segger_rtt.d ./freemaster/drivers/freemaster_net_segger_rtt.o ./freemaster/drivers/freemaster_serial_lpsci.d ./freemaster/drivers/freemaster_serial_lpsci.o ./freemaster/drivers/freemaster_serial_lpuart.d ./freemaster/drivers/freemaster_serial_lpuart.o ./freemaster/drivers/freemaster_serial_miniusart.d ./freemaster/drivers/freemaster_serial_miniusart.o ./freemaster/drivers/freemaster_serial_uart.d ./freemaster/drivers/freemaster_serial_uart.o ./freemaster/drivers/freemaster_serial_usart.d ./freemaster/drivers/freemaster_serial_usart.o ./freemaster/drivers/freemaster_serial_usb.d ./freemaster/drivers/freemaster_serial_usb.o

.PHONY: clean-freemaster-2f-drivers

