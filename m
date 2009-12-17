Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:59121 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1765430AbZLQVsp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Dec 2009 16:48:45 -0500
Message-ID: <4B2AA742.6020603@suse.cz>
Date: Thu, 17 Dec 2009 22:48:50 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] Kconfig: default m doesn't work for menuconfig/xconfig/gconfig
 even if CONFIG_MODULES=y
References: <20091216173556.0b50c25debf12a9aa545bf810459b532.9761f5fd4a.wbe@email.secureserver.net>
In-Reply-To: <20091216173556.0b50c25debf12a9aa545bf810459b532.9761f5fd4a.wbe@email.secureserver.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiafu He <jay@goldhive.com>
Cc: linux-kbuild@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>

Jiafu He napsal(a):
> menuconfig/xconfig/gconfig all fails to set tristate CONFIG_ options to
> m even if CONFIG_MODULES=y has been set. The "config" target works,
> though.

On a x86_64, I tried adding
config FOOBAR
        tristate "foobar"
        default m
        ---help---
           aaa aaa
to init/Kconfig

The I run make menuconfig in an already configured build dir and in an
empty one, in both cases FOOBAR was preset to M. Could you provide a
step-by-step testcase that shows the problem you want to fix?

Thanks!
Michal
> 
> Signed-off-by: Jiafu He <jay@goldhive.com>
> -----
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index b55e72f..9ff712b 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -170,8 +170,11 @@ int conf_read_simple(const char *name, int def)
>                 if (in)
>                         goto load;
>                 sym_add_change_count(1);
> -               if (!sym_defconfig_list)
> +               if (!sym_defconfig_list) {
> +                       if (modules_sym)
> +                               sym_calc_value(modules_sym);
>                         return 1;
> +               }
>  
>                 for_all_defaults(sym_defconfig_list, prop) {
>                         if (expr_calc_value(prop->visible.expr) == no ||
> -----
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

