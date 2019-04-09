Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:45550 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726372AbfDIRCC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Apr 2019 13:02:02 -0400
Received: by mail-vs1-f67.google.com with SMTP id o10so7654230vsp.12
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Apr 2019 10:02:01 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id b197sm39386735vkd.9.2019.04.09.10.01.58
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Apr 2019 10:01:58 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id o10so7654065vsp.12
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Apr 2019 10:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190308132701.133598-1-glider@google.com> <20190308132701.133598-3-glider@google.com>
 <497b1201-b2ae-5e0c-d191-ff1830d92fc1@redhat.com> <CAGXu5jJUWKiyW-_ygHpg9rJc7wQ2XTzjH71CtJfdefLu2zZHEg@mail.gmail.com>
 <CAG_fn=WGOCsHZ4stECA9nUBUMCL9SA76QKTy3FifLxmTfsQivg@mail.gmail.com>
In-Reply-To: <CAG_fn=WGOCsHZ4stECA9nUBUMCL9SA76QKTy3FifLxmTfsQivg@mail.gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 9 Apr 2019 10:01:46 -0700
Message-ID: <CAGXu5j+uXoJj6DTOrsK78t7tc8g_bfZDpugV+TBJYTsQOfi49Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] initmem: introduce CONFIG_INIT_ALL_HEAP
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Potapenko <glider@google.com>
Cc: Laura Abbott <labbott@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, linux-security-module <linux-security-module@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Kostya Serebryany <kcc@google.com>, Dmitry Vyukov <dvyukov@google.com>, Sandeep Patil <sspatil@android.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>

On Tue, Apr 9, 2019 at 1:55 AM Alexander Potapenko <glider@google.com> wrote:
>
> On Mon, Apr 8, 2019 at 7:14 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Mon, Apr 8, 2019 at 9:43 AM Laura Abbott <labbott@redhat.com> wrote:
> > > I've looked at doing something similar in the past (failing to find
> > > the thread this morning...) and while this will work, it has pretty
> > > serious performance issues. It's not actually the poisoning which
> > > is expensive but that turning on debugging removes the cpu slab
> > > which has significant performance penalties.
> > >
> > > I'd rather go back to the proposal of just poisoning the slab
> > > at alloc/free without using SLAB_POISON.
> >
> > I still agree this would make the most sense. Fundamentally it's not a
> > debugging feature.
> Wasn't it you who suggested using SLAB_POISON in the first round of comments? :)

Sure, if we want to use what we have right now, that's the way to go.
Optimally, I'd like to see it done the way Laura mentioned, but that's
a long road to convince the heap maintainers, etc.

> I actually have a working implementation that piggybacks on existing
> __GFP_ZERO code to initialize page_alloc() and SLUB allocations:
> https://github.com/google/kmsan/commit/4907af529ad525378a0728435c96d3812f71e594
> https://github.com/google/kmsan/commit/69618a9668bcf27700cc5da42eebf8ab50d1f56a
>
> I'd better cook a patch based on that.

I think it's still better to zero at free (this reduces the lifetime
of the data in memory and should make some use-after-tree bugs stand
out more), but we'll need to do something like what you have here for
doing memory tagging anyway, so we likely need both.

> There's also some overhead when allocations are initialized twice (in
> page_alloc() and kmalloc()) or thrice (page_alloc(), kmalloc() and
> e.g. sock_alloc_send_pskb())
> We can introduce another GFP flag explicitly telling the allocator to
> not initialize the memory chunk if we know it'll be initialized by a
> higher level allocator
> (something along the lines of
> https://github.com/google/kmsan/commit/4fc8cff79d868c29688c8a4186e504fda362f6fd)

Agreed.

-- 
Kees Cook
