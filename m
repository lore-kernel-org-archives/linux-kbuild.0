Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:34619 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755376AbbDTSQg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Apr 2015 14:16:36 -0400
Date: Mon, 20 Apr 2015 20:16:31 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] tools/lib/api/Makefile: Add feature check for
 _FORTIFY_SOURCE
Message-ID: <20150420181631.GA19378@gmail.com>
References: <ghlhhnf0j2.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ghlhhnf0j2.fsf@lena.gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


* Dirk Gouders <dirk@gouders.net> wrote:

> For example on Gentoo systems where _FORTIFY_SOURCE is set by default,
> `make -C tools/perf' fails, because of the macro being redefined.
> 
> Fix that by a feature-check analogous to tools/perf/config/Makefile.
> 
> Signed-off-by: Dirk Gouders <dirk@gouders.net>
> ---
>  tools/lib/api/Makefile | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/lib/api/Makefile b/tools/lib/api/Makefile
> index d8fe29f..acf9097 100644
> --- a/tools/lib/api/Makefile
> +++ b/tools/lib/api/Makefile
> @@ -16,7 +16,14 @@ MAKEFLAGS += --no-print-directory
>  LIBFILE = $(OUTPUT)libapi.a
>  
>  CFLAGS := $(EXTRA_WARNINGS) $(EXTRA_CFLAGS)
> -CFLAGS += -ggdb3 -Wall -Wextra -std=gnu99 -Werror -O6 -D_FORTIFY_SOURCE=2 -fPIC
> +CFLAGS += -ggdb3 -Wall -Wextra -std=gnu99 -Werror -O6 -fPIC
> +
> +ifeq ($(DEBUG),0)
> +  ifeq ($(feature-fortify-source), 1)
> +    CFLAGS += -D_FORTIFY_SOURCE=2
> +  endif
> +endif

So how about undefining it instead and re-defining it as 
_FORTIFY_SOURCE=2?

Just in case a distro sets a weaker version - lets not accept that 
weaker setting. We've always had the stronger version of it.

Thanks,

	Ingo
