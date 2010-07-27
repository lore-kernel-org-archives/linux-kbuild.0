Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:65166 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752389Ab0G0Twl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Jul 2010 15:52:41 -0400
Date: Tue, 27 Jul 2010 21:57:43 +0200
From: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Subject: Re: [PATCH 2.6.35-rc6] kconfig: fix MODULES-related bug in case of
 no .config
Message-ID: <20100727195742.GA18079@ulf>
References: <20100727192727.GA17954@ulf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20100727192727.GA17954@ulf>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On Tue, Jul 27, 2010 at 09:27:27PM +0200, Ulf Magnusson wrote:
> Hi,
> 
> There seems to be a kconfig bug due to MODULES not always being evaluated if no
> .config is found. Take the following Kconfig as an example:
> 
> config MODULES
> 	def_bool y
> 
> config FOO
> 	def_tristate m
> 
> With no .config, the following configuration is generated:
> 
> CONFIG_MODULES=y
> CONFIG_FOO=y
> 
> With an empty .config, the following:
> 
> CONFIG_MODULES=y
> CONFIG_FOO=m
> 
> Tristate choice statements can also exhibit the problem, due to having an
> implicit rev_dep (select) containing "m".
> 
> The problem is that MODULES is never evaluted in conf_read_simple() unless
> there's a .config. The following patch fixes this.
> 
> Signed-off-by: Ulf Magnusson <ulfalizer.lkml@gmail.com>
> 
> diff -uNr linux.vanilla/scripts/kconfig/confdata.c linux.new/scripts/kconfig/confdata.c
> --- linux.vanilla/scripts/kconfig/confdata.c	2010-07-27 16:47:43.443006287 +0200
> +++ linux.new/scripts/kconfig/confdata.c	2010-07-27 16:50:19.795005537 +0200
> @@ -170,8 +170,10 @@
>  		if (in)
>  			goto load;
>  		sym_add_change_count(1);
> -		if (!sym_defconfig_list)
> +		if (!sym_defconfig_list) {
> +			sym_calc_value(modules_sym);
>  			return 1;
> +		}
>  
>  		for_all_defaults(sym_defconfig_list, prop) {
>  			if (expr_calc_value(prop->visible.expr) == no ||

Silly error in the patch. The correct patch follows.

Signed-off-by: Ulf Magnusson <ulfalizer.lkml@gmail.com>

diff -uNr linux.vanilla/scripts/kconfig/confdata.c linux.new/scripts/kconfig/confdata.c
--- linux.vanilla/scripts/kconfig/confdata.c	2010-07-27 16:47:43.443006287 +0200
+++ linux.new/scripts/kconfig/confdata.c	2010-07-27 21:48:07.471550551 +0200
@@ -170,8 +170,11 @@
 		if (in)
 			goto load;
 		sym_add_change_count(1);
-		if (!sym_defconfig_list)
+		if (!sym_defconfig_list) {
+			if (modules_sym)
+				sym_calc_value(modules_sym);
 			return 1;
+		}
 
 		for_all_defaults(sym_defconfig_list, prop) {
 			if (expr_calc_value(prop->visible.expr) == no ||
