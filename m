Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vs1-f65.google.com ([209.85.217.65]:38302 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726940AbfEJGqs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 02:46:48 -0400
MIME-Version: 1.0
References: <20190510061205.28753-1-yamada.masahiro@socionext.com> <20190510061205.28753-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190510061205.28753-2-yamada.masahiro@socionext.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 May 2019 08:46:35 +0200
Message-ID: <CAMuHMdVmgZjyGxz0F=Akz+3egFtGMppGg6TRAnRhd=KZv5ADdg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: do not write .config if the content is the same
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, Ulf Magnusson <ulfalizer@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Joel Fernandes <joel@joelfernandes.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Yamada-san,

On Fri, May 10, 2019 at 8:14 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Kconfig updates the .config when it exits even if its content is
> exactly the same as before. Since its timestamp becomes newer than
> that of other build artifacts, additional processing is invoked,
> which is annoying.
>
> - syncconfig is invoked to update include/config/auto.conf, etc.
>
> - kernel/config.o is recompiled if CONFIG_IKCONFIG is enabled,
>   then vmlinux is relinked as well.
>
> If the .config is not changed at all, we do not have to even
> touch it. Just bail out showing "No change to .config".
>
>   $ make allmodconfig
>   scripts/kconfig/conf  --allmodconfig Kconfig
>   #
>   # configuration written to .config
>   #
>   $ make allmodconfig
>   scripts/kconfig/conf  --allmodconfig Kconfig
>   #
>   # No change to .config
>   #
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Thanks for your patch!

> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c

> @@ -888,6 +935,13 @@ int conf_write(const char *name)
>         fclose(out);
>
>         if (*tmpname) {
> +               if (is_same(name, tmpname)) {
> +                       conf_message("No change to %s", name);
> +                       unlink(tmpname);
> +                       sym_set_change_count(0);
> +                       return 0;
> +               }
> +
>                 snprintf(oldname, sizeof(oldname), "%s.old", name);
>                 rename(name, oldname);
>                 if (rename(tmpname, name))

This causes a semantic change for the meaning of ".config.old", which is
no longer updated if .config has not changed.
Hence its contents may no longer correspond to the previous config, but to
an arbitrary older version.

My workflow involves always running my own script "linux-oldconfig",
instead of "make oldconfig", so I immediately see what has changed:

    $ cat $(type -p linux-oldconfig)
    #!/bin/bash
    make ${0#*/linux-} && colordiff -u .config{.old,}

However, after your patch, "linux-oldconfig" keeps on showing the old
changes, while .config itself has not changed.  I guess other people
tracking .config changes are using a similar scheme.

One way to fix this is to rename tmpname to oldname if is_same() returns
true. However, this may have side effects for other people, as the
timestamp of .config.old will be changed.

Do you have a better solution?
Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
