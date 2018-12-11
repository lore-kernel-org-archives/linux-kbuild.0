Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:35098 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726531AbeLKNBu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 08:01:50 -0500
MIME-Version: 1.0
References: <1544009286-15705-1-git-send-email-yamada.masahiro@socionext.com>
 <1544009286-15705-2-git-send-email-yamada.masahiro@socionext.com> <20181206180459.GA19166@ravnborg.org>
In-Reply-To: <20181206180459.GA19166@ravnborg.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 11 Dec 2018 22:01:09 +0900
Message-ID: <CAK7LNAQ8RjUkc57CWi_rnLopGSQQBtgerYJO+F7_0MD+p=NFxA@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: generate asm-generic wrappers if mandatory
 headers are missing
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>

Hi Sam,


On Fri, Dec 7, 2018 at 3:06 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Wed, Dec 05, 2018 at 08:28:05PM +0900, Masahiro Yamada wrote:
> > Some time ago, Sam pointed out a certain degree of overwrap between
> > generic-y and mandatory-y. (https://lkml.org/lkml/2017/7/10/121)
> >
> > I a bit tweaked the meaning of mandatory-y; now it defines the minimum
> > set of ASM headers that all architectures must have.
> >
> > If arch does not have specific implementation of a mandatory header,
> > Kbuild will let it fallback to the asm-generic one by automatically
> > generating a wrapper. This will allow to drop lots of redundant
> > generic-y defines.
> >
> > Previously, "mandatory" was used in the context of UAPI, but I guess
> > this can be extended to kernel space ASM headers.
> >
> > Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Nice work!
>
> For the full series:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>
> Have you considered to warn if generic-y contains a header listed
> in mandatory-y - to prevent that they sneak back in.
> And to catch when we lift a header from available to mandatory.


Yes, I also thought of this,
and probably we should do it.





--
Best Regards
Masahiro Yamada
