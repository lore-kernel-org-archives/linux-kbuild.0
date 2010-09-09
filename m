Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:39596 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1753530Ab0IIXVe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Sep 2010 19:21:34 -0400
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Thu, 9 Sep 2010 16:21:23 -0700
Date: Thu, 9 Sep 2010 16:21:22 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: xconfig build error in linux-next??
Message-Id: <20100909162122.094a1e71.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

Beginning with linux-next of 20100902 (and later), I cannot build/use xconfig.

I see this after doing:

> mkdir xx64
> make ARCH=x86_64 O=xx64 defconfig

> make V=1 ARCH=x86_64 O=xx64 xconfig &

make -C /lnx/src/TMP/linux-next-20100902/xx64 \
	KBUILD_SRC=/lnx/src/TMP/linux-next-20100902 \
	KBUILD_EXTMOD="" -f /lnx/src/TMP/linux-next-20100902/Makefile \
	xconfig
make -f /lnx/src/TMP/linux-next-20100902/scripts/Makefile.build obj=scripts/basic
rm -f .tmp_quiet_recordmcount
ln -fsn /lnx/src/TMP/linux-next-20100902 source
/bin/sh /lnx/src/TMP/linux-next-20100902/scripts/mkmakefile \
	    /lnx/src/TMP/linux-next-20100902 /lnx/src/TMP/linux-next-20100902/xx64 2 6
  GEN     /lnx/src/TMP/linux-next-20100902/xx64/Makefile
mkdir -p include/linux include/config
make -f /lnx/src/TMP/linux-next-20100902/scripts/Makefile.build obj=scripts/kconfig xconfig
**Unknown**/moc -i /lnx/src/TMP/linux-next-20100902/scripts/kconfig/qconf.h -o scripts/kconfig/qconf.moc
/bin/sh: **Unknown**/moc: No such file or directory
make[2]: *** [scripts/kconfig/qconf.moc] Error 127
make[1]: *** [xconfig] Error 2
make: *** [sub-make] Error 2


Any ideas what happened?

thanks,
---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
