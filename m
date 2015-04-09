Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb3-smtp-cloud2.xs4all.net ([194.109.24.29]:53927 "EHLO
	lb3-smtp-cloud2.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753235AbbDILGm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Apr 2015 07:06:42 -0400
Message-ID: <1428577598.14000.31.camel@x220>
Subject: Re: [PATCH] kasan: Makefile: shut up warnings if
 CONFIG_COMPILE_TEST=y
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 09 Apr 2015 13:06:38 +0200
In-Reply-To: <1428507505-4015-1-git-send-email-a.ryabinin@samsung.com>
References: <20150407160213.8f66c90ca812c30f362dd543@linux-foundation.org>
	 <1428507505-4015-1-git-send-email-a.ryabinin@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <a.ryabinin@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2015-04-08 at 18:38 +0300, Andrey Ryabinin wrote:
> It might be annoying to constantly see this:
> 
> 	scripts/Makefile.kasan:16: Cannot use CONFIG_KASAN: -fsanitize=kernel-address is not supported by compiler
> 
> while performing allmodconfig/allyesconfig build tests.

That warning might be seen - once per build - because allmodconfig and
allyesconfig enable both CONFIG_KASAN and CONFIG_COMPILE_TEST, right?

> Disable this warning if CONFIG_COMPILE_TEST=y.

Do we expect that some people want to enable both KASAN and COMPILE_TEST
manually (ie, not as a result of allmodconfig or allyesconfig)? If so,
those people might now be in for some head-scratching if their compiler
lacks what's apparently needed to run kasan.

> Signed-off-by: Andrey Ryabinin <a.ryabinin@samsung.com>
> ---
>  scripts/Makefile.kasan | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> index 631619b..3f874d2 100644
> --- a/scripts/Makefile.kasan
> +++ b/scripts/Makefile.kasan
> @@ -13,12 +13,16 @@ CFLAGS_KASAN := $(call cc-option, -fsanitize=kernel-address \
>  		--param asan-instrumentation-with-call-threshold=$(call_threshold))
>  
>  ifeq ($(call cc-option, $(CFLAGS_KASAN_MINIMAL) -Werror),)
> +   ifneq ($(CONFIG_COMPILE_TEST),y)
>          $(warning Cannot use CONFIG_KASAN: \
>              -fsanitize=kernel-address is not supported by compiler)
> +   endif
>  else
>      ifeq ($(CFLAGS_KASAN),)
> -        $(warning CONFIG_KASAN: compiler does not support all options.\
> -            Trying minimal configuration)
> +        ifneq ($(CONFIG_COMPILE_TEST),y)
> +            $(warning CONFIG_KASAN: compiler does not support all options.\
> +                Trying minimal configuration)

(Side note: in this case the compiler supports that minimal
configuration, doesn't it? So shouldn't the second warning end in
                Running with minimal configuration)

or something to that effect?)

> +        endif
>          CFLAGS_KASAN := $(CFLAGS_KASAN_MINIMAL)
>      endif
>  endif

Thanks,


Paul Bolle

