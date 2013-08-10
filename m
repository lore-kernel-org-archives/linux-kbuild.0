Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:43312 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S968472Ab3HJJGu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 10 Aug 2013 05:06:50 -0400
Date: Sat, 10 Aug 2013 11:06:43 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 1/4] KConf: Move flavours into their own
	subdirectories.
Message-ID: <20130810090643.GB8521@merkur.ravnborg.org>
References: <1375612711-17140-1-git-send-email-david.graeff@web.de> <1375612711-17140-2-git-send-email-david.graeff@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1375612711-17140-2-git-send-email-david.graeff@web.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Graeff <david.graeff@web.de>
Cc: linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr

On Sun, Aug 04, 2013 at 12:38:28PM +0200, David Graeff wrote:
> Split out non-generic Makefile targets into new Makefiles.
> Each flavour has its own specific Makefile now.
> 
> Signed-off-by: David Graeff <david.graeff@web.de>
> 
>  create mode 100644 scripts/kconfig/gconfig/Makefile
>  rename scripts/kconfig/{ => gconfig}/gconf.c (99%)
>  rename scripts/kconfig/{ => gconfig}/gconf.glade (100%)
>  create mode 100644 scripts/kconfig/lxdialog/Makefile
>  rename scripts/kconfig/{ => lxdialog}/mconf.c (99%)
>  create mode 100644 scripts/kconfig/nconfig/Makefile
>  rename scripts/kconfig/{ => nconfig}/nconf.c (99%)
>  rename scripts/kconfig/{ => nconfig}/nconf.gui.c (100%)
>  rename scripts/kconfig/{ => nconfig}/nconf.h (100%)
>  create mode 100644 scripts/kconfig/qconfig/Makefile
>  rename scripts/kconfig/{ => qconfig}/qconf.cc (99%)
>  rename scripts/kconfig/{ => qconfig}/qconf.h (100%)

Please provide the full diffstat for the patch.
git format-patch -n will do this for you.

Each directory should be named after the frontend IMO.
So lxdialog dir should be renamed to menuconfig.

> 
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 844bc9d..08524cc 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -110,6 +100,7 @@ help:
>  	@echo  '  nconfig         - Update current config utilising a ncurses menu based program'
>  	@echo  '  menuconfig	  - Update current config utilising a menu based program'
>  	@echo  '  xconfig	  - Update current config utilising a QT based front-end'
> +	@echo  '  qconfig	  - Update current config utilising a QT based front-end'
>  	@echo  '  gconfig	  - Update current config utilising a GTK based front-end'
>  	@echo  '  oldconfig	  - Update current config utilising a provided .config as base'
>  	@echo  '  localmodconfig  - Update current config disabling modules not loaded'

So you sneaked in a new "qconfig" target.
This belongs in a separate patch - and we already have xconfig so I suggest to drop it.

> -clean-files	:= qconf.moc .tmp_qtcheck .tmp_gtkcheck
> -clean-files	+= zconf.tab.c zconf.lex.c zconf.hash.c gconf.glade.h
> -clean-files     += mconf qconf gconf nconf
> +clean-files	:= zconf.tab.c zconf.lex.c zconf.hash.c
>  clean-files     += config.pot linux.pot
OK

> diff --git a/scripts/kconfig/gconfig/Makefile b/scripts/kconfig/gconfig/Makefile
> new file mode 100644
> index 0000000..335ee5e
> --- /dev/null
> +++ b/scripts/kconfig/gconfig/Makefile
> @@ -0,0 +1,63 @@
> +# ===========================================================================
> +# Kernel configuration targets
> +# These targets are used from top-level makefile
> +
> +PHONY += gconfig
> +
> +gconfig: $(obj)/gconf
> +	$< $(Kconfig)
> +
> +# ===========================================================================
> +# Shared Makefile for some of the kconfig executables:
> +# gconf:  Used for the gconfig target
> +#         Based on GTK which needs to be installed to compile it
> +# object files used by all kconfig flavours listed above
> +
> +gconf-objs	:= gconfig/gconf.o zconf.tab.o
> +
> +ifeq ($(MAKECMDGOALS),gconfig)
> +	gconf-target := 1
> +endif
> +
> +ifeq ($(gconf-target),1)
> +	hostprogs-y += gconf
> +endif
> +
> +clean-files	+= zconf.tab.c gconfig/gconf.glade.h gconf
zconf.tab.c should be dropped here.

Other than these small nits it looks good.

	Sam
