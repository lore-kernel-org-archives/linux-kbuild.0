Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:41694 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725731AbeKRFiM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Nov 2018 00:38:12 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] kbuild: rpm-pkg: fix binrpm-pkg breakage when O= is used
Date: Sat, 17 Nov 2018 21:20:43 +0200
Message-ID: <17334806.ITFQqvuZkQ@avalon>
In-Reply-To: <1541404309-30210-1-git-send-email-yamada.masahiro@socionext.com>
References: <1541404309-30210-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Zhenzhong Duan <zhenzhong.duan@oracle.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Hi Yamada-san,

On Monday, 5 November 2018 09:51:49 EET Masahiro Yamada wrote:
> Zhenzhong Duan reported that running 'make O=/build/kernel binrpm-pkg'
> failed with the following errors:
> 
>   Running 'make O=/build/kernel binrpm-pkg' failed with below two errors.
> 
>   Makefile:600: include/config/auto.conf: No such file or directory
> 
>   + cp make -C /mnt/root/kernel O=/build/kernel image_name make -f
>   /mnt/root/kernel/Makefile ...
>   cp: invalid option -- 'C'
>   Try 'cp --help' for more information.
> 
> Prior to commit 80463f1b7bf9 ("kbuild: add --include-dir flag only
> for out-of-tree build"), both objtree and srctree were added to
> --include-dir, and the wrong code 'make image_name' was working
> relying on that. Now, the potential issue that had previously been
> hidden just showed up.
> 
> 'make image_name' recurses to the generated $(objtree)/Makefile and
> ends up with running in srctree, which is incorrect. It should be
> invoked with '-f $srctree/Makefile' (or KBUILD_SRC=) to be executed
> in objtree.

I (painfully) found out that a similar problem occurs with 'make bindeb-pkg'.

After spending half a day unsuccessfully trying to debug and fix the problem I 
ran across this patch. The naive approach of mimicking the solution and adding 
'MAKE="$MAKE -f $srctree/Makefile"' at the top of scripts/package/builddeb 
didn't work. Reverting commit 80463f1b7bf9 fixed the problem.

Would you be able to give it a look ? I'm afraid my limited skills related to 
the kernel build system don't allow me to submit a fix :-S

> Fixes: 80463f1b7bf9 ("kbuild: add --include-dir flag only for out-of-tree
> build") Reported-by: Zhenzhong Duan <zhenzhong.duan@oracle.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  scripts/package/mkspec | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index e05646d..009147d 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -12,6 +12,7 @@
>  # how we were called determines which rpms we build and how we build them
>  if [ "$1" = prebuilt ]; then
>  	S=DEL
> +	MAKE="$MAKE -f $srctree/Makefile"
>  else
>  	S=
>  fi
> @@ -78,19 +79,19 @@ $S	%prep
>  $S	%setup -q
>  $S
>  $S	%build
> -$S	make %{?_smp_mflags} KBUILD_BUILD_VERSION=%{release}
> +$S	$MAKE %{?_smp_mflags} KBUILD_BUILD_VERSION=%{release}
>  $S
>  	%install
>  	mkdir -p %{buildroot}/boot
>  	%ifarch ia64
>  	mkdir -p %{buildroot}/boot/efi
> -	cp \$(make image_name) %{buildroot}/boot/efi/vmlinuz-$KERNELRELEASE
> +	cp \$($MAKE image_name) %{buildroot}/boot/efi/vmlinuz-$KERNELRELEASE
>  	ln -s efi/vmlinuz-$KERNELRELEASE %{buildroot}/boot/
>  	%else
> -	cp \$(make image_name) %{buildroot}/boot/vmlinuz-$KERNELRELEASE
> +	cp \$($MAKE image_name) %{buildroot}/boot/vmlinuz-$KERNELRELEASE
>  	%endif
> -$M	make %{?_smp_mflags} INSTALL_MOD_PATH=%{buildroot} KBUILD_SRC=
> modules_install -	make %{?_smp_mflags} INSTALL_HDR_PATH=%{buildroot}/usr
> KBUILD_SRC= headers_install +$M	$MAKE %{?_smp_mflags}
> INSTALL_MOD_PATH=%{buildroot} modules_install +	$MAKE %{?_smp_mflags}
> INSTALL_HDR_PATH=%{buildroot}/usr headers_install cp System.map
> %{buildroot}/boot/System.map-$KERNELRELEASE
>  	cp .config %{buildroot}/boot/config-$KERNELRELEASE
>  	bzip2 -9 --keep vmlinux

-- 
Regards,

Laurent Pinchart
