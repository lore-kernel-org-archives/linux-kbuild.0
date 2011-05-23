Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from r-mail2.rd.francetelecom.com ([217.108.152.42]:53801 "EHLO
	r-mail2.rd.francetelecom.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750883Ab1EWJEy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2011 05:04:54 -0400
From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Subject: Re: [RFCv2 07/13] kconfig: back-out parser prefix, from `zconf' to `yy'
Date: Mon, 23 May 2011 10:54:47 +0200
References: <1306138239-13440-1-git-send-email-lacombar@gmail.com> <1306138239-13440-8-git-send-email-lacombar@gmail.com>
In-Reply-To: <1306138239-13440-8-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201105231054.47573.yann.morin.1998@anciens.enib.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

Arnaud, All,

On Monday 23 May 2011 101033 Arnaud Lacombe wrote:
> ---
>  scripts/kconfig/lkc.h   |    2 +-
>  scripts/kconfig/zconf.l |   16 ++++++++--------
>  scripts/kconfig/zconf.y |   22 +++++++++++-----------
>  3 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
> index febf0c9..716c36c 100644
> --- a/scripts/kconfig/lkc.h
> +++ b/scripts/kconfig/lkc.h
> @@ -69,7 +69,7 @@ struct kconf_id {
>  };
>  
>  #ifdef YYDEBUG
> -extern int zconfdebug;
> +extern int yyebug;

Missing 'd' in yyebug, maybe? See below...

[--SNIP--]
> diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
> index 98c5716..8564238 100644
> --- a/scripts/kconfig/zconf.y
> +++ b/scripts/kconfig/zconf.y
> @@ -21,10 +21,10 @@
>  
>  int cdebug = PRINTD;
>  
> -extern int zconflex(void);
> +extern int yylex(void);
>  static void zconfprint(const char *err, ...);
>  static void zconf_error(const char *err, ...);
> -static void zconferror(const char *err);
> +static void yyerror(const char *err);
>  static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtoken);
>  
>  struct symbol *symbol_hash[SYMBOL_HASHSIZE];
> @@ -505,10 +505,10 @@ void conf_parse(const char *name)
>  
>  #if YYDEBUG
>  	if (getenv("ZCONF_DEBUG"))
> -		zconfdebug = 1;
> +		yydebug = 1;

... here we use yydebug with a 'd'.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
