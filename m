Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35626 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725849AbeKQSQd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Nov 2018 13:16:33 -0500
MIME-Version: 1.0
References: <20181031111444.3472-1-malat@debian.org> <CANiq72mj_iHvxqAEqhGoLT61Tc04-zN6f7Gv1jyNeb6d0R2LGw@mail.gmail.com>
 <CAK7LNARyykVuHT1YQ_UWVMFRG-K3VQwEXtjGQxQE4Fgu4wQtDg@mail.gmail.com>
In-Reply-To: <CAK7LNARyykVuHT1YQ_UWVMFRG-K3VQwEXtjGQxQE4Fgu4wQtDg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 17 Nov 2018 09:00:29 +0100
Message-ID: <CANiq72=UbXHZNDzqOJe7MQ5vZ1tiSD_YJNESG9g6-dcQ409BdQ@mail.gmail.com>
Subject: Re: [PATCH] remove old GCC version implementation
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: malat@debian.org, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Wed, Oct 31, 2018 at 5:14 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Wed, Oct 31, 2018 at 8:28 PM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > By the way, is it possible that scripts/ and similar stuff uses
> > directly include/linux/compiler_attributes.h (whenever it hits
> > mainline, see https://github.com/ojeda/linux/blob/compiler-attributes/include/linux/compiler_attributes.h
> > )? It is a header that does not depend on anything, so it could easily
> > be shared; and would avoid having to maintain two sets of attributes.
> > Let me know, I can take a look at it if you think it is a good idea.

Landed a couple of weeks ago.

> No.
> I want to share a header file between kernel and host-tools
> only when we need to do so.
>
> In this case, it is wrong to use the linker magic for the host tool
> if you look at the so ugly #if defined(__MACH__) part.

Do you mean this line?

  #define SECTION(name)   __attribute__((section("__TEXT, " #name)))

I would say having exceptions is fine, i.e. the idea was to reduce
"duplicated" definitions. In this case, the #define has a different
name and style, so I would say it is clear.

Anyway, if the policy is not sharing headers at all, that is fine!

Cheers,
Miguel
