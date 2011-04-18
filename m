Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254]:41869 "EHLO
	wolverine01.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752968Ab1DRWi5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Apr 2011 18:38:57 -0400
Message-ID: <4DACBD80.9080705@codeaurora.org>
Date: Mon, 18 Apr 2011 15:38:56 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
Subject: Re: [PATCH] nconfig: Silence unused return values from wattrset
References: <1302127669-15272-1-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1302127669-15272-1-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Nir Tzachar <nir.tzachar@gmail.com>

On 04/06/2011 03:07 PM, Stephen Boyd wrote:
> Ignore the return value from wattrset since we ignore the return
> value in nconf.gui.c as well.
>
> scripts/kconfig/nconf.c: In function 'print_function_line':
> scripts/kconfig/nconf.c:376: warning: value computed is not used
> scripts/kconfig/nconf.c:380: warning: value computed is not used
> scripts/kconfig/nconf.c:387: warning: value computed is not used
> scripts/kconfig/nconf.c: In function 'show_menu':
> scripts/kconfig/nconf.c:956: warning: value computed is not used
> scripts/kconfig/nconf.c:961: warning: value computed is not used
> scripts/kconfig/nconf.c:963: warning: value computed is not used
> scripts/kconfig/nconf.c:965: warning: value computed is not used
>
> Cc: Nir Tzachar <nir.tzachar@gmail.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Ping? Nack? Ack?

>  scripts/kconfig/nconf.c |   14 +++++++-------
>  1 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index db56377..488dd74 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
> @@ -373,18 +373,18 @@ static void print_function_line(void)
>  	const int skip = 1;
>  
>  	for (i = 0; i < function_keys_num; i++) {
> -		wattrset(main_window, attributes[FUNCTION_HIGHLIGHT]);
> +		(void) wattrset(main_window, attributes[FUNCTION_HIGHLIGHT]);
>  		mvwprintw(main_window, LINES-3, offset,
>  				"%s",
>  				function_keys[i].key_str);
> -		wattrset(main_window, attributes[FUNCTION_TEXT]);
> +		(void) wattrset(main_window, attributes[FUNCTION_TEXT]);
>  		offset += strlen(function_keys[i].key_str);
>  		mvwprintw(main_window, LINES-3,
>  				offset, "%s",
>  				function_keys[i].func);
>  		offset += strlen(function_keys[i].func) + skip;
>  	}
> -	wattrset(main_window, attributes[NORMAL]);
> +	(void) wattrset(main_window, attributes[NORMAL]);
>  }
>  
>  /* help */
> @@ -953,16 +953,16 @@ static void show_menu(const char *prompt, const char *instructions,
>  	current_instructions = instructions;
>  
>  	clear();
> -	wattrset(main_window, attributes[NORMAL]);
> +	(void) wattrset(main_window, attributes[NORMAL]);
>  	print_in_middle(stdscr, 1, 0, COLS,
>  			menu_backtitle,
>  			attributes[MAIN_HEADING]);
>  
> -	wattrset(main_window, attributes[MAIN_MENU_BOX]);
> +	(void) wattrset(main_window, attributes[MAIN_MENU_BOX]);
>  	box(main_window, 0, 0);
> -	wattrset(main_window, attributes[MAIN_MENU_HEADING]);
> +	(void) wattrset(main_window, attributes[MAIN_MENU_HEADING]);
>  	mvwprintw(main_window, 0, 3, " %s ", prompt);
> -	wattrset(main_window, attributes[NORMAL]);
> +	(void) wattrset(main_window, attributes[NORMAL]);
>  
>  	set_menu_items(curses_menu, curses_menu_items);
>  
-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.

