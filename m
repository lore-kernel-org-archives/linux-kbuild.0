Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout5.freenet.de ([195.4.92.95]:55773 "EHLO mout5.freenet.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750749AbZFLL7B (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 12 Jun 2009 07:59:01 -0400
Message-ID: <4A3242EC.7020602@freenet.de>
Date: Fri, 12 Jun 2009 13:58:36 +0200
From: Patrick Ringl <patrick_@freenet.de>
MIME-Version: 1.0
Subject: PATCH: README - Fix misleading pointer to the defconf directory [NEW]
References: <4A321A3C.6030400@gmx.de>
In-Reply-To: <4A321A3C.6030400@gmx.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: torvalds@osdl.org, linux-kbuild@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>

Hello again,

after Arnd's short review and appropriate suggestions of change (thank 
you), here is an updated version of my earlier patch:


Signed-off-by: Patrick Ringl <patrick_@freenet.de>

<---->

--- linux.orig/README	2009-06-10 05:05:27.000000000 +0200
+++ linux/README	2009-06-12 13:47:38.000000000 +0200
@@ -175,7 +175,15 @@
  			   Like above, but avoids cluttering the screen
  			   with questions already answered.
  	"make defconfig"   Create a ./.config file by using the default
-			   symbol values from arch/$ARCH/defconfig.
+			   symbol values from either arch/$ARCH/defconfig
+			   or arch/$ARCH/configs/${PLATFORM}_defconfig,
+			   depending on the architecture.
+	"make ${PLATFORM}_defconfig"
+			   Create a ./.config file by using the default
+			   symbol values from
+			   arch/$ARCH/configs/${PLATFORM}_defconfig.
+			   Use "make help" to get a list of all available
+			   platforms of your architecture.
  	"make allyesconfig"
  			   Create a ./.config file by setting symbol
  			   values to 'y' as much as possible.

<---->


regards,
Patrick
