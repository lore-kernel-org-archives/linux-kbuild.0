Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:36237 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752079AbdESR3M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 May 2017 13:29:12 -0400
MIME-Version: 1.0
In-Reply-To: <20170519150813.27845-1-tycho@docker.com>
References: <20170519150813.27845-1-tycho@docker.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 May 2017 19:29:05 +0200
Message-ID: <CAMuHMdUjyatcp5ROwOW3JJWsTHqc79PCpdVrhFYCSFoFQr5YTg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: always use user input symbols
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tycho Andersen <tycho@docker.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, linux-kbuild <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>

Hi Tycho,

On Fri, May 19, 2017 at 5:08 PM, Tycho Andersen <tycho@docker.com> wrote:
> ...regardless of visibility.
>
> When a symbol that is not visible by default (e.g. PNFS_FLEXFILE_LAYOUT)
> has a default value, it is impossible to set the value to something not the
> default:
>
> ~/packages/linux render-symbol-inputs grep FLEXFILE .config
> CONFIG_PNFS_FLEXFILE_LAYOUT=y
> ~/packages/linux render-symbol-inputs make oldconfig
> scripts/kconfig/conf  --oldconfig Kconfig
> ~/packages/linux render-symbol-inputs grep FLEXFILE .config
> CONFIG_PNFS_FLEXFILE_LAYOUT=m
>
> There are two reasons for this: the symbol's user input value is only
> considered when it is visible (hunks 2 and 3), and the user values are
> explicitly ignored (hunk 1) if the symbols are not visible.
>
> It's not clear to me why hunk 1 exists. I'm sure it solve some problem, but
> I'm not sure why we would ever want to discard user input values, and
> causes a problem exactly as the comment describes.

This is intentional.  If a symbol is not visible, it's not meant to be changed
by the user, as doing so may break things (at build or runtime).

E.g. running "make oldconfig" after a kernel upgrade may retain the old
state of a variable, which is now invalid.  Ignoring invisible symbols
avoids this.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
