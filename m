Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nat.scz.novell.com ([213.151.88.252]:34724 "EHLO pobox.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752460Ab0LOWtt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 17:49:49 -0500
Date: Wed, 15 Dec 2010 23:49:48 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 1/5] kconfig: make hexadecimal prefix mandatory for
	S_HEX default value
Message-ID: <20101215224948.GC21436@pobox.suse.cz>
References: <1291530566-23531-1-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1291530566-23531-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Sun, Dec 05, 2010 at 01:29:24AM -0500, Arnaud Lacombe wrote:
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/symbol.c |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index af6e9f3..ad7dbe7 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -548,8 +548,10 @@ bool sym_string_valid(struct symbol *sym, const char *str)
>  		}
>  		return true;
>  	case S_HEX:
> -		if (str[0] == '0' && (str[1] == 'x' || str[1] == 'X'))
> -			str += 2;
> +		if (str[0] != '\0' &&
> +		    !(str[0] == '0' && (str[1] == 'x' || str[1] == 'X')))
> +			return false;
> +		str += 2;
>  		ch = *str++;
>  		do {
>  			if (!isxdigit(ch))

I think that saying "hex" is enough to express that the value is to be
interpreted in hexadecimal, so let's keep the 0x prefix optional.
Kconfig prints enough warnings these days... ;)

Michal
