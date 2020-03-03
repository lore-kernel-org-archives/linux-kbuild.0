Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:17398 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbgCCNsU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Mar 2020 08:48:20 -0500
MIME-Version: 1.0
References: <20200226175325.8787-1-masahiroy@kernel.org>
In-Reply-To: <20200226175325.8787-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 3 Mar 2020 22:47:39 +0900
Message-ID: <CAK7LNARVX6bJPO0yPo7k_ateDNmk_bXGfoR8nmkEUbkCVtJTLw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove trailing slash from devicetree/binding/
 for descending
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>

On Thu, Feb 27, 2020 at 2:53 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> obj-* needs a trailing slash for a directory, but subdir-* does not
> because it already implies a directory.
>
> Also, change subdir-y to subdir- to ensure this is effective only
> for cleaning targets.
>
> This makes the cleaning log consistent. (no trailing slash)
>
> Before:
>
>   $ make clean
>   CLEAN   Documentation/devicetree/bindings/
>
> After:
>
>   $ make clean
>   CLEAN   Documentation/devicetree/bindings
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Applied to linux-kbuild.



>
>  Documentation/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index d77bb607aea4..39569a2e1953 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -2,7 +2,8 @@
>  # Makefile for Sphinx documentation
>  #
>
> -subdir-y := devicetree/bindings/
> +# for cleaning
> +subdir- := devicetree/bindings
>
>  # Check for broken documentation file references
>  ifeq ($(CONFIG_WARN_MISSING_DOCUMENTS),y)
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
