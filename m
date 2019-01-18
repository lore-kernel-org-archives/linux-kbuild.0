Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:36958 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727167AbfARH5l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Jan 2019 02:57:41 -0500
MIME-Version: 1.0
References: <20190114135144.26096-1-geert+renesas@glider.be> <CAK7LNASdA+5_pdTjr1dY-cKGSDq804Huc_CX_8-Gg+ypFCmajQ@mail.gmail.com>
In-Reply-To: <CAK7LNASdA+5_pdTjr1dY-cKGSDq804Huc_CX_8-Gg+ypFCmajQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Jan 2019 08:57:27 +0100
Message-ID: <CAMuHMdWGbJwWXMK7f10n2zPSiMEj7EHJfiK0Pj4ABHHu3f4sdw@mail.gmail.com>
Subject: Re: [PATCH 00/12] selftests: Miscellaneous fixes
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Shuah Khan <shuah@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamv2005@gmail.com>, Kees Cook <keescook@chromium.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>

Hi Yamada-san,

On Fri, Jan 18, 2019 at 5:15 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> On Mon, Jan 14, 2019 at 10:52 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > This patch series contains several build fixes and cleanups for issues I
> > encountered when trying to cross-build an rtctest binary in a separate
> > output directory (like I use for all my kernel builds).
>
> Geert,
> Thanks for working on this!
>
> My fundamental question is,
> why did tools/ opt out Kbuild?

Good question.  I think it originally started as a separate small project.

> I think lots of mess comes in
> in order to support
>   cd tools/gpio; make
>
> instead of
>
>   make tools/gpio/
>
> Lots of files are duplicated in tools/build/
> in order to invent a different build system for tools/

I agree switching to kbuild would be the best solution.
Unfortunately my kbuild foo is not strong enough...

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
