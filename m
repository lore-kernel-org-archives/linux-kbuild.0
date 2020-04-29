Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:48211 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726598AbgD2Co4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Apr 2020 22:44:56 -0400
MIME-Version: 1.0
References: <20200423073929.127521-1-masahiroy@kernel.org> <20200423073929.127521-3-masahiroy@kernel.org>
 <20200424203231.b4lonbdgzkoxf7ug@treble>
In-Reply-To: <20200424203231.b4lonbdgzkoxf7ug@treble>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 29 Apr 2020 11:43:39 +0900
Message-ID: <CAK7LNATrGDegfn2j5gmHTSj8V=Wd53SpLqG4-T1gfn3j19mEtg@mail.gmail.com>
Subject: Re: [PATCH 02/16] Revert "objtool: Skip samples subdirectory"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, bpf <bpf@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Apr 25, 2020 at 5:32 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Thu, Apr 23, 2020 at 04:39:15PM +0900, Masahiro Yamada wrote:
> > This reverts commit 8728497895794d1f207a836e02dae762ad175d56.
> >
> > This directory contains no object.
> >
> > Cc: Josh Poimboeuf <jpoimboe@redhat.com>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  samples/Makefile | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/samples/Makefile b/samples/Makefile
> > index f8f847b4f61f..5ce50ef0f2b2 100644
> > --- a/samples/Makefile
> > +++ b/samples/Makefile
> > @@ -1,6 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  # Makefile for Linux samples code
> > -OBJECT_FILES_NON_STANDARD := y
> >
> >  obj-$(CONFIG_SAMPLE_ANDROID_BINDERFS)        += binderfs/
> >  obj-$(CONFIG_SAMPLE_CONFIGFS)                += configfs/
> > --
> > 2.25.1
>
> Hm, somehow I was thinking this would work recursively for
> subdirectories.  Anyway, you're right:
>
> Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>
>
> --
> Josh
>

Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
