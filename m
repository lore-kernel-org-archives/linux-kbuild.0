Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:37406 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751061AbeEQGc1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 May 2018 02:32:27 -0400
Received: by mail-ua0-f195.google.com with SMTP id i3-v6so2223101uad.4
        for <linux-kbuild@vger.kernel.org>; Wed, 16 May 2018 23:32:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1526537830-22606-30-git-send-email-yamada.masahiro@socionext.com>
References: <1526537830-22606-1-git-send-email-yamada.masahiro@socionext.com> <1526537830-22606-30-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 16 May 2018 23:32:25 -0700
Message-ID: <CAGXu5jLMRfLurNe04WoK3kLHvTYFEHyUz1vMyGf4dLBkOmTnAQ@mail.gmail.com>
Subject: Re: [PATCH v4 29/31] gcc-plugins: test plugin support in Kconfig and
 clean up Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, "Luis R . Rodriguez" <mcgrof@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Emese Revfy <re.emese@gmail.com>, X86 ML <x86@kernel.org>

On Wed, May 16, 2018 at 11:17 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Run scripts/gcc-plugin.sh from Kconfig so that users can enable
> GCC_PLUGINS only when the compiler supports building plugins.
>
> Kconfig defines a new symbol, PLUGIN_HOSTCC.  This will contain
> the compiler (g++ or gcc) used for building plugins, or empty
> if the plugin can not be supported at all.
>
> This allows us to remove all ugly testing in Makefile.gcc-plugins.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
Pixel Security
