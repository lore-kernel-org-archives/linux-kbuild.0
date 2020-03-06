Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:47985 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbgCFEGv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Mar 2020 23:06:51 -0500
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 02646ecs001794
        for <linux-kbuild@vger.kernel.org>; Fri, 6 Mar 2020 13:06:40 +0900
Received: by mail-vs1-f54.google.com with SMTP id 7so680243vsr.10
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Mar 2020 20:06:40 -0800 (PST)
MIME-Version: 1.0
References: <20200219000434.15872-1-mpe@ellerman.id.au> <48YT3Y2QBsz9sSs@ozlabs.org>
In-Reply-To: <48YT3Y2QBsz9sSs@ozlabs.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 6 Mar 2020 13:06:02 +0900
Message-ID: <CAK7LNAQfREwzk4NwE5PzxOXGLcsk2BtjYNKvKx8g4_vxHmNHdw@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/Makefile: Mark phony targets as PHONY
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <patch-notifications@ellerman.id.au>
Cc: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Mar 6, 2020 at 9:27 AM Michael Ellerman
<patch-notifications@ellerman.id.au> wrote:
>
> On Wed, 2020-02-19 at 00:04:34 UTC, Michael Ellerman wrote:
> > Some of our phony targets are not marked as such. This can lead to
> > confusing errors, eg:
> >
> >   $ make clean
> >   $ touch install
> >   $ make install
> >   make: 'install' is up to date.
> >   $
> >
> > Fix it by adding them to the PHONY variable which is marked phony in
> > the top-level Makefile, or in scripts/Makefile.build for the boot
> > Makefile.
> >
> > Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
> Applied to powerpc next.
>
> https://git.kernel.org/powerpc/c/d42c6d0f8d004c3661dde3c376ed637e9f292c22
>

You do not have to double your Signed-off-by.



-- 
Best Regards
Masahiro Yamada
