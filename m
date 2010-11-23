Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:60721 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932383Ab0KWBPZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Nov 2010 20:15:25 -0500
Received: by qwc9 with SMTP id 9so1495431qwc.19
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Nov 2010 17:15:24 -0800 (PST)
From: Ben Gamari <bgamari.foss@gmail.com>
Subject: Kernel build under meta-toolchain SDK fails
Date: Mon, 22 Nov 2010 20:15:20 -0500
Message-ID: <87y68kx2l3.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: openembedded-devel@lists.openembedded.org
Cc: =?utf-8?Q?Am=C3=A9rico?= Wang <xiyou.wangcong@gmail.com>, Christoph Egger <siccegge@cs.fau.de>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hey all,

Recently I tried updating our openembedded environment for an embedded
application built around the BeagleBoard. Unfortunately, the build
failed while configuring the kernel with an inexplicable bus error. To
trace down the issue I installed the latest meta-toolchain sdk and tried
building a kernel. This resulted in an identical failure,

$ make
  HOSTCC  scripts/basic/fixdep
In file included from /usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/include/stdlib.h:903,
                 from scripts/basic/fixdep.c:112:
/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/include/bits/stdlib.h:65: warning: no previous prototype for ‘ptsname_r’
/bin/sh: line 1:  4192 Bus error               scripts/basic/fixdep scripts/basic/.fixdep.d scripts/basic/fixdep 'gcc -Wp,-MD,scripts/basic/.fixdep.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer     -o scripts/basic/fixdep scripts/basic/fixdep.c  ' > scripts/basic/.fixdep.tmp
make[2]: *** [scripts/basic/fixdep] Error 135
make[1]: *** [scripts_basic] Error 2
make: *** No rule to make target `include/config/auto.conf', needed by `include/config/kernel.release'.  Stop.

The problem is quite early in the build since even make oldconfig fails
in this way. I tried tracking down the bug on the LKML[1] but after some
discussion it seems very likely the problem is a toolchain issue. At
least part of the problem seems to be in fixdep, which fails very
strangely in fstat[2]. I've done quite a bit of debugging[2], but it
seems to be a bit of a heisenbug.

Interestingly enough, I can reproduce the issue both on my personal
laptop (running Ubuntu 10.10, gcc 4.4.5) and our build server (running
Ubuntu 10.04, gcc 4.4.3). It would be great if someone could try
building a kernel from master using openembedded master. Otherwise, any
ideas would be greatly appreciated.

Cheers,

- Ben


[1] http://lkml.org/lkml/2010/11/6/90
[2] http://lkml.org/lkml/2010/11/7/78
