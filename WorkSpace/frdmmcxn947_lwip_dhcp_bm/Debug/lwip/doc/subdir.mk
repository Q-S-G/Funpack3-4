################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lwip/doc/NO_SYS_SampleCode.c \
../lwip/doc/ZeroCopyRx.c 

C_DEPS += \
./lwip/doc/NO_SYS_SampleCode.d \
./lwip/doc/ZeroCopyRx.d 

OBJS += \
./lwip/doc/NO_SYS_SampleCode.o \
./lwip/doc/ZeroCopyRx.o 


# Each subdirectory must supply rules for building sources it contributes
lwip/doc/%.o: ../lwip/doc/%.c lwip/doc/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_MCXN947VDF -DCPU_MCXN947VDF_cm33 -DCPU_MCXN947VDF_cm33_core0 -DMCUXPRESSO_SDK -DLWIP_DISABLE_PBUF_POOL_SIZE_SANITY_CHECKS=1 -DSDK_DEBUGCONSOLE=1 -DPRINTF_FLOAT_ENABLE=1 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -DSERIAL_PORT_TYPE_UART=1 -DDEBUG_CONSOLE_RX_ENABLE=0 -DSDK_OS_BAREMETAL -I"D:\Documents\NXP\frdmmcxn947_lwip_dhcp_bm\phy" -I"D:\Documents\NXP\frdmmcxn947_lwip_dhcp_bm\utilities" -I"D:\Documents\NXP\frdmmcxn947_lwip_dhcp_bm\drivers\flash" -I"D:\Documents\NXP\frdmmcxn947_lwip_dhcp_bm\component\silicon_id" -I"D:\Documents\NXP\frdmmcxn947_lwip_dhcp_bm\lwip\port" -I"D:\Documents\NXP\frdmmcxn947_lwip_dhcp_bm\lwip\src" -I"D:\Documents\NXP\frdmmcxn947_lwip_dhcp_bm\lwip\src\include" -I"D:\Documents\NXP\frdmmcxn947_lwip_dhcp_bm\drivers" -I"D:\Documents\NXP\frdmmcxn947_lwip_dhcp_bm\device" -I"D:\Documents\NXP\frdmmcxn947_lwip_dhcp_bm\startup" -I"D:\Documents\NXP\frdmmcxn947_lwip_dhcp_bm\component\uart" -I"D:\Documents\NXP\frdmmcxn947_lwip_dhcp_bm\component\lists" -I"D:\Documents\NXP\frdmmcxn947_lwip_dhcp_bm\component\phy" -I"D:\Documents\NXP\frdmmcxn947_lwip_dhcp_bm\component\gpio" -I"D:\Documents\NXP\frdmmcxn947_lwip_dhcp_bm\CMSIS" -I"D:\Documents\NXP\frdmmcxn947_lwip_dhcp_bm\component\p3t1755" -I"D:\Documents\NXP\frdmmcxn947_lwip_dhcp_bm\component\serial_manager" -I"D:\Documents\NXP\frdmmcxn947_lwip_dhcp_bm\lwip\template" -I"D:\Documents\NXP\frdmmcxn947_lwip_dhcp_bm\source" -I"D:\Documents\NXP\frdmmcxn947_lwip_dhcp_bm\board" -O0 -fno-common -g3 -gdwarf-4 -mcpu=cortex-m33 -c -ffunction-sections -fdata-sections -fno-builtin -fmerge-constants -fmacro-prefix-map="$(<D)/"= -mcpu=cortex-m33 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-lwip-2f-doc

clean-lwip-2f-doc:
	-$(RM) ./lwip/doc/NO_SYS_SampleCode.d ./lwip/doc/NO_SYS_SampleCode.o ./lwip/doc/ZeroCopyRx.d ./lwip/doc/ZeroCopyRx.o

.PHONY: clean-lwip-2f-doc

