Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:48836 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751357Ab1AXKfJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 24 Jan 2011 05:35:09 -0500
Received: by bwz15 with SMTP id 15so3402712bwz.19
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Jan 2011 02:35:08 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 24 Jan 2011 11:35:08 +0100
Message-ID: <AANLkTikjYfjKjZX9U5sdCNtPHwu52qayueSV0+jzt+zW@mail.gmail.com>
Subject: arch/x86/Makefile kbuild problem
From: Philippe Auphelle <pauphelle@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi All,

Building an x86_64 external module from an x86 (32-bit) Linux 2.6.35,
I get a "stack protector enabled but no compiler support" error.
I'm by no way a kbuild (or even make) specialist, but it looks to me
like the problem is this:

The error is produced in arch/x86/Makefile, line 81.

Looking further, it looks like this code relies on $(biarch) being set
to the CC bitness parm (-m32 / -m64) to call the cc_has_sp detection
script (line 77).
Problem is, $(biarch) is only set (to -m32) when CONFIG_X86_32 is set
(line 20), but *not* when the else clause is taken (-m64 option is
directly set then in KBUILD_AFLAGS and KBUILD_CFLAGS then, (lines
49-50) ).
As a result, the detection scripts always fails.

replacing lines 49-50 by something like:
        biarch := $(call cc-option,-m64)
        KBUILD_AFLAGS += $(biarch)
        KBUILD_CFLAGS += $(biarch)

solves the problem.

I just checked with the latest 2.6.37, and arch/x86/Makefile hasn't
changed since 2.6.35 (at least not in that part of the file).

Questions are:
- Could someone more knowledgeable than me in that matter be kind
enough to confirm that this is truely the problem (and a valid
solution)?
and if so,
- Is this the right place to report it to get it eventually fixed?
(and if it ain't, where should it be?)

TIA! /Ph.
