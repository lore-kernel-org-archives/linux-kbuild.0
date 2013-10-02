Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:50471 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752923Ab3JBHMg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Oct 2013 03:12:36 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [PATCH 4/4] kconfig: remove unused definition from scanner
In-Reply-To: <6249343.9Mjtul3lu5@tacticalops> (Martin Walch's message of "Wed,
	02 Oct 2013 07:24:40 +0200")
References: <6249343.9Mjtul3lu5@tacticalops>
Date: Wed, 02 Oct 2013 08:42:59 +0200
Message-ID: <ghk3hwjhqk.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Martin Walch <walch.martin@web.de>
Cc: Michal Marek <mmarek@suse.cz>, Jiri Kosina <trivial@kernel.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>, Benjamin Poirier <bpoirier@suse.de>, Wang YanQing <udknight@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Jean Delvare <jdelvare@suse.de>, Kees Cook <keescook@chromium.org>, Alan Cox <alan@linux.intel.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Martin Walch <walch.martin@web.de> writes:

> From: Martin Walch <walch.martin@web.de>
> Date: Wed, 2 Oct 2013 06:58:46 +0200
> Subject: [PATCH 4/4] kconfig: remove unused definition from scanner
>
> The definition ws [ \n\t] is not used anywhere. Drop it to avoid confusion.

Hi Martin,

I think you should also regenerate the scanner and add
the new zconf.lex.c_shipped to this patch.

Dirk

> Signed-off-by: Martin Walch <walch.martin@web.de>
> ---
>  scripts/kconfig/zconf.l | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
> index 6555a47..1a9f53e 100644
> --- a/scripts/kconfig/zconf.l
> +++ b/scripts/kconfig/zconf.l
> @@ -68,7 +68,6 @@ static void alloc_string(const char *str, int size)
>  }
>  %}
>  
> -ws	[ \n\t]
>  n	[A-Za-z0-9_]
>  
>  %%
