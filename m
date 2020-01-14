Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:61739 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728682AbgANIFL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Jan 2020 03:05:11 -0500
MIME-Version: 1.0
References: <20200113064841.3946-1-masahiroy@kernel.org> <20200113064841.3946-4-masahiroy@kernel.org>
 <7da5750c40489dcb6cd8eef0307ee8d8df2e134e.camel@decadent.org.uk>
In-Reply-To: <7da5750c40489dcb6cd8eef0307ee8d8df2e134e.camel@decadent.org.uk>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 14 Jan 2020 17:04:09 +0900
Message-ID: <CAK7LNAR3fL-RQM412LJmJD6v81JTJ+s0A5vcS4O=Y_=kNO4DUA@mail.gmail.com>
Subject: Re: [PATCH 4/7] builddeb: avoid invoking sub-shells where possible
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Riku Voipio <riku.voipio@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Ben,

On Tue, Jan 14, 2020 at 2:21 AM Ben Hutchings <ben@decadent.org.uk> wrote:
> > +(
> > +     cd $srctree
> > +     find . arch/$SRCARCH -maxdepth 1 -name Makefile\*
> > +     find include scripts -type f -o -type l
> > +     find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform
> > +     find arch/$SRCARCH -name include -type f
>
> This command is wrong.  We currently find all files under all
> directories named "include" under arch/$SRCARCH.  (arc, arm and xtensa
> have some per-platform include directories in additional to the per-
> architecture include directory.)
>
> > +
> > +     if [ -d arch/$SRCARCH/scripts ]; then
> > +             find arch/$SRCARCH/scripts -type f
> > +     fi
> > +) > debian/hdrsrcfiles
> > +
> > +{
> > +     if is_enabled CONFIG_STACK_VALIDATION; then
> > +             find tools/objtool -type f -executable
> > +     fi
> > +
> > +     find arch/$SRCARCH/include Module.symvers include scripts -type f
> > +
> > +     if is_enabled CONFIG_GCC_PLUGINS; then
> > +             find scripts/gcc-plugins -name \*.so -o -name gcc-common.h
> > +     fi
>
> This is reverting patch 1.
>
> Ben.

Thank you for catching these.

I made a mistake somehow
when I inserted the patch 1, and then
rebased the others on top of it.

I will fix it in v2.


-- 
Best Regards
Masahiro Yamada
