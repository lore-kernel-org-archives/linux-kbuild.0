Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:40973 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgBADO0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Jan 2020 22:14:26 -0500
MIME-Version: 1.0
References: <20200125041235.8856-1-masahiroy@kernel.org>
In-Reply-To: <20200125041235.8856-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 1 Feb 2020 12:13:42 +0900
Message-ID: <CAK7LNARxO7krvxb1TgJpHkaWwvgZ7JNRsOULhgP=AZ4SHht9aw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] builddeb: remove unneeded files in hdrobjfiles for
 headers package
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Ben Hutchings <ben@decadent.org.uk>, Riku Voipio <riku.voipio@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Sat, Jan 25, 2020 at 1:13 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>  - We do not need tools/objtool/fixdep or tools/objtool/sync-check.sh
>    for building external modules. Including tools/objtool/objtool is
>    enough.
>
>  - gcc-common.h is a check-in file. I do not see any point to search
>    for it in objtree.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v3: None

Series, applied.


> Changes in v2: None
>
>  scripts/package/builddeb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index f903ba947daf..d4bb28fbd3de 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -170,11 +170,11 @@ done
>  (cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform) >> "$objtree/debian/hdrsrcfiles"
>  (cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f) >> "$objtree/debian/hdrsrcfiles"
>  if is_enabled CONFIG_STACK_VALIDATION; then
> -       (cd $objtree; find tools/objtool -type f -executable) >> "$objtree/debian/hdrobjfiles"
> +       echo tools/objtool/objtool >> "$objtree/debian/hdrobjfiles"
>  fi
>  (cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts -type f) >> "$objtree/debian/hdrobjfiles"
>  if is_enabled CONFIG_GCC_PLUGINS; then
> -       (cd $objtree; find scripts/gcc-plugins -name \*.so -o -name gcc-common.h) >> "$objtree/debian/hdrobjfiles"
> +       (cd $objtree; find scripts/gcc-plugins -name \*.so) >> "$objtree/debian/hdrobjfiles"
>  fi
>  destdir=$kernel_headers_dir/usr/src/linux-headers-$version
>  mkdir -p "$destdir"
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
