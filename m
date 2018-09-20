Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 4.mo1.mail-out.ovh.net ([46.105.76.26]:33628 "EHLO
        4.mo1.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387557AbeITS7P (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Sep 2018 14:59:15 -0400
Received: from player690.ha.ovh.net (unknown [10.109.160.54])
        by mo1.mail-out.ovh.net (Postfix) with ESMTP id A68DC12B9D8
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Sep 2018 14:36:35 +0200 (CEST)
From: =?UTF-8?Q?Piotr_Kr=c3=b3l?= <piotr.krol@3mdeb.com>
Subject: Multi-threaded build on 4.14.122 return code 2 for some
 configurations
Message-ID: <5c391704-3404-987e-0f56-f3274c310edc@3mdeb.com>
Date: Thu, 20 Sep 2018 14:36:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, Maciej Pijanowski <maciej.pijanowski@3mdeb.com>

Hi all,
I'm trying to automate longterm stable compilation for validation needs,
but facing issue with mutli-threaded compilation of 4.14.122 (and other
version).

Reproduction procedure:
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.9.122.tar.gz
tar xvf linux-4.9.122.tar.gz
cd linux-4.9.122
make mrproper
wget
https://raw.githubusercontent.com/pcengines/apu2-documentation/master/configs/config-4.14.59
-O .config
make olddefconfig
make -j$(nproc) deb-pkg bzImage
echo $?

I'm getting 2 despite all components built correctly. When I do not
define jobs:
make deb-pkg bzImage

Return code is 0. I have this effect not only for my custom config -
looks like x86_64_defconfig also have similar problem.

In failing case (for my config) in logs I see something like:

(...)
ld: cannot find arch/x86/kernel/cpu/mshyperv.o: No such file or
directory

make[3]: *** [scripts/Makefile.build:449:
arch/x86/kernel/cpu/built-in.o] Error 1


make[2]: *** [scripts/Makefile.build:547: arch/x86/kernel/cpu] Error 2


  LD      drivers/xen/built-in.o


make[1]: *** [scripts/Makefile.build:547: arch/x86/kernel] Error 2


make: *** [Makefile:1008: arch/x86] Error 2


make: *** Waiting for unfinished jobs....


ld: cannot find drivers/xen/cpu_hotplug.o: No such file or directory


ld: cannot find drivers/xen/fallback.o: No such file or directory


ld: cannot find drivers/xen/grant-table.o: No such file or directory


ld: cannot find drivers/xen/features.o: No such file or directory


ld: cannot find drivers/xen/balloon.o: No such file or directory


ld: cannot find drivers/xen/manage.o: No such file or directory


ld: cannot find drivers/xen/preempt.o: No such file or directory


ld: cannot find drivers/xen/time.o: No such file or directory


make[2]: *** [scripts/Makefile.build:449: drivers/xen/built-in.o] Error
1

make[1]: *** [scripts/Makefile.build:547: drivers/xen] Error 2


make: *** [Makefile:1008: drivers] Error 2
make KBUILD_SRC=

So it looks like build system tries to link objects which are not built
yet. What would be best way to fix that behavior?

Make version:
GNU Make 4.2.1
Built for x86_64-pc-linux-gnu

gcc:
gcc (Debian 8.2.0-7) 8.2.0

ld:
GNU ld (GNU Binutils for Debian) 2.31.1

Full log with errors for make defconfig: https://pastebin.com/hMadtLeU
Full log with errors for my custom config: https://pastebin.com/Kmbjm0qJ

Best Regards,
-- 
Piotr Król
Embedded Systems Consultant
https://3mdeb.com | @3mdeb_com
