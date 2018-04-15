Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f179.google.com ([209.85.217.179]:39279 "EHLO
        mail-ua0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752470AbeDOQEr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 15 Apr 2018 12:04:47 -0400
Received: by mail-ua0-f179.google.com with SMTP id g10so8612703ual.6
        for <linux-kbuild@vger.kernel.org>; Sun, 15 Apr 2018 09:04:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQqmdABvUEtqtOWuw_5YTUaY+0P8GXnzDx+ycSavNtukA@mail.gmail.com>
References: <1523595999-27433-1-git-send-email-yamada.masahiro@socionext.com>
 <1523595999-27433-22-git-send-email-yamada.masahiro@socionext.com>
 <CAGXu5jLt4xoxXTw83-npD4WmumPzSC9WnbOkkDoR=VYa5R4rYw@mail.gmail.com>
 <CA+55aFyM1uxzvU4SH3c1VYRXBRfGuqKZ4OR-O_pMoxPs7XTFug@mail.gmail.com> <CAK7LNAQqmdABvUEtqtOWuw_5YTUaY+0P8GXnzDx+ycSavNtukA@mail.gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Sun, 15 Apr 2018 09:04:44 -0700
Message-ID: <CAGXu5jKE3DA84XT8TqLHthGQ1wc8vUwNDsCz0AWfyCLwg8cg=Q@mail.gmail.com>
Subject: Re: [PATCH 21/30] stack-protector: test compiler capability in
 Kconfig and drop AUTO mode
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Emese Revfy <re.emese@gmail.com>, X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Sun, Apr 15, 2018 at 6:28 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> In my Makefile ...
>
> stackp-flags-$(CONFIG_CC_HAS_STACKPROTECTOR_NONE) := -fno-stack-protector
> stackp-flags-$(CONFIG_CC_STACKPROTECTOR)          := -fstack-protector
> stackp-flags-$(CONFIG_CC_STACKPROTECTOR_STRONG)   := -fstack-protector-strong
>
> KBUILD_CFLAGS += $(stackp-flags-y)
>
> the last one is picked.

Ah! Yes, sorry for the noise. I see the := instead of += now. Thanks!

-Kees

-- 
Kees Cook
Pixel Security
