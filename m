Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:39206 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgAYEGz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jan 2020 23:06:55 -0500
MIME-Version: 1.0
References: <20200115162529.11089-1-masahiroy@kernel.org> <20200115162529.11089-4-masahiroy@kernel.org>
 <2bedc86669d33dd2e9f3b97954710f1a8139be19.camel@decadent.org.uk>
In-Reply-To: <2bedc86669d33dd2e9f3b97954710f1a8139be19.camel@decadent.org.uk>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 25 Jan 2020 13:06:05 +0900
Message-ID: <CAK7LNASmgxQEOdpbbdBxPU58+QZ5Rz6UZpe+1TYJLaHg8pER7g@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] builddeb: avoid invoking sub-shells where possible
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Riku Voipio <riku.voipio@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Ben,

On Wed, Jan 22, 2020 at 4:24 AM Ben Hutchings <ben@decadent.org.uk> wrote:
>
> On Thu, 2020-01-16 at 01:25 +0900, Masahiro Yamada wrote:
> [...]
> > -if is_enabled CONFIG_STACK_VALIDATION; then
> > -     echo tools/objtool/objtool >> debian/hdrobjfiles
> > -fi
> [...]
> > +{
> > +     if is_enabled CONFIG_STACK_VALIDATION; then
> > +             find tools/objtool -type f -executable
> > +     fi
> [...]
>
> And this is still undoing part of patch 1.
>

You are right. I will fix it.



-- 
Best Regards
Masahiro Yamada
