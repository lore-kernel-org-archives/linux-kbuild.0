Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:43681 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752034Ab2LIQOr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 9 Dec 2012 11:14:47 -0500
Message-ID: <50C4B8F3.6030704@suse.cz>
Date: Sun, 09 Dec 2012 17:14:43 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Makefile race between jobs
References: <264C179F799EF24AB26D5319053335E80CC3049A10@ezexch.ezchip.com>
In-Reply-To: <264C179F799EF24AB26D5319053335E80CC3049A10@ezexch.ezchip.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Noam Camus <noamc@ezchip.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

On 16.11.2012 14:40, Noam Camus wrote:
> Hello Michael,
> 
> Here is my patch for dealing with race between 2 jobs of primary Makefile:
> 
> From 697f6ffa0d67b676fc2d75f65541c6e12108829d Mon Sep 17 00:00:00 2001
> From: Noam Camus <noamc@ezchip.com>
> Date: Fri, 16 Nov 2012 15:12:48 +0200
> Subject: [PATCH] Makefile: solve race between make jobs.
> 
> Fix occasionally compilation failures when source tree is distcleaned.
> The compilation is failing over file scripts/mod/empty.c
> 
> The error is because empty.o depends on some headers from:
> 	 arch/<arch>/include/generated/asm/
> 
> I see that there is a race between two targets in main Makefile (j=2):
> 	1) asm-generic
> 	2) scripts_basic
> 
> asm-generic:
> 	generates all wrappers in atch/<arch>/include/generated/asm/
> 
> scripts_basic:
> 	calls scripts/Makefile.build
> 	--> performs target __build
> 		--> depends on targets defined at variable $(always)
> 			--> compile scripts/mod/empty.c

Can you explain this dependency? scripts/basic/fixdep.c is supposed to
not depend on _anything_, because the script is subsequently used for
any compilation. And scripts/mod/empty.c is only built when visiting
scripts/mod:

$ arch
x86_64
$ mkdir /dev/shm/_build
$ make O=/dev/shm/_build defconfig
  HOSTCC  scripts/basic/fixdep
...
# At this point, scripts_basic has already been done, but just for sure
$ make O=/dev/shm/_build scripts_basic
  GEN     /dev/shm/_build/Makefile
scripts/kconfig/conf --silentoldconfig Kconfig
# Yet
$ ls /dev/shm/_build/scripts/mod
ls: cannot access /dev/shm/_build/scripts/mod: No such file or directory

If you are seeing something different, please tell which architecture
and which configuration.

Michal
