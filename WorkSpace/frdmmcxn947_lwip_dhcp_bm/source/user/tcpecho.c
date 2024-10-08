#include "tcpecho.h"
#include "board.h"
 #include "lwip/netif.h"
 #include "lwip/ip.h"
 #include "lwip/tcp.h"
 #include "lwip/init.h"
 #include "netif/etharp.h"
 #include "lwip/udp.h"
 #include "lwip/pbuf.h"
 #include "lwip/tcp.h"
 #include  "fsl_common_arm.h"
 #include <stdio.h>
 #include <string.h>
 #include <stdbool.h>

#define TAIL 2

extern double temp;
extern int touch_flag;
extern int key_flag;
int key_switch;
int touch_flag_last;
int temp_flag;
double temp_here;
char str_send[20],
	 str_temp[20],
	 str_touch[20],
     str_recv[20];

#if TAIL == 0
char temp_on[] = "temp:1",
	 temp_off[] = "temp:0",
	 led_red_on[] = "red:1",
	 led_red_off[] = "red:0",
	 led_blue_on[] = "blue:1",
	 led_blue_off[] = "blue:0",
	 led_green_on[] = "green:1",
	 led_green_off[] = "green:0";
#elif TAIL == 1
char temp_on[] = "temp:1\r",
	 temp_off[] = "temp:0\r",
	 led_red_on[] = "red:1\r",
	 led_red_off[] = "red:0\r",
	 led_blue_on[] = "blue:1\r",
	 led_blue_off[] = "blue:0\r",
	 led_green_on[] = "green:1\r",
	 led_green_off[] = "green:0\r";
#elif TAIL == 2
char temp_on[] = "temp:1\n",
	 temp_off[] = "temp:0\n",
	 led_red_on[] = "red:1\n",
	 led_red_off[] = "red:0\n",
	 led_blue_on[] = "blue:1\n",
	 led_blue_off[] = "blue:0\n",
	 led_green_on[] = "green:1\n",
	 led_green_off[] = "green:0\n";
#elif TAIL == 3
char temp_on[] = "temp:1\r\n",
	 temp_off[] = "temp:0\r\n",
	 led_red_on[] = "red:1\r\n",
	 led_red_off[] = "red:0\r\n",
	 led_blue_on[] = "blue:1\r\n",
	 led_blue_off[] = "blue:0\r\n",
	 led_green_on[] = "green:1\r\n",
	 led_green_off[] = "green:0\r\n";
#elif TAIL == 4
char temp_on[] = "temp:1\n\r",
	 temp_off[] = "temp:0\n\r",
	 led_red_on[] = "red:1\n\r",
	 led_red_off[] = "red:0\n\r",
	 led_blue_on[] = "blue:1\n\r",
	 led_blue_off[] = "blue:0\n\r",
	 led_green_on[] = "green:1\n\r",
	 led_green_off[] = "green:0\n\r";
#endif

 static err_t tcpecho_recv(void *arg,
                         struct tcp_pcb *tpcb,
                         struct pbuf *p,
                         err_t err)
 {
     if (p != NULL)
     {
         /* 更新窗口*/
         tcp_recved(tpcb, p->tot_len);

         strncpy(str_recv,p->payload,p->len);

         str_recv[p->len] = '\0';

         /* 返回接收到的数据*/
//         tcp_write(tpcb, p->payload, p->tot_len, 1);

         PRINTF("[TCP INFO] : %s\r\n",p->payload);

         if(strcmp(str_recv,temp_on) == 0)
        	 temp_flag = 1;
         else if(strcmp(str_recv,temp_off) == 0)
             temp_flag = 0;
         else if(strcmp(str_recv,led_red_on) == 0)
        	 LED_RED_ON();
         else if(strcmp(str_recv,led_red_off) == 0)
             LED_RED_OFF();
         else if(strcmp(str_recv,led_blue_on) == 0)
             LED_BLUE_ON();
         else if(strcmp(str_recv,led_blue_off) == 0)
             LED_BLUE_OFF();
         else if(strcmp(str_recv,led_green_on) == 0)
             LED_GREEN_ON();
         else if(strcmp(str_recv,led_green_off) == 0)
             LED_GREEN_OFF();

         memset(p->payload, 0 , p->tot_len);
         pbuf_free(p);

     }
     else if (err == ERR_OK)
     {
         return tcp_close(tpcb);
     }
     return ERR_OK;
 }



 static err_t tcpecho_accept(void *arg,
                             struct tcp_pcb *newpcb,
                             err_t err)
 {
     tcp_recv(newpcb, tcpecho_recv);
     return ERR_OK;
 }

 void TCP_Touch_Task(void)
 {
     if(touch_flag != touch_flag_last)
     {
    	 struct tcp_pcb *pcb;
    	 for (pcb = tcp_active_pcbs; pcb != NULL; pcb = pcb->next)
    	 {
    		 sprintf(str_send,"Info:%.2f,%d,%d\r\n",temp_here,touch_flag,key_switch);
    		 tcp_write(pcb, str_send, sizeof(str_send), 1);
    	 }
    	 touch_flag_last = touch_flag;
     }
 }

 void TCP_Key_Task(void)
 {
     if(key_flag)
     {
    	 key_switch = !key_switch;
    	 key_flag = 0;
    	 struct tcp_pcb *pcb;
    	 for (pcb = tcp_active_pcbs; pcb != NULL; pcb = pcb->next)
    	 {
    		 sprintf(str_send,"Info:%.2f,%d,%d\r\n",temp_here,touch_flag,key_switch);
    		 tcp_write(pcb, str_send, sizeof(str_send), 1);
    	 }
     }
 }

 void TCP_Temp_Task(void)
 {
	 if(temp_flag)
	      {
		 	 temp_here = temp;
	     	 struct tcp_pcb *pcb;
	     	 for (pcb = tcp_active_pcbs; pcb != NULL; pcb = pcb->next)
	     	 {
	    		sprintf(str_send,"Info:%.2f,%d,%d\r\n",temp_here,touch_flag,key_switch);
	    		tcp_write(pcb, str_send, sizeof(str_send), 1);
	     	 }
	     	SDK_DelayAtLeastUs(100000, CLOCK_GetCoreSysClkFreq());
	      }
 }

 void TCP_Echo_Init(void)
 {
     struct tcp_pcb *pcb = NULL;

     /* 创建一个TCP控制块  */
     pcb = tcp_new();

     /* 绑定TCP控制块 */
     tcp_bind(pcb, IP_ADDR_ANY, TCP_ECHO_PORT);


     /* 进入监听状态 */
     pcb = tcp_listen(pcb);

     /* 处理连接 */
     tcp_accept(pcb, tcpecho_accept);
 }
