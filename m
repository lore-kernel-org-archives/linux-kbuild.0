Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:40234 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbfDKR37 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Apr 2019 13:29:59 -0400
Received: by mail-ua1-f67.google.com with SMTP id b8so2297008uaq.7
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Apr 2019 10:29:58 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id u6sm30913845vke.54.2019.04.11.10.29.55
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Apr 2019 10:29:56 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id l22so2296491uao.8
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Apr 2019 10:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190410131726.250295-1-glider@google.com> <20190410131726.250295-3-glider@google.com>
 <CAGXu5jJt3uNWVXDD=GR6oVwn=g7O=Jcz9sxai5q10X9yyR56XA@mail.gmail.com> <CAG_fn=Vkod40bxxP8PU-+zXs2u4arqAB_bYxqei1bb_tgsg8GA@mail.gmail.com>
In-Reply-To: <CAG_fn=Vkod40bxxP8PU-+zXs2u4arqAB_bYxqei1bb_tgsg8GA@mail.gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 11 Apr 2019 10:29:43 -0700
Message-ID: <CAGXu5jLEGmMVTJEJHFM3z0EVBAryK3x8Uz4K+mMaOJhfuL9Acg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] initmem: introduce CONFIG_INIT_ALL_HEAP
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Potapenko <glider@google.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, linux-security-module <linux-security-module@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Kostya Serebryany <kcc@google.com>, Dmitry Vyukov <dvyukov@google.com>, Sandeep Patil <sspatil@android.com>, Laura Abbott <labbott@redhat.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>

On Thu, Apr 11, 2019 at 1:39 AM Alexander Potapenko <glider@google.com> wrote:
>
> On Wed, Apr 10, 2019 at 6:09 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Wed, Apr 10, 2019 at 6:18 AM Alexander Potapenko <glider@google.com> wrote:
> > >
> > > This config option adds the possibility to initialize newly allocated
> > > pages and heap objects with a 0xAA pattern.
> > > There's already a number of places where allocations are initialized
> > > based on the presence of __GFP_ZERO flag. We just change this code so
> > > that under CONFIG_INIT_ALL_HEAP these allocations are always initialized
> > > with either 0x00 or 0xAA depending on the __GFP_ZERO.
> >
> > Why not just make __GFP_ZERO unconditional instead? This looks like
> > it'd be simpler and not need arch-specific implementation?
>
> Right, but it would mean we can only initialize with 0x00 pattern.
> I believe that for testing purposes a nonzero pattern is better,

Can it be implemented in a way that isn't arch-specific? I'd really
like to have a general solution that works immediately for all
architectures. (Can't everything just use a memset?)

> because it'll not only assure the execution is deterministic, but will
> also uncover logic bugs earlier (see the discussion at
> https://reviews.llvm.org/D54604?id=174471)
> For hardening purposes the pattern shouldn't matter much.

So, for hardening, it actually does matter but only in certain cases.
On 64-bit, a 0xAA... pointer will have the high bit set, so it'll land
in the non-canonical memory range, which is good. For 32-bit, 0xAA...
will be in userspace (TASK_SIZE is 0xC0000000). In the above URL I see
now that 32-bit pointer init gets 0x000000AA, which is good, but for
heap init, types aren't known. So perhaps use 0x000000AA for 32-bit
and 0xAA... for 64-bit heap init? (0xAA... has stronger properties
since there have been NULL page mapping bypass flaws in the (recent!)
past, so I could see keeping that for 64-bit instead of just using
0-init everywhere.)

> If you think arch-specific code is too much of a trouble, we could
> implement clear_page_pattern() using memset() on every architecture,
> but allow the user to choose between slow (0xAA) and production (0x00)
> modes.

How about 32-bit use 0x00, 64-bit use 0xAA (and provide per-arch
speed-ups with a generic "slow" version for all the other
architectures?)

-Kees

-- 
Kees Cook
