Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35756 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbeIQWwm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Sep 2018 18:52:42 -0400
Received: by mail-pf1-f196.google.com with SMTP id p12-v6so7881490pfh.2
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Sep 2018 10:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20180917073754.24048-1-joel@jms.id.au>
In-Reply-To: <20180917073754.24048-1-joel@jms.id.au>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 17 Sep 2018 10:24:11 -0700
Message-ID: <CAKwvOd=d4FdFzqimdq1os4gkk2JeeC4_-_ZbxVdkkPwd3KmuuQ@mail.gmail.com>
Subject: Re: [PATCH] ftrace: Build with CPPFLAGS to get -Qunused-arguments
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: joel@jms.id.au
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Sep 17, 2018 at 12:38 AM Joel Stanley <joel@jms.id.au> wrote:
>
> When building to record the mcount locations the kernel uses
> KBUILD_CFLAGS but not KBUILD_CPPFLAGS. This means it lacks
> -Qunused-arguments when building with clang, resulting in a lot of
> noisy warnings.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> Not sure why -Qunused-arguments is in CPP instead of KBUILD_CFLAGS. We
> could instead put it in KBUILD_CFLAGS, and not need this patch.

The preprocessor has flags that can change the definitions of macros.
So there might be unused flags there.  I'm not a fan of covering up
those warnings via -Qunused-arguments; the flags should be feature
detected via cc-option and friends rather than always added then
silenced if excessive.  That hides flags that are long dead/unused.

Thanks for this patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
>  scripts/Makefile.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 5a2d1c9578a0..54da4b070db3 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -219,7 +219,7 @@ else
>  sub_cmd_record_mcount = set -e ; perl $(srctree)/scripts/recordmcount.pl "$(ARCH)" \
>         "$(if $(CONFIG_CPU_BIG_ENDIAN),big,little)" \
>         "$(if $(CONFIG_64BIT),64,32)" \
> -       "$(OBJDUMP)" "$(OBJCOPY)" "$(CC) $(KBUILD_CFLAGS)" \
> +       "$(OBJDUMP)" "$(OBJCOPY)" "$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS)" \
>         "$(LD) $(KBUILD_LDFLAGS)" "$(NM)" "$(RM)" "$(MV)" \
>         "$(if $(part-of-module),1,0)" "$(@)";
>  recordmcount_source := $(srctree)/scripts/recordmcount.pl
> --
> 2.17.1
>


-- 
Thanks,
~Nick Desaulniers
