Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:44690 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754504AbcLOVdn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Dec 2016 16:33:43 -0500
Subject: Re: default 0 if KASAN expression not working in kbuild
References: <e8e7205e-17f4-1d2c-f6d1-bd741b65e032@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <18825051-61d0-e8a9-544a-4f7d89f30b3c@infradead.org>
Date: Thu, 15 Dec 2016 13:32:58 -0800
MIME-Version: 1.0
In-Reply-To: <e8e7205e-17f4-1d2c-f6d1-bd741b65e032@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nikolay Borisov <n.borisov.lkml@gmail.com>, linux-kbuild@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, yann.morin.1998@free.fr, mmarek@suse.com

On 12/15/16 10:09, Nikolay Borisov wrote:
> Hello,
> 
> I was doing some kasan-related debugging and when I enabled it I started
> getting warnings for large stackframes. So CONFIG_FRAME_WARN has :
> 
> int "Warn for stack frames larger than (needs gcc 4.4)"
>     range 0 8192
>     default 0 if KASAN
>     default 2048 if GCC_PLUGIN_LATENT_ENTROPY
>     default 1024 if !64BIT
>     default 2048 if 64BIT
> 
> This means that frame_warns should effectively be disabled when kasan is
> enabled. However in my case this is not the situation.
> http://sprunge.us/FiGf here is the config file. It does have
> CONFIG_KASAN=y and CONFIG_FRAME_WARN=1024 . And even this is erroneous
> since it's a 64bit kernel, so it should be 2k. I haven't manually set
> the limit to 1k either.

Yeah, it set FRAME_WARN=1024 for me also.

It seems to be dependent on order of kconfig symbols in
lib/Kconfig.debug.

If I move the line:
  source "lib/Kconfig.kasan"
to just after this line:
  menu "Compile-time checks and compiler options"
it seems to work for me.

Can you test the patch below?
-- 
~Randy



From: Randy Dunlap <rdunlap@infradead.org>

Move the KASAN kconfig symbols to above where they are used
so that their chosen values are used later.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 lib/Kconfig.debug |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- lnx-49.orig/lib/Kconfig.debug
+++ lnx-49/lib/Kconfig.debug
@@ -117,6 +117,8 @@ endmenu # "printk and dmesg options"
 
 menu "Compile-time checks and compiler options"
 
+source "lib/Kconfig.kasan"
+
 config DEBUG_INFO
 	bool "Compile the kernel with debug info"
 	depends on DEBUG_KERNEL && !COMPILE_TEST
@@ -695,8 +697,6 @@ config DEBUG_STACKOVERFLOW
 
 source "lib/Kconfig.kmemcheck"
 
-source "lib/Kconfig.kasan"
-
 endmenu # "Memory Debugging"
 
 config ARCH_HAS_KCOV
