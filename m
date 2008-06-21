Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:59068 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752282AbYFUWGT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 21 Jun 2008 18:06:19 -0400
Date: Sun, 22 Jun 2008 00:07:03 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Support arch/$ARCH/include in kbuild
Message-ID: <20080621220703.GA12279@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>

Linus hinted that he liked to have all arch specific
header files moved from include/asm-$ARCH to
arch/$ARCH/include/asm.

The following two patches implement the basic support
for this.

I have used sparc for my testing and to some degree
I also used i386.

For sparc I just had to do a simple:

    mkdir -p arch/sparc/include/asm
    mv include/asm-sparc/* arch/sparc/include/asm

to build sparc with the new directory layout.

For i386 I had to do a few trivial path fixes in
arch/x86/Makefile and to fix the include of unistd_32.h
in one place to fix the build.

I expect a few additional bits to show up when people
start to move their header files but this should
be a good starting point.


To support arch/$ARCH/include/ was done in two steps.

First was to teach make headers_* about the new layout.
And second step was to get the build fixed with the new
layout.

Patches are on top of kbuild-next.git and follows.

	Sam
