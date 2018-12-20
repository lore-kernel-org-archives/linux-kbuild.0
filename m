Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:22402 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729731AbeLTCAn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Dec 2018 21:00:43 -0500
MIME-Version: 1.0
References: <1545110741-10761-1-git-send-email-yamada.masahiro@socionext.com> <1545143648.18411.20.camel@lca.pw>
In-Reply-To: <1545143648.18411.20.camel@lca.pw>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 20 Dec 2018 10:59:55 +0900
Message-ID: <CAK7LNAQxG_UmLQGCZqaNkKGQwKyzJdZst343o_kTqsMcGCcLCQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix false positive warning/error about missing libelf
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Qian Cai <cai@lca.pw>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Bernd Edlinger <bernd.edlinger@hotmail.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Dec 18, 2018 at 11:35 PM Qian Cai <cai@lca.pw> wrote:
>
> On Tue, 2018-12-18 at 14:25 +0900, Masahiro Yamada wrote:
> > For the same reason as commit 25896d073d8a ("x86/build: Fix compiler
> > support check for CONFIG_RETPOLINE"), you cannot put this $(error ...)
> > into the parse stage of the top Makefile.
> >
> > Perhaps I'd propose a more sophisticated solution later, but this is
> > the best I can do for now.
> >
> > Link: https://lkml.org/lkml/2017/12/25/211
> > Reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> > Reported-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
> > Reported-by: Qian Cai <cai@lca.pw>
> > Cc: Josh Poimboeuf <jpoimboe@redhat.com>
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
>
> Tested-by: Qian Cai <cai@lca.pw>


Applied to linux-kbuild/fixes.



-- 
Best Regards
Masahiro Yamada
