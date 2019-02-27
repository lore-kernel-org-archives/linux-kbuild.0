Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:17374 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727316AbfB0N2b (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Feb 2019 08:28:31 -0500
MIME-Version: 1.0
References: <1550821211-30324-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1550821211-30324-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 27 Feb 2019 22:27:42 +0900
Message-ID: <CAK7LNAQy=nf6n11_dNQYCe-pq3t99ENyQASziVQFOA0KTtU68g@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] kbuild: move tools_silent to a more relevant place
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Feb 22, 2019 at 4:40 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> This would disturb the change the sub-make part. Move it near the
> tools/ target.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Series, applied to linux-kbuild.



> Changes in v2: None
>
>  Makefile | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index bf4e77b..82091b8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -90,7 +90,6 @@ endif
>
>  ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
>    quiet=silent_
> -  tools_silent=s
>  endif
>
>  export quiet Q KBUILD_VERBOSE
> @@ -1678,6 +1677,11 @@ image_name:
>         @echo $(KBUILD_IMAGE)
>
>  # Clear a bunch of variables before executing the submake
> +
> +ifeq ($(quiet),silent_)
> +tools_silent=s
> +endif
> +
>  tools/: FORCE
>         $(Q)mkdir -p $(objtree)/tools
>         $(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(src)/tools/
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
