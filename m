Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:54596 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbgDJRg2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Apr 2020 13:36:28 -0400
Subject: Re: [PATCH] scripts/config: allow colons in option strings for sed
References: <20200410165741.27078-1-jeremie.francois@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1b824b27-aa2d-91ca-5540-15695994ef9a@infradead.org>
Date: Fri, 10 Apr 2020 10:36:27 -0700
MIME-Version: 1.0
In-Reply-To: <20200410165741.27078-1-jeremie.francois@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Jeremie Francois (on alpha)" <jeremie.francois@gmail.com>, LKML <linux-kernel@vger.kernel.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

[adding Cc's]

On 4/10/20 9:57 AM, Jeremie Francois (on alpha) wrote:
> Sed broke on some strings as it used colon as a separator.
> I made it more robust by using \001, which is legit POSIX AFAIK.
> 
> E.g. ./config --set-str CONFIG_USBNET_DEVADDR "de:ad:be:ef:00:01"
> failed with: sed: -e expression #1, char 55: unknown option to `s'
> 
> Signed-off-by: Jeremie Francois (on alpha) <jeremie.francois@gmail.com>
> ---
>  scripts/config | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/config b/scripts/config
> index e0e39826dae9..d365081b60b2 100755
> --- a/scripts/config
> +++ b/scripts/config
> @@ -7,6 +7,9 @@ myname=${0##*/}
>  # If no prefix forced, use the default CONFIG_
>  CONFIG_="${CONFIG_-CONFIG_}"
>  
> +# We use an uncommon delimiter for sed substitutions
> +SED_DELIM=$(echo -en "\001")
> +
>  usage() {
>  	cat >&2 <<EOL
>  Manipulate options in a .config file from the command line.
> @@ -83,7 +86,7 @@ txt_subst() {
>  	local infile="$3"
>  	local tmpfile="$infile.swp"
>  
> -	sed -e "s:$before:$after:" "$infile" >"$tmpfile"
> +	sed -e "s$SED_DELIM$before$SED_DELIM$after$SED_DELIM" "$infile" >"$tmpfile"
>  	# replace original file with the edited one
>  	mv "$tmpfile" "$infile"
>  }
> 


-- 
~Randy
