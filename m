Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:56624 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752412Ab1JNWbf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Oct 2011 18:31:35 -0400
Message-ID: <4E98B845.8050009@xenotime.net>
Date: Fri, 14 Oct 2011 15:31:33 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
Subject: strange build failure when kconfig symbol is bool but not when tristate
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux kbuild list <linux-kbuild@vger.kernel.org>

(my turn)

I have seen this randconfig build error 2-3 times in the past 3 months:
(this one is from linux-next of 20111014.)

net/built-in.o: In function `unregister_8022_client':
(.text+0x26157): undefined reference to `llc_sap_close'
net/built-in.o: In function `register_8022_client':
(.text+0x261b6): undefined reference to `llc_sap_open'
net/built-in.o: In function `p8022_request':
p8022.c:(.text+0x261e5): undefined reference to `llc_build_and_send_ui_pkt'
net/built-in.o: In function `snap_request':
psnap.c:(.text+0x26487): undefined reference to `llc_build_and_send_ui_pkt'
net/built-in.o: In function `snap_init':
psnap.c:(.init.text+0xb22): undefined reference to `llc_sap_open'
net/built-in.o: In function `snap_exit':
psnap.c:(.exit.text+0x16): undefined reference to `llc_sap_close'

I finally found that if I change drivers/net/tokenring/Kconfig
symbol TR from bool to tristate, the build completes successfully,
but I don't understand why this is happening.


---
 drivers/net/tokenring/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- next-2011-1014.orig/drivers/net/tokenring/Kconfig
+++ next-2011-1014/drivers/net/tokenring/Kconfig
@@ -4,7 +4,7 @@
 
 # So far, we only have PCI, ISA, and MCA token ring devices
 menuconfig TR
-	bool "Token Ring driver support"
+	tristate "Token Ring driver support"
 	depends on NETDEVICES && !UML
 	depends on (PCI || ISA || MCA || CCW || PCMCIA)
 	select LLC

> make oldconfig

> diff -u .config.old .config
--- .config.old	2011-10-14 15:17:45.000000000 -0700
+++ .config	2011-10-14 15:24:45.000000000 -0700
@@ -876,7 +876,7 @@
 # CONFIG_MDIO_BITBANG is not set
 # CONFIG_PPP is not set
 # CONFIG_SLIP is not set
-CONFIG_TR=y
+CONFIG_TR=m
 CONFIG_PCMCIA_IBMTR=m


voila.  build works cleanly.

ideas?

thanks,
-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
