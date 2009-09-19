Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:33491 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752088AbZISXs2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 19 Sep 2009 19:48:28 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Roland McGrath <roland@redhat.com>
Subject: Re: [patch 11/18] kconfig CROSS_COMPILE option
In-Reply-To: Sam Ravnborg's message of  Saturday, 19 September 2009 15:13:16 +0200 <20090919131316.GA26044@merkur.ravnborg.org>
References: <200909181949.n8IJnVSB019127@imap1.linux-foundation.org>
	<20090919090241.GA25877@merkur.ravnborg.org>
	<20090919121950.A599F2728@magilla.sf.frob.com>
	<20090919131316.GA26044@merkur.ravnborg.org>
Message-Id: <20090919234823.12E5E13BA3@magilla.sf.frob.com>
Date: Sat, 19 Sep 2009 16:48:23 -0700 (PDT)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Pavel Machek <pavel@ucw.cz>, akpm@linux-foundation.org, linux-kbuild@vger.kernel.org

> Another approach would be to ask kbuild for
> this information so we do not expose various filenames to the
> outer world.

For shell scripts and makefiles, running a command like make and retrieving
its output via pipe is de rigueur.  But for some other programs it might be
substantially less hassle to just read plain files.  That's what I was
thinking, anyway.  (I only really think that $ARCH is something that anyone
would want to fetch before they'd run make anyway, and I guess $SUBARCH in
the case of ARCH=um, but not $CROSS_COMPILE.)

> This is analogous to the way we ask for
> kernelrelease and kernelversion these days.

Except that include/config/kernel.release is there for all to see (when
referring to /lib/modules/.../build directory, e.g.), so perhaps some
people are in fact using that.


Thanks,
Roland
