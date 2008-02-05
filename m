Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail29.messagelabs.com ([216.82.249.147]:6931 "HELO
	mail29.messagelabs.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751921AbYBEOXr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Feb 2008 09:23:47 -0500
Date: Tue, 5 Feb 2008 15:23:43 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <Uwe.Kleine-Koenig@digi.com>
Subject: Problems with parallel building
Message-ID: <20080205142343.GA9448@digi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hello,

using v2.6.24-7284-g9ef9dc6 (plus some patches that shouldn't affect
kbuild) I have problems with parallel building (make -j 3).  Sometimes
the build fails, the error isn't always the same.

The last build resulted in:

	...
	  SYSMAP  .tmp_System.map
	  OBJCOPY arch/arm/boot/Image
	  OBJCOPY arch/arm/boot/Image
	  OBJCOPY arch/arm/boot/Image
	  Kernel: arch/arm/boot/Image is ready
	  GZIP    arch/arm/boot/Image.gz
	  Kernel: arch/arm/boot/Image is ready
	  Kernel: arch/arm/boot/Image is ready
	  AS      arch/arm/boot/compressed/head.o
	  GZIP    arch/arm/boot/compressed/piggy.gz
	  AS      arch/arm/boot/compressed/head.o
	  GZIP    arch/arm/boot/compressed/piggy.gz
	  UIMAGE  arch/arm/boot/uzImage
	  CC      arch/arm/boot/compressed/misc.o
	Image Name:   Linux-2.6.24-07325-g0f3fee0-dirt
	Created:      Tue Feb  5 14:49:25 2008
	Image Type:   ARM Linux Kernel Image (gzip compressed)
	Data Size:    1240792 Bytes = 1211.71 kB = 1.18 MB
	Load Address: 0x00008000
	Entry Point:  0x00008000
	  Image arch/arm/boot/uzImage is ready
	  Kernel: arch/arm/boot/Image is ready
	  CC      arch/arm/boot/compressed/misc.o
	  AS      arch/arm/boot/compressed/piggy.o
	  LD      arch/arm/boot/compressed/vmlinux
	arch/arm/boot/compressed/head.o: In function `not_relocated':
	/home/ukleinek/gsrc/linux-2.6/arch/arm/boot/compressed/head.S:249: undefined reference to `decompress_kernel'
	arch/arm/boot/compressed/head.o: In function `wont_overwrite':
	/home/ukleinek/gsrc/linux-2.6/arch/arm/boot/compressed/head.S:286: undefined reference to `decompress_kernel'
	make[4]: *** [arch/arm/boot/compressed/vmlinux] Error 1
	make[3]: *** [arch/arm/boot/compressed/vmlinux] Error 2
	make[2]: *** [uImage] Error 2
	make[2]: *** Waiting for unfinished jobs....

The command to start the build was:

	make "ARCH=arm" "CROSS_COMPILE=arm-linux-" -j 3 uzImage uImage zImage Image

Running that command once more worked without errors.

I could reproduce that problem with current Linus' master
(v2.6.24-7284-g9ef9dc6).

I did:

	while delmake ns9xxx_defconfig && delmake -j 3 Image zImage uImage && delmake mrproper; do :; done

with delmake being a wrapper script that does

	make "ARCH=arm" "CROSS_COMPILE=arm-linux-" "$@"

after adding the toolchain to my PATH.

The result was:

	...
	  KSYM    .tmp_kallsyms2.S
	  AS      .tmp_kallsyms2.o
	  LD      vmlinux
	  SYSMAP  System.map
	  SYSMAP  .tmp_System.map
	  OBJCOPY arch/arm/boot/Image
	  Kernel: arch/arm/boot/Image is ready
	  Kernel: arch/arm/boot/Image is ready
	  AS      arch/arm/boot/compressed/head.o
	  GZIP    arch/arm/boot/compressed/piggy.gz
	  CC      arch/arm/boot/compressed/misc.o
	  AS      arch/arm/boot/compressed/piggy.o
	  Kernel: arch/arm/boot/Image is ready
	  AS      arch/arm/boot/compressed/piggy.o
	  CC      arch/arm/boot/compressed/misc.o
	fixdep: arch/arm/boot/compressed/.piggy.o.d: No such file or directory
	make[2]: *** [arch/arm/boot/compressed/piggy.o] Error 2
	make[2]: *** Waiting for unfinished jobs....
	make[1]: *** [arch/arm/boot/compressed/vmlinux] Error 2
	make: *** [zImage] Error 2
	make: *** Waiting for unfinished jobs....
	  LD      arch/arm/boot/compressed/vmlinux
	  OBJCOPY arch/arm/boot/zImage
	  Kernel: arch/arm/boot/zImage is ready
	  UIMAGE  arch/arm/boot/uImage
	Image Name:   Linux-2.6.24
	Created:      Tue Feb  5 15:05:22 2008
	Image Type:   ARM Linux Kernel Image (uncompressed)
	Data Size:    734016 Bytes = 716.81 kB = 0.70 MB
	Load Address: 0x00108000
	Entry Point:  0x00108000
	  Image arch/arm/boot/uImage is ready

Now the loop is running again with passing V=1 make.  So far without failing :-)
I will let this run over night and report tomorrow.

