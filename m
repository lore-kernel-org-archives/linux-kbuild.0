Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from artax.karlin.mff.cuni.cz ([195.113.26.195]:53637 "EHLO
	artax.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755385AbZKLXes (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Nov 2009 18:34:48 -0500
Date: Thu, 12 Nov 2009 13:16:48 +0100
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/4] Support loading and saving custom remarks for
	config symbols
Message-ID: <20091112121648.GE1394@ucw.cz>
References: <cover.1256767265.git.aragorn@Anduril.ringwar.org> <b106dec1237ab723ae6a2404d42601bf20704bf3.1256767265.git.aragorn@Anduril.ringwar.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b106dec1237ab723ae6a2404d42601bf20704bf3.1256767265.git.aragorn@Anduril.ringwar.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bernhard Kaindl <bernhard.kaindl@gmx.net>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Hi!

> This code supports one-line remarks without newlines. The changes to
> the tools (menuconfig, xconfig, config) also only support one-line
> remarks as they use the existing UI functions for editing strings.
> 
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 797a741..eee2b60 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -152,6 +152,30 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
>  	return 0;
>  }
>  
> +/**
> + * Read remarks from -remarks file:
> + */

/** means kerneldoc but this is not valid kerneldoc.


								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
