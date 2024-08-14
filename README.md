# Funpack3-4
# 1 硬件介绍

​		FRDM-MCXN947是NXP Semiconductors（恩智浦半导体）官方推出的一款基于MCXN947微控制器的低成本评估和开发板。这款开发板专为快速原型设计和评估MCXN947微控制器的功能而设计，具有高性能、低功耗和丰富的外设支持等特点。

## 1.1 微控制器核心

FRDM-MCXN947的核心是MCXN947微控制器，该控制器集成了两个高性能的Arm Cortex-M33内核，每个内核的主频均可达到150MHz，提供了强大的处理能力。此外，MCXN947还集成了eIQ Neutron神经处理单元（NPU），该NPU显著提升了机器学习（ML）的吞吐量，相比单核CPU性能提升高达30倍，大大缩短了设备的工作时间和总体功耗。

## 1.2 丰富的外设和接口

FRDM-MCXN947开发板配备了多种外设和接口，包括：

- ***\*P3T1755DP I3C温度传感器\****：用于实时温度监测。
- ***\*TJA1057GTK/3Z CAN PHY\****：支持CAN总线通信。
- ***\*以太网PHY\****：支持以太网连接。
- ***\*SDHC电路（Micro SD卡插槽）\****：用于数据存储。
- ***\*RGB LED\****、***\*触摸板\****、***\*高速USB电路\****和***\*按钮\****等，提供了丰富的用户交互接口。
- ***\*Arduino扩展\****、***\*PMOD拓展\****和***\*MicroBus总线拓展\****，支持多种扩展模块。
- ***\*摄像头模块和NXP低成本LCD模块PAR-LCD-S035\****：支持图像显示和图像处理应用。

## 1.3 开发环境支持

FRDM-MCXN947开发板通过MCUXpresso Developer Experience提供强大的开发支持，包括MCUXpresso IDE、SDK和安全配置工具等。这些工具为开发人员提供了基于Eclipse的用户友好开发环境，支持代码编辑、编译、调试和配置，并提供了丰富的示例代码和驱动程序，帮助开发人员快速上手。

## 1.4 应用场景

由于MCXN947微控制器的高性能和低功耗特性，以及FRDM-MCXN947开发板的丰富外设和接口，该开发板非常适合用于多种应用场景，如边缘机器学习（Edge ML）、智能电机控制、工业物联网（IIoT）、智慧城市、医疗保健和消费电子产品等。特别是在边缘ML领域，MCXN947的NPU能够显著提高推理速度，降低延迟，为实时智能应用提供了强大的支持。

# 2 功能介绍

## 2.1 基于lwIP TCP/IP堆栈与电脑通信

​		在两个项目中，***\*lwip_httpsrv\****项目可以实现板卡通过网线与电脑连接，然后与电脑通信，实现数据传输；***\*lwip_dhcp\****项目可以实现板卡通过网线与路由器进行连接，然后与电脑在局域网中进行无线通信，实现数据传输。

## 2.2 电脑获取板卡传感器信息

​		在电脑通过TCP/IP协议向板卡发送温度获取的指令后，板卡会通过TCP/IP协议不断向电脑发送P3T1755传感器测量得到的温度数据。当触摸板卡上的***\*Touch Pad\****区域时，电脑上TCP调试助手上名为“Touch”的LED会亮起，松开后LED会熄灭。当按压一次板卡上的***\*ISP\****按钮时，电脑上TCP调试助手上名为“Key“的开关状态会发生变化。

## 2.3 电脑控制板卡外设

​		在电脑的TCP调试助手中，点击红绿蓝三个LED的开关可以切换板卡上RGB灯的不同颜色亮灭，实现电脑控制板卡外设的功能。

## 2.4 TCP调试助手

​		使用MATLAB制作了专门为该项目服务的TCP调试助手，如图所示

