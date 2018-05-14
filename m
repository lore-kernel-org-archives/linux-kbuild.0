Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:62945 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751853AbeENB4T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 13 May 2018 21:56:19 -0400
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com [209.85.213.45]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id w4E1u8dw015473
        for <linux-kbuild@vger.kernel.org>; Mon, 14 May 2018 10:56:08 +0900
Received: by mail-vk0-f45.google.com with SMTP id u8-v6so5736463vku.5
        for <linux-kbuild@vger.kernel.org>; Sun, 13 May 2018 18:56:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180512194613.24059-1-petr.vorel@gmail.com>
References: <20180512194613.24059-1-petr.vorel@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 14 May 2018 10:55:27 +0900
Message-ID: <CAK7LNAQK9fZ=FBXUZxrVBK4v+fTgdHjsEONQ2LTHDQCFcoqrNQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] Makefile: Add testconfig target into doc
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-05-13 4:46 GMT+09:00 Petr Vorel <petr.vorel@gmail.com>:
> make testconfig appeared in these commits:
> 022a4bf6b59d kconfig: tests: add framework for Kconfig unit testing
> 1903c5119059 kconfig: tests: add basic choice tests
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  Makefile | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index d0d2652db174..da9a254203f7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1477,6 +1477,9 @@ help:
>         @echo  'Documentation targets:'
>         @$(MAKE) -f $(srctree)/Documentation/Makefile dochelp
>         @echo  ''
> +       @echo  'Testing targets:'
> +       @echo  '  testconfig   - Run Kconfig unit tests'
> +       @echo  ''
>         @echo  'Architecture specific targets ($(SRCARCH)):'
>         @$(if $(archhelp),$(archhelp),\
>                 echo '  No architecture specific help defined for $(SRCARCH)')
> --

I think this should be added to scripts/kconfig/Makefile

Can you also mention 'python3 and pytest are required' ?



-- 
Best Regards
Masahiro Yamada
