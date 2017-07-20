Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:37173 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932592AbdGTHYW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Jul 2017 03:24:22 -0400
MIME-Version: 1.0
In-Reply-To: <596fd414.fDkQ2LPtuAl0Zq0f%akpm@linux-foundation.org>
References: <596fd414.fDkQ2LPtuAl0Zq0f%akpm@linux-foundation.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jul 2017 09:24:21 +0200
Message-ID: <CAK8P3a1NXUw9oSb-YB+TGeQYd6-sNMW+S5E5FUV_0TuBGhKV_A@mail.gmail.com>
Subject: Re: + kbuild-disable-wformat-truncation-warnings-by-default.patch
 added to -mm tree
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: mm-commits@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, stable <stable@vger.kernel.org>, gregkh <gregkh@linuxfoundation.org>

On Wed, Jul 19, 2017 at 11:50 PM,  <akpm@linux-foundation.org> wrote:
> ------------------------------------------------------
> From: Arnd Bergmann <arnd@arndb.de>
> Subject: kbuild: disable -Wformat-truncation warnings by default
>
> With x86 allmodconfig, we currently get 233 -Wformat-truncation warnings,
> which makes the entire warnings rather useless.
>
> This turns off the warning by default, unless we specify W=1 or higher
>
> Link: http://lkml.kernel.org/r/20170714120720.906842-2-arnd@arndb.de
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
>
>  scripts/Makefile.extrawarn |    3 +++
>  1 file changed, 3 insertions(+)
>
> diff -puN scripts/Makefile.extrawarn~kbuild-disable-wformat-truncation-warnings-by-default scripts/Makefile.extrawarn
> --- a/scripts/Makefile.extrawarn~kbuild-disable-wformat-truncation-warnings-by-default
> +++ a/scripts/Makefile.extrawarn
> @@ -67,5 +67,8 @@ KBUILD_CFLAGS += $(call cc-disable-warni
>  KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
>  KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
>  KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
> +else
> +# noisy gcc-7 warnings
> +KBUILD_CFLAGS += $(call cc-option,-Wformat-truncation=0)
>  endif
>  endif

Hi Andrew, Linus, Greg,

I noticed that Linus has made a similar patch in 4.13-rc1, commit bd664f6b3e37
("disable new gcc-7.1.1 warnings for now"), and it completely disables three
warnings (format-truncation, format-overflow and int-in-bool-context).

Obviously there is no point in having both, so let's talk about what we
want for 4.13, stable-backports and for future kernels, I'll then send those
patches. Here is my first suggestion:

- enable all three warnings with "make W=1" in 4.13, but leave them
  disabled by default.
- backport Linus' patch, plus the follow-up for W=1 to stable kernels,
  to allow stable kernels to build cleanly
- backport the patches that address any other gcc-7 warnings, as
  well as those that are not obvious false-positives to stable kernels
- In 4.14+, use my version above and address all int-in-bool-context
  and format-overflow warnings, but only use -Wformat-truncation
  with make W=1.

Any other suggestions?

        Arnd
