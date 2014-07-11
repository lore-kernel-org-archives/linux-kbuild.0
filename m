Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:49142 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751143AbaGKLvz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Jul 2014 07:51:55 -0400
Received: by mail-lb0-f179.google.com with SMTP id z11so800316lbi.10
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Jul 2014 04:51:54 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: include guard weirdness
Date: Fri, 11 Jul 2014 13:51:51 +0200
Message-ID: <87a98gnmeg.fsf@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Hi,

gcc/cpp claims to be smart enough to recognize the include guard idiom,
and most of the time this works very well: the second and subsequent
#includes do not even cause the file to be opened (thus saving at least
open+fstat+read+close). Except in a few cases, which are so common that
it might be worth investigating.

For example, linux/mm.h often shows up exactly twice in strace output;
another very common header such as linux/types.h always occurs only
once.

Steps to reproduce: 

(1) Pick some file which includes linux/mm.h through multiple paths
(those are not hard to find); I use kernel/fork.c as example.

strace -f -o /tmp/strace.txt gcc -Wp,-MD,kernel/.fork.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/4.7/include -I./arch/x86/include -Iarch/x86/include/generated  -Iinclude -I./arch/x86/include/uapi -Iarch/x86/include/generated/uapi -I./include/uapi -Iinclude/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -m64 -mno-mmx -mno-sse -mno-80387 -mno-fp-ret-in-387 -mtune=generic -mno-red-zone -mcmodel=kernel -funit-at-a-time -maccumulate-outgoing-args -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_CRC32=1 -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fno-delete-null-pointer-checks -O2 -Wframe-larger-than=2048 -fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(fork)"  -D"KBUILD_MODNAME=KBUILD_STR(fork)" -c -o kernel/fork.o kernel/fork.c

(2) Run

  perl -ne 'print if s/^.*open\("([^"]*\.h)".*\) = [0-9]/$1/;' /tmp/strace.txt | sort | uniq -c --repeated

to find all the header files which were succesfully opened more than once.

For me, this gives

      2 ./arch/x86/include/asm/fixmap.h
      2 ./arch/x86/include/asm/posix_types.h
      2 ./arch/x86/include/asm/smp.h
      2 ./arch/x86/include/asm/spinlock_types.h
      4 ./arch/x86/include/uapi/asm/errno.h
      4 ./arch/x86/include/uapi/asm/param.h
      2 ./arch/x86/include/uapi/asm/socket.h
      2 ./arch/x86/include/uapi/asm/sockios.h
      2 include/linux/bitops.h
      2 include/linux/cgroup_subsys.h
      2 include/linux/mm.h
      2 include/linux/mmzone.h
      3 include/linux/static_key.h
     13 include/linux/tracepoint.h
     11 include/trace/define_trace.h
     10 include/trace/events/task.h

Some of these are expected (no include guards), but mm.h, mmzone.h and
tracepoint.h certainly have include guards.

The same happens when I try a few other random examples (fs/dcache.c,
drivers/dma/intel_mid_dma.c); mm.h is always read twice.

I'm using
$ gcc --version
gcc (Debian 4.7.2-5) 4.7.2


Rasmus
