Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ve1eur01on0094.outbound.protection.outlook.com ([104.47.1.94]:6607
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752666AbdGJKc0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Jul 2017 06:32:26 -0400
Subject: Re: [PATCH 4/4] kasan: add compiler support for clang
References: <20170706220114.142438-1-ghackmann@google.com>
 <20170706220114.142438-5-ghackmann@google.com>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <34230d2e-c134-6cbc-2a59-c78c78782526@virtuozzo.com>
Date: Mon, 10 Jul 2017 13:34:24 +0300
MIME-Version: 1.0
In-Reply-To: <20170706220114.142438-5-ghackmann@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Hackmann <ghackmann@google.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>

On 07/07/2017 01:01 AM, Greg Hackmann wrote:
> For now we can hard-code ASAN ABI level 5, since historical clang builds
> can't build the kernel anyway.  We also need to emulate gcc's
> __SANITIZE_ADDRESS__ flag, or memset() calls won't be instrumented.
> 
> Signed-off-by: Greg Hackmann <ghackmann@google.com>
> ---
>  include/linux/compiler-clang.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
> index d614c5ea1b5e..8153f793b22a 100644
> --- a/include/linux/compiler-clang.h
> +++ b/include/linux/compiler-clang.h
> @@ -23,3 +23,13 @@
>   */
>  #undef inline
>  #define inline inline __attribute__((unused)) notrace
> +
> +/* all clang versions usable with the kernel support KASAN ABI version 5
> + */

 Enclosing */ should be on the same line for single-line comments.

> +#define KASAN_ABI_VERSION 5
> +
> +/* emulate gcc's __SANITIZE_ADDRESS__ flag
> + */

Ditto.

> +#if __has_feature(address_sanitizer)
> +#define __SANITIZE_ADDRESS__
> +#endif
> 
