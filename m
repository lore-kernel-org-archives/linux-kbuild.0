Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from tartarus.angband.pl ([89.206.35.136]:35592 "EHLO
        tartarus.angband.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753217AbcLKAwX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Dec 2016 19:52:23 -0500
Date: Sun, 11 Dec 2016 01:52:11 +0100
From: Adam Borowski <kilobyte@angband.pl>
Subject: [PATCH v3 0/1] asm prototypes for modversions on x86
Message-ID: <20161211005211.GA11607@angband.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>, Nicholas Piggin <npiggin@gmail.com>

Hi!
After Linus' revert of Arnd's modversions patch, it looks like we're back to
wanting asm-prototypes.h at least in the short term.  Things are much better
than before -- instead of failing to load modules there's just a scary
warning, but I still believe that no scary warning is better :)

Users will be stressed, waste their time looking for answer, etc -- and the
short-term fix is quite well researched and tested.  It's for x86 only, but
with arm ppc arm64 already dealt with, that handles about 99.9% of machines.

So I think it'd be good if you could apply this -- ideally for 4.9, if not
then at least 4.10.

There _is_ a modification since the last posted version: Ben Hutchings
pointed out that I missed one 486-only symbol.  Not surprising no one found
this during testing...

The diff from v2 is:
+#ifndef CONFIG_X86_CMPXCHG64
+extern void cmpxchg8b_emu(void);
+#endif

Note that this is already carried by Debian (Ben Hutchings' tree), so a
mainline fix for 4.9 would matter only for other distributions, not sure
which if any want to release with 4.9.


Meow!
-- 
u-boot problems can be solved with the help of your old SCSI manuals, the
parts that deal with goat termination.  You need a black-handled knife, and
an appropriate set of candles (number and color matters).  Or was it a
silver-handled knife?  Crap, need to look that up.
