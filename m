Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pb-smtp20.pobox.com ([173.228.157.52]:64665 "EHLO
        pb-smtp20.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgA2S3Z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Jan 2020 13:29:25 -0500
Date: Wed, 29 Jan 2020 13:29:15 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH v2] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
In-Reply-To: <20200129181541.105335-1-qperret@google.com>
Message-ID: <nycvar.YSQ.7.76.2001291327540.1655@knanqh.ubzr>
References: <20200129181541.105335-1-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: masahiroy@kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, maennich@google.com, kernel-team@android.com, jeyu@kernel.org

On Wed, 29 Jan 2020, Quentin Perret wrote:

> CONFIG_TRIM_UNUSED_KSYMS currently removes all unused exported symbols
> from ksymtab. This works really well when using in-tree drivers, but
> cannot be used in its current form if some of them are out-of-tree.
> 
> Indeed, even if the list of symbols required by out-of-tree drivers is
> known at compile time, the only solution today to guarantee these don't
> get trimmed is to set CONFIG_TRIM_UNUSED_KSYMS=n. This not only wastes
> space, but also makes it difficult to control the ABI usable by vendor
> modules in distribution kernels such as Android. Being able to control
> the kernel ABI surface is particularly useful to ship a unique Generic
> Kernel Image (GKI) for all vendors.
> 
> As such, attempt to improve the situation by enabling users to specify a
> symbol 'whitelist' at compile time. Any symbol specified in this
> whitelist will be kept exported when CONFIG_TRIM_UNUSED_KSYMS is set,
> even if it has no in-tree user. The whitelist is defined as a simple
> text file, listing symbols, one per line.
> 
> Signed-off-by: Quentin Perret <qperret@google.com>

Reviewed-by: Nicolas Pitre <nico@fluxnic.net>


> ---
> v2: make sure to quote the whitelist path properly (Nicolas)
> ---
>  init/Kconfig                | 12 ++++++++++++
>  scripts/adjust_autoksyms.sh |  1 +
>  2 files changed, 13 insertions(+)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index a34064a031a5..d9c977ef7de5 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2180,6 +2180,18 @@ config TRIM_UNUSED_KSYMS
>  
>  	  If unsure, or if you need to build out-of-tree modules, say N.
>  
> +config UNUSED_KSYMS_WHITELIST
> +	string "Whitelist of symbols to keep in ksymtab"
> +	depends on TRIM_UNUSED_KSYMS
> +	help
> +	  By default, all unused exported symbols will be trimmed from the
> +	  build when TRIM_UNUSED_KSYMS is selected.
> +
> +	  UNUSED_KSYMS_WHITELIST allows to whitelist symbols that must be kept
> +	  exported at all times, even in absence of in-tree users. The value to
> +	  set here is the path to a text file containing the list of symbols,
> +	  one per line.
> +
>  endif # MODULES
>  
>  config MODULES_TREE_LOOKUP
> diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> index a904bf1f5e67..8e1b7f70e800 100755
> --- a/scripts/adjust_autoksyms.sh
> +++ b/scripts/adjust_autoksyms.sh
> @@ -48,6 +48,7 @@ cat > "$new_ksyms_file" << EOT
>  EOT
>  sed 's/ko$/mod/' modules.order |
>  xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
> +cat - "${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}" |
>  sort -u |
>  sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
>  
> -- 
> 2.25.0.341.g760bfbb309-goog
> 
> 
