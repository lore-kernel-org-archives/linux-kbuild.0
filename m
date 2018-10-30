Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:23674 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbeJaAzt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Oct 2018 20:55:49 -0400
MIME-Version: 1.0
References: <1540827688-15999-1-git-send-email-yamada.masahiro@socionext.com> <1540827688-15999-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1540827688-15999-2-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 31 Oct 2018 01:00:40 +0900
Message-ID: <CAK7LNARQ2fJS95NevLpeo4duvOr3zbMm_xSBwc3_uAPr1SKKXA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: remove silentoldconfig target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Networking <netdev@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, intel-wired-lan@lists.osuosl.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Oct 30, 2018 at 12:43 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> As commit 911a91c39cab ("kconfig: rename silentoldconfig to
> syncconfig") announced, it is time for the removal.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.



>  Documentation/networking/ice.rst | 2 +-
>  scripts/kconfig/Makefile         | 9 +--------
>  2 files changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/networking/ice.rst b/Documentation/networking/ice.rst
> index 1e4948c..4d118b8 100644
> --- a/Documentation/networking/ice.rst
> +++ b/Documentation/networking/ice.rst
> @@ -20,7 +20,7 @@ Enabling the driver
>  The driver is enabled via the standard kernel configuration system,
>  using the make command::
>
> -  make oldconfig/silentoldconfig/menuconfig/etc.
> +  make oldconfig/menuconfig/etc.
>
>  The driver is located in the menu structure at:
>
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 5d37a60..63b6092 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -68,14 +68,7 @@ PHONY += $(simple-targets)
>  $(simple-targets): $(obj)/conf
>         $< $(silent) --$@ $(Kconfig)
>
> -PHONY += silentoldconfig savedefconfig defconfig
> -
> -# We do not expect manual invokcation of "silentoldcofig" (or "syncconfig").
> -silentoldconfig: syncconfig
> -       @echo "  WARNING: \"silentoldconfig\" has been renamed to \"syncconfig\""
> -       @echo "            and is now an internal implementation detail."
> -       @echo "            What you want is probably \"oldconfig\"."
> -       @echo "            \"silentoldconfig\" will be removed after Linux 4.19"
> +PHONY += savedefconfig defconfig
>
>  savedefconfig: $(obj)/conf
>         $< $(silent) --$@=defconfig $(Kconfig)
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
