Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f193.google.com ([209.85.161.193]:35186 "EHLO
        mail-yw0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964899AbeFNQNt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jun 2018 12:13:49 -0400
Received: by mail-yw0-f193.google.com with SMTP id v131-v6so2329458ywg.2
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Jun 2018 09:13:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1528972605-24264-1-git-send-email-yamada.masahiro@socionext.com>
References: <1528972605-24264-1-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 14 Jun 2018 09:13:47 -0700
Message-ID: <CAGXu5j+NCxOa9LWss5LF94q8=pSaSw=HxRuGJ8QV-eKXA57Eww@mail.gmail.com>
Subject: Re: [PATCH 0/3] Some more changes for stack protector config symbols
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Thu, Jun 14, 2018 at 3:36 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Hi Linus,
>
> While I was checking the renaming commit,
> I noticed some more fixups.
>
> The first two patches take care of what I missed to update.
>
> The last one is another renaming for consistency.
> (Sorry, I should have asked you that.)
>
> Please consider applying this series.

Consider the series:

Acked-by: Kees Cook <keescook@chromium.org>

Thanks for the fixes!

-Kees

>
>
>
> Masahiro Yamada (3):
>   x86: fix dependency of X86_32_LAZY_GS
>   kconfig: tinyconfig: remove stale stack protector fixups
>   Kbuild: rename HAVE_CC_STACKPROTECTOR config variable
>
>  Documentation/features/debug/stackprotector/arch-support.txt | 2 +-
>  arch/Kconfig                                                 | 4 ++--
>  arch/arm/Kconfig                                             | 2 +-
>  arch/arm64/Kconfig                                           | 2 +-
>  arch/mips/Kconfig                                            | 2 +-
>  arch/sh/Kconfig                                              | 2 +-
>  arch/x86/Kconfig                                             | 4 ++--
>  arch/xtensa/Kconfig                                          | 2 +-
>  kernel/configs/tiny.config                                   | 4 ----
>  9 files changed, 10 insertions(+), 14 deletions(-)
>
> --
> 2.7.4
>



-- 
Kees Cook
Pixel Security
