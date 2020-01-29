Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pb-smtp1.pobox.com ([64.147.108.70]:51887 "EHLO
        pb-smtp1.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727367AbgA2RmY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Jan 2020 12:42:24 -0500
Date: Wed, 29 Jan 2020 12:42:20 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
In-Reply-To: <20200129173714.GA193443@google.com>
Message-ID: <nycvar.YSQ.7.76.2001291240370.1655@knanqh.ubzr>
References: <20200129150612.19200-1-qperret@google.com> <nycvar.YSQ.7.76.2001291152540.1655@knanqh.ubzr> <20200129173714.GA193443@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: masahiroy@kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, maennich@google.com, kernel-team@android.com

On Wed, 29 Jan 2020, Quentin Perret wrote:

> On Wednesday 29 Jan 2020 at 12:11:12 (-0500), Nicolas Pitre wrote:
> > This way, if $CONFIG_UNUSED_KSYMS_WHITELIST is non empty, it'll get 
> > quoted.
> 
> A shorter alternative would be something a little like so perhaps ?
> 
> diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> index 1a6f7f377230..8e1b7f70e800 100755
> --- a/scripts/adjust_autoksyms.sh
> +++ b/scripts/adjust_autoksyms.sh
> @@ -48,7 +48,7 @@ cat > "$new_ksyms_file" << EOT
>  EOT
>  sed 's/ko$/mod/' modules.order |
>  xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
> -cat - $CONFIG_UNUSED_KSYMS_WHITELIST |
> +cat - "${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}" |

That's even better.


Nicolas
