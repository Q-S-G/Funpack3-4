#ifndef TSI_V6
#define TSI_V6

#include "pin_mux.h"
#include "board.h"
#include "fsl_tsi_v6.h"
#include "fsl_debug_console.h"
#include "fsl_lptmr.h"
#include "fsl_inputmux.h"

#include <stdbool.h>
/*******************************************************************************
 * Definitions
 ******************************************************************************/

/* Available PAD names on board */
#define PAD_TSI_ELECTRODE_1_NAME "E1"

/* IRQ related redefinitions for specific SOC */
#define TSI0_IRQHandler TSI_END_OF_SCAN_IRQHandler
#define TSI0_IRQn       TSI_END_OF_SCAN_IRQn

/* Define the delta value to indicate a touch event */
#define TOUCH_DELTA_VALUE 100U

/* TSI indication led of electrode 1 */
#define LED1_INIT()   LED_BLUE_INIT(LOGIC_LED_OFF)
#define LED1_TOGGLE() LED_BLUE_TOGGLE()
#define LED2_INIT()   LED_RED_INIT(LOGIC_LED_OFF)

/* Get source clock for LPTMR driver */
#define LPTMR_SOURCE_CLOCK (16000)
/* Define LPTMR microseconds count value */
#define LPTMR_USEC_COUNT (100000)

void Tsi_Init(void);

#endif
