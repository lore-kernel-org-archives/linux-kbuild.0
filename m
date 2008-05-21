Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from host36-195-149-62.serverdedicati.aruba.it ([62.149.195.36]:55101
	"EHLO mx.cpushare.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758518AbYEUT7s (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 21 May 2008 15:59:48 -0400
Date: Wed, 21 May 2008 21:48:08 +0200
From: Andrea Arcangeli <andrea@qumranet.com>
Subject: Re: kbuild variable $(src) broken in 2.6.23-rc3?
Message-ID: <20080521194806.GJ22488@duo.random>
References: <20080521144211.902CD37652C@pmx1.sophos.com> <20080521190453.GA12638@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080521190453.GA12638@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: tvrtko.ursulin@sophos.com, linux-kbuild@vger.kernel.org

On Wed, May 21, 2008 at 09:04:53PM +0200, Sam Ravnborg wrote:
> Andrea Arcangeli <andrea@qumranet.com> reported a similar issue.
> I have not gotten around to look at it yet.
> I minimal Makefile that exhibits the problem
> would be helpfull!

I don't have the minimal but I can easily provide you a way to
reproduce:

git clone git://git.kernel.org/pub/scm/virt/kvm/kvm-userspace.git
cd kvm-userspace
patch -p1 -R <../belowinlinedworkaround
./configure --kerneldir=/usr/src/anykernel
cd kernel
make

The below has the benefit of making more robust and higher prio the
inclusion of external-module-compat so it may not to be backed out
after this 2.6.26-rc regression is fixed.

The problem is that the $(src) in the EXTRA_CFLAGS below is expanded
to "".

Thanks.

Signed-off-by: Andrea Arcangeli <andrea@qumranet.com>

diff --git a/kernel/Kbuild b/kernel/Kbuild
index cabfc75..d9245eb 100644
--- a/kernel/Kbuild
+++ b/kernel/Kbuild
@@ -1,4 +1,3 @@
-EXTRA_CFLAGS := -I$(src)/include -include $(src)/external-module-compat.h
 obj-m := kvm.o kvm-intel.o kvm-amd.o
 kvm-objs := kvm_main.o x86.o mmu.o x86_emulate.o anon_inodes.o irq.o i8259.o \
 	 lapic.o ioapic.o preempt.o i8254.o external-module-compat.o
diff --git a/kernel/Makefile b/kernel/Makefile
index 78ff923..e3fccbe 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -27,7 +27,8 @@ all::
 #	include header priority 1) $LINUX 2) $KERNELDIR 3) include-compat
 	$(MAKE) -C $(KERNELDIR) M=`pwd` \
 		LINUXINCLUDE="-I`pwd`/include -Iinclude -I`pwd`/include-compat \
-		-include include/linux/autoconf.h" \
+		-include include/linux/autoconf.h \
+		-include `pwd`/external-module-compat.h"
 		"$$@"
 
 sync: header-sync source-sync
