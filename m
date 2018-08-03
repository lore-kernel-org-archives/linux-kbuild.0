Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:35752 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727161AbeHCCHn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Aug 2018 22:07:43 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: kbuild: ARCH=um archheaders failed
Message-ID: <be4f41de-c27a-abac-4b23-369c400e016e@infradead.org>
Date: Thu, 2 Aug 2018 17:13:59 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, linux-um@lists.infradead.org

Hi Yamada-san,

I see this every few weeks.  It's not reproducible (it depends
on the moon, Mars, etc.).

I'm using O=builddir.  The build log is short (below).

Do you see a makefile problem here?  (nothing to do with mmotm;
I see it more frequently with linux-next since I do many daily
builds with it)


thanks.
-- 
make[1]: Entering directory '/home/rdunlap/mmotm-2018-0802-1529/UM64'
  UPD     include/generated/uapi/linux/version.h
  WRAP    arch/x86/include/generated/asm/dma-contiguous.h
  WRAP    arch/x86/include/generated/asm/export.h
  WRAP    arch/x86/include/generated/asm/early_ioremap.h
  WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
  WRAP    arch/x86/include/generated/asm/mm-arch-hooks.h
  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  GEN     ./Makefile
make[2]: *** No rule to make target 'archheaders'.  Stop.
arch/um/Makefile:119: recipe for target 'archheaders' failed
make[1]: *** [archheaders] Error 2
make[1]: *** Waiting for unfinished jobs....
  UPD     include/config/kernel.release
make[1]: *** wait: No child processes.  Stop.
Makefile:146: recipe for target 'sub-make' failed
make: *** [sub-make] Error 2

