Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:45448 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751409AbeEQG34 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 May 2018 02:29:56 -0400
Received: by mail-ua0-f195.google.com with SMTP id j5-v6so2189374uak.12
        for <linux-kbuild@vger.kernel.org>; Wed, 16 May 2018 23:29:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1526537830-22606-29-git-send-email-yamada.masahiro@socionext.com>
References: <1526537830-22606-1-git-send-email-yamada.masahiro@socionext.com> <1526537830-22606-29-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 16 May 2018 23:29:55 -0700
Message-ID: <CAGXu5jKSwSj6GiaDbmL2DHHqWUQTfPpQ=+8HtHxDUWrnK_9xHw@mail.gmail.com>
Subject: Re: [PATCH v4 28/31] gcc-plugins: move GCC version check for PowerPC
 to Kconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, "Luis R . Rodriguez" <mcgrof@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Emese Revfy <re.emese@gmail.com>, X86 ML <x86@kernel.org>

On Wed, May 16, 2018 at 11:17 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> For PowerPC, GCC 5.2 is the requirement for GCC plugins.  Move the
> version check to Kconfig so that the GCC plugin menus will be hidden
> if an older compiler is in use.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Acked-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
Pixel Security
