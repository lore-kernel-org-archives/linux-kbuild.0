Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pb-smtp20.pobox.com ([173.228.157.52]:52474 "EHLO
        pb-smtp20.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbgA2RLT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Jan 2020 12:11:19 -0500
Date: Wed, 29 Jan 2020 12:11:12 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
In-Reply-To: <20200129150612.19200-1-qperret@google.com>
Message-ID: <nycvar.YSQ.7.76.2001291152540.1655@knanqh.ubzr>
References: <20200129150612.19200-1-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: masahiroy@kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, maennich@google.com, kernel-team@android.com

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

The idea is sound to me. But...

> diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> index a904bf1f5e67..1a6f7f377230 100755
> --- a/scripts/adjust_autoksyms.sh
> +++ b/scripts/adjust_autoksyms.sh
> @@ -48,6 +48,7 @@ cat > "$new_ksyms_file" << EOT
>  EOT
>  sed 's/ko$/mod/' modules.order |
>  xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
> +cat - $CONFIG_UNUSED_KSYMS_WHITELIST |

This is a nice trick, however it'll fail if the file path contains 
spaces or other shell special characters. You could try something like 
this:

[ -z "$CONFIG_UNUSED_KSYMS_WHITELIST" ] \
	&& whitelist= \
	|| whitelist="\"$CONFIG_UNUSED_KSYMS_WHITELIST\""

And then...

  eval cat - $whitelist | ...

This way, if $CONFIG_UNUSED_KSYMS_WHITELIST is non empty, it'll get 
quoted.


Nicolas
