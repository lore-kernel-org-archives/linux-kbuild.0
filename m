Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:52308 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754812AbcAYNWS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Jan 2016 08:22:18 -0500
Subject: Re: Dependency issue through subdir's
References: <56A6080C.2070006@kbingham.co.uk>
From: Michal Marek <mmarek@suse.com>
Message-ID: <56A62187.3070805@suse.com>
Date: Mon, 25 Jan 2016 14:22:15 +0100
MIME-Version: 1.0
In-Reply-To: <56A6080C.2070006@kbingham.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kieran Bingham <kieran@kbingham.co.uk>
Cc: linux-kbuild@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>, Lee Jones <lee.jones@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On 2016-01-25 12:33, Kieran Bingham wrote:
> This is functional on a make -j1 build, however at -j2 and above (from a
> clean build), kbuild attempts to generate my file before
> include/generated/timeconst.h resulting in the following error:
> 
> --- 8< ---
>   GEN     scripts/gdb/linux/constants.py
> In file included from sources/linux/include/linux/ktime.h:25:0,
>                  from /linux/include/linux/rcupdate.h:47,
>                  from /linux/include/linux/rbtree.h:34,
>                  from /linux/include/linux/mm_types.h:9,
>                  from /linux/arch/x86/include/asm/pgtable.h:448,
>                  from /linux/scripts/gdb/linux/constants.py.in:16:
> sources/linux/include/linux/jiffies.h:10:33: fatal error:
> generated/timeconst.h: No such file or directory
> --- >8 ---
[...]
> 2) Move the code that generates this file to /Kbuild. However I don't
> like the idea of putting non-essential generator at the top level build

You can keep the code in scripts/gdb/..., just move it out of $(always)
and have the toplevel Kbuild file call something like

  $(MAKE) $(obj)=scripts/gdb/linux build_constants


> 3) Add #ifndef __GENERATE_CONSTANTS_PY__ across any reference to
> generated header files, such as in ktime.h, and define that with my
> Preprocessor statement.

If you do not need the generated headers, this might be the least evil.
We already have the COMPILE_OFFSETS and __GENERATING_BOUNDS_H defines
for a similar purpose.

Michal
