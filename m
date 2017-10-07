Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:47909 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750931AbdJGLZC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Oct 2017 07:25:02 -0400
MIME-Version: 1.0
In-Reply-To: <20171002234421.20254-3-shuahkh@osg.samsung.com>
References: <20171002234421.20254-1-shuahkh@osg.samsung.com> <20171002234421.20254-3-shuahkh@osg.samsung.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 7 Oct 2017 20:24:10 +0900
Message-ID: <CAK7LNAS0Zc=_r9wLOssY9hy=d+yGJSew3Maaw_5bGdC=pr6YTw@mail.gmail.com>
Subject: Re: [PATCH] Makefile: enable dochelp run from main make level
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: Michal Marek <mmarek@suse.com>, Jonathan Corbet <corbet@lwn.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-10-03 8:44 GMT+09:00 Shuah Khan <shuahkh@osg.samsung.com>:
> Change to enable dochelp run from main make level to make it easier to
> use it.
>
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index cf007a31d575..f99d1b36c437 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1454,7 +1454,7 @@ $(help-board-dirs): help-%:
>
>  # Documentation targets
>  # ---------------------------------------------------------------------------
> -DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs linkcheckdocs
> +DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs linkcheckdocs dochelp
>  PHONY += $(DOC_TARGETS)
>  $(DOC_TARGETS): scripts_basic FORCE
>         $(Q)$(MAKE) $(build)=Documentation $@
> --
> 2.11.0
>


The dochelp is invoked from "make help" of the main make level.

Do you mean "make dochelp" is also necessary?



-- 
Best Regards
Masahiro Yamada
