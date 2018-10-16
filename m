Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:41064 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbeJPXi0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Oct 2018 19:38:26 -0400
Date: Tue, 16 Oct 2018 17:47:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/3] kbuild: provide a new place to check necessary host
 tools
Message-ID: <20181016154717.GA25717@ravnborg.org>
References: <1539681053-24388-1-git-send-email-yamada.masahiro@socionext.com>
 <1539681053-24388-2-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1539681053-24388-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Bernd Edlinger <bernd.edlinger@hotmail.de>, Borislav Petkov <bp@suse.de>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Hi Masahiro.

Looks good, a few nits below.

	Sam

> The top Makefile is too cluttered
So true...

> This adds a new file scripts/Makefile.toolcheck to check additional
> tools depending on the kernel configuration. This check is run
> immediately after syncconfig, i.e., when a user attempts to build
> something with a new set of CONFIG options.
> 
> [1] https://patchwork.kernel.org/patch/10516049/
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
The use of toolcheck-y should be documented in Documentation/kbuild/...


> 
>  Makefile                   |  1 +
>  scripts/Makefile.toolcheck | 35 +++++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 scripts/Makefile.toolcheck
> 
> diff --git a/Makefile b/Makefile
> index bf3786e..23a204a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -633,6 +633,7 @@ $(KCONFIG_CONFIG) include/config/auto.conf.cmd: ;
>  # include/config/auto.conf (which mirrors .config).
>  include/config/%.conf: $(KCONFIG_CONFIG) include/config/auto.conf.cmd
>  	$(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
> +	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.toolcheck
>  else
>  # External modules and some install targets need include/generated/autoconf.h
>  # and include/config/auto.conf but do not care if they are up-to-date.
> diff --git a/scripts/Makefile.toolcheck b/scripts/Makefile.toolcheck
> new file mode 100644
> index 0000000..f3c165d
> --- /dev/null
> +++ b/scripts/Makefile.toolcheck
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# ===========================================================================
> +# Host tools check
> +# ===========================================================================
> +#
> +# Some additional tools might be required depending on the kernel configuration.
> +# Check if they are installed on the host machine, and if missing, error out
> +# with a user-friendly message.
> +
> +include include/config/auto.conf
> +
> +__toolcheck:
> +	@:
> +
> +PHONY += $(toolcheck-y)
> +__toolcheck: $(toolcheck-y)
> +
> +define populate_toolcheck
> +__toolcheck: check_$(1)
> +PHONY += check_$(1)
> +check_$(1):
> +	$(Q){ $(chk_$(1)); } >/dev/null 2>&1 || {	\
> +		echo "*" >&2;				\
> +		for msg in $(msg_$(1));			\
> +		do					\
> +			echo "* $$$${msg}" >&2;		\
> +		done;					\
> +		echo "*" >&2;				\
> +		/bin/false;				\
> +	}
Very dense, but usign if [ ... ] may result is somethign that
is a little more readable.

And maybe a litle hint on the usage...

> +$(foreach c, $(toolcheck-y), $(eval $(call populate_toolcheck,$(c))))
Good use of $(eval ...)
