Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:61594 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751112Ab2D0FNB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 Apr 2012 01:13:01 -0400
Received: by wgbdr13 with SMTP id dr13so349544wgb.1
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Apr 2012 22:12:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1335496484-3438-1-git-send-email-laface.tw@gmail.com>
References: <1335496484-3438-1-git-send-email-laface.tw@gmail.com>
Date: Fri, 27 Apr 2012 07:12:59 +0200
Message-ID: <CAMuHMdVYFvszp=5_ZG4ztpviTV_wj_+zSd=C3UAXk_YwR6GZ5A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Makefile: remove unnecessary check for m68knommu ARCH
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Edward Shao <laface.tw@gmail.com>
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz, sam@ravnborg.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Apr 27, 2012 at 05:14, Edward Shao <laface.tw@gmail.com> wrote:
> ARCH is never set to m68knomm.
> make ARCH=m68knomm is not supported anymore.
>
> Signed-off-by: Edward Shao <laface.tw@gmail.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> ---
>  Makefile |    4 ----
>  1 files changed, 0 insertions(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index afc868e..6f46cf9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -231,10 +231,6 @@ endif
>  # Where to locate arch specific headers
>  hdr-arch  := $(SRCARCH)
>
> -ifeq ($(ARCH),m68knommu)
> -       hdr-arch  := m68k
> -endif
> -
>  KCONFIG_CONFIG ?= .config
>  export KCONFIG_CONFIG
>
> --
> 1.7.7.6

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
