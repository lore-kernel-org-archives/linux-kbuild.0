Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl0-f67.google.com ([209.85.160.67]:44782 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751023AbdK3Iek (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Nov 2017 03:34:40 -0500
Received: by mail-pl0-f67.google.com with SMTP id x22so3817464pln.11
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2017 00:34:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171129215050.158653-6-paullawrence@google.com>
References: <20171129215050.158653-1-paullawrence@google.com> <20171129215050.158653-6-paullawrence@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 30 Nov 2017 09:34:18 +0100
Message-ID: <CACT4Y+YEmjU=9TvKP0FEJ=GJyO2G_hx09M1TYW_4B7c+HyYMhg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] kasan: add compiler support for clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Lawrence <paullawrence@google.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, Linux-MM <linux-mm@kvack.org>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>

On Wed, Nov 29, 2017 at 10:50 PM, 'Paul Lawrence' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
> For now we can hard-code ASAN ABI level 5, since historical clang builds
> can't build the kernel anyway.  We also need to emulate gcc's
> __SANITIZE_ADDRESS__ flag, or memset() calls won't be instrumented.
>
> Signed-off-by: Greg Hackmann <ghackmann@google.com>
> Signed-off-by: Paul Lawrence <paullawrence@google.com>
>
> ---
>  include/linux/compiler-clang.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
> index 3b609edffa8f..d02a4df3f473 100644
> --- a/include/linux/compiler-clang.h
> +++ b/include/linux/compiler-clang.h
> @@ -19,3 +19,11 @@
>
>  #define randomized_struct_fields_start struct {
>  #define randomized_struct_fields_end   };
> +
> +/* all clang versions usable with the kernel support KASAN ABI version 5 */
> +#define KASAN_ABI_VERSION 5
> +
> +/* emulate gcc's __SANITIZE_ADDRESS__ flag */
> +#if __has_feature(address_sanitizer)
> +#define __SANITIZE_ADDRESS__
> +#endif

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
