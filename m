Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38082 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbgCFMR0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Mar 2020 07:17:26 -0500
MIME-Version: 1.0
References: <20200302062340.21453-1-masahiroy@kernel.org> <20200302062340.21453-2-masahiroy@kernel.org>
In-Reply-To: <20200302062340.21453-2-masahiroy@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Mar 2020 13:17:15 +0100
Message-ID: <CAMuHMdWUvKXOU1LWZ-Vmb_tTe8b1wHrWFW6dEnENNSs0S7AvWQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: make 'imply' obey the direct dependency
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicolas Pitre <nico@fluxnic.net>, Ulf Magnusson <ulfalizer@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Randy Dunlap <rdunlap@infradead.org>

Hi Yamada-san,

On Mon, Mar 2, 2020 at 7:24 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> The 'imply' statement may create unmet direct dependency when the
> implied symbol depends on m.
>
> [Test Code]
>
>   config FOO
>           tristate "foo"
>           imply BAZ
>
>   config BAZ
>           tristate "baz"
>           depends on BAR
>
>   config BAR
>           def_tristate m
>
>   config MODULES
>           def_bool y
>           option modules
>
> If you set FOO=y, BAZ is also promoted to y, which results in the
> following .config file:
>
>   CONFIG_FOO=y
>   CONFIG_BAZ=y
>   CONFIG_BAR=m
>   CONFIG_MODULES=y
>
> This does not meet the dependency 'BAZ depends on BAR'.
>
> Unlike 'select', what is worse, Kconfig never shows the
> 'WARNING: unmet direct dependencies detected for ...' for this case.
>
> Because 'imply' is considered to be weaker than 'depends on', Kconfig
> should take the direct dependency into account.
>
> For clarification, describe this case in kconfig-language.rst too.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

This fixes some issue with "imply SND_SOC_WCD934X".
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
