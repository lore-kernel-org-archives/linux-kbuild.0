Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:38268 "EHLO
        mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751112AbeAVRWj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jan 2018 12:22:39 -0500
Received: by mail-oi0-f46.google.com with SMTP id m65so6469318oig.5
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Jan 2018 09:22:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAKwvOdnyuw27CCYf6CVB4yVeov2=0iifsnjD3eTxtaeTZmPQEg@mail.gmail.com>
References: <8ffecfffe04088c52c42b92739c2bd8a0bcb3f5e.1516384594.git.andreyknvl@google.com>
 <CAKwvOdnyuw27CCYf6CVB4yVeov2=0iifsnjD3eTxtaeTZmPQEg@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 22 Jan 2018 18:22:37 +0100
Message-ID: <CAAeHK+z=7UBwVyyDLi8jLbMg5PHdqr-RaqiUFgkdLcMFfie4Vg@mail.gmail.com>
Subject: Re: [PATCH v2] kasan: don't emit builtin calls when sanitization is off
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, Kostya Serebryany <kcc@google.com>, Evgeniy Stepanov <eugenis@google.com>, Stephen Hines <srhines@google.com>, Pirama Arumuga Nainar <pirama@google.com>, Manoj Gupta <manojgupta@google.com>, Greg Hackmann <ghackmann@google.com>, Andrew Morton <akpm@linux-foundation.org>, David Majnemer <majnemer@google.com>, Chandler Carruth <chandlerc@google.com>, Michael Kuperstein <mkuper@google.com>

On Fri, Jan 19, 2018 at 8:06 PM, Nick Desaulniers
<ndesaulniers@google.com> wrote:
> Hmm... I had mentioned this patch to some coworkers who have much more
> knowledge about LLVM than me.  They had concern that LLVM needs memset
> to be defined, and that there were discussions on the llvm mailing
> list about this.
>
> I'm digging through trying to find anything relevant, maybe this one
> about memcpy: https://lists.llvm.org/pipermail/llvm-dev/2012-May/050108.html
>
> I wonder if -ffreestanding is more appropriate?

I don't mind using either of those, they both fix the issue.

I'm struggling to understand the difference though. GCC documentation
doesn't really explain it [1] and Clang documentation [2] is
completely useless in this case.

[1] https://gcc.gnu.org/onlinedocs/gcc/Standards.html
[2] https://clang.llvm.org/docs/CommandGuide/clang.html
