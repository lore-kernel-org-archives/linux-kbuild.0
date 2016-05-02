Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:64794 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751890AbcEBHY1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 May 2016 03:24:27 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: mainline build: 896 warnings 1 failures (mainline/v4.6-rc5-224-gda9373d)
Date: Mon, 02 May 2016 09:24:19 +0200
Message-ID: <1535117.FXDhxv6m8v@wuerfel>
In-Reply-To: <CAOesGMiwACS7Gq41c1p58h_Uj1RBz-_g-BQFZwgRTaKs6QwmvQ@mail.gmail.com>
References: <57267469.8ade420a.aec17.ffffc1ee@mx.google.com> <CAOesGMiwACS7Gq41c1p58h_Uj1RBz-_g-BQFZwgRTaKs6QwmvQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org
Cc: Olof Johansson <olof@lixom.net>, Olof's autobuilder <build@lixom.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Sunday 01 May 2016 16:19:53 Olof Johansson wrote:
> On Sun, May 1, 2016 at 2:26 PM, Olof's autobuilder <build@lixom.net> wrote:
> > Here are the build results from automated periodic testing.
> >
> > The tree being built was mainline, found at:
> >
> > http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git (master branch)
> >
> > Topmost commit:
> >
> > da9373d Merge branch 'fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-thermal
> >
> > Build logs (stderr only) can be found at the following link (experimental):
> >
> > http://arm-soc.lixom.net/buildlogs/mainline/v4.6-rc5-224-gda9373d/
> >
> >
> >         Runtime:                5m 0s
> >
> >         Passed:                 117
> >         Failed:                 1
> >
> >         Warnings:               896
> >
> >         Section mismatches:     0
> 
> So, yeah, I updated to GCC 6.1.0 and it looks noisy. If it doesn't get
> whittled down pretty quickly I might switch to an older compiler
> again.

Oops, it looks like I never submitted a patch to shut up
-Wunused-const-variable, though I've been building that way
myself here and fixing all /other/ warnings.

I think we want to have -Wunused-const-variable at the W=1 level, but
not by default.

	Arnd



