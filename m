Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ve1eur01on0114.outbound.protection.outlook.com ([104.47.1.114]:62871
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932456AbeASP52 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jan 2018 10:57:28 -0500
Subject: Re: [PATCH] kasan: don't emit builtin calls when sanitization is off
References: <7d2dddbb7e4d4522fcf8e57c7da072c1ac76e1b0.1516373316.git.andreyknvl@google.com>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <20516c34-7826-e07a-cda6-6228776ebee6@virtuozzo.com>
Date: Fri, 19 Jan 2018 18:57:35 +0300
MIME-Version: 1.0
In-Reply-To: <7d2dddbb7e4d4522fcf8e57c7da072c1ac76e1b0.1516373316.git.andreyknvl@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Konovalov <andreyknvl@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Cc: Kostya Serebryany <kcc@google.com>, Evgeniy Stepanov <eugenis@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Pirama Arumuga Nainar <pirama@google.com>, Manoj Gupta <manojgupta@google.com>, Greg Hackmann <ghackmann@google.com>, Andrew Morton <akpm@linux-foundation.org>



On 01/19/2018 05:54 PM, Andrey Konovalov wrote:

> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> index dbbd4382f15a..db473309f136 100644
> --- a/scripts/Makefile.kasan
> +++ b/scripts/Makefile.kasan
> @@ -39,4 +39,7 @@ else
>  endif
>  
>  CFLAGS_KASAN += $(call cc-option, -fsanitize-address-use-after-scope)
> +
> +CFLAGS_KASAN_NOSANITIZE := $(call cc-option, -fno-builtin)
> +

I think it should be fine to drop cc-option here. Even ancient versions of GCC have -fno-builtin.

>  endif
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 1ca4dcd2d500..015aa9dbad86 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -121,7 +121,7 @@ endif
>  ifeq ($(CONFIG_KASAN),y)
>  _c_flags += $(if $(patsubst n%,, \
>  		$(KASAN_SANITIZE_$(basetarget).o)$(KASAN_SANITIZE)y), \
> -		$(CFLAGS_KASAN))
> +		$(CFLAGS_KASAN), $(CFLAGS_KASAN_NOSANITIZE))
>  endif
>  
>  ifeq ($(CONFIG_UBSAN),y)
> 
