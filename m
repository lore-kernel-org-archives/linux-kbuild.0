Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:60672 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756239AbcECUQo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 May 2016 16:16:44 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: mainline build: 896 warnings 1 failures (mainline/v4.6-rc5-224-gda9373d)
Date: Tue, 03 May 2016 22:16:31 +0200
Message-ID: <1967190.iUkQd8aPov@wuerfel>
In-Reply-To: <CAOesGMgb=Z1hjKaEG96dOpvKuEFOJQ=TQB_Dag0C-AXNBNTTgg@mail.gmail.com>
References: <57267469.8ade420a.aec17.ffffc1ee@mx.google.com> <1535117.FXDhxv6m8v@wuerfel> <CAOesGMgb=Z1hjKaEG96dOpvKuEFOJQ=TQB_Dag0C-AXNBNTTgg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Kernel Build Reports Mailman List <kernel-build-reports@lists.linaro.org>, Olof's autobuilder <build@lixom.net>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>

On Monday 02 May 2016 19:12:31 Olof Johansson wrote:
> On Mon, May 2, 2016 at 12:24 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Sunday 01 May 2016 16:19:53 Olof Johansson wrote:
> >> On Sun, May 1, 2016 at 2:26 PM, Olof's autobuilder <build@lixom.net> wrote:
> >> > Here are the build results from automated periodic testing.
> >> >
> >> > The tree being built was mainline, found at:
> >> >
> >> > http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git (master branch)
> >> >
> >> > Topmost commit:
> >> >
> >> > da9373d Merge branch 'fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-thermal
> >> >
> >> > Build logs (stderr only) can be found at the following link (experimental):
> >> >
> >> > http://arm-soc.lixom.net/buildlogs/mainline/v4.6-rc5-224-gda9373d/
> >> >
> >> >
> >> >         Runtime:                5m 0s
> >> >
> >> >         Passed:                 117
> >> >         Failed:                 1
> >> >
> >> >         Warnings:               896
> >> >
> >> >         Section mismatches:     0
> >>
> >> So, yeah, I updated to GCC 6.1.0 and it looks noisy. If it doesn't get
> >> whittled down pretty quickly I might switch to an older compiler
> >> again.
> >
> > Oops, it looks like I never submitted a patch to shut up
> > -Wunused-const-variable, though I've been building that way
> > myself here and fixing all /other/ warnings.
> >
> > I think we want to have -Wunused-const-variable at the W=1 level, but
> > not by default.
> 
> Agreed, at least as long as it is as noisy as it is today.
> 
> Care to send it in so we can see it in 4.6?

Sure, I'll try.

I seem to have a low success rate getting Makefile changes like this
merged: My best guess is that Michal Marek should pick them up, but
he ignored my last few submission for warning changes, so I don't
know if I should instead send them to Andrew Morton or someone else.

	Arnd