![image.png](https://qn.eetree.cn/FijMKGK2dSl3UzslGKQNUpxz0wxK)

# 3 设计思路

## 3.1 从SDK中拉取Demo

​		打开恩智浦官方的IDE——***\*MCUXpresso IDE\****，我们可以获取MCXN947的SDK。之后，我们可以直接从SDK中拉取示例工程，根据我们的需求，选择拉取以下几个Demo：

- ***\*lwip_dhcp_bm\****——**在lwIP堆栈上运行一个HTTP服务器通过互联网浏览器发送连接请求，开发板作为HTTP服务器响应并发送网页回用户的PC。**（用于实现板卡通过网线与电脑连接，然后与电脑通信）
- ***\*lwip_httpsrv_bm\****——**在lwIP堆栈上实现DHCP客户端功能，应用程序作为DHCP客户端运行，并打印其状态进展，包括从DHCP服务器获取的IP地址信息。**（实现板卡通过网线与路由器进行连接，然后与电脑在局域网中进行无线通信）
- ***\*i3c_master_read_sensor_p3t1755\****——**获取温度传感器的初始化和温度数值读取方式**
- ***\*tsi_v6_self_cap\****——**获取触摸板的初始化和状态读取方式**

## 3.2 学习Lwip应用开发和TCP/IP协议

​		通过学习野火的[LwIP应用开发实战指南](https://doc.embedfire.com/net/lwip/zh/latest/index.html)，我们可以了解到TCP/IP协议的具体内容，特别是对应的源代码以及数据包的格式，这有助于我们进行后续的开发。同时，我们可以获得一个TCP回显服务器的示例程序，让我们实现基础的基于TCP/IP协议的信息收发功能。

## 3.3 移植、整合各个Demo

​		在MCUXpresso IDE中，我们要想将一个Demo移植到另一个工程中，必须在被移植的工程中添加Demo所需的组件（**components**），并且在引脚配置工具中将Demo所需的引脚添加到工程中。前者在项目资源管理器中右键项目，选择***\*SDK Management-Manage SDK components\****，后者则是同样右键项目，选择***\*MCUXpresso 配置工具-打开引脚\****。在上述工作完成后才能对代码进行移植，否则编译时会缺失库文件，或者编译通过，但是烧录后没有期望中的效果（引脚没有配置）。

## 3.4 制作TCP调试助手

​		由于直接在网络调试助手中发送指令控制板卡不够便捷，我们需要制作一个自己的TCP调试助手。这里提供两个方案，一个是简易版的，使用VOFA软件，直接拖拉控件制作一个简易的面板。另一个是使用MATLAB或QT等更专业的方式制作一个APP，但是需要有一定的经验或花费一些时间进行学习。

# 4 软件流程图

![image.png](https://qn.eetree.cn/FjgtF8PpiaI-Jg7iDiiNoiTBAcg-)

# 5 主要代码说明

## 5.1 主函数的主要修改部分

```c
    p3t1755_Init();
    TCP_Echo_Init();
    Tsi_Init();
    Led_Init();

    while (1)
    {
        /* Poll the driver, get any outstanding frames */
        ethernetif_input(&netif);

        /* Handle all system timeouts for all core protocols */
        sys_check_timeouts();

        /* Print DHCP progress */
        print_dhcp_state(&netif);

        temp = temperature_read();

        TCP_Touch_Task();

        TCP_Key_Task();

        TCP_Temp_Task();
    }
```

​		在循环前的几个功能初始化函数中，LED_Init函数是在主函数所在文件中定义的，其他三个在user文件夹中对应模块的C语言文件中定义。在循环中，可以看到温度数值的获取，处理触摸任务，处理按键任务，处理温度发送任务，由于这些任务可以单线执行，所以没有启用RTOS。

## 5.2 TCP模块

```c
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
```

​		这段代码实现了一个基于TCP的简单服务器，能够接收客户端发送的数据，根据数据内容控制温度标志位和LED状态，并打印接收到的数据。它通过处理新的TCP连接请求，并为每个新连接设置数据接收回调函数来管理连接。此外，它还通过处理触摸事件、按键事件和温度数据，并将这些事件和数据通过TCP发送给所有活动的TCP连接，实现了事件通知功能。通过初始化TCP Echo服务器，绑定到指定端口并进入监听状态，等待客户端连接，构建了一个能够接收客户端命令、控制硬件状态并实时反馈事件和数据的TCP服务器。

# 6 导入项目时遇到的问题及解决方案

​		我附上了两个项目的所有内容，但是他们不能直接导入到工作空间中，会遇到一系列问题，我在这里进行说明，并提供解决方案：

​		在导入项目时，点击左上角***\*文件-导入\****，选择***\*常规-来自文件夹或划归档文件的项目-下一步\****，点击***\*目录\****，选择对应的工程文件文件夹，如**frdmmcxn947_lwip_dhcp_bm**，然后点击***\*完成\****。

​		导入完成后，直接点击Build，会出现很多报错和警告，这时候我们需要Refresh SDK Components，具体方法为在项目资源管理器中右键项目文件夹，选择***\*SDK Management-Refresh SDK components\****。完成之后再次Build，还是会有些许报错，根据我的观察，这些报错的原因是在source文件夹中有一个名为lwipopts.h的文件，其中有一个宏定义(**LWIP_NETIF_EXT_STATUS_CALLBACK**)，它被定义为1才会定义一个我们需要的结构体(**netif_ext_callback_t**)，而这个lwipopts.h文件在Demo刚刚import时候是2023版本的，在Refresh之后就变成了2024版本的，在2024版本中，那个宏定义被删除了，这就需要我们手动添加它

​		解决方案不止一种，比如你可以正确的位置加上

```c
#ifndef LWIP_NETIF_EXT_STATUS_CALLBACK
#define LWIP_NETIF_EXT_STATUS_CALLBACK 1
#endif
```

一段代码即可，又可以去项目文件夹中lwip/src/include/lwip/opt.h文件的1700行，将LWIP_NETIF_EXT_STATUS_CALLBACK的0改为1即可。

# 7 心得体会

​		在本次活动中，我学习了TCP/IP协议相关内容，对于以太网的了解进一步加深。同时，我还第一次尝试了使用MATLAB制作自己需要的APP，这对于我以后的学习和工作有着极大帮助。

​		
