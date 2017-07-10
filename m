Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:35244 "EHLO
        mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753789AbdGJIsS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Jul 2017 04:48:18 -0400
Received: by mail-oi0-f41.google.com with SMTP id 191so69002545oii.2
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Jul 2017 01:48:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170706220114.142438-4-ghackmann@google.com>
References: <20170706220114.142438-1-ghackmann@google.com> <20170706220114.142438-4-ghackmann@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 10 Jul 2017 10:47:46 +0200
Message-ID: <CACT4Y+Zr530Hj90adwBpLW_U6VY7AomAM+VZctZTtW4GA8ULpQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] kasan: support LLVM-style asan parameters
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Hackmann <ghackmann@google.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>

On Fri, Jul 7, 2017 at 12:01 AM, Greg Hackmann <ghackmann@google.com> wrote:
> Use cc-option to figure out whether the compiler's sanitizer uses
> LLVM-style parameters ("-mllvm -asan-foo=bar") or GCC-style parameters
> ("--param asan-foo=bar").
>
> Signed-off-by: Greg Hackmann <ghackmann@google.com>
> ---
>  scripts/Makefile.kasan | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> index 9576775a86f6..b66ae4b4546b 100644
> --- a/scripts/Makefile.kasan
> +++ b/scripts/Makefile.kasan
> @@ -9,11 +9,19 @@ KASAN_SHADOW_OFFSET ?= $(CONFIG_KASAN_SHADOW_OFFSET)
>
>  CFLAGS_KASAN_MINIMAL := -fsanitize=kernel-address
>
> -CFLAGS_KASAN := $(call cc-option, -fsanitize=kernel-address \
> +CFLAGS_KASAN_GCC := $(call cc-option, -fsanitize=kernel-address \
>                 -fasan-shadow-offset=$(KASAN_SHADOW_OFFSET) \
>                 --param asan-stack=1 --param asan-globals=1 \
>                 --param asan-instrumentation-with-call-threshold=$(call_threshold))
>
> +CFLAGS_KASAN_LLVM := $(call cc-option, -fsanitize=kernel-address \
> +               -mllvm -asan-mapping-offset=$(KASAN_SHADOW_OFFSET) \
> +               -mllvm -asan-stack=1 -mllvm -asan-globals=1 \
> +               -mllvm -asan-use-after-scope=1 \
> +               -mllvm -asan-instrumentation-with-call-threshold=$(call_threshold))
> +
> +CFLAGS_KASAN := $(CFLAGS_KASAN_GCC) $(CFLAGS_KASAN_LLVM)
> +
>  ifeq ($(call cc-option, $(CFLAGS_KASAN_MINIMAL) -Werror),)
>     ifneq ($(CONFIG_COMPILE_TEST),y)
>          $(warning Cannot use CONFIG_KASAN: \

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