[...]
Oh, it failed just now, I think at the same stage:

	...
	  arm-linux-ld -EL  -p --no-undefined -X  -o .tmp_vmlinux2 -T arch/arm/kernel/vmlinux.lds arch/arm/kernel/head.o arch/arm/kernel/init_task.o  init/built-in.o --start-group  usr/built-in.o  arch/arm/kernel/built-in.o  arch/arm/mm/built-in.o  arch/arm/common/built-in.o  arch/arm/mach-ns9xxx/built-in.o  arch/arm/nwfpe/built-in.o  kernel/built-in.o  mm/built-in.o  fs/built-in.o  ipc/built-in.o  security/built-in.o  crypto/built-in.o  block/built-in.o  arch/arm/lib/lib.a  lib/lib.a  arch/arm/lib/built-in.o  lib/built-in.o  drivers/built-in.o  sound/built-in.o  net/built-in.o --end-group .tmp_kallsyms1.o
	  arm-linux-nm -n .tmp_vmlinux2 | scripts/kallsyms  > .tmp_kallsyms2.S
	  arm-linux-gcc -Wp,-MD,./..tmp_kallsyms2.o.d -D__ASSEMBLY__ -mabi=apcs-gnu -mno-thumb-interwork -D__LINUX_ARM_ARCH__=5 -march=armv5te -mtune=arm9tdmi -msoft-float -gdwarf-2   -nostdinc -isystem /home/ukleinek/csrc/LxNETES-4/bin/../lib/gcc/arm-linux-uclibc/4.0.3/include -D__KERNEL__ -Iinclude  -include include/linux/autoconf.h -mlittle-endian    -c -o .tmp_kallsyms2.o .tmp_kallsyms2.S
	  arm-linux-ld -EL  -p --no-undefined -X  -o vmlinux -T arch/arm/kernel/vmlinux.lds arch/arm/kernel/head.o arch/arm/kernel/init_task.o  init/built-in.o --start-group  usr/built-in.o  arch/arm/kernel/built-in.o  arch/arm/mm/built-in.o  arch/arm/common/built-in.o  arch/arm/mach-ns9xxx/built-in.o  arch/arm/nwfpe/built-in.o  kernel/built-in.o  mm/built-in.o  fs/built-in.o  ipc/built-in.o  security/built-in.o  crypto/built-in.o  block/built-in.o  arch/arm/lib/lib.a  lib/lib.a  arch/arm/lib/built-in.o  lib/built-in.o  drivers/built-in.o  sound/built-in.o  net/built-in.o --end-group .tmp_kallsyms2.o
	echo 'cmd_vmlinux := arm-linux-ld -EL  -p --no-undefined -X  -o vmlinux -T arch/arm/kernel/vmlinux.lds arch/arm/kernel/head.o arch/arm/kernel/init_task.o  init/built-in.o --start-group  usr/built-in.o  arch/arm/kernel/built-in.o  arch/arm/mm/built-in.o  arch/arm/common/built-in.o  arch/arm/mach-ns9xxx/built-in.o  arch/arm/nwfpe/built-in.o  kernel/built-in.o  mm/built-in.o  fs/built-in.o  ipc/built-in.o  security/built-in.o  crypto/built-in.o  block/built-in.o  arch/arm/lib/lib.a  lib/lib.a  arch/arm/lib/built-in.o  lib/built-in.o  drivers/built-in.o  sound/built-in.o  net/built-in.o --end-group .tmp_kallsyms2.o' > ./.vmlinux.cmd
	echo '  /bin/sh /home/ukleinek/gsrc/l/scripts/mksysmap  System.map' && /bin/sh /home/ukleinek/gsrc/l/scripts/mksysmap vmlinux System.map; if [ $? -ne 0 ]; then rm -f vmlinux; /bin/false; fi;
	  /bin/sh /home/ukleinek/gsrc/l/scripts/mksysmap  System.map
	echo '  /bin/sh /home/ukleinek/gsrc/l/scripts/mksysmap  .tmp_System.map' && /bin/sh /home/ukleinek/gsrc/l/scripts/mksysmap .tmp_vmlinux2 .tmp_System.map
	  /bin/sh /home/ukleinek/gsrc/l/scripts/mksysmap  .tmp_System.map
	cmp -s System.map .tmp_System.map || (echo Inconsistent kallsyms data; echo Try setting CONFIG_KALLSYMS_EXTRA_PASS; rm .tmp_kallsyms* ; /bin/false )
	rm -f .old_version
	make -f scripts/Makefile.build obj=arch/arm/boot MACHINE=arch/arm/mach-ns9xxx/ arch/arm/boot/Image
	make -f scripts/Makefile.build obj=arch/arm/boot MACHINE=arch/arm/mach-ns9xxx/ arch/arm/boot/zImage
	  arm-linux-objcopy -O binary -R .note -R .note.gnu.build-id -R .comment -S  vmlinux arch/arm/boot/Image
	  Kernel: arch/arm/boot/Image is ready
	make -f scripts/Makefile.build obj=arch/arm/boot MACHINE=arch/arm/mach-ns9xxx/ arch/arm/boot/uImage
	  Kernel: arch/arm/boot/Image is ready
	make -f scripts/Makefile.build obj=arch/arm/boot/compressed arch/arm/boot/compressed/vmlinux
	  arm-linux-gcc -Wp,-MD,arch/arm/boot/compressed/.head.o.d  -nostdinc -isystem /home/ukleinek/csrc/LxNETES-4/bin/../lib/gcc/arm-linux-uclibc/4.0.3/include -D__KERNEL__ -Iinclude  -include include/linux/autoconf.h -mlittle-endian -D__ASSEMBLY__ -mabi=apcs-gnu -mno-thumb-interwork -D__LINUX_ARM_ARCH__=5 -march=armv5te -mtune=arm9tdmi -msoft-float -gdwarf-2     -c -o arch/arm/boot/compressed/head.o arch/arm/boot/compressed/head.S
	  gzip -f -9 < arch/arm/boot/compressed/../Image > arch/arm/boot/compressed/piggy.gz
	  arm-linux-gcc -Wp,-MD,arch/arm/boot/compressed/.misc.o.d  -nostdinc -isystem /home/ukleinek/csrc/LxNETES-4/bin/../lib/gcc/arm-linux-uclibc/4.0.3/include -D__KERNEL__ -Iinclude  -include include/linux/autoconf.h -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -O2 -marm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -mabi=apcs-gnu -mno-thumb-interwork -D__LINUX_ARM_ARCH__=5 -march=armv5te -mtune=arm9tdmi  -msoft-float -Uarm -fno-omit-frame-pointer -fno-optimize-sibling-calls -g  -Wdeclaration-after-statement -Wno-pointer-sign  -fpic -fno-builtin -Dstatic=  -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(misc)"  -D"KBUILD_MODNAME=KBUILD_STR(misc)" -c -o arch/arm/boot/compressed/.tmp_misc.o arch/arm/boot/compressed/misc.c
	  arm-linux-gcc -Wp,-MD,arch/arm/boot/compressed/.piggy.o.d  -nostdinc -isystem /home/ukleinek/csrc/LxNETES-4/bin/../lib/gcc/arm-linux-uclibc/4.0.3/include -D__KERNEL__ -Iinclude  -include include/linux/autoconf.h -mlittle-endian -D__ASSEMBLY__ -mabi=apcs-gnu -mno-thumb-interwork -D__LINUX_ARM_ARCH__=5 -march=armv5te -mtune=arm9tdmi -msoft-float -gdwarf-2     -c -o arch/arm/boot/compressed/piggy.o arch/arm/boot/compressed/piggy.S
	  Kernel: arch/arm/boot/Image is ready
	make -f scripts/Makefile.build obj=arch/arm/boot/compressed arch/arm/boot/compressed/vmlinux
	  arm-linux-gcc -Wp,-MD,arch/arm/boot/compressed/.piggy.o.d  -nostdinc -isystem /home/ukleinek/csrc/LxNETES-4/bin/../lib/gcc/arm-linux-uclibc/4.0.3/include -D__KERNEL__ -Iinclude  -include include/linux/autoconf.h -mlittle-endian -D__ASSEMBLY__ -mabi=apcs-gnu -mno-thumb-interwork -D__LINUX_ARM_ARCH__=5 -march=armv5te -mtune=arm9tdmi -msoft-float -gdwarf-2     -c -o arch/arm/boot/compressed/piggy.o arch/arm/boot/compressed/piggy.S
	  arm-linux-gcc -Wp,-MD,arch/arm/boot/compressed/.misc.o.d  -nostdinc -isystem /home/ukleinek/csrc/LxNETES-4/bin/../lib/gcc/arm-linux-uclibc/4.0.3/include -D__KERNEL__ -Iinclude  -include include/linux/autoconf.h -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -O2 -marm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -mabi=apcs-gnu -mno-thumb-interwork -D__LINUX_ARM_ARCH__=5 -march=armv5te -mtune=arm9tdmi  -msoft-float -Uarm -fno-omit-frame-pointer -fno-optimize-sibling-calls -g  -Wdeclaration-after-statement -Wno-pointer-sign  -fpic -fno-builtin -Dstatic=  -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(misc)"  -D"KBUILD_MODNAME=KBUILD_STR(misc)" -c -o arch/arm/boot/compressed/.tmp_misc.o arch/arm/boot/compressed/misc.c
	fixdep: arch/arm/boot/compressed/.piggy.o.d: No such file or directory
	make[2]: *** [arch/arm/boot/compressed/piggy.o] Error 2
	make[1]: *** [arch/arm/boot/compressed/vmlinux] Error 2
	make: *** [zImage] Error 2
	make: *** Waiting for unfinished jobs....
	  arm-linux-ld -EL    --defsym zreladdr=0x108000 --defsym params_phys=0x100 -p --no-undefined -X /home/ukleinek/csrc/LxNETES-4/bin/../lib/gcc/arm-linux-uclibc/4.0.3/libgcc.a -T arch/arm/boot/compressed/vmlinux.lds arch/arm/boot/compressed/head.o arch/arm/boot/compressed/piggy.o arch/arm/boot/compressed/misc.o -o arch/arm/boot/compressed/vmlinux 
	  arm-linux-objcopy -O binary -R .note -R .note.gnu.build-id -R .comment -S  arch/arm/boot/compressed/vmlinux arch/arm/boot/zImage
	  Kernel: arch/arm/boot/zImage is ready
	  /bin/sh /home/ukleinek/gsrc/l/scripts/mkuboot.sh -A arm -O linux -T kernel -C none -a 0x108000 -e 0x108000 -n 'Linux-2.6.24' -d arch/arm/boot/zImage arch/arm/boot/uImage
	Image Name:   Linux-2.6.24
	Created:      Tue Feb  5 15:19:05 2008
	Image Type:   ARM Linux Kernel Image (uncompressed)
	Data Size:    733972 Bytes = 716.77 kB = 0.70 MB
	Load Address: 0x00108000
	Entry Point:  0x00108000
	  Image arch/arm/boot/uImage is ready

ukleinek@zentaur:~$ arm-linux-gcc --version
arm-linux-gcc (GCC) 4.0.3
Copyright (C) 2006 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

ukleinek@zentaur:~$ arm-linux-as --version
GNU assembler 2.16.1
Copyright 2005 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License.  This program has absolutely no warranty.
This assembler was configured for a target of `arm-linux-uclibc'.

Best regards
Uwe

-- 
Uwe Kleine-König, Software Engineer
Digi International GmbH Branch Breisach, Küferstrasse 8, 79206 Breisach, Germany
Tax: 315/5781/0242 / VAT: DE153662976 / Reg. Amtsgericht Dortmund HRB 13962
