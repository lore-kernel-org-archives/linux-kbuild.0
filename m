Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yh0-f51.google.com ([209.85.213.51]:34618 "EHLO
	mail-yh0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755058AbbEaBKz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 30 May 2015 21:10:55 -0400
MIME-Version: 1.0
In-Reply-To: <1432640395-17310-2-git-send-email-geert+renesas@glider.be>
References: <1432640395-17310-1-git-send-email-geert+renesas@glider.be>
	<1432640395-17310-2-git-send-email-geert+renesas@glider.be>
Date: Sat, 30 May 2015 22:10:54 -0300
Message-ID: <CA+ToGPGAhmKm3RT=GB6Bxi2TBEMsWpjMTTm0WeqgQNATnM6b6g@mail.gmail.com>
Subject: Re: [PATCH 2/3] kconfig: Wrap long "make help" text lines
From: Diego Viola <diego.viola@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

Can you please include a minor change in your patch?

At line 89, there's this:

# on its behavior(sets new symbols to their default value but not 'n') with the

Please change this line to this:

# on its behavior (sets new symbols to their default value but not 'n') with the

There should be a space between "behavior" and the parentheses/bracket.

Thanks,

Diego

On Tue, May 26, 2015 at 8:39 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Some "make help" text lines extend beyond 80 characters. Wrap them at 79
> characters.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  scripts/kconfig/Makefile | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index d9b1fef0c67e3cb4..d19de3665bfbe984 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -122,7 +122,8 @@ tinyconfig:
>  # Help text used by make help
>  help:
>         @echo  '  config          - Update current config utilising a line-oriented program'
> -       @echo  '  nconfig         - Update current config utilising a ncurses menu based program'
> +       @echo  '  nconfig         - Update current config utilising a ncurses menu based'
> +       @echo  '                    program'
>         @echo  '  menuconfig      - Update current config utilising a menu based program'
>         @echo  '  xconfig         - Update current config utilising a QT based front-end'
>         @echo  '  gconfig         - Update current config utilising a GTK based front-end'
> @@ -138,7 +139,8 @@ help:
>         @echo  '  alldefconfig    - New config with all symbols set to default'
>         @echo  '  randconfig      - New config with random answer to all options'
>         @echo  '  listnewconfig   - List new options'
> -       @echo  '  olddefconfig    - Same as silentoldconfig but sets new symbols to their default value'
> +       @echo  '  olddefconfig    - Same as silentoldconfig but sets new symbols to their'
> +       @echo  '                    default value'
>         @echo  '  kvmconfig       - Enable additional options for guest kernel support'
>         @echo  '  tinyconfig      - Configure the tiniest possible kernel'
>
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
