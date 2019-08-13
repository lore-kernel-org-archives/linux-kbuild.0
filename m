Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:29463 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727621AbfHMPkg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 11:40:36 -0400
MIME-Version: 1.0
References: <201908130812.45DE9AE8@keescook>
In-Reply-To: <201908130812.45DE9AE8@keescook>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 14 Aug 2019 00:39:50 +0900
Message-ID: <CAK7LNAS5g6VXK8AunXbuMizjW2hs7tU8W-uuN4FwR9EYJgCy7Q@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Parameterize kallsyms generation and correct reporting
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Wed, Aug 14, 2019 at 12:15 AM Kees Cook <keescook@chromium.org> wrote:
>
> When kallsyms generation happens, temporary vmlinux outputs are linked
> but the quiet make output didn't report it, giving the impression that
> the prior command is taking longer than expected.
>
> Instead, report the linking step explicitly. While at it, this
> consolidates the repeated "kallsyms generation step" into a single
> function and removes the existing copy/pasting.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> v2:
> - rename $kallsymso_previous to $kallsymso_prev (Masahiro)
> - move location of kallsyms_step() (Masahiro)
> - report linking step instead of folding it into KSYM (Masahiro)

Applied to linux-kbuild.
Thanks!



-- 
Best Regards
Masahiro Yamada
