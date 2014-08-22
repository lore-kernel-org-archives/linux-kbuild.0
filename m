Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:57044 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751974AbaHVLHS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Aug 2014 07:07:18 -0400
Message-ID: <53F72464.6060401@suse.cz>
Date: Fri, 22 Aug 2014 13:07:16 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFC] [PATCH] kconfig: menuconfig: pkg-config should base upon
 default configuration
References: <cover.1407766447.git.silvio.fricke@gmail.com> <1a72fd7040a988e84a81c0e5aaef50c33064f576.1407766447.git.silvio.fricke@gmail.com>
In-Reply-To: <1a72fd7040a988e84a81c0e5aaef50c33064f576.1407766447.git.silvio.fricke@gmail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Silvio Fricke <silvio.fricke@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Justin Lecher <jlec@gentoo.org>

Dne 11.8.2014 16:22, Silvio Fricke napsal(a):
> Since fc9c6e0 "menuconfig: optionally use pkg-config to detect ncurses
> libs" we use pkg-config, but some cross toolchains (like yocto tc)
> change the search pathes for pc files with some PKG_CONFIG_* environment
> variables.
> 
> With this patch we ensure that we only get the host config options for
> ncurses and don't mix with others not relevant settings.
> 
> Signed-off-by: Silvio Fricke <silvio.fricke@gmail.com>
> ---
>  scripts/kconfig/lxdialog/check-lxdialog.sh | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
> index 9d2a4c5..a067d3c 100644
> --- a/scripts/kconfig/lxdialog/check-lxdialog.sh
> +++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
> @@ -1,6 +1,9 @@
>  #!/bin/sh
>  # Check ncurses compatibility
>  
> +unset PKG_CONFIG_PATH
> +unset PKG_CONFIG_SYSROOT_DIR

PKG_CONFIG_SYSROOT_DIR is clearly meant for cross-compiling and we are
never cross-compiling kconfig. However, PKG_CONFIG_PATH has valid use
cases even when not cross-compiling. Which variables exactly does yocto set?

It might also be a good idea for yocto to special case the kernel and do
not set the variables, because we are not cross-compiling any userspace
programs.

Michal
