Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:20719 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfKFG03 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Nov 2019 01:26:29 -0500
MIME-Version: 1.0
References: <20191025080544.7209-1-unixbhaskar@gmail.com> <CAK7LNAT1=e36tLgPcHUOxKUSCH7MW3egYuJMtY+OfZWvHRxfGA@mail.gmail.com>
 <20191106042049.GC20442@Gentoo>
In-Reply-To: <20191106042049.GC20442@Gentoo>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 6 Nov 2019 15:25:45 +0900
Message-ID: <CAK7LNARdxhr1Ab1bkUqRjz4LGuH6mUg9kmp_4U0sYcK8uWzRyw@mail.gmail.com>
Subject: Re: [PATCH] scripts:patch-kernel:bash syntax replace,correct one
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Nov 6, 2019 at 1:21 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> On 13:15 Wed 06 Nov 2019, Masahiro Yamada wrote:
> >On Fri, Oct 25, 2019 at 5:06 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
> >>
> >> This patch will replace backquote to dollar parenthesis syntax
> >> for better readability.Corrected one.
> >
> >Talking about the commit subject,
> >which part is 'bash syntax' ?
> >
> >One more thing,
> >"correct one" is not the correct way to send
> >a new patch version.
> >See the patch submission from other people.
> >The version number is enclosed in the square brackets.
> >
> >[PATCH v2]
> >
> >
> >The commit subject should describe what it does
> >in imperative mood.
> >
> >https://patchwork.kernel.org/patch/11205593/
> You are right ..my mistake ..shouldn't have included the
> "correct one" ...and you are absolutely right..."bash syntax"
> is as vague and confusing .
>
> Again , Would you mind if I send you the correct one with
> proper subject line and explained what changed.


I will pick up the patch with the subject corrected
but you do not need to send similar patches any more.

`...` is the correct syntax.
Even if $(...) is more readable,
the added value is quite small.




-- 
Best Regards
Masahiro Yamada
