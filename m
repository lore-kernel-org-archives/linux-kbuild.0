Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:47048 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751379AbcAKI0I (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Jan 2016 03:26:08 -0500
Date: Mon, 11 Jan 2016 09:26:03 +0100
From: Pavel Machek <pavel@ucw.cz>
Subject: Kernel build fails "cannot =?utf-8?Q?move_?=
 =?utf-8?B?4oCYYXJjaC9hcm0vYm9vdC9jb21wcmVzc2VkLy5waWdneS5nemlwLm8udG1w?=
 =?utf-8?Q?=22?= then succeeds
Message-ID: <20160111082603.GA24950@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz, linux-kbuild@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>

Hi!

Ok, I guess it is second time I see it.

This time it is while cross-compiling 4.0 kernel on 4.4-rc5. Failure
is:

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

I'm building it like this...

eval ` eldk-switch.sh -r 5.4 armv7a`
ARCH=arm long make -j 3 zImage uImage LOADADDR=0x8000  && \

It builds ok after re-run. Is building zImage and uImage at the same
time bad idea?

pavel@duo:~/stahl/linux$ ./mkit
Setup for armv7a (using ELDK 5.4)
25205 (process ID) old priority 0, new priority 10
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
make took 0 minutes 37 seconds

Any other ideas?

Thanks,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
