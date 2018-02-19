Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lilium.sigma-star.at ([109.75.188.150]:42740 "EHLO
        lilium.sigma-star.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753126AbeBSSV1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Feb 2018 13:21:27 -0500
From: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] kconfig: really drop GENERIC_IO
Date: Mon, 19 Feb 2018 19:22:45 +0100
Message-ID: <1770118.vanpxeS0Mp@blindfold>
In-Reply-To: <CAL_Jsq+eN2-=6afWDWJ6BtQ+u2qUdCx5OeXp9LXi2-aD7ShRDw@mail.gmail.com>
References: <5A8AF3B602000078001A920C@prv-mh.provo.novell.com> <CAL_Jsq+eN2-=6afWDWJ6BtQ+u2qUdCx5OeXp9LXi2-aD7ShRDw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Jan Beulich <JBeulich@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Am Montag, 19. Februar 2018, 19:17:22 CET schrieb Rob Herring:
> On Mon, Feb 19, 2018 at 8:56 AM, Jan Beulich <JBeulich@suse.com> wrote:
> > Commit 9de8da4774 ("kconfig: kill off GENERIC_IO option") dropped the
> > option, but left a "select" of it in place.
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > 
> >  lib/Kconfig |    1 -
> >  1 file changed, 1 deletion(-)
> 
> This is the 4th such patch to fix this. I'll send it to Linus I guess
> if Richard is not going to.

Ups, shame on me. I thought otherwise.

Thanks,
//richard
