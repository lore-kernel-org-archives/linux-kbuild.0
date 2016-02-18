Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:59375 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1425384AbcBRKgg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 18 Feb 2016 05:36:36 -0500
Subject: Re: [PATCH] modpost: allow modpost to fail on warnings
References: <1455747939-34515-1-git-send-email-filbranden@google.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <56C59EB2.6080207@suse.com>
Date: Thu, 18 Feb 2016 11:36:34 +0100
MIME-Version: 1.0
In-Reply-To: <1455747939-34515-1-git-send-email-filbranden@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Filipe Brandenburger <filbranden@google.com>
Cc: linux-kbuild@vger.kernel.org, Greg Thelen <gthelen@google.com>, Michael Davidson <md@google.com>, Eugene Surovegin <surovegin@google.com>

On 2016-02-17 23:25, Filipe Brandenburger wrote:
> Set KBUILD_MODPOST_FAIL_ON_WARNINGS to a non-empty value to make the
> kbuild fail when modpost generates any warnings.
> 
> Tested:
>   Replaced ntp_clear() with ntp_init() in kernel/time/timekeeping.c,
>   which produces a modpost warning since the latter is marked __init.
>   Confirmed that the build failed with a hard error.
> 
>   $ make bzImage modules KBUILD_MODPOST_FAIL_ON_WARNINGS=1
>     CHK     include/config/kernel.release
>     CHK     include/generated/uapi/linux/version.h
>     CHK     include/generated/utsrelease.h
>     CHK     include/generated/bounds.h
>     CHK     include/generated/timeconst.h
>     CHK     include/generated/asm-offsets.h
>     CALL    scripts/checksyscalls.sh
>     CHK     include/generated/compile.h
>     CC      kernel/time/timekeeping.o
>     LD      kernel/time/built-in.o
>     LD      kernel/built-in.o
>     LINK    vmlinux
>     LD      vmlinux.o
>     MODPOST vmlinux.o
>   WARNING: modpost: Found 1 section mismatch(es).
>   To see full details build your kernel with:
>   'make CONFIG_DEBUG_SECTION_MISMATCH=y'
>   scripts/Makefile.modpost:100: recipe for target 'vmlinux.o' failed
>   make[1]: *** [vmlinux.o] Error 2
>   Makefile:936: recipe for target 'vmlinux' failed
>   make: *** [vmlinux] Error 2

This is not a good test case, because we already fail here if
CONFIG_SECTION_MISMATCH_WARN_ONLY=n.

Michal
