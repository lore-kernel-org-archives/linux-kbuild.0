Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47343 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754297AbaA0VIo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 27 Jan 2014 16:08:44 -0500
Message-ID: <52E6CAD7.2020208@suse.cz>
Date: Mon, 27 Jan 2014 22:08:39 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] mn10300: Remove redundent debugging info flag
References: <cover.1386804405.git.geoff@infradead.org> <e9d530c5b8b1c9a8510d9c8db8663aedc393de8f.1386804405.git.geoff@infradead.org>
In-Reply-To: <e9d530c5b8b1c9a8510d9c8db8663aedc393de8f.1386804405.git.geoff@infradead.org>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geoff Levand <geoff@infradead.org>
Cc: linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

Dne 12.12.2013 00:34, Geoff Levand napsal(a):
> The gereric makefile now sets '-Wa,--gdwarf2' in KBUILD_AFLAGS, so
> this setting is no longer needed in arch makefiles.
> 
> Cc: David Howells <dhowells@redhat.com>
> Signed-off-by: Geoff Levand <geoff@infradead.org> for Huawei, Linaro
> ---
>  arch/mn10300/Makefile | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/mn10300/Makefile b/arch/mn10300/Makefile
> index a3d0fef..f5a9db9 100644
> --- a/arch/mn10300/Makefile
> +++ b/arch/mn10300/Makefile
> @@ -97,7 +97,6 @@ endef
>  # that are unhelpful whilst debugging.
>  ifdef CONFIG_DEBUG_INFO
>  #KBUILD_CFLAGS	+= -O1
> -KBUILD_AFLAGS	+= -Wa,--gdwarf2
>  endif

This leaves only a commented-out assignment in the ifdef block. Just
remove it completely together with the outdated comment above. Same for
the frv Makefile.

Michal
