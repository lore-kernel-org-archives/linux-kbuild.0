Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:33033 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbfH1QnZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 12:43:25 -0400
MIME-Version: 1.0
References: <20190821173321.15012-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190821173321.15012-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 29 Aug 2019 01:42:42 +0900
Message-ID: <CAK7LNAS=2=D=aQDn_+iYTW6f86TnvHUL68SzCPkdqXxbNZWw-Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove unneeded dependency for $(DOC_TARGETS)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Aug 22, 2019 at 2:33 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Commit 415008af3219 ("docs-rst: convert lsm from DocBook to ReST")
> stopped using if_changed_rule. No more users of if_changed* for the
> doc targets. Hence, fixdep is unneeded. Remove the dependency on
> scripts_basic.
>
> All the doc targets are phony. Depending on FORCE is odd.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index c0be1a4dbfdd..7e54a821b4b0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1578,7 +1578,7 @@ $(help-board-dirs): help-%:
>  DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs \
>                linkcheckdocs dochelp refcheckdocs
>  PHONY += $(DOC_TARGETS)
> -$(DOC_TARGETS): scripts_basic FORCE
> +$(DOC_TARGETS):
>         $(Q)$(MAKE) $(build)=Documentation $@
>
>  # Misc
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
