Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733274AbgCQA5u (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Mar 2020 20:57:50 -0400
Date: Tue, 17 Mar 2020 01:57:46 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH] Makefile: disallow data races on gcc-10 as well
In-Reply-To: <20200317000718.177637-1-slyfox@gentoo.org>
Message-ID: <nycvar.YFH.7.76.2003170154580.19500@cbobk.fhfr.pm>
References: <20200317000718.177637-1-slyfox@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sergei Trofimovich <slyfox@gentoo.org>
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org

On Tue, 17 Mar 2020, Sergei Trofimovich wrote:

> gcc-10 will rename --param=allow-store-data-races=0
> to -fno-allow-store-data-races.
> 
> The flag change happened at https://gcc.gnu.org/PR92046.
> 
> CC: Jiri Kosina <jkosina@suse.cz>
> CC: Masahiro Yamada <masahiroy@kernel.org>
> CC: Michal Marek <michal.lkml@markovi.net>
> CC: linux-kbuild@vger.kernel.org
> Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index 171f2b004c8a..9696eb2cd5a1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -714,6 +714,7 @@ endif
>  
>  # Tell gcc to never replace conditional load with a non-conditional one
>  KBUILD_CFLAGS	+= $(call cc-option,--param=allow-store-data-races=0)
> +KBUILD_CFLAGS	+= $(call cc-option,-fno-allow-store-data-races)

I have to say I can't really read gcc sources without major cerebral pain, 
so let me me dense here: what happens to gcc<10 if you pass 
-fno-allow-store-data-races to it?

My expectation would be that it would just blow up in fatal error, meaning 
that after we apply your patch, kernel couldn't be successfully compiled 
by any compiler that doesn't understand '-fno-allow-store-data-races' 
(which is just about any compiler on this planet).

Thanks,

-- 
Jiri Kosina
SUSE Labs
