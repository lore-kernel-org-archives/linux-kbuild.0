Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:48506 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbfEINe2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 09:34:28 -0400
MIME-Version: 1.0
References: <CAK7LNASpsid7_sh4rdRNSTwZ1YtW_+uH2eoarJNNUttntQZ-kg@mail.gmail.com>
 <20190509114824.25866-1-natechancellor@gmail.com>
In-Reply-To: <20190509114824.25866-1-natechancellor@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 9 May 2019 22:33:23 +0900
Message-ID: <CAK7LNARBH7tpZLJCC4EGvLDGCCt0_425p4nSE5+fimakP5o3NA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Don't try to add '-fcatch-undefined-behavior' flag
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>

On Thu, May 9, 2019 at 8:49 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> This is no longer a valid option in clang, it was removed in 3.5, which
> we don't support.
>
> https://github.com/llvm/llvm-project/commit/cb3f812b6b9fab8f3b41414f24e90222170417b4
>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>
> Let me know if you want this incremental to your patch.

No problem. I will rebase mine on top of this.

> I figured it
> made more sense to remove this then do the cc-option/cc-disable-warning
> removal because it will simplify the commit message.

Yes, I agree!


Thanks.

-- 
Best Regards
Masahiro Yamada
