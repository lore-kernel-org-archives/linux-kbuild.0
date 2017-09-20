Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:45828 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751585AbdITGKC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Sep 2017 02:10:02 -0400
Date: Wed, 20 Sep 2017 08:10:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] kbuild/mkspec: remove firmware from rpm package
Message-ID: <20170920061012.GA32032@kroah.com>
References: <20170920023529.10881-1-shuwang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170920023529.10881-1-shuwang@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: shuwang@redhat.com
Cc: yamada.masahiro@socionext.com, mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, chuhu@redhat.com, yizhan@redhat.com

On Wed, Sep 20, 2017 at 10:35:29AM +0800, shuwang@redhat.com wrote:
> From: Shu Wang <shuwang@redhat.com>
> 
> Commit 5620a0d1aacd ("firmware: delete in-kernel firmware") deleted
> in-kernel firmware support, including the firmware install command.
> 
> So make binrpm-pkg will failed as no firmware_install make target.
> 
> Signed-off-by: Shu Wang <shuwang@redhat.com>
> ---
>  scripts/package/mkspec | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index bb43f153fd8e..8f34e31d8474 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -88,11 +88,8 @@ echo 'mkdir -p $RPM_BUILD_ROOT/boot/efi $RPM_BUILD_ROOT/lib/modules'
>  echo "%else"
>  echo 'mkdir -p $RPM_BUILD_ROOT/boot $RPM_BUILD_ROOT/lib/modules'
>  echo "%endif"
> -echo 'mkdir -p $RPM_BUILD_ROOT'"/lib/firmware/$KERNELRELEASE"
>  
>  echo 'INSTALL_MOD_PATH=$RPM_BUILD_ROOT make %{?_smp_mflags} KBUILD_SRC= mod-fw= modules_install'
> -echo 'INSTALL_FW_PATH=$RPM_BUILD_ROOT'"/lib/firmware/$KERNELRELEASE"
> -echo 'make INSTALL_FW_PATH=$INSTALL_FW_PATH' firmware_install
>  echo "%ifarch ia64"
>  echo 'cp $KBUILD_IMAGE $RPM_BUILD_ROOT'"/boot/efi/vmlinuz-$KERNELRELEASE"
>  echo 'ln -s '"efi/vmlinuz-$KERNELRELEASE" '$RPM_BUILD_ROOT'"/boot/"
> @@ -154,7 +151,6 @@ echo '%defattr (-, root, root)'
>  echo "/lib/modules/$KERNELRELEASE"
>  echo "%exclude /lib/modules/$KERNELRELEASE/build"
>  echo "%exclude /lib/modules/$KERNELRELEASE/source"
> -echo "/lib/firmware/$KERNELRELEASE"
>  echo "/boot/*"
>  echo ""
>  echo "%files headers"

I think this has already been posted to the list, right?

Sorry about it, it's pretty obvious that no build system tests kernel
packages, and neither do I :)

thanks,

greg k-h
