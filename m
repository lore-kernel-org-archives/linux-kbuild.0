Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pb-smtp1.pobox.com ([64.147.108.70]:60058 "EHLO
        pb-smtp1.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfGIRhy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 13:37:54 -0400
Date: Tue, 9 Jul 2019 13:37:50 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH 08/11] kbuild: create *.mod with full directory path and
 remove MODVERDIR
In-Reply-To: <20190709042416.27554-9-yamada.masahiro@socionext.com>
Message-ID: <nycvar.YSQ.7.76.1907091332150.4190@knanqh.ubzr>
References: <20190709042416.27554-1-yamada.masahiro@socionext.com> <20190709042416.27554-9-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>

On Tue, 9 Jul 2019, Masahiro Yamada wrote:

> --- a/scripts/adjust_autoksyms.sh
> +++ b/scripts/adjust_autoksyms.sh
> @@ -47,13 +47,10 @@ cat > "$new_ksyms_file" << EOT
>   */
>  
>  EOT
> -[ "$(ls -A "$MODVERDIR")" ] &&
> -for mod in "$MODVERDIR"/*.mod; do
> -	sed -n -e '3{s/ /\n/g;/^$/!p;}' "$mod"
> -done | sort -u |
> -while read sym; do
> -	echo "#define __KSYM_${sym} 1"
> -done >> "$new_ksyms_file"
> +sed 's/ko$/mod/' modules.order |
> +xargs -r -n1 sed -n -e '3{s/ /\n/g;/^$/!p;}' |
> +sort -u |
> +sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"

Did you consider the case when CONFIG_MODULES=y but no modules are 
selected? Also -r to xargs is a GNU extension and there were some 
efforts to remove theur use in the past (no idea if this is still a 
concern).

Other than that, looks good to me.

Acked-by: Nicolas Pitre <nico@fluxnic.net>


Nicolas
