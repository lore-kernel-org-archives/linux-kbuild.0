Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:46303 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751524AbeEQG3A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 May 2018 02:29:00 -0400
Received: by mail-ua0-f194.google.com with SMTP id e8-v6so2189340uam.13
        for <linux-kbuild@vger.kernel.org>; Wed, 16 May 2018 23:28:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1526537830-22606-7-git-send-email-yamada.masahiro@socionext.com>
References: <1526537830-22606-1-git-send-email-yamada.masahiro@socionext.com> <1526537830-22606-7-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 16 May 2018 23:28:58 -0700
Message-ID: <CAGXu5j+iAHM06OnJ8ECt1ZHHRrX+J++dy=pSSJf-kb0Z2C+8Cw@mail.gmail.com>
Subject: Re: [PATCH v4 06/31] kconfig: remove sym_expand_string_value()
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, "Luis R . Rodriguez" <mcgrof@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Emese Revfy <re.emese@gmail.com>, X86 ML <x86@kernel.org>

On Wed, May 16, 2018 at 11:16 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> There is no more caller of sym_expand_string_value().
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

Easy to review! :)

-Kees

-- 
Kees Cook
Pixel Security
