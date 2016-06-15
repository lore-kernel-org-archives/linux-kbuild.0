Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:62030 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752578AbcFOPkp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Jun 2016 11:40:45 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] Kbuild: don't add obj tree in additional includes
Date: Wed, 15 Jun 2016 17:42:07 +0200
Message-ID: <12307786.ur6o1LYuVt@wuerfel>
In-Reply-To: <201606140609.AQumlVjN%fengguang.wu@intel.com>
References: <201606140609.AQumlVjN%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday, June 14, 2016 6:42:16 AM CEST kbuild test robot wrote:
>    kernel/time/Kconfig:155:warning: range is invalid
>    In file included from arch/x86/include/asm/seccomp.h:4:0,
>                     from include/linux/seccomp.h:11,
>                     from include/linux/sched.h:43,
>                     from arch/x86/um/shared/sysdep/kernel-offsets.h:2,
>                     from arch/um/kernel/asm-offsets.c:1:
> >> arch/x86/include/asm/unistd.h:15:29: fatal error: asm/unistd_32.h: No such file or directory
>     #  include <asm/unistd_32.h>

Clearly this version was no good, I'm following up with a (longer) replacement,
let's see how that works out.

	Arnd
