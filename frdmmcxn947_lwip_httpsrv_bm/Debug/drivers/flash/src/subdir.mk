################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/flash/src/fsl_flash.c 

C_DEPS += \
./drivers/flash/src/fsl_flash.d 

OBJS += \
./drivers/flash/src/fsl_flash.o 


# Each subdirectory must supply rules for building sources it contributes
drivers/flash/src/%.o: ../drivers/flash/src/%.c drivers/flash/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_MCXN947VDF -DCPU_MCXN947VDF_cm33 -DCPU_MCXN947VDF_cm33_core0 -DPRINTF_ADVANCED_ENABLE=1 -DMCUXPRESSO_SDK -DLWIP_DISABLE_PBUF_POOL_SIZE_SANITY_CHECKS=1 -DSDK_DEBUGCONSOLE=1 -DPRINTF_FLOAT_ENABLE=1 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -DSDK_OS_BAREMETAL -DSERIAL_PORT_TYPE_UART=1 -DDEBUG_CONSOLE_RX_ENABLE=0 -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\phy" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\utilities" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\drivers\flash" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\component\silicon_id" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\lwip\port" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\lwip\src" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\lwip\src\include" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\drivers" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\device" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\startup" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\component\uart" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\component\lists" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\component\phy" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\component\gpio" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\lwip\src\apps\http" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\lwip\src\include\lwip\apps" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\CMSIS" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\component\p3t1755" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\component\serial_manager" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\lwip\template" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\source" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\board" -I"D:\Documents\MCUXpressoIDE_11.10.0_3148\frdmmcxn947_lwip_httpsrv_bm\source\user" -O0 -fno-common -g3 -gdwarf-4 -mcpu=cortex-m33 -c -ffunction-sections -fdata-sections -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-drivers-2f-flash-2f-src

clean-drivers-2f-flash-2f-src:
	-$(RM) ./drivers/flash/src/fsl_flash.d ./drivers/flash/src/fsl_flash.o

.PHONY: clean-drivers-2f-flash-2f-src

