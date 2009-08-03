Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bamako.nerim.net ([62.4.17.28]:52552 "EHLO bamako.nerim.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754332AbZHCTcU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 3 Aug 2009 15:32:20 -0400
Date: Mon, 3 Aug 2009 21:32:16 +0200
From: Jean Delvare <khali@linux-fr.org>
Subject: Re: ld:arch/x86/kernel/vmlinux.lds:678: parse error
Message-ID: <20090803213216.6a0c182b@hyperion.delvare>
In-Reply-To: <4A7702D9.5080101@zytor.com>
References: <20090803140459.02cea700@hyperion.delvare>
	<4A7702D9.5080101@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>

Hi Peter,

Thanks for your fast answer.

On Mon, 03 Aug 2009 08:31:37 -0700, H. Peter Anvin wrote:
> On 08/03/2009 05:04 AM, Jean Delvare wrote:
> > Hi Sam,
> > 
> > I am not able to build Linus' latest kernel on my oldest test system. I
> > get the following linking error at the end:
> > 
> >   LD      .tmp_vmlinux1
> > ld:arch/x86/kernel/vmlinux.lds:678: parse error
> > 
> > Which is:
> > 
> > ASSERT((_end - 0xC0000000 <= (512 * 1024 * 1024)),
> >         "kernel image bigger than KERNEL_IMAGE_SIZE")
> > 
> > Apparently this assertion is relatively new, as I was able to build
> > kernel 2.6.29 on the same system. The system has binutils 2.14.90.0.6,
> > which is more recent than what is listed in Documentation/Changes
> > (2.12).
> > 
> > Any idea?
> > 
> 
> Old binutils doesn't accept the naked ASSERT(); there has to be a sink
> for the data; so one has to do crap like:
> 
> __junk_symbol = ASSERT(...);
> 
> or
> 
> . = ASSERT(...);
> 
> near the end.
> 
> Does this patch fix it for you?

You patch doesn't, because you forgot to fix the one ASSERT() call that
failed for me ;) but the updated version below does indeed fix the
build for me:

Index: linux-2.6.31-rc5/arch/x86/kernel/vmlinux.lds.S
===================================================================
--- linux-2.6.31-rc5.orig/arch/x86/kernel/vmlinux.lds.S	2009-08-01 22:24:12.000000000 +0200
+++ linux-2.6.31-rc5/arch/x86/kernel/vmlinux.lds.S	2009-08-03 21:22:31.000000000 +0200
@@ -393,8 +393,8 @@
 
 
 #ifdef CONFIG_X86_32
-ASSERT((_end - LOAD_OFFSET <= KERNEL_IMAGE_SIZE),
-        "kernel image bigger than KERNEL_IMAGE_SIZE")
+. = ASSERT((_end - LOAD_OFFSET <= KERNEL_IMAGE_SIZE),
+	   "kernel image bigger than KERNEL_IMAGE_SIZE");
 #else
 /*
  * Per-cpu symbols which need to be offset from __per_cpu_load
@@ -407,12 +407,12 @@
 /*
  * Build-time check on the image size:
  */
-ASSERT((_end - _text <= KERNEL_IMAGE_SIZE),
-	"kernel image bigger than KERNEL_IMAGE_SIZE")
+. = ASSERT((_end - _text <= KERNEL_IMAGE_SIZE),
+	   "kernel image bigger than KERNEL_IMAGE_SIZE");
 
 #ifdef CONFIG_SMP
-ASSERT((per_cpu__irq_stack_union == 0),
-        "irq_stack_union is not at start of per-cpu area");
+. = ASSERT((per_cpu__irq_stack_union == 0),
+           "irq_stack_union is not at start of per-cpu area");
 #endif
 
 #endif /* CONFIG_X86_32 */
@@ -420,7 +420,7 @@
 #ifdef CONFIG_KEXEC
 #include <asm/kexec.h>
 
-ASSERT(kexec_control_code_size <= KEXEC_CONTROL_CODE_MAX_SIZE,
-       "kexec control code size is too big")
+. = ASSERT(kexec_control_code_size <= KEXEC_CONTROL_CODE_MAX_SIZE,
+           "kexec control code size is too big");
 #endif
 

So I guess you can send this to Linus. Thanks!

-- 
Jean Delvare
