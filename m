Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:35727 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731429AbeGQOZI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Jul 2018 10:25:08 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [PATCH] kconfig: handle format string before calling conf_message_callback()
In-Reply-To: <1530758772-31832-1-git-send-email-yamada.masahiro@socionext.com>
        (Masahiro Yamada's message of "Thu, 5 Jul 2018 11:46:12 +0900")
References: <1530758772-31832-1-git-send-email-yamada.masahiro@socionext.com>
Date: Tue, 17 Jul 2018 15:45:45 +0200
Message-ID: <gha7qqx9fa.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org

Masahiro Yamada <yamada.masahiro@socionext.com> writes:

> As you see in mconf.c and nconf.c, conf_message_callback() hooks are
> likely to end up with the boilerplate of vsnprintf().  Process the
> string format before calling conf_message_callback() so that it
> receives a simple string.

I looked at and tested this patch and found no issues -- perhaps: except
that it seems to require another series:

     kbuild/kconfig: do not update config during installation

Dirk

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/kconfig/confdata.c  | 17 +++++++++++------
>  scripts/kconfig/lkc_proto.h |  2 +-
>  scripts/kconfig/mconf.c     |  9 +++------
>  scripts/kconfig/nconf.c     |  7 ++-----
>  4 files changed, 17 insertions(+), 18 deletions(-)
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 5af25a0..d0988a9 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -105,16 +105,16 @@ static void conf_warning(const char *fmt, ...)
>  	conf_warnings++;
>  }
>  
> -static void conf_default_message_callback(const char *fmt, va_list ap)
> +static void conf_default_message_callback(const char *s)
>  {
>  	printf("#\n# ");
> -	vprintf(fmt, ap);
> +	printf("%s", s);
>  	printf("\n#\n");
>  }
>  
> -static void (*conf_message_callback) (const char *fmt, va_list ap) =
> +static void (*conf_message_callback)(const char *s) =
>  	conf_default_message_callback;
> -void conf_set_message_callback(void (*fn) (const char *fmt, va_list ap))
> +void conf_set_message_callback(void (*fn)(const char *s))
>  {
>  	conf_message_callback = fn;
>  }
> @@ -122,10 +122,15 @@ void conf_set_message_callback(void (*fn) (const char *fmt, va_list ap))
>  static void conf_message(const char *fmt, ...)
>  {
>  	va_list ap;
> +	char buf[4096];
> +
> +	if (!conf_message_callback)
> +		return;
>  
>  	va_start(ap, fmt);
> -	if (conf_message_callback)
> -		conf_message_callback(fmt, ap);
> +
> +	vsnprintf(buf, sizeof(buf), fmt, ap);
> +	conf_message_callback(buf);
>  	va_end(ap);
>  }
>  
> diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
> index b0cd52f..86c2675 100644
> --- a/scripts/kconfig/lkc_proto.h
> +++ b/scripts/kconfig/lkc_proto.h
> @@ -10,7 +10,7 @@ int conf_write(const char *name);
>  int conf_write_autoconf(int overwrite);
>  bool conf_get_changed(void);
>  void conf_set_changed_callback(void (*fn)(void));
> -void conf_set_message_callback(void (*fn)(const char *fmt, va_list ap));
> +void conf_set_message_callback(void (*fn)(const char *s));
>  
>  /* menu.c */
>  extern struct menu rootmenu;
> diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
> index 82b27a0..83b5836 100644
> --- a/scripts/kconfig/mconf.c
> +++ b/scripts/kconfig/mconf.c
> @@ -772,16 +772,13 @@ static void show_helptext(const char *title, const char *text)
>  	show_textbox(title, text, 0, 0);
>  }
>  
> -static void conf_message_callback(const char *fmt, va_list ap)
> +static void conf_message_callback(const char *s)
>  {
> -	char buf[PATH_MAX+1];
> -
> -	vsnprintf(buf, sizeof(buf), fmt, ap);
>  	if (save_and_exit) {
>  		if (!silent)
> -			printf("%s", buf);
> +			printf("%s", s);
>  	} else {
> -		show_textbox(NULL, buf, 6, 60);
> +		show_textbox(NULL, s, 6, 60);
>  	}
>  }
>  
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index 208f7be..1ef232a 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
> @@ -1211,12 +1211,9 @@ static void conf(struct menu *menu)
>  	}
>  }
>  
> -static void conf_message_callback(const char *fmt, va_list ap)
> +static void conf_message_callback(const char *s)
>  {
> -	char buf[1024];
> -
> -	vsnprintf(buf, sizeof(buf), fmt, ap);
> -	btn_dialog(main_window, buf, 1, "<OK>");
> +	btn_dialog(main_window, s, 1, "<OK>");
>  }
>  
>  static void show_help(struct menu *menu)
