Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it1-f194.google.com ([209.85.166.194]:53545 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbfBTWMZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Feb 2019 17:12:25 -0500
Received: by mail-it1-f194.google.com with SMTP id x131so19244601itc.3
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Feb 2019 14:12:24 -0800 (PST)
MIME-Version: 1.0
References: <20190219214940.391081-1-arnd@arndb.de> <CAAeHK+xSpsu0tNmeq0wKXfT=0HuORnvU+XzLswDzhbtfZVa4Hw@mail.gmail.com>
 <CAK8P3a1NfHohd1xT7iHK85L2PGnD95RJvwFi-2cWrFpipQzqwg@mail.gmail.com>
 <b109ad0d-6995-8ca2-5426-7e2627d2032c@virtuozzo.com> <CAK8P3a0tg1WRLK=fs9S+X4TPB7sR55ZsjMbBVX07AtAfguXCsw@mail.gmail.com>
 <CAKwvOd=XrNNb=r3qgsT8O6JNzL4hg4pqfJJFcY2DzA0Ooc=E3w@mail.gmail.com>
 <20190220184408.GG9878@sirena.org.uk> <CAKwvOdne3aE5bUsQF-2C-L2Xezqq9qb=NqF8FA+B7nvqXKAXFA@mail.gmail.com>
 <CAK8P3a1pop4WqWxV=-R4n1Lh3FYG0mb4iJk4=saq6CgzpsPe4A@mail.gmail.com> <CAK8P3a0z7Y-uLgc8pWrdt712ic4R2nLbceg_zTCAC=ctG9LK9Q@mail.gmail.com>
In-Reply-To: <CAK8P3a0z7Y-uLgc8pWrdt712ic4R2nLbceg_zTCAC=ctG9LK9Q@mail.gmail.com>
From: Kostya Serebryany <kcc@google.com>
Date: Wed, 20 Feb 2019 14:12:12 -0800
Message-ID: <CAN=P9pi1J8fORxyp9H4WiEWWDANj0EmFOVGttDMPthUavToHBQ@mail.gmail.com>
Subject: Re: [PATCH] kasan: turn off asan-stack for clang-8 and earlier
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Mark Brown <broonie@kernel.org>, Evgenii Stepanov <eugenis@google.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Andrey Konovalov <andreyknvl@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>, Qian Cai <cai@lca.pw>, Alexander Potapenko <glider@google.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Christoph Lameter <cl@linux.com>, LKML <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>

On Wed, Feb 20, 2019 at 1:40 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Feb 20, 2019 at 10:13 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > In the example in https://bugs.llvm.org/show_bug.cgi?id=38809#c12
> > (https://godbolt.org/z/ylsGSQ) there is no inlining, yet clang uses
> > over ten times as much stack space as gcc, for reasons I still
> > can't explain. My assumption right now is that the underlying bug
> > causes most of the problems with excessive stack usage in
> > allmodconfig kernels.
>
> Here is an even more minimal example:
>
> struct s { int i[5]; } f(void);
> void g(void) { f(); f();}

On this example I can see some stupidity that clang/asan is doing.
Let me try fixing it and see if it helps bigger cases.
Thanks for reducing the case!

This is the input we get in the asan instrumentation:

; Function Attrs: noinline nounwind optnone sanitize_address uwtable
define dso_local void @g() #0 {
entry:
  %tmp = alloca %struct.s, align 4  <<<<<<<<<<<<<<<<<<<<<<<
  %tmp1 = alloca %struct.s, align 4
  %0 = bitcast %struct.s* %tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 20, i8* %0) #3
  call void @f(%struct.s* sret %tmp)
  %1 = bitcast %struct.s* %tmp to i8* <<<<<<<<<<<<<<<<<<<<<
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %1) #3
  %2 = bitcast %struct.s* %tmp1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 20, i8* %2) #3  <<<<<<<<<<<<<
  call void @f(%struct.s* sret %tmp1)
  %3 = bitcast %struct.s* %tmp1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %3) #3
  ret void
}

the stack variables are not *really* used, but since they are "used"
inside the lifetime markers they are not eliminated by asan,
and so asan instruments them, after which no one can remove them any more...




>
> https://godbolt.org/z/d_KWkh
>
> It's clear that clang does /something/ here when asan-stack=1 is
> set, but I fail to see what it is, or why that is necessary.
>
> The output of clang with asan-stack=0 is the expected
> code, and basically identical to what gcc produces with or
> without asan-stack.
>
>       Arnd
