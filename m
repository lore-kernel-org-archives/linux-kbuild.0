Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:33332 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932740AbeALLFQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jan 2018 06:05:16 -0500
MIME-Version: 1.0
In-Reply-To: <1515718701-4552-2-git-send-email-yamada.masahiro@socionext.com>
References: <1515718701-4552-1-git-send-email-yamada.masahiro@socionext.com> <1515718701-4552-2-git-send-email-yamada.masahiro@socionext.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Fri, 12 Jan 2018 12:05:15 +0100
Message-ID: <CAFkk2KS8GqCmXNxvSbTULQNuZK-PTN4fX=vyCY4TBgTMOOXaVw@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: remove unnecessary LEX_PREFIX and YACC_PREFIX
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jan 12, 2018 at 1:58 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Kconfig was the only user of these.  With Kconfig converted to use
> the default 'yy' prefix, we do not need them any more.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/Makefile.lib | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 0f9ef3f..5ff2761 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -188,10 +188,8 @@ endef
>
>  # LEX
>  # ---------------------------------------------------------------------------
> -LEX_PREFIX = $(if $(LEX_PREFIX_${baseprereq}),$(LEX_PREFIX_${baseprereq}),yy)
> -
>  quiet_cmd_flex = LEX     $@
> -      cmd_flex = $(LEX) -o$@ -L -P $(LEX_PREFIX) $<
> +      cmd_flex = $(LEX) -o$@ -L $<
>
>  ifdef REGENERATE_PARSERS
>  .PRECIOUS: $(src)/%.lex.c_shipped
> @@ -205,10 +203,8 @@ $(filter %.lex.c,$(targets)): $(obj)/%.lex.c: $(src)/%.l FORCE
>
>  # YACC
>  # ---------------------------------------------------------------------------
> -YACC_PREFIX = $(if $(YACC_PREFIX_${baseprereq}),$(YACC_PREFIX_${baseprereq}),yy)
> -
>  quiet_cmd_bison = YACC    $@
> -      cmd_bison = $(YACC) -o$@ -t -l -p $(YACC_PREFIX) $<
> +      cmd_bison = $(YACC) -o$@ -t -l $<
>
>  ifdef REGENERATE_PARSERS
>  .PRECIOUS: $(src)/%.tab.c_shipped
> --
> 2.7.4
>

Acked-by: Ulf Magnusson <ulfalizer@gmail.com>

Cheers,
Ulf
