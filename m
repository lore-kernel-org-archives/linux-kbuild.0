Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:35339 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbeJ3Lj3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Oct 2018 07:39:29 -0400
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id w9U2lkRZ022007
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Oct 2018 11:47:46 +0900
Received: by mail-ua1-f43.google.com with SMTP id z18so2732210uam.9
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Oct 2018 19:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <201810292206.VluYDCiv%fengguang.wu@intel.com>
In-Reply-To: <201810292206.VluYDCiv%fengguang.wu@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 30 Oct 2018 11:47:09 +0900
Message-ID: <CAK7LNATdwofGuKjHTRTT2oKfBXF69R-R8h4v7nAKVsq5xEXcow@mail.gmail.com>
Subject: Re: [kbuild:kbuild 2/4] drivers/tty/serial/qcom_geni_serial.c:1313:22:
 warning: 'drv' may be used uninitialized in this function
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: Changbin Du <changbin.du@gmail.com>, kbuild-all@01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, Oct 29, 2018 at 11:36 PM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> head:   94c7dfd01652880ffa336baad8269ee9add8fb01
> commit: 312d61883cf16e7b422caab857035f23a8c68076 [2/4] kernel hacking: add a config option to disable compiler auto-inlining
> config: sh-allyesconfig (attached as .config)
> compiler: sh4-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 312d61883cf16e7b422caab857035f23a8c68076
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.2.0 make.cross ARCH=sh
>
> Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
> http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings



This is not a new warning.
It was already fixed by:


commit 2843cbb5d3c467a85112f004a8a9345370760520
Author: Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu Aug 23 23:30:27 2018 +0200

    tty: serial: qcom_geni_serial: Drop useless check for dev.of_node






