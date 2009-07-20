Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f213.google.com ([209.85.217.213]:62661 "EHLO
	mail-gx0-f213.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753943AbZGTVMN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Jul 2009 17:12:13 -0400
Received: by gxk9 with SMTP id 9so4444970gxk.13
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Jul 2009 14:12:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090720200522.GA6854@merkur.ravnborg.org>
References: <20090720100157.GA6467@merkur.ravnborg.org> <1248086059.15751.8405.camel@twins>
	<20090720115134.GA6517@merkur.ravnborg.org> <1248091243.15751.8550.camel@twins>
	<20090720171200.GA6730@merkur.ravnborg.org> <20090720200522.GA6854@merkur.ravnborg.org>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 20 Jul 2009 17:05:12 -0400
Message-ID: <8bd0f97a0907201405s5d6f79e7me82cd7ca05daaf3a@mail.gmail.com>
Subject: Re: [PATCH] kbuild: save ARCH & CROSS_COMPILE when building a kernel
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jul 20, 2009 at 16:05, Sam Ravnborg wrote:
> --- a/arch/blackfin/Makefile
> +++ b/arch/blackfin/Makefile
> @@ -155,7 +155,7 @@ define archhelp
>   echo  '* vmImage.gz      - Kernel-only image for U-Boot (arch/$(ARCH)/boot/vmImage.gz)'
>   echo  '  vmImage.lzma    - Kernel-only image for U-Boot (arch/$(ARCH)/boot/vmImage.lzma)'
>   echo  '  install         - Install kernel using'
> -  echo  '                     (your) ~/bin/$(CROSS_COMPILE)installkernel or'
> -  echo  '                     (distribution) PATH: $(CROSS_COMPILE)installkernel or'
> +  echo  '                     (your) ~/bin/$(INSTALLKERNEL) or'
> +  echo  '                     (distribution) PATH: $(INSTALLKERNEL) or'
>   echo  '                     install to $$(INSTALL_PATH)'
>  endef
> diff --git a/arch/blackfin/boot/install.sh b/arch/blackfin/boot/install.sh
> index 9560a6b..e2c6e40 100644
> --- a/arch/blackfin/boot/install.sh
> +++ b/arch/blackfin/boot/install.sh
> @@ -36,9 +36,9 @@ verify "$3"
>
>  # User may have a custom install script
>
> -if [ -x ~/bin/${CROSS_COMPILE}installkernel ]; then exec ~/bin/${CROSS_COMPILE}installkernel "$@"; fi
> -if which ${CROSS_COMPILE}installkernel >/dev/null 2>&1; then
> -       exec ${CROSS_COMPILE}installkernel "$@"
> +if [ -x ~/bin/${INSTALLKERNEL} ]; then exec ~/bin/${INSTALLKERNEL} "$@"; fi
> +if which ${INSTALLKERNEL} >/dev/null 2>&1; then
> +       exec ${INSTALLKERNEL} "$@"
>  fi
>
>  # Default install - same as make zlilo

np with this, Acked-by-me
-mike
