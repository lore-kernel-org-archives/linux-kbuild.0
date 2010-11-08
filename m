Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:57607 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752720Ab0KHSmP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Nov 2010 13:42:15 -0500
From: Ben Gamari <bgamari.foss@gmail.com>
Subject: Re: fstat suddenly return -EINVAL [Was: Bus error on make allyesconfig, kernelbuild with HEAD]
In-Reply-To: <20101108182209.GA26742@merkur.ravnborg.org>
References: <87d3qicwxn.fsf@gmail.com> <87aalmcv0p.fsf@gmail.com> <20101106162426.GA14361@merkur.ravnborg.org> <87tyjtjd7m.fsf@gmail.com> <20101107170700.GA22684@merkur.ravnborg.org> <87mxplypid.fsf@gmail.com> <20101107223056.GA23871@merkur.ravnborg.org> <87lj54raw3.fsf@gmail.com> <20101108101920.GA5527@cr0.nay.redhat.com> <87d3qgq9ca.fsf@gmail.com> <20101108182209.GA26742@merkur.ravnborg.org>
Date: Mon, 08 Nov 2010 13:42:10 -0500
Message-ID: <87d3qfejy5.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: =?utf-8?Q?Am=C3=A9rico?= Wang <xiyou.wangcong@gmail.com>, Christoph Egger <siccegge@cs.fau.de>, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

On Mon, 8 Nov 2010 19:22:09 +0100, Sam Ravnborg <sam@ravnborg.org> wrote:
> Hi Ben - interesting information.
> 
> Do you see that this bug trigger for the same file always?
> You could try to print out the filename if fstat fails.
>
fstat appears to be failing for every file (the file= line is printed
right before the fstat; there seems to be a corresponding error for
every file= so I'm inferring that it must always fail):

$ make
  HOSTCC  scripts/basic/fixdep
file=scripts/basic/.fixdep.d
fixdep: fstat failed: Invalid argument
  HOSTCC  scripts/basic/docproc
file=scripts/basic/.docproc.d
fixdep: fstat failed: Invalid argument
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/kxgettext.o
file=scripts/kconfig/.conf.o.d
fixdep: fstat failed: Invalid argument
file=scripts/kconfig/.kxgettext.o.d
fixdep: fstat failed: Invalid argument
  HOSTCC  scripts/kconfig/zconf.tab.o
file=scripts/kconfig/.zconf.tab.o.d
fixdep: fstat failed: Invalid argument
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf --silentoldconfig Kconfig
***
*** Configuration file ".config" not found!
***
*** Please run some configurator (e.g. "make oldconfig" or
*** "make menuconfig" or "make xconfig").
***
make[2]: *** [silentoldconfig] Error 1
make[1]: *** [silentoldconfig] Error 2
make: *** No rule to make target `include/config/auto.conf', needed by `include/config/kernel.release'.  Stop.

> If this happens while accessing the same file then try to
> check if this file has any special permissions / security settings.
> [I looked a bit on the kernel side of fstat() and it looked
> like a security check could result in EINVAL].
>
> Again if it is always the same file try if you can read it
> using less/vi.
> 
It actually seems as if the problem might be that none of these files
actually exist:

$ find scripts -iname .*.d
$

How are .d files supposed to be generated?


> From your previous posting it looks like you have some special setting
> that impact your choice of HOST gcc.
> Do you define HOSTCC somewhere?
> 
I don't think I do define HOSTCC anywhere. My cross compilation
environment is as follows,

source /usr/local/angstrom/arm/environment-setup
export ARCH=arm
export CROSS_COMPILE=arm-angstrom-linux-gnueabi-
export CC=${CROSS_COMPILE}gcc
export CXX=${CROSS_COMPILE}g++

OE_ENV_ROOT=/home/bgamari/OE/angstrom-dev
SYSROOT=$OE_ENV_ROOT/sysroots/armv7a-angstrom-linux-gnueabi
export LD_LIBRARY_PATH=$SYSROOT/lib:$SYSROOT/usr/lib
export CFLAGS=-I$OE_ROOT/lib/gcc/arm-angstrom-linux-gnueabi/4.3.1/include

