#include "tsi_v6.h"

/*******************************************************************************
 * Variables
 ******************************************************************************/
tsi_calibration_data_t buffer;
static volatile bool s_tsiInProgress = true;
static volatile bool s_touchDetected = false;
/* Array of TSI peripheral base address. */
#if defined(TSI0)
#define APP_TSI TSI0
#elif defined(TSI)
#define APP_TSI TSI
#endif

int touch_flag = 0;
int key_flag = 0;
int key = 0;

/*******************************************************************************
 * Code
 ******************************************************************************/
void TSI0_IRQHandler(void)
{
#if BOARD_TSI_ELECTRODE_1 > 15
    /* errata ERR051410: When reading TSI_COMFIG[TSICH] bitfield, the upper most bit will always be 0. */
    if ((TSI_GetSelfCapMeasuredChannel(APP_TSI) | 0x10U) == BOARD_TSI_ELECTRODE_1)
#else
    if (TSI_GetSelfCapMeasuredChannel(APP_TSI) == BOARD_TSI_ELECTRODE_1)
#endif
    {
        if (TSI_GetCounter(APP_TSI) > (uint16_t)(buffer.calibratedData[BOARD_TSI_ELECTRODE_1] + TOUCH_DELTA_VALUE))
        {
            if (!s_touchDetected) // 检查是否已经检测到触摸
            {
                touch_flag = 1;
                s_touchDetected = true; // 设置触摸检测标志
            }
            s_tsiInProgress = false;
        }
        else
        {
        	touch_flag = 0;
            s_touchDetected = false; // 触摸结束，清除标志
        }
    }

    if(!GPIO_PinRead(BOARD_INITPINS_SW3_GPIO ,BOARD_INITPINS_SW3_GPIO_PIN))
    {
    	if(!key)
    	{
    		key_flag = 1;
    		key = 1;
    	}
    }
    else
    {
    	key_flag = 0;
    	key = 0;
    }

    /* Clear endOfScan flag */
    TSI_ClearStatusFlags(APP_TSI, kTSI_EndOfScanFlag);
    SDK_ISR_EXIT_BARRIER;
}

void Tsi_Init(void)
{
	volatile uint32_t i = 0;
	tsi_selfCap_config_t tsiConfig_selfCap;
	lptmr_config_t lptmrConfig;
	memset((void *)&lptmrConfig, 0, sizeof(lptmrConfig));

    /* attach FRO 12M to FLEXCOMM4 (debug console) */
    CLOCK_SetClkDiv(kCLOCK_DivFlexcom4Clk, 1u);

    /* Enables the clk_16k[1] */
    CLOCK_SetupClk16KClocking(kCLOCK_Clk16KToVsys);
    /* attach FRO HF to SCT */
    CLOCK_SetClkDiv(kCLOCK_DivTsiClk, 1u);
    CLOCK_AttachClk(kCLK_IN_to_TSI);

    /* Configure LPTMR */
    LPTMR_GetDefaultConfig(&lptmrConfig);
    /* TSI default hardware configuration for self-cap mode */
    TSI_GetSelfCapModeDefaultConfig(&tsiConfig_selfCap);

    /* Initialize the LPTMR */
    LPTMR_Init(LPTMR0, &lptmrConfig);
    /* Initialize the TSI */
    TSI_InitSelfCapMode(APP_TSI, &tsiConfig_selfCap);
    /* Enable noise cancellation function */
    TSI_EnableNoiseCancellation(APP_TSI, true);

    /* Set timer period */
    LPTMR_SetTimerPeriod(LPTMR0, USEC_TO_COUNT(LPTMR_USEC_COUNT, LPTMR_SOURCE_CLOCK));

    NVIC_EnableIRQ(TSI0_IRQn);
    TSI_EnableModule(APP_TSI, true); /* Enable module */

    /*********  CALIBRATION PROCESS ************/
    memset((void *)&buffer, 0, sizeof(buffer));
    TSI_SelfCapCalibrate(APP_TSI, &buffer);
    /* Print calibrated counter values */
    for (i = 0U; i < FSL_FEATURE_TSI_CHANNEL_COUNT; i++)
    {
        PRINTF("Calibrated counters for channel %d is: %d \r\n", i, buffer.calibratedData[i]);
    }

    /********** HARDWARE TRIGGER SCAN ********/
    PRINTF("\r\nNOW, comes to the hardware trigger scan method!\r\n");
    TSI_EnableModule(APP_TSI, false);
    TSI_EnableHardwareTriggerScan(APP_TSI, true);
    TSI_EnableInterrupts(APP_TSI, kTSI_EndOfScanInterruptEnable);
    TSI_ClearStatusFlags(APP_TSI, kTSI_EndOfScanFlag);

    TSI_SetSelfCapMeasuredChannel(APP_TSI,
                                  BOARD_TSI_ELECTRODE_1); /* Select BOARD_TSI_ELECTRODE_1 as detecting electrode. */
    TSI_EnableModule(APP_TSI, true);
    INPUTMUX_AttachSignal(INPUTMUX0, 0U, kINPUTMUX_Lptmr0ToTsiTrigger);
    LPTMR_StartTimer(LPTMR0); /* Start LPTMR triggering */
}