>
> All warnings (new ones prefixed by >>):
>
>    drivers/tty/serial/qcom_geni_serial.c: In function 'qcom_geni_serial_probe':
> >> drivers/tty/serial/qcom_geni_serial.c:1313:22: warning: 'drv' may be used uninitialized in this function [-Wmaybe-uninitialized]
>      uport->private_data = drv;
>      ~~~~~~~~~~~~~~~~~~~~^~~~~
> --
>    drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_mac_init_rd':
> >> drivers/net/wireless/ath/ath10k/mac.c:8374:39: warning: 'rd' may be used uninitialized in this function [-Wmaybe-uninitialized]
>      ar->ath_common.regulatory.current_rd = rd;
>      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
>    In file included from arch/sh/include/asm/string.h:3:0,
>                     from include/linux/string.h:20,
>                     from include/linux/bitmap.h:9,
>                     from include/linux/cpumask.h:12,
>                     from include/linux/rcupdate.h:44,
>                     from include/linux/rbtree.h:34,
>                     from include/linux/skbuff.h:22,
>                     from include/linux/if_ether.h:23,
>                     from include/net/mac80211.h:21,
>                     from drivers/net/wireless/ath/ath10k/mac.h:21,
>                     from drivers/net/wireless/ath/ath10k/mac.c:19:
>    drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_bss_info_changed':
>    arch/sh/include/asm/string_32.h:50:42: warning: array subscript is above array bounds [-Warray-bounds]
>       : "0" (__dest), "1" (__src), "r" (__src+__n)
>                                         ~~~~~^~~~
> --
>    drivers/dma/stm32-mdma.c: In function 'stm32_mdma_setup_xfer':
> >> drivers/dma/stm32-mdma.c:781:6: warning: 'ccr' may be used uninitialized in this function [-Wmaybe-uninitialized]
>      ccr &= ~STM32_MDMA_CCR_IRQ_MASK;
>          ^~
>
> vim +/drv +1313 drivers/tty/serial/qcom_geni_serial.c
>
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1251
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1252  static int qcom_geni_serial_probe(struct platform_device *pdev)
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1253  {
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1254          int ret = 0;
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1255          int line = -1;
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1256          struct qcom_geni_serial_port *port;
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1257          struct uart_port *uport;
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1258          struct resource *res;
> 066cd1c4e Karthikeyan Ramasubramanian 2018-04-06  1259          int irq;
> 8a8a66a1a Girish Mahadevan            2018-07-13  1260          bool console = false;
> 8a8a66a1a Girish Mahadevan            2018-07-13  1261          struct uart_driver *drv;
> 8a8a66a1a Girish Mahadevan            2018-07-13  1262
> 8a8a66a1a Girish Mahadevan            2018-07-13  1263          if (of_device_is_compatible(pdev->dev.of_node, "qcom,geni-debug-uart"))
> 8a8a66a1a Girish Mahadevan            2018-07-13  1264                  console = true;
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1265
> 8a8a66a1a Girish Mahadevan            2018-07-13  1266          if (pdev->dev.of_node) {
> 8a8a66a1a Girish Mahadevan            2018-07-13  1267                  if (console) {
> 8a8a66a1a Girish Mahadevan            2018-07-13  1268                          drv = &qcom_geni_console_driver;
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1269                          line = of_alias_get_id(pdev->dev.of_node, "serial");
> 8a8a66a1a Girish Mahadevan            2018-07-13  1270                  } else {
> 8a8a66a1a Girish Mahadevan            2018-07-13  1271                          drv = &qcom_geni_uart_driver;
> 8a8a66a1a Girish Mahadevan            2018-07-13  1272                          line = of_alias_get_id(pdev->dev.of_node, "hsuart");
> 8a8a66a1a Girish Mahadevan            2018-07-13  1273                  }
> 8a8a66a1a Girish Mahadevan            2018-07-13  1274          }
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1275
> 8a8a66a1a Girish Mahadevan            2018-07-13  1276          port = get_port_from_line(line, console);
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1277          if (IS_ERR(port)) {
> 6a10635e9 Karthikeyan Ramasubramanian 2018-05-03  1278                  dev_err(&pdev->dev, "Invalid line %d\n", line);
> 6a10635e9 Karthikeyan Ramasubramanian 2018-05-03  1279                  return PTR_ERR(port);
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1280          }
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1281
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1282          uport = &port->uport;
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1283          /* Don't allow 2 drivers to access the same port */
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1284          if (uport->private_data)
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1285                  return -ENODEV;
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1286
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1287          uport->dev = &pdev->dev;
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1288          port->se.dev = &pdev->dev;
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1289          port->se.wrapper = dev_get_drvdata(pdev->dev.parent);
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1290          port->se.clk = devm_clk_get(&pdev->dev, "se");
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1291          if (IS_ERR(port->se.clk)) {
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1292                  ret = PTR_ERR(port->se.clk);
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1293                  dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1294                  return ret;
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1295          }
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1296
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1297          res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> 7693b331d Wei Yongjun                 2018-03-22  1298          if (!res)
> 7693b331d Wei Yongjun                 2018-03-22  1299                  return -EINVAL;
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1300          uport->mapbase = res->start;
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1301
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1302          port->tx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1303          port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1304          port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1305
> 066cd1c4e Karthikeyan Ramasubramanian 2018-04-06  1306          irq = platform_get_irq(pdev, 0);
> 066cd1c4e Karthikeyan Ramasubramanian 2018-04-06  1307          if (irq < 0) {
> 066cd1c4e Karthikeyan Ramasubramanian 2018-04-06  1308                  dev_err(&pdev->dev, "Failed to get IRQ %d\n", irq);
> 066cd1c4e Karthikeyan Ramasubramanian 2018-04-06  1309                  return irq;
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1310          }
> 066cd1c4e Karthikeyan Ramasubramanian 2018-04-06  1311          uport->irq = irq;
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1312
> 8a8a66a1a Girish Mahadevan            2018-07-13 @1313          uport->private_data = drv;
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1314          platform_set_drvdata(pdev, port);
> 8a8a66a1a Girish Mahadevan            2018-07-13  1315          port->handle_rx = console ? handle_rx_console : handle_rx_uart;
> 8a8a66a1a Girish Mahadevan            2018-07-13  1316          if (!console)
> 8a8a66a1a Girish Mahadevan            2018-07-13  1317                  device_create_file(uport->dev, &dev_attr_loopback);
> 8a8a66a1a Girish Mahadevan            2018-07-13  1318          return uart_add_one_port(drv, uport);
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1319  }
> c4f528795 Karthikeyan Ramasubramanian 2018-03-14  1320
>
> :::::: The code at line 1313 was first introduced by commit
> :::::: 8a8a66a1a18a1dbd213bee460bcedb1361abc7ff tty: serial: qcom_geni_serial: Add support for flow control
>
> :::::: TO: Girish Mahadevan <girishm@codeaurora.org>
> :::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation



-- 
Best Regards
Masahiro Yamada
