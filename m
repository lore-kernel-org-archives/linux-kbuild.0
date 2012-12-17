Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f194.google.com ([209.85.212.194]:56165 "EHLO
	mail-wi0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752179Ab2LQSTQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 17 Dec 2012 13:19:16 -0500
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] kconfig:lxdialog: remove duplicate code
Date: Mon, 17 Dec 2012 19:19:07 +0100
References: <20121217143751.GA16993@udknight>
In-Reply-To: <20121217143751.GA16993@udknight>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201212171919.07368.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wang YanQing <udknight@gmail.com>
Cc: mmarek@suse.cz, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, rdunlap@xenotime.net, bp@alien8.de, sakiwit@gmail.com, lacombar@gmail.com, lucas.demarchi@profusion.mobi, dave@gnu.org, paul.gortmaker@windriver.com, crquan@gmail.com, bpoirier@suse.de

Wang, All,

On Monday 17 December 2012 Wang YanQing wrote:
> dialog.h has two line the same below:
> extern char dialog_input_result[];
> This patch remove one of them.
> 
> Signed-off-by: Wang YanQing <udknight@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  scripts/kconfig/lxdialog/dialog.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/scripts/kconfig/lxdialog/dialog.h b/scripts/kconfig/lxdialog/dialog.h
> index ee17a52..307022a 100644
> --- a/scripts/kconfig/lxdialog/dialog.h
> +++ b/scripts/kconfig/lxdialog/dialog.h
> @@ -221,7 +221,6 @@ int dialog_menu(const char *title, const char *prompt,
>  		const void *selected, int *s_scroll);
>  int dialog_checklist(const char *title, const char *prompt, int height,
>  		     int width, int list_height);
> -extern char dialog_input_result[];
>  int dialog_inputbox(const char *title, const char *prompt, int height,
>  		    int width, const char *init);
>  
> -- 
> 1.7.11.1.116.g8228a23
> 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

