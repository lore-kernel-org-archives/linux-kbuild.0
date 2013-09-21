Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:45883 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751906Ab3IUXVH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 21 Sep 2013 19:21:07 -0400
Received: by mail-wi0-f177.google.com with SMTP id cb5so906152wib.10
        for <linux-kbuild@vger.kernel.org>; Sat, 21 Sep 2013 16:21:06 -0700 (PDT)
Date: Sun, 22 Sep 2013 01:21:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] kconfig: fix allmodconfig
Message-ID: <20130921232102.GC3221@free.fr>
References: <1379805443-10945-1-git-send-email-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1379805443-10945-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>

Stephen, All,

Please, test this patch to fix the allmodconfig issue reported by
Stephen.

From my little testing (some randconfig followed by silentoldconfig, as
well as allmodconfig), this patch seems to fix the issue without any
regression I could ientify.

But since this is sensitive code, I'd like some feedback before this
gets applied.

Thank you!

Regards,
Yann E. MORIN.

On 2013-09-22 01:17 +0200, Yann E. MORIN spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Michal Marek <mmarek@suse.cz>
> ---
>  scripts/kconfig/confdata.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 87f7238..0cbfc67 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -399,8 +399,6 @@ setsym:
>  	free(line);
>  	fclose(in);
>  
> -	if (modules_sym)
> -		sym_calc_value(modules_sym);
>  	return 0;
>  }
>  
> @@ -1175,6 +1173,10 @@ bool conf_set_all_new_symbols(enum conf_def_mode mode)
>  				sym->def[S_DEF_USER].tri = yes;
>  				break;
>  			case def_mod:
> +				/* Note: although modules_sym must be 'yes' to
> +				 * enable tristates, 'mod' is promoted to 'yes'
> +				 * when applied to a boolean, which modules_sym
> +				 * is. So we need not special-case it here. */
>  				sym->def[S_DEF_USER].tri = mod;
>  				break;
>  			case def_no:
> -- 
> 1.8.1.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
