Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:1073 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754835Ab2EHTPD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 May 2012 15:15:03 -0400
Message-ID: <4FA9709F.6020700@linux.intel.com>
Date: Tue, 08 May 2012 12:14:39 -0700
From: "H. Peter Anvin" <hpa@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 02/23] x86, realmode: realmode.bin infrastructure
References: <1336501366-28617-1-git-send-email-jarkko.sakkinen@intel.com> <1336501366-28617-3-git-send-email-jarkko.sakkinen@intel.com> <20120508185349.GA12013@merkur.ravnborg.org>
In-Reply-To: <20120508185349.GA12013@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Jarkko Sakkinen <jarkko.sakkinen@intel.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Joseph Cihula <joseph.cihula@intel.com>, Shane Wang <shane.wang@intel.com>

On 05/08/2012 11:53 AM, Sam Ravnborg wrote:
+# How to compile the 16-bit code.  Note we always compile for -march=i386,
+# that way we can complain to the user if the CPU is insufficient.
+KBUILD_CFLAGS	:= $(LINUXINCLUDE) -m32 -g -Os -D_SETUP -D__KERNEL__ \
+		   -DDISABLE_BRANCH_PROFILING \
+		   -Wall -Wstrict-prototypes \
+		   -march=i386 -mregparm=3 \
+		   -include $(srctree)/$(src)/../../boot/code16gcc.h \
+		   -fno-strict-aliasing -fomit-frame-pointer \
+		   $(call cc-option, -ffreestanding) \
+		   $(call cc-option, -fno-toplevel-reorder,\
+			$(call cc-option, -fno-unit-at-a-time)) \
+		   $(call cc-option, -fno-stack-protector) \
+		   $(call cc-option, -mpreferred-stack-boundary=2)
+KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__


> 
> How much is needed to avoid this misuse of kernel-internal build rules?
> This was and is an ugly hack.
> 

It is more or less the same as for arch/x86/boot and other things.  If
there are better ways to do it suggestions are very much appreciated.

However, it is a bit of a tricky bit because we need *some* of the bits
of the target compiler configuration and some not (this is the same as
arch/x86/boot etc.)  It is not "pure target" but it's also most
definitely not host.

	-hpa
