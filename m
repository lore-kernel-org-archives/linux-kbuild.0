Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:34559 "EHLO
        metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752552AbdF2MR2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Jun 2017 08:17:28 -0400
Date: Thu, 29 Jun 2017 14:17:24 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] kbuild: Enable Large File Support for hostprogs
Message-ID: <20170629121724.cnv5eymfnlctdifk@pengutronix.de>
References: <20170629121136.16860-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170629121136.16860-1-u.kleine-koenig@pengutronix.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, kernel@pengutronix.de, Ben Hutchings <ben@decadent.org.uk>

Hello,

On Thu, Jun 29, 2017 at 02:11:36PM +0200, Uwe Kleine-König wrote:
> diff --git a/Makefile b/Makefile
> index e40c471abe29..2c72207ce298 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -301,9 +301,15 @@ CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
>  	  else if [ -x /bin/bash ]; then echo /bin/bash; \
>  	  else echo sh; fi ; fi)
>  
> +HOST_LFS_CFLAGS := $(shell getconf LFS_CFLAGS)
> +HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS)
> +HOST_LFS_LIBS := $(shell getconf LFS_LIBS)
> +
>  HOSTCC       = gcc
>  HOSTCXX      = g++
> -HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89
> +HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS)
> +HOSTLDFLAGS  = $(HOST_LFS_LDFLAGS)
> +HOST_LOADLIBES = $(HOST_LFS_LIBS)
>  HOSTCXXFLAGS = -O2

I forgot to add $(HOST_LFS_CFLAGS) to HOSTCXXFLAGS. I can resend if the
patch is considered ok otherwise.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
