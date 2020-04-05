Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:16577 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbgDEN4a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Apr 2020 09:56:30 -0400
MIME-Version: 1.0
References: <202004020117.6E434C035@keescook> <CA+icZUW0R9LDGJ1YjJAB2oWkcEQxCO79xYmdVEoh=P8Fy_AL1A@mail.gmail.com>
 <CA+icZUVowLVpAxiWw=FJHfQ38KtU7AXXkVnw46D2XLM41-NCEA@mail.gmail.com>
In-Reply-To: <CA+icZUVowLVpAxiWw=FJHfQ38KtU7AXXkVnw46D2XLM41-NCEA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 5 Apr 2020 22:55:35 +0900
Message-ID: <CAK7LNAQ6ji3=2+7R1DL7eFveH7L7No6e3XkqfqgiH5QFyQj==A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: mkcompile_h: Include $LD version in /proc/version
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Kees Cook <keescook@chromium.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Apr 5, 2020 at 8:23 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Thu, Apr 2, 2020 at 4:24 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Thu, Apr 2, 2020 at 10:18 AM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > When doing Clang builds of the kernel, it is possible to link with
> > > either ld.bfd (binutils) or ld.lld (LLVM), but it is not possible to
> > > discover this from a running kernel. Add the "$LD -v" output to
> > > /proc/version.
> > >
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> >
>
> Please feel free and add:
>
> Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>


Thanks.

I collected all Reviewed-by and Tested-by.






-- 
Best Regards
Masahiro Yamada
