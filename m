Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:32412 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S975161AbdDXSGV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Apr 2017 14:06:21 -0400
MIME-Version: 1.0
In-Reply-To: <1481819733-3002-1-git-send-email-robert.jarzmik@free.fr>
References: <1481819733-3002-1-git-send-email-robert.jarzmik@free.fr>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 25 Apr 2017 03:06:04 +0900
Message-ID: <CAK7LNAQN2ZRFETM818ySYSOx1Tykhq7RCYeyFv=x1ARH7w7cww@mail.gmail.com>
Subject: Re: [PATCH v2] tags: honor COMPILED_SOURCE with apart output directory
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Robert,



2016-12-16 1:35 GMT+09:00 Robert Jarzmik <robert.jarzmik@free.fr>:
> When the kernel is compiled with an "O=" argument, the object files are
> not necessarily in the source tree, and more probably in another tree.

Always in objtree.


> In this situation, the current used check doesn't work, and
> COMPILED_SOURCE tags is broken with O= builds.
>
> This patch fixes it by looking for object files both in source tree and
> potential destination tree.
>
> It was verified that in the case of O= usage, the current directory is
> the build tree, ie. the tree referenced by O=xxx, and j is the source
> tree path concatenated with relative path of the object to the source
> tree root, hence the simple expression to compute "k" as the built
> object.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---
> Since v1: amended k expression, Marek's comments
> ---
>  scripts/tags.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/tags.sh b/scripts/tags.sh
> index a2ff3388e5ea..35cb64d5211c 100755
> --- a/scripts/tags.sh
> +++ b/scripts/tags.sh
> @@ -106,7 +106,8 @@ all_compiled_sources()
>                 case "$i" in
>                         *.[cS])
>                                 j=${i/\.[cS]/\.o}
> -                               if [ -e $j ]; then
> +                               k="${j#$tree}"
> +                               if [ -e $j -o -e "$k" ]; then


Do we need to check both srctree and objtree?
I think checking objtree (after $tree is ripped off) is enough.


-- 
Best Regards
Masahiro Yamada
