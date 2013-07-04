Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50510 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756634Ab3GDPPn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 4 Jul 2013 11:15:43 -0400
Message-ID: <51D5919B.7010208@suse.cz>
Date: Thu, 04 Jul 2013 17:15:39 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] kbuild: add generation of kernel-devel
References: <20130624143658.10761.3787.stgit@phlsvslse11.ph.intel.com> <20130624143833.10761.94871.stgit@phlsvslse11.ph.intel.com>
In-Reply-To: <20130624143833.10761.94871.stgit@phlsvslse11.ph.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Marciniszyn <mike.marciniszyn@intel.com>
Cc: Doug Ledford <dledford@redhat.com>, linux-kbuild@vger.kernel.org, mmarcini@yahoo.com

On 24.6.2013 16:38, Mike Marciniszyn wrote:
> Change the spec file to generate a kernel-devel module
> allowing for compilation of external kernel modules.
> 
> Signed-off-by: Mike Marciniszyn <mike.marciniszyn@intel.com>
> ---
>  scripts/package/mkspec |   26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index 514aeb2..65131df 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -59,6 +59,14 @@ echo "header files define structures and constants that are needed for"
>  echo "building most standard programs and are also needed for rebuilding the"
>  echo "glibc package."
>  echo ""
> +echo "%package devel"
> +echo "Summary: Development package for building kernel modules to match the $__KERNELRELEASE kernel"
> +echo "Group: System Environment/Kernel"
> +echo "AutoReqProv: no"
> +echo "%description -n kernel-devel"
> +echo "This package provides kernel headers and makefiles sufficient to build modules"
> +echo "against the $__KERNELRELEASE kernel package."
> +echo ""
>  
>  if ! $PREBUILT; then
>  echo "%prep"
> @@ -109,6 +117,11 @@ echo 'mv vmlinux.bz2 $RPM_BUILD_ROOT'"/boot/vmlinux-$KERNELRELEASE.bz2"
>  echo 'mv vmlinux.orig vmlinux'
>  echo "%endif"
>  
> +echo 'rm -rf $RPM_BUILD_ROOT'"/lib/modules/$KERNELRELEASE/{build,source}"
> +echo "mkdir -p "'$RPM_BUILD_ROOT'"/usr/src/kernels/$KERNELRELEASE"
> +echo "EXCLUDES=\"--exclude-vcs --exclude .tmp_versions --exclude=*vmlinux* --exclude=*.o --exclude=*.ko --exclude=*.cmd --exclude=Documentation --exclude=firmware --exclude .config.old --exclude .missing-syscalls.d\""
> +echo "tar "'$EXCLUDES'" -cf- . | (cd "'$RPM_BUILD_ROOT'"/usr/src/kernels/$KERNELRELEASE;tar xvf -)"

For consistency and compatibility with older tar versions, please use
$RCS_TAR_EXCLUDE instead of --exclude-vcs. Also, you only need .config,
scripts/, include/ and the Makefiles to build external modules. But
that's an optimization that can be done in a later patch.

> +echo "%post devel"
> +echo "cd /lib/modules/$KERNELRELEASE"
> +echo "ln -sf /usr/src/kernels/$KERNELRELEASE build"
> +echo "ln -sf /usr/src/kernels/$KERNELRELEASE source"
> +echo ""
> +echo "%postun devel"
> +echo "cd /lib/modules/$KERNELRELEASE"
> +echo "rm -f build source"

These symlinks should be part of the RPM payload.

Michal
