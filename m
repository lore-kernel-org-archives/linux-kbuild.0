Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:33110 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729936AbfGHOcj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jul 2019 10:32:39 -0400
Received: by mail-lj1-f193.google.com with SMTP id h10so16155908ljg.0
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Jul 2019 07:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190703205527.955320-1-arnd@arndb.de> <20190703205527.955320-2-arnd@arndb.de>
In-Reply-To: <20190703205527.955320-2-arnd@arndb.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Jul 2019 16:32:26 +0200
Message-ID: <CACRpkdYnuSqiYBPMe_+u6dx_X1zSYKCnCtFznWtxkMf-BGBwjA@mail.gmail.com>
Subject: Re: [PATCH 2/3] kasan: disable CONFIG_KASAN_STACK with clang on arm32
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Abbott Liu <liuwenliang@huawei.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, kasan-dev@googlegroups.com, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Andrey Konovalov <andreyknvl@google.com>, Will Deacon <will@kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, clang-built-linux@googlegroups.com

On Wed, Jul 3, 2019 at 10:56 PM Arnd Bergmann <arnd@arndb.de> wrote:

> The CONFIG_KASAN_STACK symbol tells us whether we should be using the
> asan-stack=1 parameter. On clang-8, this causes explosive kernel stack
> frame growth, so it is currently disabled, hopefully to be turned back
> on when a future clang version is fixed. Examples include
>
> drivers/media/dvb-frontends/mb86a20s.c:1942:12: error: stack frame size of 4128 bytes in function
> drivers/net/wireless/atmel/atmel.c:1307:5: error: stack frame size of 4928 bytes in function 'atmel_open'
> drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c:1521:1: error: stack frame size of 5440 bytes in function
> drivers/media/i2c/mt9t112.c:670:12: error: stack frame size of 9344 bytes in function 'mt9t112_init_camera'
> drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.c:185:12: error: stack frame size of 10048 bytes
>
> For the 32-bit ARM build, the logic I introduced earlier does
> not work because $(CFLAGS_KASAN_SHADOW) is empty, and we don't add
> those flags.
>
> Moving the asan-stack= parameter down fixes this. No idea of any
> of the other parameters should also be moved though.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

For some reason the RealView doesn't boot after this patch. Trying to figure
out why.

Yours,
Linus Walleij
