Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail29.messagelabs.com ([216.82.249.147]:59093 "HELO
	mail29.messagelabs.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753706AbYBGH43 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Feb 2008 02:56:29 -0500
Date: Thu, 7 Feb 2008 08:56:25 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <Uwe.Kleine-Koenig@digi.com>
Subject: Re: Problems with parallel building
Message-ID: <20080207075625.GA6757@digi.com>
References: <20080205142343.GA9448@digi.com> <20080206215100.GA12348@uranus.ravnborg.org> <20080207064015.GA5235@digi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080207064015.GA5235@digi.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

Uwe Kleine-König wrote:
> Hi Sam,
> 
> Sam Ravnborg wrote:
> > On Tue, Feb 05, 2008 at 03:23:43PM +0100, Uwe Kleine-König wrote:
> > > Hello,
> > > 
> > > using v2.6.24-7284-g9ef9dc6 (plus some patches that shouldn't affect
> > > kbuild) I have problems with parallel building (make -j 3).  Sometimes
> > > the build fails, the error isn't always the same.
> > 
> > Hi Uwe.
> > 
> > Is this new behaviour?
> I'm not sure, because I only recently created some scripts that use -j 3
> and use them frequently.  I'd say it started around 2.6.23 ...
> 
> > If it is it would be nice if you could bisect when it happened.
> > One suspect could be:
> > 18c32dac75b187d1a4e858f3cfdf03e844129f5e
> > or
> > 0b35786d77ba4037f181982cc8ca20a7a3bf0fd2
> ... which could match the latter.
> 
> > but they should only be relevant when you use O=...
> I do use O=...
> 
> I will try to bisect it and let you know.
With e.g. v2.6.21 it's even worse.  I get for each build:

	...
	CRC32c (Castagnoli, et al) Cyclic Redundancy-Check (LIBCRC32C) [N/m/y/?] n
	#
	# configuration written to .config
	#
	  GEN     /home/ukleinek/tmp/buildtest/obj/Makefile
	  GEN     /home/ukleinek/tmp/buildtest/obj/Makefile
	  GEN     /home/ukleinek/tmp/buildtest/obj/Makefile
	scripts/kconfig/conf -s arch/arm/Kconfig
	scripts/kconfig/conf -s arch/arm/Kconfig
	scripts/kconfig/conf -s arch/arm/Kconfig
	  CHK     include/linux/version.h
	  UPD     include/linux/version.h
	  SYMLINK include/asm-arm/arch -> include/asm-arm/arch-ns9xxx
	  CHK     include/linux/version.h
	  CHK     include/linux/version.h
	  GEN     /home/ukleinek/tmp/buildtest/obj/Makefile
	  GEN     /home/ukleinek/tmp/buildtest/obj/Makefile
	  CHK     include/linux/utsrelease.h
	  UPD     include/linux/utsrelease.h
	make[2]: `/home/ukleinek/tmp/buildtest/linux-2.6/include/asm-arm/mach-types.h' is up to date.
	  Using /home/ukleinek/tmp/buildtest/linux-2.6 as source for kernel
	  /home/ukleinek/tmp/buildtest/linux-2.6 is not clean, please run 'make mrproper'
	  in the '/home/ukleinek/tmp/buildtest/linux-2.6' directory.
	make[1]: *** [prepare3] Error 1
	make: *** [uImage] Error 2
	make: *** Waiting for unfinished jobs....
	  CHK     include/linux/utsrelease.h
	make[2]: `/home/ukleinek/tmp/buildtest/linux-2.6/include/asm-arm/mach-types.h' is up to date.
	  Using /home/ukleinek/tmp/buildtest/linux-2.6 as source for kernel
	  /home/ukleinek/tmp/buildtest/linux-2.6 is not clean, please run 'make mrproper'
	  in the '/home/ukleinek/tmp/buildtest/linux-2.6' directory.
	make[1]: *** [prepare3] Error 1
	make: *** [zImage] Error 2
	  GEN     /home/ukleinek/tmp/buildtest/obj/Makefile
	  CHK     include/linux/utsrelease.h
	make[2]: `/home/ukleinek/tmp/buildtest/linux-2.6/include/asm-arm/mach-types.h' is up to date.
	  Using /home/ukleinek/tmp/buildtest/linux-2.6 as source for kernel
	  /home/ukleinek/tmp/buildtest/linux-2.6 is not clean, please run 'make mrproper'
	  in the '/home/ukleinek/tmp/buildtest/linux-2.6' directory.
	make[1]: *** [prepare3] Error 1
	make: *** [Image] Error 2
	make: INTERNAL: Exiting with 4 jobserver tokens available; should be 3!

The result is the same for v2.6.22 and v2.6.23.

Bisecting this yielded 0b35786d77ba4037f181982cc8ca20a7a3bf0fd2.

The script used for building is:

	#! /bin/bash -e

	seq -w 1 100 | while read i; do 
		echo "********************* run $i *************************";

		rm -rf ../obj;
		mkdir ../obj;

		delmake O=../obj ns9xxx_defconfig;

		if ! delmake O=../obj -j 3 uImage zImage Image; then
			break;
		fi;
	done;

Best regards
Uwe

-- 
Uwe Kleine-König, Software Engineer
Digi International GmbH Branch Breisach, Küferstrasse 8, 79206 Breisach, Germany
Tax: 315/5781/0242 / VAT: DE153662976 / Reg. Amtsgericht Dortmund HRB 13962
