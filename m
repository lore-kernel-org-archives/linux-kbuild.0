Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:53801 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgBLNXI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Feb 2020 08:23:08 -0500
MIME-Version: 1.0
References: <20200210131925.145463-1-samitolvanen@google.com>
In-Reply-To: <20200210131925.145463-1-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 12 Feb 2020 22:22:27 +0900
Message-ID: <CAK7LNAS7UchtP_+2m4AB-hJ=nMwsM-qpkJ+VHU1JGJrn8K1KPg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove duplicate dependencies from .mod files
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Sami,

On Mon, Feb 10, 2020 at 10:19 PM Sami Tolvanen <samitolvanen@google.com> wrote:
>
> With CONFIG_TRIM_UNUSED_SYMS, if a module has enough dependencies to
> exceed the default xargs command line size limit, the output is split
> into multiple lines, which can result in used symbols getting trimmed.
>
> This change removes duplicate dependencies, which will reduce the
> probability of this happening and makes .mod files smaller and easier
> to read.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/Makefile.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index a1730d42e5f3..a083bcec19d3 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -257,7 +257,7 @@ endef
>
>  # List module undefined symbols (or empty line if not enabled)
>  ifdef CONFIG_TRIM_UNUSED_KSYMS
> -cmd_undef_syms = $(NM) $< | sed -n 's/^  *U //p' | xargs echo
> +cmd_undef_syms = $(NM) $< | sed -n 's/^  *U //p' | sort -u | xargs echo



In which case are undefined symbols duplicated?

Do you have a .config to reproduce it?



>  else
>  cmd_undef_syms = echo
>  endif
>
> base-commit: bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9
> --
> 2.25.0.341.g760bfbb309-goog
>


-- 
Best Regards
Masahiro Yamada
