Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:40242 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752287Ab1BJOfL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Feb 2011 09:35:11 -0500
Message-ID: <4D53F79D.3050001@suse.cz>
Date: Thu, 10 Feb 2011 15:35:09 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: arch/x86/Makefile kbuild problem
References: <AANLkTikjYfjKjZX9U5sdCNtPHwu52qayueSV0+jzt+zW@mail.gmail.com>
In-Reply-To: <AANLkTikjYfjKjZX9U5sdCNtPHwu52qayueSV0+jzt+zW@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Philippe Auphelle <pauphelle@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 24.1.2011 11:35, Philippe Auphelle wrote:
> Hi All,
> 
> Building an x86_64 external module from an x86 (32-bit) Linux 2.6.35,
> I get a "stack protector enabled but no compiler support" error.
> I'm by no way a kbuild (or even make) specialist, but it looks to me
> like the problem is this:
> 
> The error is produced in arch/x86/Makefile, line 81.
> 
> Looking further, it looks like this code relies on $(biarch) being set
> to the CC bitness parm (-m32 / -m64) to call the cc_has_sp detection
> script (line 77).
> Problem is, $(biarch) is only set (to -m32) when CONFIG_X86_32 is set
> (line 20), but *not* when the else clause is taken (-m64 option is
> directly set then in KBUILD_AFLAGS and KBUILD_CFLAGS then, (lines
> 49-50) ).
> As a result, the detection scripts always fails.
> 
> replacing lines 49-50 by something like:
>         biarch := $(call cc-option,-m64)
>         KBUILD_AFLAGS += $(biarch)
>         KBUILD_CFLAGS += $(biarch)

I think you can omit the cc-option call and simply set biarch := -m64,
because the gcc x86_64 target always had the -m64 option.
> 
> solves the problem.
> 
> I just checked with the latest 2.6.37, and arch/x86/Makefile hasn't
> changed since 2.6.35 (at least not in that part of the file).
> 
> Questions are:
> - Could someone more knowledgeable than me in that matter be kind
> enough to confirm that this is truely the problem (and a valid
> solution)?
> and if so,
> - Is this the right place to report it to get it eventually fixed?
> (and if it ain't, where should it be?)

You should send a proper patch (refer to
Documentation/SubmittingPatches) to lkml and the people under the "X86
ARCHITECTURE (32-BIT AND 64-BIT)" entry in the MAINTAINERS file.

Michal
