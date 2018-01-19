Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:38148 "EHLO
        mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755985AbeASTIa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jan 2018 14:08:30 -0500
Received: by mail-wm0-f50.google.com with SMTP id 141so5507267wme.3
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Jan 2018 11:08:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAKwvOdnyuw27CCYf6CVB4yVeov2=0iifsnjD3eTxtaeTZmPQEg@mail.gmail.com>
References: <8ffecfffe04088c52c42b92739c2bd8a0bcb3f5e.1516384594.git.andreyknvl@google.com>
 <CAKwvOdnyuw27CCYf6CVB4yVeov2=0iifsnjD3eTxtaeTZmPQEg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 19 Jan 2018 14:08:28 -0500
Message-ID: <CAKwvOdmFTREEgzu_meC899EL2mdYfpq9iVgzVQVPo0ORBs=OAw@mail.gmail.com>
Subject: Re: [PATCH v2] kasan: don't emit builtin calls when sanitization is off
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Konovalov <andreyknvl@google.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, Kostya Serebryany <kcc@google.com>, Evgeniy Stepanov <eugenis@google.com>, Stephen Hines <srhines@google.com>, Pirama Arumuga Nainar <pirama@google.com>, Manoj Gupta <manojgupta@google.com>, Greg Hackmann <ghackmann@google.com>, Andrew Morton <akpm@linux-foundation.org>, David Majnemer <majnemer@google.com>, Chandler Carruth <chandlerc@google.com>, Michael Kuperstein <mkuper@google.com>

sorry, for new people I just cc'ed: https://patchwork.kernel.org/patch/10175831/

On Fri, Jan 19, 2018 at 2:06 PM, Nick Desaulniers
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



-- 
Thanks,
~Nick Desaulniers
