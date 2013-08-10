Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:10827 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S968472Ab3HJJKW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 10 Aug 2013 05:10:22 -0400
Date: Sat, 10 Aug 2013 11:10:21 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 4/4] KConf: images.c for gtk/qt gui flavour
	reoganized
Message-ID: <20130810091021.GC8521@merkur.ravnborg.org>
References: <1375612711-17140-1-git-send-email-david.graeff@web.de> <1375612711-17140-5-git-send-email-david.graeff@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1375612711-17140-5-git-send-email-david.graeff@web.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Graeff <david.graeff@web.de>
Cc: linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr

On Sun, Aug 04, 2013 at 12:38:31PM +0200, David Graeff wrote:
> Change order of xpm image constants to build up groups.
> Make those groups optional via ifdefs.
> Remove not used constants.
> 
> Signed-off-by: David Graeff <david.graeff@web.de>
> 
> diff --git a/scripts/kconfig/images.c b/scripts/kconfig/images.c
> index d4f84bd..c8563d9 100644
> --- a/scripts/kconfig/images.c
> +++ b/scripts/kconfig/images.c
> @@ -3,6 +3,166 @@
>   * Released under the terms of the GNU GPL v2.0.
>   */
>  
> +/* Most images are taken from the system icon theme
> +   in modern gui toolkits nowadays.
> +   Because we compile with -Wunused-variable, we hide
> +   the following xmp image constants.
> +*/
> +#ifdef IMAGES_EXTENDED

I see no users of this. So why not delete these?

	Sam

