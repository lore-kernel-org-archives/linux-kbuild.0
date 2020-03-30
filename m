Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:19780 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728120AbgC3FNG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Mar 2020 01:13:06 -0400
MIME-Version: 1.0
References: <20200329110832.19961-1-masahiroy@kernel.org> <202003292126.5105600A@keescook>
In-Reply-To: <202003292126.5105600A@keescook>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Mar 2020 14:12:24 +0900
Message-ID: <CAK7LNARhnzxhMMD7b36s8u_DJ+XdU0p4RQpsjYpPxwjTU9P5ew@mail.gmail.com>
Subject: Re: [PATCH] gcc-plugins: drop support for GCC <= 4.7
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Emese Revfy <re.emese@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Kernel Hardening <kernel-hardening@lists.openwall.com>

Hi Kees,

On Mon, Mar 30, 2020 at 1:27 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Sun, Mar 29, 2020 at 08:08:32PM +0900, Masahiro Yamada wrote:
> > Nobody was opposed to raising minimum GCC version to 4.8 [1]
> > So, we will drop GCC <= 4.7 support sooner or later.
> >
> > We always use C++ compiler for building plugins for GCC >= 4.8.
> >
> > This commit drops the plugin support for GCC <= 4.7 a bit earlier,
> > which allows us to dump lots of code.
> >
> > [1] https://lkml.org/lkml/2020/1/23/545
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Thanks for getting this cleaned up! I look forward to the 4.8 version
> bump. :)
>
> Acked-by: Kees Cook <keescook@chromium.org>


Thanks for your Ack.
I will queue this up to kbuild tree,
and it will ease more kbuild cleanups.

Thanks.

-- 
Best Regards
Masahiro Yamada
