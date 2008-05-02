Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from barikada.upol.cz ([158.194.242.200]:41333 "EHLO
	barikada.upol.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758438AbYEBLFA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 May 2008 07:05:00 -0400
Received: from flower (flower.upol.cz [158.194.64.22])
	by barikada.upol.cz (Spam Firewall) with ESMTP id 72EB01242D0
	for <linux-kbuild@vger.kernel.org>; Fri,  2 May 2008 13:04:46 +0200 (CEST)
Received: from flower (flower.upol.cz [158.194.64.22]) by barikada.upol.cz with ESMTP id 9IvM6fyzYyxydYPe for <linux-kbuild@vger.kernel.org>; Fri, 02 May 2008 13:04:46 +0200 (CEST)
Received: from olecom by flower with local (Exim 4.63)
	(envelope-from <olecom@flower.upol.cz>)
	id 1JrtOk-0002ML-28
	for linux-kbuild@vger.kernel.org; Fri, 02 May 2008 13:25:54 +0200
Date: Fri, 2 May 2008 13:25:54 +0200
Subject: source processing-friendly scripting
Message-ID: <20080502112554.GX24008@flower.upol.cz>
References: <20080501165333.GG29330@cs181133002.pp.htv.fi> <33623.81.193.128.196.1209661842.squirrel@galactus.symlabs.net> <20080501191714.GM29330@cs181133002.pp.htv.fi> <20080501213952.GA8281@uranus.ravnborg.org> <20080501220747.GV29330@cs181133002.pp.htv.fi> <52649.81.193.128.196.1209689622.squirrel@galactus.symlabs.net> <8499950a0805011848h713606e3mda5dd2aed31dfa91@mail.gmail.com> <20080502060813.GB19090@uranus.ravnborg.org> <20080502105620.GW24008@flower.upol.cz> <20080502104211.GB20741@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080502104211.GB20741@uranus.ravnborg.org>
From: Oleg Verych <olecom@flower.upol.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Sam Ravnborg (kbuild list)" <linux-kbuild@vger.kernel.org>

Sam Ravnborg @ Fri, May 02, 2008 at 12:42:11PM +0200:
[]
> > ,-- Message-ID: <Pine.LNX.4.64.0702082335150.14457@scrub.home> --
> > |It would make casual kbuild hacking only even more difficult, as one has
> > |to check it works with the various shells.
> > `--
> This is still true. But we start to see a few more people reporting issues
> with non-standard Linux systems (busy-box, cygwin, sun) so there is a 
> need and there is a tester base.

Even if i will have my extended `sh` (as you may saw in dash list),
it's quite easy to make portability modules for any tools used.

But this is the case only if source/script is not a concrete -- i.e. is
written is the way friendly for text-processing tools, thus clear
plain-text transformations of source can be possible. This is not the
case of `make` and requires experience as in scripting as in design.

> And any strightforward looking patches will be applied - when eventual
> feedback has been incorporated.

I've shown readable `sed` for cases other than MIPS. MIPS requires
more cleanup of all that manual "#define" stuff.

,-- arch/mips/kernel/asm-offsets.c --
|        text("/* MIPS pt_regs offsets. */");
|        offset("#define PT_R0     ", struct pt_regs, regs[0]);
`--

Anyone, who wants to have some understanding of basic things:

* processing of plain text
* gcc/assembler generation
* kbuild

may take it and have ``fun''.

> I will not promise to check for non-linux compliance but testers are welcome.
> 
> 	Sam
____
