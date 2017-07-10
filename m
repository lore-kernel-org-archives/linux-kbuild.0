Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:33230 "EHLO
        mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753510AbdGJItN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Jul 2017 04:49:13 -0400
Received: by mail-oi0-f53.google.com with SMTP id p188so68870049oia.0
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Jul 2017 01:49:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170706220114.142438-5-ghackmann@google.com>
References: <20170706220114.142438-1-ghackmann@google.com> <20170706220114.142438-5-ghackmann@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 10 Jul 2017 10:48:46 +0200
Message-ID: <CACT4Y+aTdmohCejgV1NNSitk5WL2s_YyvBHMbDOGSBoWz8qzdA@mail.gmail.com>
Subject: Re: [PATCH 4/4] kasan: add compiler support for clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Hackmann <ghackmann@google.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>

On Fri, Jul 7, 2017 at 12:01 AM, Greg Hackmann <ghackmann@google.com> wrote:
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
> +#define KASAN_ABI_VERSION 5
> +
> +/* emulate gcc's __SANITIZE_ADDRESS__ flag
> + */
> +#if __has_feature(address_sanitizer)
> +#define __SANITIZE_ADDRESS__
> +#endif


Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
