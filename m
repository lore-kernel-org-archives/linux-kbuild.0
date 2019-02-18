Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:16625 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727423AbfBRJLs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Feb 2019 04:11:48 -0500
MIME-Version: 1.0
References: <CAK7LNARPq7Bj+zp7bYyH_uPOyJ9a1-hD-aSq6GDLb8YdqbA-+A@mail.gmail.com>
 <20190201103038.GE31854@zn.tnic> <20190201103648.GF31854@zn.tnic>
 <CAK7LNAQ4juLxrdMoPumQQ-96fMorf+wfAqkNxq1X1k=0i_R4vQ@mail.gmail.com>
 <20190201151139.GK31854@zn.tnic> <CAK7LNATVeX=6Mmn6A4+EGmZ9OSf=ePwbQWV1m1c=e=_LiebdNQ@mail.gmail.com>
 <20190202144227.GC27822@zn.tnic> <20190206104729.GC7314@zn.tnic>
 <CAK7LNAT+GhbEwP7v7NWd2kqW76qbXM1mtKhc21YXkp7BUJjzKQ@mail.gmail.com>
 <20190210123923.GA14948@zn.tnic> <20190218083008.GB4265@zn.tnic>
In-Reply-To: <20190218083008.GB4265@zn.tnic>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 18 Feb 2019 18:10:57 +0900
Message-ID: <CAK7LNAQ_UfHcin1G_fqEX0qZ-AFe7=GHfnHZ2QZu1oe=dZW-aA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Disable extra debugging info in .s output
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>

Borislav,


On Mon, Feb 18, 2019 at 5:30 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Sun, Feb 10, 2019 at 01:39:23PM +0100, Borislav Petkov wrote:
> > Please attach the diff or send it from another mail server.
>
> So you couldn't be bothered to send me an applicable version so I went
> and typed it in by hand. Thanks. ;-\

I admit I must fix my unfriendly attitude.
Sorry for annoying you.


> Anyway, this variant works too, pls queue it.
>
> Acked-by: Borislav Petkov <bp@suse.de>
> Tested-by: Borislav Petkov <bp@suse.de>

Could you send v2 as I suggested?
Your commit log describes your motivation perfectly.

(I lost the applicable patch because
I just modified the code locally and pasted it
into the previous email.)



> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> Good mailing practices for 400: avoid top-posting and trim the reply.



-- 
Best Regards
Masahiro Yamada
