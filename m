Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:41996 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752805AbdKWNmq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Nov 2017 08:42:46 -0500
Received: by mail-vk0-f66.google.com with SMTP id o70so11831623vkc.9
        for <linux-kbuild@vger.kernel.org>; Thu, 23 Nov 2017 05:42:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAKwvOdkDz1yRo=Skt_mWxs0uucK+adXx8kFQksMbTE3ofnpUMQ@mail.gmail.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-19-samitolvanen@google.com> <20171116115810.GH9361@arm.com>
 <20171116161731.GA94341@samitolvanen.mtv.corp.google.com> <20171116163054.kcsdsomr7u2mqql2@hirez.programming.kicks-ass.net>
 <CAKwvOdkV_g0XAbGM+nF2zt=2+tHLLcj=pbSxRDd2HMbrtU3cZg@mail.gmail.com>
 <20171116165922.llrojrvomuihabrt@hirez.programming.kicks-ass.net>
 <CAKwvOd=k=iVQvWmzP1E3XHUCYLoJgx+F9zoPuE+R2oaw_ePUVA@mail.gmail.com>
 <20171116173417.nqsh5dpu65uj7b5s@hirez.programming.kicks-ass.net>
 <20171116174830.GX3624@linux.vnet.ibm.com> <CAKwvOdkDz1yRo=Skt_mWxs0uucK+adXx8kFQksMbTE3ofnpUMQ@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 23 Nov 2017 14:42:44 +0100
Message-ID: <CAG_fn=UsmiQCXmdbED_SxgBj=xR0u0_mPS2+EhF0Me1ACBfWzw@mail.gmail.com>
Subject: Re: [PATCH v2 18/18] arm64: select ARCH_SUPPORTS_LTO_CLANG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Paul McKenney <paulmck@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>, Sami Tolvanen <samitolvanen@google.com>, Will Deacon <will.deacon@arm.com>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, Stephen Hines <srhines@google.com>, Pirama Arumuga Nainar <pirama@google.com>, Manoj Gupta <manojgupta@google.com>, Dmitriy Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@google.com>

On Thu, Nov 16, 2017 at 7:16 PM, Nick Desaulniers
<ndesaulniers@google.com> wrote:
> On Thu, Nov 16, 2017 at 9:48 AM, Paul E. McKenney
> <paulmck@linux.vnet.ibm.com> wrote:
>> On Thu, Nov 16, 2017 at 06:34:17PM +0100, Peter Zijlstra wrote:
>>> On Thu, Nov 16, 2017 at 09:16:49AM -0800, Nick Desaulniers wrote:
>>> > On Thu, Nov 16, 2017 at 8:59 AM, Peter Zijlstra <peterz@infradead.org=
> wrote:
>>> > > On Thu, Nov 16, 2017 at 08:50:41AM -0800, Nick Desaulniers wrote:
>>> > >> On Thu, Nov 16, 2017 at 8:30 AM, Peter Zijlstra <peterz@infradead.=
org> wrote:
>>> > >>
>>> > >> > Ideally we'd get the toolchain people to commit to supporting th=
e kernel
>>> > >> > memory model along side the C11 one. That would help a ton.
>>> > >>
>>> > >> Does anyone from the kernel side participate in the C standardizat=
ion process?
>>> > >
>>> > > Yes, Paul McKenney and Will Deacon. Doesn't mean these two can stil=
l be
>>> > > reconciled though. From what I understand C11 (and onwards) are
>>> > > incompatible with the kernel model on a number of subtle points.
>>> >
>>> > It would be good to have these incompatibilities written down, then
>>> > for the sake of argument, they can be cited both for discussions on
>>> > LKML and in the C standardization process.  For example, a running
>>> > list in Documentation/ or something would make it so that anyone coul=
d
>>> > understand and cite current issues with the latest C standard.
>>>
>>> Will should be able to produce this list; I know he's done before, I
>>> just can't find it -- my Google-foo isn't strong today.
>>
>> Here you go:
>>
>> http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/p0124r4.html
>
> Great, thanks! Will take some time to digest, but happy to refer
> others to this important work in the future.
>
> I wonder if we have anything like a case study that shows specifically
> how a compiler generated a subtle bug due to specifics of the memory
> model, like a "if you do this, here's the problematic code that will
> get generated, and why it's problematic due to the memory model."
> That may be a good way to raise issues with toolchain developers with
> concrete and actionable examples.
>
>>> > I don't understand why we'd block patches for enabling experimental
>>> > features.  We've been running this patch-set on actual devices for
>>> > months and would love to provide them to the community for further
>>> > testing.  If bugs are found, then there's more evidence to bring to
>>> > the C standards committee.  Otherwise we're shutting down feature
>>> > development for the sake of potential bugs in a C standard we're not
>>> > even using.
>>>
>>> So the problem is that its very very hard (and painful) to find these
>>> bugs. Getting the tools people to comment on these specific
>>> optimizations would really help lots.
>
> No doubt; I do not disagree with you.  Kernel developers have very
> important use cases for the language.
>
> But the core point I'm trying to make is "do we need to block this
> patch set until issues with the C standards body in regards to the
> kernels memory model are resolved?"  I would hope the two are
> orthogonal and that we'd take them and then test them even more
> extensively than the developer has in order to find out.
>
>> It would be good to get something similar to LKMM into KTSAN, for
>> example.  There would probably be a few differences due to efficiency
>> concerns, but closer is better than less close.  ;-)
>
> + glider, who may be able to comment on the state of KTSAN.
We haven't touched KTSAN for a while, so it's probably broken right now.
It should be possible to revive it, the question is how much code will
need to be annotated to prevent the tool from overwhelming the
developers with reports.
+Dima and Andrey, who should know better.


--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
