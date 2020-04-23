Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:55269 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbgDWCBR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Apr 2020 22:01:17 -0400
MIME-Version: 1.0
References: <20200423014919.31713-1-masahiroy@kernel.org>
In-Reply-To: <20200423014919.31713-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 23 Apr 2020 11:00:18 +0900
Message-ID: <CAK7LNAQ-5aKSn0J81NMey5+nTis8LZT_mv+bYbndx99SBf_w6w@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kbuild: fix the section title format
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Apr 23, 2020 at 10:49 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Make it consistent with the other sections.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux/fixes.



>  Documentation/kbuild/makefiles.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 04d5c01a2e99..b80257a03830 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -1241,7 +1241,8 @@ When kbuild executes, the following steps are followed (roughly):
>         will be displayed with "make KBUILD_VERBOSE=0".
>
>
> ---- 6.9 Preprocessing linker scripts
> +6.9 Preprocessing linker scripts
> +--------------------------------
>
>         When the vmlinux image is built, the linker script
>         arch/$(ARCH)/kernel/vmlinux.lds is used.
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
