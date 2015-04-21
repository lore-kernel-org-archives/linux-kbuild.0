Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49314 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751488AbbDUN6u (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 Apr 2015 09:58:50 -0400
Message-ID: <55365798.4090302@suse.cz>
Date: Tue, 21 Apr 2015 15:58:48 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] builddeb: fix stripped module signatures if CONFIG_DEBUG_INFO
 and CONFIG_MODULE_SIG_ALL are set
References: <1426494054-32138-1-git-send-email-andrej.skvortzov@gmail.com>
In-Reply-To: <1426494054-32138-1-git-send-email-andrej.skvortzov@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, maximilian attems <max@stro.at>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

(added Max to Cc)

On 2015-03-16 09:20, Andrey Skvortsov wrote:
> If CONFIG_MODULE_SIG_ALL is set, then user expects that all modules are
> automatically signed in the result package, as it's for rpm-pkg, binrpm-pkg,
> tar, tar-*. For deb-pkg this is correct only if CONFIG_DEBUG_INFO
> is NOT set. In that case deb-package contains signed modules.
> 
> But if CONFIG_DEBUG_INFO is set, builddeb creates separate package with
> debug information. To do that, debug information from all modules
> is copied into separate files by objcopy. And loadable kernel modules are
> stripped afterwards. Stripping removes previously (during modules_install)
> added signatures from loadable kernel modules. Therefore final deb-package
> contains unsigned modules despite of set option CONFIG_MODULE_SIG_ALL.
> 
> This patch resigns all stripped modules if CONFIG_MODULE_SIG_ALL is set
> to solve this problem.
> 
> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>

Max, Ben, are you fine with this patch? It looks OK to me, the
modules_sign target has been added for this very purpose.

Thanks,
Michal

> ---
>  scripts/package/builddeb |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 88dbf23..977c4d7 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -162,6 +162,12 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
>  			# then add a link to those
>  			$OBJCOPY --add-gnu-debuglink=$dbg_dir/usr/lib/debug/$module $tmpdir/$module
>  		done
> +
> +                # resign stripped modules
> +                MODULE_SIG_ALL="$(grep -s '^CONFIG_MODULE_SIG_ALL=y' $KCONFIG_CONFIG || true)"
> +                if [ -n "$MODULE_SIG_ALL" ]; then
> +	            	INSTALL_MOD_PATH="$tmpdir" $MAKE KBUILD_SRC= modules_sign
> +                fi
>  	fi
>  fi
>  
> 

