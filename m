Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f169.google.com ([209.85.128.169]:34259 "EHLO
        mail-wr0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756092AbeASTGQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jan 2018 14:06:16 -0500
Received: by mail-wr0-f169.google.com with SMTP id 36so2475808wrh.1
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Jan 2018 11:06:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <8ffecfffe04088c52c42b92739c2bd8a0bcb3f5e.1516384594.git.andreyknvl@google.com>
References: <8ffecfffe04088c52c42b92739c2bd8a0bcb3f5e.1516384594.git.andreyknvl@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 19 Jan 2018 14:06:13 -0500
Message-ID: <CAKwvOdnyuw27CCYf6CVB4yVeov2=0iifsnjD3eTxtaeTZmPQEg@mail.gmail.com>
Subject: Re: [PATCH v2] kasan: don't emit builtin calls when sanitization is off
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Konovalov <andreyknvl@google.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, Kostya Serebryany <kcc@google.com>, Evgeniy Stepanov <eugenis@google.com>, Stephen Hines <srhines@google.com>, Pirama Arumuga Nainar <pirama@google.com>, Manoj Gupta <manojgupta@google.com>, Greg Hackmann <ghackmann@google.com>, Andrew Morton <akpm@linux-foundation.org>, David Majnemer <majnemer@google.com>, Chandler Carruth <chandlerc@google.com>, Michael Kuperstein <mkuper@google.com>

Hmm... I had mentioned this patch to some coworkers who have much more
knowledge about LLVM than me.  They had concern that LLVM needs memset
to be defined, and that there were discussions on the llvm mailing
list about this.

I'm digging through trying to find anything relevant, maybe this one
about memcpy: https://lists.llvm.org/pipermail/llvm-dev/2012-May/050108.html

I wonder if -ffreestanding is more appropriate?
