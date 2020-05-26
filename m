Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:59901 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388460AbgEZKaY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 May 2020 06:30:24 -0400
MIME-Version: 1.0
References: <20200522020002.504506-1-masahiroy@kernel.org>
In-Reply-To: <20200522020002.504506-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 26 May 2020 19:29:25 +0900
Message-ID: <CAK7LNARuxFq5NVR5xuD0vEVarQ8te-p1ZEj5990x7Wd3DesTjg@mail.gmail.com>
Subject: Re: [PATCH 1/5] kbuild: remove ifdef builtin-target / lib-target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, May 22, 2020 at 11:00 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I do not see a good reason to add ifdef here.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Applied to linux-kbuild.



>  scripts/Makefile.build | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 3665b1a0bc8e..9af88f4cacb8 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -384,16 +384,14 @@ $(obj)/%/built-in.a: $(obj)/% ;
>  #
>  # Rule to compile a set of .o files into one .a file (without symbol table)
>  #
> -ifdef builtin-target
>
>  quiet_cmd_ar_builtin = AR      $@
>        cmd_ar_builtin = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
>
> -$(builtin-target): $(real-obj-y) FORCE
> +$(obj)/built-in.a: $(real-obj-y) FORCE
>         $(call if_changed,ar_builtin)
>
>  targets += $(builtin-target)
> -endif # builtin-target
>
>  #
>  # Rule to create modules.order file
> @@ -408,15 +406,11 @@ $(modorder-target): $(subdir-ym) FORCE
>  #
>  # Rule to compile a set of .o files into one .a file (with symbol table)
>  #
> -ifdef lib-target
> -
> -$(lib-target): $(lib-y) FORCE
> +$(obj)/lib.a: $(lib-y) FORCE
>         $(call if_changed,ar)
>
>  targets += $(lib-target)
>
> -endif
> -
>  # NOTE:
>  # Do not replace $(filter %.o,^) with $(real-prereqs). When a single object
>  # module is turned into a multi object module, $^ will contain header file
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
