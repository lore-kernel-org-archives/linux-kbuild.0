Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:51142 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbfLRNcq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 08:32:46 -0500
MIME-Version: 1.0
References: <20191218114625.28438-1-frank-w@public-files.de>
In-Reply-To: <20191218114625.28438-1-frank-w@public-files.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 18 Dec 2019 22:31:53 +0900
Message-ID: <CAK7LNARWYE4-4Qp-YfTrrt1YCZ68b28FDoE45cDJkZTqUyXNUw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add DTC_CPP_FLAGS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, DTML <devicetree@vger.kernel.org>

(+CC: DT maintainers)

On Wed, Dec 18, 2019 at 8:55 PM Frank Wunderlich
<frank-w@public-files.de> wrote:
>
> With this Patch we are able to change cpp-preprocessor options
> (e.g. -D...) for using conditions (#ifdef) in devicetree files
> and dynamically add include searchpaths

I think this is questionable
since DT is supposed to describe hardware.
Does it depends on #ifdef or some external defines?

If you want to add variations,
you can add a new DTS which includes other DTS(I) files.



>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  scripts/Makefile.lib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 3fa32f83b2d7..c722a6c7786a 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -177,7 +177,7 @@ DTC_INCLUDE    := $(srctree)/scripts/dtc/include-prefixes
>
>  dtc_cpp_flags  = -Wp,-MD,$(depfile).pre.tmp -nostdinc                    \
>                  $(addprefix -I,$(DTC_INCLUDE))                          \
> -                -undef -D__DTS__
> +                -undef -D__DTS__ $(DTC_CPP_FLAGS)
>
>  # Useful for describing the dependency of composite objects
>  # Usage:
> --
> 2.17.1
>


--
Best Regards


Masahiro Yamada
