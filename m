Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:28027 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbfBTGLZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Feb 2019 01:11:25 -0500
MIME-Version: 1.0
References: <1547706826-16833-1-git-send-email-yamada.masahiro@socionext.com>
 <CAKwvOdkzSTyiiBmpwGFj6K=1Ang6nsVVahaQstk_GkPAcyBZOg@mail.gmail.com> <CABC7LbQSxB=WuUz22uunWW=YahNd2-By8LKxLcZYo0L17P---A@mail.gmail.com>
In-Reply-To: <CABC7LbQSxB=WuUz22uunWW=YahNd2-By8LKxLcZYo0L17P---A@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 20 Feb 2019 15:10:23 +0900
Message-ID: <CAK7LNATY8-hJ6QouGjO4wvsw8+W60HhLfNk60RZWyNz4s5fv_w@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: support llvm-ar
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jordan Rupprecht <rupprecht@google.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, Dmitry Golovin <dima@golovin.in>, Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>, Michal Marek <michal.lkml@markovi.net>, LKML <linux-kernel@vger.kernel.org>

Hi Jordan,


On Thu, Feb 7, 2019 at 9:56 AM Jordan Rupprecht <rupprecht@google.com> wrote:
>
> I have a patch up for review that fixes the second case of chopping
> off the directory when nesting thin archives:
> https://reviews.llvm.org/D57842. I'll commit it tomorrow if there are
> no more comments.


Sorry for late reply.

Now I tested the latest llvm-ar, and it worked perfectly for kbuild.
Thanks for your work!


-- 
Best Regards
Masahiro Yamada
