Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:30930 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfGDAn5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Jul 2019 20:43:57 -0400
MIME-Version: 1.0
References: <1560752096-1323-1-git-send-email-Cedric_Hombourger@mentor.com>
In-Reply-To: <1560752096-1323-1-git-send-email-Cedric_Hombourger@mentor.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 4 Jul 2019 09:43:04 +0900
Message-ID: <CAK7LNASCmZyS11WkUWXLXVWgk-WU5JV=MMw=S6pXAzMhkVJ40Q@mail.gmail.com>
Subject: Re: [PATCH] builddeb: generate multi-arch friendly linux-libc-dev package
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cedric Hombourger <Cedric_Hombourger@mentor.com>
Cc: isar-users@googlegroups.com, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ben Hutchings <ben@decadent.org.uk>, Riku Voipio <riku.voipio@linaro.org>

CCed a couple of people.

On Mon, Jun 17, 2019 at 3:15 PM Cedric Hombourger
<Cedric_Hombourger@mentor.com> wrote:
>
> Debian-based distributions place libc header files in a machine
> specific directory (/usr/include/<libc-machine>) instead of
> /usr/include/asm to support installation of the linux-libc-dev
> package from multiple architectures. Move headers installed by
> "make headers_install" accordingly.
>
> Signed-off-by: Cedric Hombourger <Cedric_Hombourger@mentor.com>
> Reviewed-by: Henning Schild <henning.schild@siemens.com>
> ---
>  scripts/package/builddeb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index b03dd56a4782..8f7afb3a84e9 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -132,6 +132,11 @@ fi
>  if [ "$ARCH" != "um" ]; then
>         $MAKE -f $srctree/Makefile headers_check
>         $MAKE -f $srctree/Makefile headers_install INSTALL_HDR_PATH="$libc_headers_dir/usr"
> +       # move asm headers to /usr/include/<libc-machine>/asm to match the structure
> +       # used by Debian-based distros (to support multi-arch)
> +       libc_mach=$($CC -dumpmachine)
> +       mkdir $libc_headers_dir/usr/include/$libc_mach
> +       mv $libc_headers_dir/usr/include/asm $libc_headers_dir/usr/include/$libc_mach/
>  fi
>
>  # Install the maintainer scripts


I am not sure but,
I just worried about the backward compatibility...
Was this previously broken?

I guess debian is using own control file
instead of the one in upstream kernel.
So, this is almost a matter for developers, I think.

How did debian-base distros managed this before,
and will this introduce no breakage?

Ben,
Could you comment on this?


-- 
Best Regards
Masahiro Yamada
