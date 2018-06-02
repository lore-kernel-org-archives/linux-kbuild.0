Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:61545 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750892AbeFBHvE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Jun 2018 03:51:04 -0400
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com [209.85.217.169]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id w527ovAH004335
        for <linux-kbuild@vger.kernel.org>; Sat, 2 Jun 2018 16:50:58 +0900
Received: by mail-ua0-f169.google.com with SMTP id a2-v6so18883716uak.2
        for <linux-kbuild@vger.kernel.org>; Sat, 02 Jun 2018 00:50:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180601055041.12922-2-pvorel@suse.cz>
References: <20180601055041.12922-1-pvorel@suse.cz> <20180601055041.12922-2-pvorel@suse.cz>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 2 Jun 2018 16:50:16 +0900
Message-ID: <CAK7LNATM5VVUghpA1Bd0yCM4xAd9hexnQk4xpfv9=bZa8McXGg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kbuild: Fix indent in help
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-06-01 14:50 GMT+09:00 Petr Vorel <pvorel@suse.cz>:
> + move last word of nconfig help to the previous line
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  scripts/kconfig/Makefile | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 36b092150c45..fda6b1734ee0 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -151,8 +151,7 @@ clean-dirs += tests/.cache
>  # Help text used by make help
>  help:
>         @echo  '  config          - Update current config utilising a line-oriented program'
> -       @echo  '  nconfig         - Update current config utilising a ncurses menu based'
> -       @echo  '                    program'
> +       @echo  '  nconfig         - Update current config utilising a ncurses menu based program'

This is OK.


>         @echo  '  menuconfig      - Update current config utilising a menu based program'
>         @echo  '  xconfig         - Update current config utilising a Qt based front-end'
>         @echo  '  gconfig         - Update current config utilising a GTK+ based front-end'
> @@ -169,7 +168,7 @@ help:
>         @echo  '  listnewconfig   - List new options'
>         @echo  '  olddefconfig    - Same as oldconfig but sets new symbols to their'
>         @echo  '                    default value without prompting'
> -       @echo  '  kvmconfig       - Enable additional options for kvm guest kernel support'
> +       @echo  '  kvmconfig       - Enable additional options for kvm guest kernel support'


Could you explain how the indent was broken on your machine?


I think you replaced a tab after kvmconfig
with some spaces.

But, I see tab-indentation in other lines.
(config, menuconfig, tinyconfig, etc.)

If you change this, you should keep "tab vs space" consistent.





>         @echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel support'
>         @echo  '  tinyconfig      - Configure the tiniest possible kernel'
>         @echo  '  testconfig      - Run Kconfig unit tests (requires python3 and pytest)'
> --
> 2.16.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
