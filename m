Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:35700 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752422AbeBEBYo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Feb 2018 20:24:44 -0500
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 11/20] usb: gadget: udc: Remove USB_GADGET_DUALSPEED select
Date: Mon,  5 Feb 2018 02:21:23 +0100
Message-Id: <20180205012146.23981-12-ulfalizer@gmail.com>
In-Reply-To: <20180205012146.23981-1-ulfalizer@gmail.com>
References: <20180205012146.23981-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, tfiga@chromium.org, paul.burton@mips.com, m.szyprowski@samsung.com, egtvedt@samfundet.no, linus.walleij@linaro.org, vgupta@synopsys.com, mgorman@techsingularity.net, hch@lst.de, mina86@mina86.com, robh@kernel.org, sboyd@codeaurora.org, paulus@ozlabs.org, will.deacon@arm.com, tony@atomide.com, npiggin@gmail.com, yamada.masahiro@socionext.com, Ulf Magnusson <ulfalizer@gmail.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Raviteja Garimella <raviteja.garimella@broadcom.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Randy Dunlap <rdunlap@infradead.org>, yuan linyu <Linyu.Yuan@alcatel-sbell.com.cn>, Cristian Birsan <cristian.birsan@microchip.com>, linux-usb@vger.kernel.org

USB_GADGET_DUALSPEED was removed by commit 85b8614d7223 ("usb: gadget:
get rid of USB_GADGET_{DUAL,SUPER}SPEED"), but the USB_SNP_UDC_PLAT
symbol still selects it.

Remove the USB_GADGET_DUALSPEED select from USB_SNP_UDC_PLAT.

Discovered with the
https://github.com/ulfalizer/Kconfiglib/blob/master/examples/list_undefined.py
script.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 drivers/usb/gadget/udc/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 1e9567091d86..0875d38476ee 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -274,7 +274,6 @@ config USB_SNP_UDC_PLAT
 	tristate "Synopsys USB 2.0 Device controller"
 	depends on USB_GADGET && OF && HAS_DMA
 	depends on EXTCON || EXTCON=n
-	select USB_GADGET_DUALSPEED
 	select USB_SNP_CORE
 	default ARCH_BCM_IPROC
 	help
-- 
2.14.1

