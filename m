Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from host36-195-149-62.serverdedicati.aruba.it ([62.149.195.36]:34841
	"EHLO mx.cpushare.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753147AbYE1USG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 May 2008 16:18:06 -0400
Date: Wed, 28 May 2008 22:18:03 +0200
From: Andrea Arcangeli <andrea@qumranet.com>
Subject: Re: kbuild variable $(src) broken in 2.6.23-rc3?
Message-ID: <20080528201803.GF8086@duo.random>
References: <20080521144211.902CD37652C@pmx1.sophos.com> <20080521190453.GA12638@uranus.ravnborg.org> <20080521194806.GJ22488@duo.random> <20080528190907.GA6466@uranus.ravnborg.org> <20080528191315.GA6979@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080528191315.GA6979@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: tvrtko.ursulin@sophos.com, linux-kbuild@vger.kernel.org

On Wed, May 28, 2008 at 09:13:15PM +0200, Sam Ravnborg wrote:
> Inspect the gcc commandlien to see if the last -I
> contains the expected value (which is `pwd`)

I can reproduce a failure, not sure if it's the same one but it ends
up with -I. Actually on the good build it seems the -I wasn't there at
all.

andrea@duo /tmp $ mkdir xx
andrea@duo /tmp $ cat x/Makefile
obj-m := foo.o
ccflags-y := -I$(src)
andrea@duo /tmp $ cat x/Makefile >xx/Makefile
andrea@duo /tmp $ touch xx/foo.c
andrea@duo /tmp $ cd xx
andrea@duo /tmp/xx $ make -C /home/andrea/kernel/linux-2.6-mmu M=`pwd` V=1
make: Entering directory `/crypto/home/andrea/devel/kernel/linux-2.6-mmu'
test -e include/linux/autoconf.h -a -e include/config/auto.conf || (            \
        echo;                                                           \
        echo "  ERROR: Kernel configuration is invalid.";               \
        echo "         include/linux/autoconf.h or include/config/auto.conf are missing.";      \
        echo "         Run 'make oldconfig && make prepare' on kernel src to fix it.";  \
        echo;                                                           \
        /bin/false)
mkdir -p /tmp/xx/.tmp_versions ; rm -f /tmp/xx/.tmp_versions/*
make -f scripts/Makefile.build obj=/tmp/xx
   rm -f /tmp/xx/built-in.o; ar rcs /tmp/xx/built-in.o
  gcc -Wp,-MD,/tmp/xx/.foo.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-pc-linux-gnu/4.1.2/include -D__KERNEL__ -Iinclude  -include include/linux/autoconf.h -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -O2   -fno-stack-protector -m64  -mno-red-zone -mcmodel=kernel -funit-at-a-time -maccumulate-outgoing-args  -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -Iinclude/asm-x86/mach-default -fomit-frame-pointer -Wdeclaration-after-statement -Wno-pointer-sign -I/tmp/xx   -DMODULE -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(foo)"  -D"KBUILD_MODNAME=KBUILD_STR(foo)" -c -o /tmp/xx/.tmp_foo.o /tmp/xx/foo.c
(cat /dev/null;   echo kernel//tmp/xx/foo.ko;) > /tmp/xx/modules.order
  Building modules, stage 2.
make -f /crypto/home/andrea/devel/kernel/linux-2.6-mmu/scripts/Makefile.modpost
  scripts/mod/modpost -m  -i /crypto/home/andrea/devel/kernel/linux-2.6-mmu/Module.symvers -I /tmp/xx/Module.symvers  -o /tmp/xx/Module.symvers -S   -w  -s
  gcc -Wp,-MD,/tmp/xx/.foo.mod.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-pc-linux-gnu/4.1.2/include -D__KERNEL__ -Iinclude  -include include/linux/autoconf.h -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -O2   -fno-stack-protector -m64  -mno-red-zone -mcmodel=kernel -funit-at-a-time -maccumulate-outgoing-args  -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -Iinclude/asm-x86/mach-default -fomit-frame-pointer -Wdeclaration-after-statement -Wno-pointer-sign -I    -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(foo.mod)"  -D"KBUILD_MODNAME=KBUILD_STR(foo)" -DMODULE -c -o /tmp/xx/foo.mod.o /tmp/xx/foo.mod.c
/tmp/xx/foo.mod.c:9: error: implicit declaration of function `KBUILD_STR'
/tmp/xx/foo.mod.c:9: error: `foo' undeclared here (not in a function)
/tmp/xx/foo.mod.c:9: warning: missing braces around initializer
/tmp/xx/foo.mod.c:9: warning: (near initialization for `__this_module.name')
/tmp/xx/foo.mod.c:9: error: initializer element is not constant
/tmp/xx/foo.mod.c:9: error: (near initialization for `__this_module.name[0]')
make[1]: *** [/tmp/xx/foo.mod.o] Error 1
make: *** [modules] Error 2
make: Leaving directory `/crypto/home/andrea/devel/kernel/linux-2.6-mmu'


Here the same but on a distro .24 kernel:

make: Entering directory `/usr/src/linux-2.6.24-gentoo-r8'
test -e include/linux/autoconf.h -a -e include/config/auto.conf || (            \
        echo;                                                           \
        echo "  ERROR: Kernel configuration is invalid.";               \
        echo "         include/linux/autoconf.h or include/config/auto.conf are missing.";      \
        echo "         Run 'make oldconfig && make prepare' on kernel src to fix it.";  \
        echo;                                                           \
        /bin/false)
mkdir -p /tmp/xx/.tmp_versions ; rm -f /tmp/xx/.tmp_versions/*
make -f scripts/Makefile.build obj=/tmp/xx
   rm -f /tmp/xx/built-in.o; ar rcs /tmp/xx/built-in.o
  gcc -Wp,-MD,/tmp/xx/.foo.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-pc-linux-gnu/4.1.2/include -D__KERNEL__ -Iinclude  -include include/linux/autoconf.h -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -O2   -m64 -mno-red-zone -mcmodel=kernel -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -funit-at-a-time -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -maccumulate-outgoing-args -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -fomit-frame-pointer -g  -fno-stack-protector -Wdeclaration-after-statement -Wno-pointer-sign -I/tmp/xx   -DMODULE -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(foo)"  -D"KBUILD_MODNAME=KBUILD_STR(foo)" -c -o /tmp/xx/.tmp_foo.o /tmp/xx/foo.c
  Building modules, stage 2.
make -f /usr/src/linux-2.6.24-gentoo-r8/scripts/Makefile.modpost
  scripts/mod/modpost -m  -i /usr/src/linux-2.6.24-gentoo-r8/Module.symvers -I /tmp/xx/Module.symvers -o /tmp/xx/Module.symvers -w  -s
  gcc -Wp,-MD,/tmp/xx/.foo.mod.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-pc-linux-gnu/4.1.2/include -D__KERNEL__ -Iinclude  -include include/linux/autoconf.h -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -O2   -m64 -mno-red-zone -mcmodel=kernel -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -funit-at-a-time -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -maccumulate-outgoing-args -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -fomit-frame-pointer -g  -fno-stack-protector -Wdeclaration-after-statement -Wno-pointer-sign    -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(foo.mod)"  -D"KBUILD_MODNAME=KBUILD_STR(foo)" -DMODULE -c -o /tmp/xx/foo.mod.o /tmp/xx/foo.mod.c
  ld -r -m elf_x86_64  --build-id -o /tmp/xx/foo.ko /tmp/xx/foo.o /tmp/xx/foo.mod.o
make: Leaving directory `/usr/src/linux-2.6.24-gentoo-r8'
