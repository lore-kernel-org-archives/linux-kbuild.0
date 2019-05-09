Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:44392 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbfEIQLk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 12:11:40 -0400
Received: by mail-vs1-f67.google.com with SMTP id j184so1749727vsd.11
        for <linux-kbuild@vger.kernel.org>; Thu, 09 May 2019 09:11:40 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id e6sm2974117vkf.0.2019.05.09.09.11.37
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 09:11:37 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id q189so715737vkq.11
        for <linux-kbuild@vger.kernel.org>; Thu, 09 May 2019 09:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190509064549.1302-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190509064549.1302-1-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 9 May 2019 09:11:25 -0700
Message-ID: <CAGXu5jKDELCthqEcnL3TvC8DtMnfoWnOd14wrKpcReUxubdMCg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add -Wvla flag unconditionally
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Arnd Bergmann <arnd@arndb.de>, clang-built-linux@googlegroups.com, Michal Marek <michal.lkml@markovi.net>, LKML <linux-kernel@vger.kernel.org>

On Wed, May 8, 2019 at 11:46 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> This flag is documented in the GCC 4.6 manual, and recognized by
> Clang as well. Let's rip off the cc-option switch.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
