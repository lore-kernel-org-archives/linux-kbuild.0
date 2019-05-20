Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726820AbfETR4p (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 May 2019 13:56:45 -0400
Date: Mon, 20 May 2019 19:56:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] kbuild: teach kselftest-merge to find nested config files
Message-ID: <20190520175641.GA14339@kroah.com>
References: <20190520151614.19188-1-dan.rue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520151614.19188-1-dan.rue@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dan Rue <dan.rue@linaro.org>
Cc: linux-kselftest@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, May 20, 2019 at 10:16:14AM -0500, Dan Rue wrote:
> Current implementation of kselftest-merge only finds config files that
> are one level deep using `$(srctree)/tools/testing/selftests/*/config`.
> 
> Often, config files are added in nested directories, and do not get
> picked up by kselftest-merge.
> 
> Use `find` to catch all config files under
> `$(srctree)/tools/testing/selftests` instead.
> 
> Signed-off-by: Dan Rue <dan.rue@linaro.org>
> ---
>  Makefile | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

To be more specific here, the binderfs test is not catching the config
entry, so it would be nice to get this into the stable trees as well :)

> diff --git a/Makefile b/Makefile
> index a45f84a7e811..e99e7f9484af 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1228,9 +1228,8 @@ kselftest-clean:
>  PHONY += kselftest-merge
>  kselftest-merge:
>  	$(if $(wildcard $(objtree)/.config),, $(error No .config exists, config your kernel first!))
> -	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
> -		-m $(objtree)/.config \
> -		$(srctree)/tools/testing/selftests/*/config
> +	$(Q)find $(srctree)/tools/testing/selftests -name config | \
> +		xargs $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
>  	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
>  
>  # ---------------------------------------------------------------------------

is find run with $(Q)?  It isn't with other instances in the Makefile.

thanks,

greg k-h
