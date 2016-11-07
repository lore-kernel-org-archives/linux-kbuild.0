Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from imap.thunk.org ([74.207.234.97]:54510 "EHLO imap.thunk.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750946AbcKGGaw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Nov 2016 01:30:52 -0500
Date: Mon, 7 Nov 2016 01:30:15 -0500
From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: -fno-PIE, take #3
Message-ID: <20161107063015.s7j6wpimj5himjp2@thunk.org>
References: <20161104183940.30692-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161104183940.30692-1-bigeasy@linutronix.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Ben Hutchings <ben@decadent.org.uk>, Sven Joachim <svenjoac@gmx.de>, "Austin S. Hemmelgarn" <ahferroin7@gmail.com>, Borislav Petkov <bp@alien8.de>

On Fri, Nov 04, 2016 at 07:39:37PM +0100, Sebastian Andrzej Siewior wrote:
> Debian gcc's is nowdays compiled with --enable-default-pie which means it does
> -fPIE by default. This breaks atleast x86-64 compiles.
> This is the third attempt to fix it, this time by using runtime detection of
> the -fno-PIE compiler switch (it was introduced in gcc 3.4, min required gcc is
> currently 3.2) so it can be backported to the stable kernels.
> As noted by Al this won't fix `git bisect' of stable kernels prio this commit.
> However using always a wrapper around gcc which adds -fno-PIE is not sollution
> I want to rely in future.

A wrapper around gcc which adds -fno-PIE doesn't work for the HOSTCC
builds, anyway:

% gcc -fno-PIE -o /tmp/hello /tmp/hello.c
/usr/bin/ld: /tmp/cckzDf9X.o: relocation R_X86_64_32 against `.rodata' can not be used when making a shared object; recompile with -fPIC
/usr/bin/ld: final link failed: Nonrepresentable section on output
collect2: error: ld returned 1 exit status

Alas, the only workaround I've found which doesn't involve bisecting
the kernel is to add "CC=gcc-5" to the Makefile invocation (assuming
gcc-5 is installed of course).

					- Ted
					

