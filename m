Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:36205 "EHLO
        mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753183AbdHTTvW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Aug 2017 15:51:22 -0400
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQ_1g_EJCvEv2mCa1x3oMR7uZAvPbwQxnjeKNkrtmbvxg@mail.gmail.com>
References: <596fd414.fDkQ2LPtuAl0Zq0f%akpm@linux-foundation.org>
 <CAK8P3a1NXUw9oSb-YB+TGeQYd6-sNMW+S5E5FUV_0TuBGhKV_A@mail.gmail.com> <CAK7LNAQ_1g_EJCvEv2mCa1x3oMR7uZAvPbwQxnjeKNkrtmbvxg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 20 Aug 2017 21:51:21 +0200
Message-ID: <CAK8P3a1fSGm8OCKu3pxD6Cnkbbn3=EbeTN2Xdzi3Y9K3Ue9UxQ@mail.gmail.com>
Subject: Re: + kbuild-disable-wformat-truncation-warnings-by-default.patch
 added to -mm tree
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, mm-commits@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, stable <stable@vger.kernel.org>, gregkh <gregkh@linuxfoundation.org>

On Sun, Aug 20, 2017 at 3:19 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2017-07-20 16:24 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
>> - enable all three warnings with "make W=1" in 4.13, but leave them
>>   disabled by default.
>> - backport Linus' patch, plus the follow-up for W=1 to stable kernels,
>>   to allow stable kernels to build cleanly
>> - backport the patches that address any other gcc-7 warnings, as
>>   well as those that are not obvious false-positives to stable kernels
>> - In 4.14+, use my version above and address all int-in-bool-context
>>   and format-overflow warnings, but only use -Wformat-truncation
>>   with make W=1.
>>
>
> Talking about 4.14+, shall we move -Wformat-truncation
> from the top Makefile (always disable) to
> Makefile.extrawarn (enable with W=1) ?

I dropped the ball on this one, sorry. I think we should do this for
all three warnings (format-overflow, format-truncation and
int-in-bool-context) for the time being.

In case of format-truncation, there are countless warnings,
most of them false-postives, so we simply can't enable them
by default.

For -Wformat-overflow, there is one patch that I need to
rewrite, all my other patches are pending for 4.14, see
https://patchwork.kernel.org/patch/9840801/ for the missing
one. This should be trivial to fix. However, enabling
CONFIG_UBSAN_SANITIZE_ALL results in seven additional
false positives. I created an patch for this in
https://pastebin.com/CD7nhRNp but can't submit that as it's
obviously bogus. I reported the gcc bug as
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81592

What we could do there is to disable the warning if
CONFIG_UBSAN_SANITIZE_ALL is turned on (like
we do for -Wmaybe-uninitialized in
CONFIG_UBSAN_SANITIZE_ALL) but leave it on otherwise.

I submitted patches for all -Wint-in-bool-context in arm/arm64/x86
randconfig builds, but there are still six known warnings for which
my patches did not get queued for 4.14.
I have to revisit those all to decide whether we can find an
acceptable workaround in the kernel and enable the warning again
by default, or leave it in W=1 until gcc improves enough.

      Arnd
