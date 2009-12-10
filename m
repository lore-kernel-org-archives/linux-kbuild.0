Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:49205 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760968AbZLJQ6b (ORCPT
	<rfc822;linux-kbuild@VGER.KERNEL.ORG>);
	Thu, 10 Dec 2009 11:58:31 -0500
Date: Thu, 10 Dec 2009 08:57:07 -0800
From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH} wrap long help lines
Message-Id: <20091210085707.54019865.randy.dunlap@oracle.com>
In-Reply-To: <20091210163621.2E868262573@eskimo.mtv.corp.google.com>
References: <20091210163621.2E868262573@eskimo.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vadim Bendebury <vbendeb@google.com>
Cc: linux-kbuild@vger.kernel.org

On Thu, 10 Dec 2009 08:36:21 -0800 (PST) Vadim Bendebury wrote:

> Help text for certain config options is very extensive (the text includes all
> config options which the option in question depends on). Long lines are not
> wrapped, making it impossible to see the list.

It's possible to see the list by using the right arrow key to
scroll/pan the screen side-to-side.
But I'm not objecting to the patch.

> This patch adds a function to wrap long lines to fit the screen width and
> makes sure the function is invoked after help text is prepared.
> 
> Tested by running
> 
> mkdir ../build/powerpc
> ARCH=powerpc make menuconfig O=../build/powerpc
> 
> in the kernel sorce tree. Once menu is displayed, hitting c<cr>cc? brings up
> the help message for CONFIG_CRYPTO_MANAGER, now properly wrapped.
> 
> 
> Signed-off-by: Vadim Bendebury <vbendeb@google.com>
> ---
>  scripts/kconfig/expr.c |    2 +
>  scripts/kconfig/lkc.h  |    1 +
>  scripts/kconfig/util.c |   52 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 55 insertions(+), 0 deletions(-)
> 
> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
> index edd3f39..2aa49e8 100644
> --- a/scripts/kconfig/expr.c
> +++ b/scripts/kconfig/expr.c
> @@ -1083,6 +1083,8 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
>  	}
>  	if (expr_compare_type(prevtoken, e->type) > 0)
>  		fn(data, NULL, ")");
> +
> +	str_screen_wrap(data, "||");
>  }
>  
>  static void expr_print_file_helper(void *data, struct symbol *sym, const char *str)
> diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
> index f379b0b..8fc69a3 100644
> --- a/scripts/kconfig/lkc.h
> +++ b/scripts/kconfig/lkc.h
> @@ -112,6 +112,7 @@ struct gstr str_assign(const char *s);
>  void str_free(struct gstr *gs);
>  void str_append(struct gstr *gs, const char *s);
>  void str_printf(struct gstr *gs, const char *fmt, ...);
> +void str_screen_wrap(struct gstr *gs, const char *break_point);
>  const char *str_get(struct gstr *gs);
>  
>  /* symbol.c */
> diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
> index b6b2a46..f6c8930 100644
> --- a/scripts/kconfig/util.c
> +++ b/scripts/kconfig/util.c
> @@ -7,6 +7,7 @@
>  
>  #include <string.h>
>  #include "lkc.h"
> +#include <curses.h>
>  
>  /* file already present in list? If not add it */
>  struct file *file_lookup(const char *name)
> @@ -131,3 +132,54 @@ const char *str_get(struct gstr *gs)
>  	return gs->s;
>  }
>  
> +static const char string_breaker[] = { '\\', '\n' };
> +#define STRING_BREAKER_SIZE sizeof(string_breaker)
> +/*
> + * wrap long lines in the passed in strings. The lines are wrapped to fit into
> + * the current screen width. The lines can be broken only at 'break points' -
> + * passed in as the second parameter. A \<cr> (two characters) sequence is
> + * instered after the appropriate break points to get the line wrapped to fit
> + * the screen.
> +*/
> +void str_screen_wrap(struct gstr *data, const char *break_point)
> +{
> +	char *eol_location;
> +	int total_length;
> +	int screen_width = getmaxx(stdscr) - 10;
> +	int break_point_size = strlen(break_point);
> +
> +	eol_location = strrchr(data->s, '\n');
> +	if (!eol_location)
> +		eol_location = data->s;
> +
> +	total_length = strlen(data->s) + 1; /* include trailing zero */
> +
> +	/* while last line's length exceeds screen width */
> +	while ((total_length - (eol_location - data->s) - 1) > screen_width) {
> +		char *prev_breakp;
> +		char *breakp = eol_location;
> +		do {
> +			prev_breakp = breakp;
> +			breakp = strstr(breakp + 1, break_point);
> +		} while (breakp &&
> +			 ((breakp - eol_location) < screen_width));
> +
> +		if (prev_breakp == eol_location) {
> +			/* no break_points found */
> +			return;
> +		}
> +
> +		total_length += STRING_BREAKER_SIZE;
> +		if (data->len < total_length) {
> +			data->s = realloc(data->s, total_length);
> +			data->len = total_length;
> +		}
> +		prev_breakp += break_point_size;
> +
> +		eol_location = prev_breakp + STRING_BREAKER_SIZE;
> +		/* move the remainder of the string including trailing zero */
> +		memmove(eol_location, prev_breakp, strlen(prev_breakp) + 1);
> +		/* insert the line break */
> +		memcpy(prev_breakp, string_breaker, STRING_BREAKER_SIZE);
> +	}
> +}
> -- 


---
~Randy
