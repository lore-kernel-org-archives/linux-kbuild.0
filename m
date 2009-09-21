Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:29191 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751002AbZIUDxb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 20 Sep 2009 23:53:31 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: Roland McGrath <roland@redhat.com>
Subject: Re: [patch 11/18] kconfig CROSS_COMPILE option
In-Reply-To: Sam Ravnborg's message of  Sunday, 20 September 2009 12:31:09 +0200 <20090920103108.GA26667@merkur.ravnborg.org>
References: <200909181949.n8IJnVSB019127@imap1.linux-foundation.org>
	<20090919090241.GA25877@merkur.ravnborg.org>
	<20090919121950.A599F2728@magilla.sf.frob.com>
	<20090919131316.GA26044@merkur.ravnborg.org>
	<20090919234823.12E5E13BA3@magilla.sf.frob.com>
	<20090920103108.GA26667@merkur.ravnborg.org>
Message-Id: <20090921035302.CAC2E13F35@magilla.sf.frob.com>
Date: Sun, 20 Sep 2009 20:53:02 -0700 (PDT)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Pavel Machek <pavel@ucw.cz>, akpm@linux-foundation.org, linux-kbuild@vger.kernel.org

> So when I move that file to include/generated I will break users script
> silently - sigh.

It's a possibility.  If so, they will probably have a far easier time
handling a simple change in the location of the file than an entirely
new scheme where there is no simple file that contains the same string.

> Revised patch following your guidelines below.
> Does this look better to you?

Yes, I like it!  I wonder if we might want to treat SUBARCH the same
way, though.  I'm not sure that matters except for the ARCH=um case,
but there I have the impression it has exactly the same utility as
$ARCH otherwise, so it makes sense to me to treat it similarly.


Thanks,
Roland
