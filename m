Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:51436 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755105Ab1HGUlT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 7 Aug 2011 16:41:19 -0400
Date: Sun, 7 Aug 2011 21:41:18 +0100
From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: [RFC] possible killing of boilerplate headers by asm-generic reorg
Message-ID: <20110807204118.GA2203@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

	I'm not sure if it's a good idea, but it might be possible to
reduce the amount of boilerplate headers in arch/*/include/asm if we
do the following:
	1) move include/asm-generic to include/generic/asm and replace
all references to asm-generic with generic/asm
	2) add include/generic to search path for headers, right after
arch/*/include
	3) kill every arch/foo/include/asm/bar.h that has only
#include <generic/asm/bar.h>
in it.

	We still can do override of default headers (simply by putting whatever
we want in arch/*/include/asm) and we can explicitly include the default from
arch/*/include/asm (by using explicit generic/asm in the #include).

	The tricky part is handling of exported headers; we could detect the
absense of asm/foo.h we'd like to export and have include/generic/asm/foo.h
copied in its place, but that's not pretty.  We also have a risk of userland
code doing explicit #include <asm-generic/foo.h>, but that's probably not
a legitimate thing to do anyway *and* we could export them as asm-generic,
rewriting includes in headers from generic/asm to asm-generic as we export
them.

	I'm honestly not sure if it's worth doing; comments?
