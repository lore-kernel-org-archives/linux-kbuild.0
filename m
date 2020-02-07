Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pb-smtp1.pobox.com ([64.147.108.70]:55140 "EHLO
        pb-smtp1.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgBGSWT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Feb 2020 13:22:19 -0500
Date: Fri, 7 Feb 2020 13:22:12 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH v3 1/3] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
In-Reply-To: <20200207180755.100561-2-qperret@google.com>
Message-ID: <nycvar.YSQ.7.76.2002071319200.1559@knanqh.ubzr>
References: <20200207180755.100561-1-qperret@google.com> <20200207180755.100561-2-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: masahiroy@kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, maennich@google.com, kernel-team@android.com, jeyu@kernel.org, hch@infradead.org

On Fri, 7 Feb 2020, Quentin Perret wrote:

> @Nicolas: I left your Reviewed-by behind as the code has changed a bit
> but let me know what you think
> ---
>  init/Kconfig                | 13 +++++++++++++
>  scripts/adjust_autoksyms.sh |  5 +++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index a34064a031a5..79fd976ce031 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2180,6 +2180,19 @@ config TRIM_UNUSED_KSYMS
>  
>  	  If unsure, or if you need to build out-of-tree modules, say N.
>  
> +config UNUSED_KSYMS_WHITELIST
> +	string "Whitelist of symbols to keep in ksymtab"
> +	depends on TRIM_UNUSED_KSYMS
> +	help
> +	  By default, all unused exported symbols will be un-exported from the
> +	  build when TRIM_UNUSED_KSYMS is selected.
> +
> +	  UNUSED_KSYMS_WHITELIST allows to whitelist symbols that must be kept
> +	  exported at all times, even in absence of in-tree users. The value to
> +	  set here is the path to a text file containing the list of symbols,
> +	  one per line. The path can be absolute, or relative to the kernel
> +	  source tree.
> +
>  endif # MODULES
>  
>  config MODULES_TREE_LOOKUP
> diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> index a904bf1f5e67..58335eee4b38 100755
> --- a/scripts/adjust_autoksyms.sh
> +++ b/scripts/adjust_autoksyms.sh
> @@ -38,6 +38,10 @@ esac
>  # We need access to CONFIG_ symbols
>  . include/config/auto.conf
>  
> +# The symbol whitelist, relative to the source tree
> +eval ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"
> +[[ "$ksym_wl" =~ ^/ ]] || ksym_wl="$abs_srctree/$ksym_wl"

This "[[ ]]" is a bashism. I think there was an effort not to depend on 
bash for the build system. So either this needs to be changed to basic 
bourne shell, or the interpretor has to be /bin/bash not /bin/sh.


Nicolas
