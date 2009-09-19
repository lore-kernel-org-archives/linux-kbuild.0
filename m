Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from [195.41.46.236] ([195.41.46.236]:38807 "EHLO pfepb.post.tele.dk"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1752538AbZISNNS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 19 Sep 2009 09:13:18 -0400
Date: Sat, 19 Sep 2009 15:13:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [patch 11/18] kconfig CROSS_COMPILE option
Message-ID: <20090919131316.GA26044@merkur.ravnborg.org>
References: <200909181949.n8IJnVSB019127@imap1.linux-foundation.org> <20090919090241.GA25877@merkur.ravnborg.org> <20090919121950.A599F2728@magilla.sf.frob.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090919121950.A599F2728@magilla.sf.frob.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roland McGrath <roland@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>, akpm@linux-foundation.org, linux-kbuild@vger.kernel.org

On Sat, Sep 19, 2009 at 05:19:50AM -0700, Roland McGrath wrote:
> 
> One thing I'd thought to do in "finishing it up" was to write just the
> $ARCH string alone to kernel.arch (then needing a kernel.subarch too)
> rather than a makefile fragment.  My thinking is that any scripty things
> that would like to look at a given build dir (as in the installed
> /lib/modules/foo/build in kernel-devel packages) would like to extract
> the arch name as well as the kernel release string, and not necessarily
> do it by running make or parsing makeish assignment lines.

Another approach would be to ask kbuild for
this information so we do not expose various filenames to the
outer world.

Somthing like this:

diff --git a/Makefile b/Makefile
index c41035a..8f488c9 100644
--- a/Makefile
+++ b/Makefile
@@ -1528,6 +1523,12 @@ kernelrelease:
 kernelversion:
 	@echo $(KERNELVERSION)
 
+kernelarch:
+	@echo $(ARCH)
+
+kernelsubarch:
+	@echo $(SUBARCH)
+
 # Single targets
 # ---------------------------------------------------------------------------
 # Single targets are compatible with:

This is analogous to the way we ask for
kernelrelease and kernelversion these days.

	Sam
