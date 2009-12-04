Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:61989 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755616AbZLDTCo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Dec 2009 14:02:44 -0500
Date: Fri, 4 Dec 2009 11:02:28 -0800
From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] make gconfig: fix the "(NEW)" string
Message-Id: <20091204110228.2ce3345c.randy.dunlap@oracle.com>
In-Reply-To: <23753252.369201259951904278.JavaMail.defaultUser@defaultHost>
References: <23753252.369201259951904278.JavaMail.defaultUser@defaultHost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "matteo_cortese@fastwebnet.it" <matteo_cortese@fastwebnet.it>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 4 Dec 2009 19:38:24 +0100 (CET) matteo_cortese@fastwebnet.it wrote:

> The string "(NEW)" is added to those options that are not present in the
>  current config file, thus looking as new features. Alas, the logic seem
> s to be inverted.

Did you just notice that thru source code inspection or via testing of
gconfig?


> Signed-off-by: Matteo Cortese <matteo_cortese@fastwebnet.it>
> ------
> 
> diff -u linux-source-2.6.26-old/scripts/kconfig/gconf.c linux-source-2.6
> .26/scripts/kconfig/gconf.c
> --- linux-source-2.6.26-old/scripts/kconfig/gconf.c	2008-07-13 21:51:29.
> 000000000 +0000
> +++ linux-source-2.6.26/scripts/kconfig/gconf.c	2009-01-03 00:52:57.0000
> 00000 +0000
> @@ -1174,7 +1174,7 @@
>  
>  	row[COL_OPTION] =
>  	    g_strdup_printf("%s %s", _(menu_get_prompt(menu)),
> -			    sym && sym_has_value(sym) ? "(NEW)" : "");
> +			    sym && !sym_has_value(sym) ? "(NEW)" : "");
>  
>  	if (show_all && !menu_is_visible(menu))
>  		row[COL_COLOR] = g_strdup("DarkGray");
> 
> --

Well, for me, with just some random config file that has
CONFIG_MODULES=y
CONFIG_BLOCK=y

gconfig with this patch says:

  Enable loadable module support
  Enable the block layer (NEW)

and gconfig without this patch says:

  Enable loadable module support (NEW)
  Enable the block layer


I'm confuzed.  Go figure.

---
~Randy
