Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:31466 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbfFACKO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 May 2019 22:10:14 -0400
MIME-Version: 1.0
References: <1559316388-19565-1-git-send-email-george_davis@mentor.com>
 <CAK7LNATXzLzttF_gLA4wdfE1ue+bLPhvDZVsTKbB5K3nrN3jng@mail.gmail.com>
 <20190531163908.GB10644@mam-gdavis-lt> <CAK7LNASq8eW0D8fpbxFGhAgR5D158emTR2quCD5ufyC+kK-2GQ@mail.gmail.com>
 <20190531174506.GC10644@mam-gdavis-lt>
In-Reply-To: <20190531174506.GC10644@mam-gdavis-lt>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 1 Jun 2019 11:09:15 +0900
Message-ID: <CAK7LNASazA2496=GkJdJFVw3S7mQ8LaVqHc6dX=FU0DGYtRTBg@mail.gmail.com>
Subject: Re: [RFC][PATCH] Makefile: Fix checkstack.pl arm64 wrong or unknown architecture
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "George G. Davis" <george_davis@mentor.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

On Sat, Jun 1, 2019 at 2:45 AM George G. Davis <george_davis@mentor.com> wrote:
> > Following this pattern, does this work for you?
> >
> > diff --git a/scripts/checkstack.pl b/scripts/checkstack.pl
> > index 122aef5e4e14..371bd17a4983 100755
> > --- a/scripts/checkstack.pl
> > +++ b/scripts/checkstack.pl
> > @@ -46,7 +46,7 @@ my (@stack, $re, $dre, $x, $xs, $funcre);
> >         $x      = "[0-9a-f]";   # hex character
> >         $xs     = "[0-9a-f ]";  # hex character or space
> >         $funcre = qr/^$x* <(.*)>:$/;
> > -       if ($arch eq 'aarch64') {
> > +       if ($arch =~ '^(aarch|arm)64$') {
>
> Yes, that works, thanks!
>
> Will you submit a fix or would you like me to resubmit with the above suggested
> fix?

Please send v2.

Thanks.

-- 
Best Regards
Masahiro Yamada
