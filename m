Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:32991 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751359AbcLJHXA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Dec 2016 02:23:00 -0500
Date: Sat, 10 Dec 2016 16:23:05 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [regression ?] kbuild: fix building bzImage with
 CONFIG_TRIM_UNUSED_KSYMS enabled
Message-ID: <20161210072305.GA6394@jagdpanzerIV.localdomain>
References: <20161209024357.GB4661@jagdpanzerIV.localdomain>
 <20161209025637.GC4661@jagdpanzerIV.localdomain>
 <alpine.LFD.2.20.1612082235510.1657@knanqh.ubzr>
 <20161209045857.GD4661@jagdpanzerIV.localdomain>
 <alpine.LFD.2.20.1612091302540.1657@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.20.1612091302540.1657@knanqh.ubzr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Jarod Wilson <jarod@redhat.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

On (12/09/16 13:07), Nicolas Pitre wrote:
[..]
> > build:
> > make -j4 > build_log 2>&1
> > 
> > package:
> > make -j4 INSTALL_MOD_PATH="${pkgdir}" modules_install >> build_log 2>&1
> 
> Weird.

it is. sorry for long reply, it took me some time to track it down.
turned out, the script also does `prepare' and `kernelrelease'. so
the sequence of commands in my build script is

	make prepare
	make kernelrelease
# functon build
	make -j4
# finction package
	make -j4 INSTALL_MOD_PATH=XXXX modules_install


now. the problem here is that, apparently, and I didn't know that,
"make prepare" and "make kernelrelease" are executed twice.

- first time when I build the kernel
 make prepare
 make kernelrelease
 make -j4

- second time when I install the modules
 make prepare
 make kernelrelease
 make -j4 INSTALL_MOD_PATH=XXXX modules_install


so this will not install modules:
 make prepare; make kernelrelease; make -j4; make prepare; make kernelrelease; make -j4 INSTALL_MOD_PATH=/tmp/MODULES modules_install

and this will:
 make prepare; make kernelrelease; make -j4; make kernelrelease; make -j4 INSTALL_MOD_PATH=/tmp/MODULES modules_install


> You must have CONFIG_TRIM_UNUSED_KSYMS=y in your .config, right?

yes.

> What if you set it to n instead without reverting 865563924022d8. Do you 
> still have the same issue?

!CONFIG_TRIM_UNUSED_KSYMS or !865563924022d8 builds just fine with extra
`make prepare'.
no `extra make prepare' builds ok regardless the state of Makefile/config
files.

I guess you don't need my .config any more.

	-ss
