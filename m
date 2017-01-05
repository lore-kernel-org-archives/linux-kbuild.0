Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:52704 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933971AbdAEJdl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jan 2017 04:33:41 -0500
Date: Thu, 5 Jan 2017 10:33:38 +0100
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 1/3] asm-prototypes: Clear any CPP defines before
 declaring the functions
Message-ID: <20170105093338.54fbe6k4n4362mld@pd.tnic>
References: <20170103141456.12743-1-mmarek@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170103141456.12743-1-mmarek@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Adam Borowski <kilobyte@angband.pl>

On Tue, Jan 03, 2017 at 03:14:54PM +0100, Michal Marek wrote:
> The asm-prototypes.h file is used to provide dummy function declarations
> for genksyms, when processing asm files with EXPORT_SYMBOL. Make sure
> that any architecture defines get out of our way. x86 currently has an
> issue with memcpy on 64bit with CONFIG_KMEMCHECK=y and with
> memset/__memset on 32bit:
> 
> 	$ cat init/test.c
> 	#include <asm/asm-prototypes.h>
> 	$ make -s init/test.o
> 	$ make -s init/test.o
> 	In file included from ./arch/x86/include/asm/string.h:4:0,
> 			 from ./include/linux/string.h:18,
> 			 from ./include/linux/bitmap.h:8,
> 			 from ./include/linux/cpumask.h:11,
> 			 from ./arch/x86/include/asm/cpumask.h:4,
> 			 from ./arch/x86/include/asm/msr.h:10,
> 			 from ./arch/x86/include/asm/processor.h:20,
> 			 from ./arch/x86/include/asm/cpufeature.h:4,
> 			 from ./arch/x86/include/asm/thread_info.h:52,
> 			 from ./include/linux/thread_info.h:25,
> 			 from ./arch/x86/include/asm/preempt.h:6,
> 			 from ./include/linux/preempt.h:59,
> 			 from ./include/linux/spinlock.h:50,
> 			 from ./include/linux/seqlock.h:35,
> 			 from ./include/linux/time.h:5,
> 			 from ./include/uapi/linux/timex.h:56,
> 			 from ./include/linux/timex.h:56,
> 			 from ./include/linux/sched.h:19,
> 			 from ./include/linux/uaccess.h:4,
> 			 from ./arch/x86/include/asm/asm-prototypes.h:2,
> 			 from init/test.c:1:
> 	./arch/x86/include/asm/string_64.h:52:47: error: expected declaration specifiers or ‘...’ before ‘(’ token
> 	 #define memcpy(dst, src, len) __inline_memcpy((dst), (src), (len))
> 	 ./include/asm-generic/asm-prototypes.h:6:14: note: in expansion of macro ‘memcpy’
> 	  extern void *memcpy(void *, const void *, __kernel_size_t);
> 
> 						       ^
> 	...
> 
> During real build, this manifests itself by genksyms segfaulting.
> 
> Reported-by: Borislav Petkov <bp@alien8.de>

... -and-tested-by: ...

For all three.

Thanks!

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
