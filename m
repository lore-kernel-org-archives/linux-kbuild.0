Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33379 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754876AbcKJJZE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Nov 2016 04:25:04 -0500
Date: Thu, 10 Nov 2016 10:25:00 +0100
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH 1/3] kbuild: add -fno-PIE
Message-ID: <20161110092500.GA24541@gmail.com>
References: <20161104183940.30692-1-bigeasy@linutronix.de>
 <20161104183940.30692-2-bigeasy@linutronix.de>
 <20161108221437.GA9197@sepie.suse.cz>
 <20161109061041.GA19246@gmail.com>
 <3cfab3f0-aef9-08a5-894c-06ea381f287b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cfab3f0-aef9-08a5-894c-06ea381f287b@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Ben Hutchings <ben@decadent.org.uk>, Sven Joachim <svenjoac@gmx.de>, "Austin S. Hemmelgarn" <ahferroin7@gmail.com>, Borislav Petkov <bp@alien8.de>


* Michal Marek <mmarek@suse.com> wrote:

> >>> +++ b/Makefile
> >>> @@ -622,6 +622,8 @@ include arch/$(SRCARCH)/Makefile
> >>>  KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
> >>>  KBUILD_CFLAGS	+= $(call cc-disable-warning,maybe-uninitialized,)
> >>>  KBUILD_CFLAGS	+= $(call cc-disable-warning,frame-address,)
> >>> +KBUILD_CFLAGS	+= $(call cc-option,-fno-PIE)
> >>> +KBUILD_AFLAGS	+= $(call cc-option,-fno-PIE)
> >>
> >> Bad compiler. No pie for you.
> >>
> >> I applied this one to kbuild.git. How about 2/3 and 3/3. Will these be
> >> merged via tip.git or shall I apply them as well?
> > 
> > I'd suggest applying them to the kbuild tree, as they are related.
> 
> OK, done.

Thanks!

	Ingo
