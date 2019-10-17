Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:33824 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731007AbfJQUQo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Oct 2019 16:16:44 -0400
Subject: Re: [PATCH] scripts : prune-kernel : prune kernels generalized way
References: <20191017063126.2005-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7965fdbe-eb2b-1178-61c3-ad54fa147fb3@infradead.org>
Date: Thu, 17 Oct 2019 13:16:42 -0700
MIME-Version: 1.0
In-Reply-To: <20191017063126.2005-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc: bfields@fieldses.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/16/19 11:31 PM, Bhaskar Chowdhury wrote:
> This patch will remove old kernel from the system in a selective way.
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
> For Randy :
> ✔ ~/git-linux/linux-kbuild [master|AM/REBASE ↑·8|✔]
> 11:42 $ ./scripts/checkpatch.pl -f
> scripts/0001-Fix-all-the-concern-raised-by-Randy.patch
> total: 0 errors, 0 warnings, 93 lines checked
> 
> scripts/0001-Fix-all-the-concern-raised-by-Randy.patch has no obvious
> style problems and is ready for submission.
> 
> scripts/prune-kernel | 75 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
> index e69de29bb2d1..9461ae2bc122 100755
> --- a/scripts/prune-kernel
> +++ b/scripts/prune-kernel
> @@ -0,0 +1,75 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# because I use CONFIG_LOCALVERSION_AUTO, not the same version again and
> +# again, /boot and /lib/modules/ eventually fill up.
> +# Dumb script to purge that stuff:
> +
> +#for f in "$@"
> +#do
> +#        if rpm -qf "/lib/modules/$f" >/dev/null; then
> +#                echo "keeping $f (installed from rpm)"
> +#        elif [ $(uname -r) = "$f" ]; then
> +#                echo "keeping $f (running kernel) "
> +#        else
> +#                echo "removing $f"
> +#                rm -f "/boot/initramfs-$f.img" "/boot/System.map-$f"
> +#                rm -f "/boot/vmlinuz-$f"   "/boot/config-$f"
> +#                rm -rf "/lib/modules/$f"
> +#                new-kernel-pkg --remove $f
> +#        fi
> +#done
> +boot_dir=/boot
> +modules_dir=/lib/modules
> +function remove_old_kernel(){
> +	cd $boot_dir
> +	rm -If vmlinuz-$kernel_version System.map-$kernel_version config-$kernel_verison

typo/spello: not tested:                                                  ^^^^^^^^^^^^^^

> +}
> +function remove_old_kernel_modules_dir(){
> +	cd $modules_dir
> +	rm -rf $modules_version
> +}
> +printf "\n\n Enlist the installed kernels \n\n"
> +
> +find $boot_dir -name "vmlinuz-*" -type f  -exec ls -1 {} \;
> +
> +printf "\n\n\n Please give the kernel version to remove: %s"
> +read kernel_version
> +if [[ $kernel_version -eq "" ]];then
> +	printf "You have forgotten the version to give for removal"

No message needed IMO -- just exit.

> +	exit 1
> +else
> +        remove_old_kernel
> +fi
> +
> +printf "\n\n Enlist the installed modules directory \n\n"
> +
> +find $modules_dir  -maxdepth 0 -type d -exec ls -1 {} \;
> +
> +printf "\n\n Please give the full modules directory name to remove: %s"
> +read modules_version
> +if [[ $modules_version -eq "" ]];then
> +	printf "You have forgotten to give the modules dir to remove"

ditto.

> +else
> +        remove_old_kernel_modules_dir
> +fi
> +
> +printf "\n\n Removed kernel version: $kernel_version and associated modules: $modules_version ...Done \n"
> +while :
> +  do
> +     printf "\n\n Do you want to remove another?[YN] : %s"
> +     read response
> +
> +       if [[ $response == "Y" ]];then

Odd indentation here.  Some lines use tab, some lines use spaces.

> +	printf "Please give another version to remove : %s"
> +	read kernel_version
> +	remove_old_kernel
> +	printf "\n\n Please give the full modules directory name to remove: %s"
> +	read modules_version
> +	remove_old_kernel_modules_dir
> +        printf "\n\n Removed kernel version: $kernel_version and associated modules: $modules_version ...Done \n"
> +
> +      elif [[ $response == "N" ]];then
> +	   exit 1
> +      fi
> +  done
> --
> 2.21.0


And lastly, 'patch' will apply this patch cleanly, but it ends up with
almost all of this patch inserted into the new prune-kernel source file
before the current contents of the prune-kernel source file,
so I think that the emailed patch file has a problem.

-- 
~Randy
