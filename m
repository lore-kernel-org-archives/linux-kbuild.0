Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:53783 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753093Ab3CUWJj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 21 Mar 2013 18:09:39 -0400
Message-ID: <514B851F.4010500@suse.cz>
Date: Thu, 21 Mar 2013 23:09:35 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] menuconfig: optionally use pkg-config to detect ncurses
 libs
References: <cover.1362679061.git.yann.morin.1998@free.fr> <fc9c6e000f62c2eeda426d4d5f022b3d57729bb0.1362679061.git.yann.morin.1998@free.fr>
In-Reply-To: <fc9c6e000f62c2eeda426d4d5f022b3d57729bb0.1362679061.git.yann.morin.1998@free.fr>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Justin Lecher <jlec@gentoo.org>

Dne 7.3.2013 19:20, Yann E. MORIN napsal(a):
> From: Justin Lecher <jlec@gentoo.org>
> 
> When building ncurses with --with-termlib several symbols get moved from
> libncurses.so to libtinfo.so. Thus when linking with libncurses.so, one
> additionally needs to link with libtinfo.so.
> 
> The ncurses pkg-config module will be used to detect the necessary libs for
> linking. If not available the old heuristic for detection of the ncurses libs
> will be used.
> 
> Signed-off-by: Justin Lecher <jlec@gentoo.org>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  scripts/kconfig/lxdialog/check-lxdialog.sh |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
> index 8078813..782d200 100644
> --- a/scripts/kconfig/lxdialog/check-lxdialog.sh
> +++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
> @@ -4,6 +4,8 @@
>  # What library to link
>  ldflags()
>  {
> +	pkg-config --libs ncursesw 2>/dev/null && exit
> +	pkg-config --libs ncurses 2>/dev/null && exit
>  	for ext in so a dll.a dylib ; do
>  		for lib in ncursesw ncurses curses ; do

Do you also plan to use pkg-config in the ccflags function?

Thanks,
Michal

