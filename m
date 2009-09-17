Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:60600 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756829AbZIQLpk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Sep 2009 07:45:40 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [patch] Makefile: can't build modules outside the kernel tree if it was built using O=
Date: Thu, 17 Sep 2009 13:45:30 +0200
References: <830a8fa70909161930r518a9644ja954ced2ae5814b4@mail.gmail.com>
In-Reply-To: <830a8fa70909161930r518a9644ja954ced2ae5814b4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200909171345.30988.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Caveh Jalali <ecaveh@gmail.com>
Cc: sam@ravnborg.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday 17 September 2009, Caveh Jalali wrote:

> when the platform specific include directories were shuffled around
> without updating the
> top level Makefile.  however, i think this FAIL is generic, and not
> limited to powerpc.
> here's a patch to the top level Makefile to teach it about the shuffled files:
> 
> 
> --- /local/caveh/linux/linux-2.6.31/Makefile    2009-09-09
> 15:13:59.000000000 -0700
> +++ Makefile    2009-09-16 12:23:05.000000000 -0700
> @@ -958,9 +958,9 @@ ifneq ($(KBUILD_SRC),)
>                 echo "  in the '$(srctree)' directory.";\
>                 /bin/false; \
>         fi;
> -       $(Q)if [ ! -d include2 ]; then                                  \
> -           mkdir -p include2;                                          \
> -           ln -fsn $(srctree)/include/asm-$(SRCARCH) include2/asm;     \
> +       $(Q)if [ ! -d include2 ]; then                                   \
> +           mkdir -p include2;                                           \
> +           ln -fsn $(srctree)/arch/$(SRCARCH)/include/asm include2/asm; \
>         fi
>  endif

I think we should no longer have the include2 directory at all with new kernels.

LINUXINCLUDE already contains the right path in theory:

LINUXINCLUDE    := -Iinclude \
                   $(if $(KBUILD_SRC),-Iinclude2 -I$(srctree)/include) \
                   -I$(srctree)/arch/$(hdr-arch)/include               \
                   -include include/linux/autoconf.h

I'm not sure what goes wrong here. What is the gcc command line you see?

	Arnd <><
