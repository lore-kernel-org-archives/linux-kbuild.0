Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from condef-05.nifty.com ([202.248.20.70]:49268 "EHLO
        condef-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbfA1FQz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Jan 2019 00:16:55 -0500
MIME-Version: 1.0
References: <1547765160-15502-1-git-send-email-eugene.loh@oracle.com>
 <CAKv+Gu8BeYsq-_7KiANOjSN2fp25BP=71uLqKnkkYYJdhD2Bfw@mail.gmail.com> <CAKv+Gu_6_K0ZrRLMST6bYxqgSfhDJACoiArQg+K3pFaYjJxQsA@mail.gmail.com>
In-Reply-To: <CAKv+Gu_6_K0ZrRLMST6bYxqgSfhDJACoiArQg+K3pFaYjJxQsA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 28 Jan 2019 13:03:02 +0900
Message-ID: <CAK7LNAQps9akw1z-t+zr3ZybmBX3buM1PoAVYHxmDn=U+nNhNQ@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: Handle too long symbols in kallsyms.c
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, eugene.loh@oracle.com
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andi Kleen <ak@linux.intel.com>, Andi Kleen <andi@firstfloor.org>

On Fri, Jan 25, 2019 at 10:30 PM Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:
>
> (+ masahiro)
>
> On Fri, 25 Jan 2019 at 14:28, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> >
> > On Thu, 17 Jan 2019 at 23:46, <eugene.loh@oracle.com> wrote:
> > >
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > >
> > > When checking for symbols with excessively long names,
> > > account for null terminating character.
> > >
> > > Fixes: f3462aa952cf ("Kbuild: Handle longer symbols in kallsyms.c")
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> >
> > Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> >
> > > ---
> > >  scripts/kallsyms.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > > index 77cebad..f75e7


Applied to linux-kbuid/fixes.
Thanks!



-- 
Best Regards
Masahiro Yamada
