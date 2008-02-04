Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nat-132.atmel.no ([80.232.32.132]:64350 "EHLO relay.atmel.no"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751680AbYBDLpK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Feb 2008 06:45:10 -0500
Date: Mon, 4 Feb 2008 12:44:48 +0100
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
Subject: [PATCH] kbuild: Fix instrumentation removal breakage on avr32
Message-ID: <20080204124448.3633e937@dhcp-252-066.norway.atmel.com>
In-Reply-To: <20080203211042.GF2648@uranus.ravnborg.org>
References: <20080203211042.GF2648@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>

On Sun, 3 Feb 2008 22:10:42 +0100
Sam Ravnborg <sam@ravnborg.org> wrote:

> Mathieu Desnoyers (5):
>       Move Kconfig.instrumentation to arch/Kconfig and init/Kconfig

AVR32 still includes Kconfig.instrumentation, so it won't build after
this...

I did point this out when the patch was submitted, I sent the avr32
pull request early as promised (more than a week ago), but it still
broke. Please apply the fix below. This fixes 2.6.24-mm1 too.

Signed-off-by: Haavard Skinnemoen <hskinnemoen@atmel.com>
---
 arch/avr32/Kconfig |    2 --
 1 file changed, 2 deletions(-)

Index: linux-2.6.24-mm1/arch/avr32/Kconfig
===================================================================
--- linux-2.6.24-mm1.orig/arch/avr32/Kconfig	2008-02-04 12:28:31.000000000 +0100
+++ linux-2.6.24-mm1/arch/avr32/Kconfig	2008-02-04 12:28:36.000000000 +0100
@@ -236,8 +236,6 @@ source "drivers/Kconfig"
 
 source "fs/Kconfig"
 
-source "kernel/Kconfig.instrumentation"
-
 source "arch/avr32/Kconfig.debug"
 
 source "security/Kconfig"
