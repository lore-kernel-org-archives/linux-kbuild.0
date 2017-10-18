Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:31791 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750954AbdJRQYT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Oct 2017 12:24:19 -0400
MIME-Version: 1.0
In-Reply-To: <20171017151848.3087-1-shuahkh@osg.samsung.com>
References: <20171017151848.3087-1-shuahkh@osg.samsung.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 19 Oct 2017 01:23:31 +0900
Message-ID: <CAK7LNATNbX0tL-SL2wU59raERmTZm8g6yxEd4rLd976=Gmff=Q@mail.gmail.com>
Subject: Re: [PATCH] Makefile: add targets for config-help and pkg-help
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: Michal Marek <mmarek@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-10-18 0:18 GMT+09:00 Shuah Khan <shuahkh@osg.samsung.com>:
> Change to enable config help and package help from the main make level
> to make it easier to use. It has become difficult to find config help
> and pkg help specific output from the "help" information.
>
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> ---
>  Makefile | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 46bfb0ed2257..1d6f86df1b6c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1441,6 +1441,13 @@ help:
>         @echo  'Execute "make" or "make all" to build all targets marked with [*] '
>         @echo  'For further info see the ./README file'
>
> +PHONY += config-help
> +config-help:
> +       @$(MAKE) -f $(srctree)/scripts/kconfig/Makefile help
> +
> +PHONY += pkg-help
> +pkg-help:
> +       @$(MAKE) $(build)=$(package-dir) help
>
>  help-board-dirs := $(addprefix help-,$(board-dirs))
>
> --


What happened to "doc-help" ?
(I want to see consistent hyphenation)

Please follow Randy's suggestion.

Also you need to add %-help pattern to no-dot-config-targets.



-- 
Best Regards
Masahiro Yamada
