Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:39457 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754628Ab1DDPkR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Apr 2011 11:40:17 -0400
Subject: Re: [PATCH 2/2] kbuild: move KALLSYMS_EXTRA_PASS from Kconfig to
 Makefile
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
In-Reply-To: <7621.1301930536@localhost>
References: <1301913651-9055-1-git-send-email-dedekind1@gmail.com>
	 <1301913651-9055-2-git-send-email-dedekind1@gmail.com>
	 <131611.1301921158@localhost> <1301921230.2760.79.camel@localhost>
	 <7621.1301930536@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Apr 2011 18:37:44 +0300
Message-ID: <1301931464.2760.101.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Valdis.Kletnieks@vt.edu
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Paulo Marques <pmarques@grupopie.com>

On Mon, 2011-04-04 at 11:22 -0400, Valdis.Kletnieks@vt.edu wrote:
> On Mon, 04 Apr 2011 15:47:10 +0300, Artem Bityutskiy said:
> > On Mon, 2011-04-04 at 08:45 -0400, Valdis.Kletnieks@vt.edu wrote:
> > > On Mon, 04 Apr 2011 13:40:51 +0300, Artem Bityutskiy said:
> > >
> > > > 3. By default KALLSYMS_EXTRA_PASS is disabled and if kallsyms has issues,
> > > >    "make" should print a warning and suggest using KALLSYMS_EXTRA_PASS
> > >
> > > If the Makefile has enough information to print the warning, why can't it go
> > > ahead and do the extra pass itself instead of issuing the warning?
> > >
> > > (I'm obviously missing something here, as I'm foolishly posting to lkml before
> > > caffeine ;)
> >
> > Good question, I thought to force people to send a bugreport.
> 
> When was the last time we actually saw such a bug report?  I'm suspecting that
> all the affected people just set the variable and get on with their lives.  So
> we should either just make it automatic if that's what people are going to do,
> or we rip the entire "EXTRA_PASS' stuff out forcibly and *make* people fix the
> actual underlying issue that causes the extra pass to be needed...

I do not know when this bug was last seen, but I'd not remove this
"extra pass" work around so far. WRT automatic fix-up - I do not have
strong opinion here, but Paulo Marques pointed in another thread that
due to various alignment issues the bug is tricky and may come back. So
probably removing working code is not very wise. Thus, it seems the way
I proposed in this patch is a good balance.

But anyway, if Michal Marek requests to change this, I'll do this (he is
the Maintainer).

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

