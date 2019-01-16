Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:55518 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387533AbfAPOeS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Jan 2019 09:34:18 -0500
MIME-Version: 1.0
References: <1546657311-24661-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1546657311-24661-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 16 Jan 2019 23:33:12 +0900
Message-ID: <CAK7LNAReq2wmuOOV3f2VxOsZpmatJXqPoDz4htoiVYq-oM8QsQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: rename generated .*conf-cfg to *conf-cfg
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Jan 5, 2019 at 12:02 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Remove the dot-prefixing since it is just a matter of the
> .gitignore file.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild/fixes.

>
>  scripts/kconfig/.gitignore |  1 +
>  scripts/kconfig/Makefile   | 36 ++++++++++++++++++------------------
>  2 files changed, 19 insertions(+), 18 deletions(-)
>
> diff --git a/scripts/kconfig/.gitignore b/scripts/kconfig/.gitignore
> index 0aabc1d..b5bf92f 100644
> --- a/scripts/kconfig/.gitignore
> +++ b/scripts/kconfig/.gitignore
> @@ -2,6 +2,7 @@
>  # Generated files
>  #
>  *.moc
> +*conf-cfg
>
>  #
>  # configuration programs
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 679e62e..c05ab00 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -157,53 +157,53 @@ conf-objs := conf.o $(common-objs)
>  hostprogs-y    += nconf
>  nconf-objs     := nconf.o nconf.gui.o $(common-objs)
>
> -HOSTLDLIBS_nconf       = $(shell . $(obj)/.nconf-cfg && echo $$libs)
> -HOSTCFLAGS_nconf.o     = $(shell . $(obj)/.nconf-cfg && echo $$cflags)
> -HOSTCFLAGS_nconf.gui.o = $(shell . $(obj)/.nconf-cfg && echo $$cflags)
> +HOSTLDLIBS_nconf       = $(shell . $(obj)/nconf-cfg && echo $$libs)
> +HOSTCFLAGS_nconf.o     = $(shell . $(obj)/nconf-cfg && echo $$cflags)
> +HOSTCFLAGS_nconf.gui.o = $(shell . $(obj)/nconf-cfg && echo $$cflags)
>
> -$(obj)/nconf.o $(obj)/nconf.gui.o: $(obj)/.nconf-cfg
> +$(obj)/nconf.o $(obj)/nconf.gui.o: $(obj)/nconf-cfg
>
>  # mconf: Used for the menuconfig target based on lxdialog
>  hostprogs-y    += mconf
>  lxdialog       := checklist.o inputbox.o menubox.o textbox.o util.o yesno.o
>  mconf-objs     := mconf.o $(addprefix lxdialog/, $(lxdialog)) $(common-objs)
>
> -HOSTLDLIBS_mconf = $(shell . $(obj)/.mconf-cfg && echo $$libs)
> +HOSTLDLIBS_mconf = $(shell . $(obj)/mconf-cfg && echo $$libs)
>  $(foreach f, mconf.o $(lxdialog), \
> -  $(eval HOSTCFLAGS_$f = $$(shell . $(obj)/.mconf-cfg && echo $$$$cflags)))
> +  $(eval HOSTCFLAGS_$f = $$(shell . $(obj)/mconf-cfg && echo $$$$cflags)))
>
> -$(obj)/mconf.o: $(obj)/.mconf-cfg
> -$(addprefix $(obj)/lxdialog/, $(lxdialog)): $(obj)/.mconf-cfg
> +$(obj)/mconf.o: $(obj)/mconf-cfg
> +$(addprefix $(obj)/lxdialog/, $(lxdialog)): $(obj)/mconf-cfg
>
>  # qconf: Used for the xconfig target based on Qt
>  hostprogs-y    += qconf
>  qconf-cxxobjs  := qconf.o
>  qconf-objs     := images.o $(common-objs)
>
> -HOSTLDLIBS_qconf       = $(shell . $(obj)/.qconf-cfg && echo $$libs)
> -HOSTCXXFLAGS_qconf.o   = $(shell . $(obj)/.qconf-cfg && echo $$cflags)
> +HOSTLDLIBS_qconf       = $(shell . $(obj)/qconf-cfg && echo $$libs)
> +HOSTCXXFLAGS_qconf.o   = $(shell . $(obj)/qconf-cfg && echo $$cflags)
>
> -$(obj)/qconf.o: $(obj)/.qconf-cfg $(obj)/qconf.moc
> +$(obj)/qconf.o: $(obj)/qconf-cfg $(obj)/qconf.moc
>
>  quiet_cmd_moc = MOC     $@
> -      cmd_moc = $(shell . $(obj)/.qconf-cfg && echo $$moc) -i $< -o $@
> +      cmd_moc = $(shell . $(obj)/qconf-cfg && echo $$moc) -i $< -o $@
>
> -$(obj)/%.moc: $(src)/%.h $(obj)/.qconf-cfg
> +$(obj)/%.moc: $(src)/%.h $(obj)/qconf-cfg
>         $(call cmd,moc)
>
>  # gconf: Used for the gconfig target based on GTK+
>  hostprogs-y    += gconf
>  gconf-objs     := gconf.o images.o $(common-objs)
>
> -HOSTLDLIBS_gconf    = $(shell . $(obj)/.gconf-cfg && echo $$libs)
> -HOSTCFLAGS_gconf.o  = $(shell . $(obj)/.gconf-cfg && echo $$cflags)
> +HOSTLDLIBS_gconf    = $(shell . $(obj)/gconf-cfg && echo $$libs)
> +HOSTCFLAGS_gconf.o  = $(shell . $(obj)/gconf-cfg && echo $$cflags)
>
> -$(obj)/gconf.o: $(obj)/.gconf-cfg
> +$(obj)/gconf.o: $(obj)/gconf-cfg
>
>  # check if necessary packages are available, and configure build flags
>  filechk_conf_cfg = $(CONFIG_SHELL) $<
>
> -$(obj)/.%conf-cfg: $(src)/%conf-cfg.sh FORCE
> +$(obj)/%conf-cfg: $(src)/%conf-cfg.sh FORCE
>         $(call filechk,conf_cfg)
>
> -clean-files += .*conf-cfg
> +clean-files += conf-cfg
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
