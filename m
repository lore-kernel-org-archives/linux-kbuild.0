Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:63710 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727875AbgC2LcH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Mar 2020 07:32:07 -0400
MIME-Version: 1.0
References: <20200326194155.29107-1-natechancellor@gmail.com>
In-Reply-To: <20200326194155.29107-1-natechancellor@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 29 Mar 2020 20:31:26 +0900
Message-ID: <CAK7LNAQ8uHtuhd7DiGGOLbkEX524rPjfUuWAHjU-_92Ow3_1Pg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Enable -Wtautological-compare
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Nick Desaulniers <ndesaulniers@google.com>, Dmitry Vyukov <dvyukov@google.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>

On Fri, Mar 27, 2020 at 4:42 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Currently, we disable -Wtautological-compare, which in turn disables a
> bunch of more specific tautological comparison warnings that are useful
> for the kernel such as -Wtautological-bitwise-compare. See clang's
> documentation below for the other warnings that are suppressed by
> -Wtautological-compare. Now that all of the major/noisy warnings have
> been fixed, enable -Wtautological-compare so that more issues can be
> caught at build time by various continuous integration setups.
>
> -Wtautological-constant-out-of-range-compare is kept disabled under a
> normal build but visible at W=1 because there are places in the kernel
> where a constant or variable size can change based on the kernel
> configuration. These are not fixed in a clean/concise way and the ones
> I have audited so far appear to be harmless. It is not a subgroup but
> rather just one warning so we do not lose out on much coverage by
> default.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/488
> Link: http://releases.llvm.org/10.0.0/tools/clang/docs/DiagnosticsReference.html#wtautological-compare
> Link: https://bugs.llvm.org/show_bug.cgi?id=42666
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>
> v1 -> v2: https://lore.kernel.org/lkml/20200219045423.54190-7-natechancellor@gmail.com/
>
> * Expand commit message a bit by adding more reasoning behind change.
> * Disable -Wtautological-constant-out-of-range-compare under a normal
>   build but allow it to show up at W=1 for easy auditing.
>
> I hope this can be accepted for 5.7. There are two warnings that I see
> still across a bunch of allyesconfig/allmodconfig builds that have
> patches sent but not accepted. I will ping them today.
>
> * https://lore.kernel.org/lkml/20191023002014.22571-1-natechancellor@gmail.com/
> * https://lore.kernel.org/lkml/20200220051011.26113-1-natechancellor@gmail.com/


OK, I will queue this up and send it to Linus
in the second week of MW.

I hope all warnings will be fixed by that time.



-- 
Best Regards
Masahiro Yamada
