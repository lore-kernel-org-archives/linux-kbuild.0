Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:59257 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754305AbZISMUI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 19 Sep 2009 08:20:08 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Roland McGrath <roland@redhat.com>
Subject: Re: [patch 11/18] kconfig CROSS_COMPILE option
In-Reply-To: Sam Ravnborg's message of  Saturday, 19 September 2009 11:02:41 +0200 <20090919090241.GA25877@merkur.ravnborg.org>
References: <200909181949.n8IJnVSB019127@imap1.linux-foundation.org>
	<20090919090241.GA25877@merkur.ravnborg.org>
Message-Id: <20090919121950.A599F2728@magilla.sf.frob.com>
Date: Sat, 19 Sep 2009 05:19:50 -0700 (PDT)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Pavel Machek <pavel@ucw.cz>, akpm@linux-foundation.org, linux-kbuild@vger.kernel.org

Cool.  I had done a hack locally to save ARCH in a different way, but
had not gotten around to finishing it up to submit.  My tack was to
write an include/config/kernel.arch file analogous to kernel.release,
and then use that.  It was about the same as yours I guess, but without
all the fancy sanity checks.  

One thing I'd thought to do in "finishing it up" was to write just the
$ARCH string alone to kernel.arch (then needing a kernel.subarch too)
rather than a makefile fragment.  My thinking is that any scripty things
that would like to look at a given build dir (as in the installed
/lib/modules/foo/build in kernel-devel packages) would like to extract
the arch name as well as the kernel release string, and not necessarily
do it by running make or parsing makeish assignment lines.


Thanks,
Roland
