Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:34595 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751610AbeEQGll (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 May 2018 02:41:41 -0400
Received: by mail-vk0-f65.google.com with SMTP id t63-v6so2052925vkb.1
        for <linux-kbuild@vger.kernel.org>; Wed, 16 May 2018 23:41:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1526537830-22606-21-git-send-email-yamada.masahiro@socionext.com>
References: <1526537830-22606-1-git-send-email-yamada.masahiro@socionext.com> <1526537830-22606-21-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 16 May 2018 23:41:39 -0700
Message-ID: <CAGXu5jJV0uwxhU_KtLU29rdLwC5M4OmaPqD86Uwv+-jsbW3Maw@mail.gmail.com>
Subject: Re: [PATCH v4 20/31] kconfig: test: add Kconfig macro language tests
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, "Luis R . Rodriguez" <mcgrof@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Emese Revfy <re.emese@gmail.com>, X86 ML <x86@kernel.org>

On Wed, May 16, 2018 at 11:16 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Here are the test cases I used for developing the text expansion
> feature.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Should these be tied to the global Makefile or selftests in any way?

-Kees

-- 
Kees Cook
Pixel Security
