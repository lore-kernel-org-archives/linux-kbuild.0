Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:47741 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758899AbcAKI6h (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Jan 2016 03:58:37 -0500
Date: Mon, 11 Jan 2016 09:58:32 +0100
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: Kernel build fails "cannot =?utf-8?Q?m?=
 =?utf-8?B?b3ZlIOKAmGFyY2gvYXJtL2Jvb3QvY29tcHJlc3NlZC8ucGlnZ3kuZ3ppcC5v?=
 =?utf-8?B?LnRtcCI=?= then succeeds
Message-ID: <20160111085831.GA7012@amd>
References: <20160111082603.GA24950@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20160111082603.GA24950@amd>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz, linux-kbuild@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>

Hi!

> Ok, I guess it is second time I see it.
> 
> This time it is while cross-compiling 4.0 kernel on 4.4-rc5. Failure
> is:
> 
>   AS      arch/arm/boot/compressed/piggy.gzip.o
>   AS      arch/arm/boot/compressed/piggy.gzip.o
> mv: cannot move ‘arch/arm/boot/compressed/.piggy.gzip.o.tmp’ to ‘arch/arm/boot/compressed/.piggy.gzip.o.cmd’: No such file or directory
> scripts/Makefile.build:294: recipe for target 'arch/arm/boot/compressed/piggy.gzip.o' failed
> make[2]: *** [arch/arm/boot/compressed/piggy.gzip.o] Error 1
> arch/arm/boot/Makefile:52: recipe for target 'arch/arm/boot/compressed/vmlinux' failed
> make[1]: *** [arch/arm/boot/compressed/vmlinux] Error 2
> arch/arm/Makefile:308: recipe for target 'zImage' failed
> make: *** [zImage] Error 2
> make: *** Waiting for unfinished jobs....

Third time now :-).

  GZIP    arch/arm/boot/compressed/piggy.gzip
mv: cannot stat ‘arch/arm/boot/compressed/.head.o.tmp’: No such file or directory
scripts/Makefile.build:294: recipe for target 'arch/arm/boot/compressed/head.o' failed
make[2]: *** [arch/arm/boot/compressed/head.o] Error 1
make[2]: *** Waiting for unfinished jobs....
  CC      arch/arm/boot/compressed/decompress.o
  AS      arch/arm/boot/compressed/hyp-stub.o
  AS      arch/arm/boot/compressed/lib1funcs.o
  AS      arch/arm/boot/compressed/ashldi3.o
  AS      arch/arm/boot/compressed/bswapsdi2.o
  AS      arch/arm/boot/compressed/piggy.gzip.o
arch/arm/boot/Makefile:52: recipe for target 'arch/arm/boot/compressed/vmlinux' failed
make[1]: *** [arch/arm/boot/compressed/vmlinux] Error 2
arch/arm/Makefile:308: recipe for target 'zImage' failed
make: *** [zImage] Error 2
make: *** Waiting for unfinished jobs....
  LD      arch/arm/boot/compressed/vmlinux

  OBJCOPY arch/arm/boot/zImage
  Kernel: arch/arm/boot/zImage is ready
  UIMAGE  arch/arm/boot/uImage
Image Name:   Linux-4.0.5-rt4-01052-g9b333f9

Second try:

  AS      arch/arm/boot/compressed/piggy.gzip.o
  AS      arch/arm/boot/compressed/piggy.gzip.o
mv: cannot move ‘arch/arm/boot/compressed/.piggy.gzip.o.tmp’ to ‘arch/arm/boot/compressed/.piggy.gzip.o.cmd’: No such file or directory
scripts/Makefile.build:294: recipe for target 'arch/arm/boot/compressed/piggy.gzip.o' failed
make[2]: *** [arch/arm/boot/compressed/piggy.gzip.o] Error 1
arch/arm/boot/Makefile:52: recipe for target 'arch/arm/boot/compressed/vmlinux' failed
make[1]: *** [arch/arm/boot/compressed/vmlinux] Error 2
arch/arm/Makefile:308: recipe for target 'zImage' failed
make: *** [zImage] Error 2
make: *** Waiting for unfinished jobs....
  LD      arch/arm/boot/compressed/vmlinux
  OBJCOPY arch/arm/boot/zImage
  Kernel: arch/arm/boot/zImage is ready
  UIMAGE  arch/arm/boot/uImage
Image Name:   Linux-4.0.5-rt4-01052-g9b333f9

Third try:

pavel@duo:~/stahl/linux$ ./mkit
Setup for armv7a (using ELDK 5.4)
9374 (process ID) old priority 0, new priority 10
  CHK     include/config/kernel.release
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
make[1]: 'include/generated/mach-types.h' is up to date.
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  CHK     kernel/config_data.h
  Kernel: arch/arm/boot/Image is ready
  Kernel: arch/arm/boot/Image is ready
  Kernel: arch/arm/boot/zImage is ready
  Kernel: arch/arm/boot/zImage is ready
  Image arch/arm/boot/uImage is ready
make took 0 minutes 31 seconds
make[1]: 'arch/arm/boot/dts/socfpga_stahl.dtb' is up to date.
done

Any ideas?
								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
