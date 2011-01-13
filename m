Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:37765 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752713Ab1AMJOf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 13 Jan 2011 04:14:35 -0500
Received: by bwz15 with SMTP id 15so1326412bwz.19
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Jan 2011 01:14:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20110112214536.f8f9ac93.rdunlap@xenotime.net>
References: <AANLkTi=XeygsSSM8Yx+VaznC0MPfP8Ptw7oN1MHBrH+a@mail.gmail.com>
	<20110112214536.f8f9ac93.rdunlap@xenotime.net>
Date: Thu, 13 Jan 2011 10:14:32 +0100
Message-ID: <AANLkTimTP--fabHNo_48m3B9-jU0=-39O51ZLjpQ7pLz@mail.gmail.com>
Subject: Re: Building an external x86_64 module from an x86 (32-bit) machine?
From: Philippe Auphelle <pauphelle@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org

Randy,

> AFAIK, it's just a matter of having a 64-bit compiler available.
> Most 32-bit distros that I know of just have a 32-bit compiler available,
> so you would need a "cross-compiler" for 64-bit code generation on a
> 32-bit host, whereas on a 64-bit host, gcc can build 32-bit code or
> 64-bit code.  But I'm no expert on this.

In fact, with the x86 architecture, the same (recent) gcc compiler
and/or ld (both 32-bit or 64-bit binaries) support both 32-bit and
64-bit code generation and linking, without requiring a separate cross
compiling toolchain. I tracked that feature a few days ago to some
(two or three years old) welcome addition to the gcc toolchain.

All it takes is using the -m32 or -m64 parm, such as in
$ gcc -m64 -o nldplug64 main.c

At worst, it's just a matter of having the right includes and libs
available in the compile and link paths (compiling to 64-bit userland
from a 32-bit debian, adding the libc6-amd64.deb, libc6-dev-amd64.deb
and possibly g++4.4-multilib.deb packages might definitly help in that
matter). But the point is that x86 gcc and ld now inherently support
dual-bitness, no extra cross-compiler required.

OTOH, I think Arnaud is very right and there is something I didn't do
(and should have). I did the config, but didn't do any prepare, and
that looks like a very good clue.
I'll post the results back here if/when I find the right trick(s).  /PhA.
