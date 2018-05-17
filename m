Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:45294 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752525AbeEQG1e (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 May 2018 02:27:34 -0400
Received: by mail-ua0-f195.google.com with SMTP id j5-v6so2185454uak.12
        for <linux-kbuild@vger.kernel.org>; Wed, 16 May 2018 23:27:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1526537830-22606-31-git-send-email-yamada.masahiro@socionext.com>
References: <1526537830-22606-1-git-send-email-yamada.masahiro@socionext.com> <1526537830-22606-31-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 16 May 2018 23:27:33 -0700
Message-ID: <CAGXu5jKjHAnT8666MVWzfK3ZYqwqf3hhDKmJ4gJZ8NUeqM==Aw@mail.gmail.com>
Subject: Re: [PATCH v4 30/31] gcc-plugins: allow to enable GCC_PLUGINS for COMPILE_TEST
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, "Luis R . Rodriguez" <mcgrof@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Emese Revfy <re.emese@gmail.com>, X86 ML <x86@kernel.org>

On Wed, May 16, 2018 at 11:17 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Now that the compiler's plugin support is checked in Kconfig,
> all{yes,mod}config will not be bothered.
>
> Remove 'depends on !COMPILE_TEST' for GCC_PLUGINS.
>
> 'depends on !COMPILE_TEST' for the following three are still kept:
>   GCC_PLUGIN_CYC_COMPLEXITY
>   GCC_PLUGIN_STRUCTLEAK_VERBOSE
>   GCC_PLUGIN_RANDSTRUCT_PERFORMANCE
>
> Kees said to do so because the first two are too noisy, and the last
> one would reduce the compile test coverage.  I commented the reasons
> in arch/Kconfig.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

I'm really looking forward to these being enabled for COMPILE_TEST. :)

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
Pixel Security
