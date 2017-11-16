Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:44490 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935106AbdKPRQw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 12:16:52 -0500
Received: by mail-lf0-f66.google.com with SMTP id i14so3138320lfc.1
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 09:16:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171116165922.llrojrvomuihabrt@hirez.programming.kicks-ass.net>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-19-samitolvanen@google.com> <20171116115810.GH9361@arm.com>
 <20171116161731.GA94341@samitolvanen.mtv.corp.google.com> <20171116163054.kcsdsomr7u2mqql2@hirez.programming.kicks-ass.net>
 <CAKwvOdkV_g0XAbGM+nF2zt=2+tHLLcj=pbSxRDd2HMbrtU3cZg@mail.gmail.com> <20171116165922.llrojrvomuihabrt@hirez.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 16 Nov 2017 09:16:49 -0800
Message-ID: <CAKwvOd=k=iVQvWmzP1E3XHUCYLoJgx+F9zoPuE+R2oaw_ePUVA@mail.gmail.com>
Subject: Re: [PATCH v2 18/18] arm64: select ARCH_SUPPORTS_LTO_CLANG
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Will Deacon <will.deacon@arm.com>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, paulmck@linux.vnet.ibm.com

On Thu, Nov 16, 2017 at 8:59 AM, Peter Zijlstra <peterz@infradead.org> wrote:
> On Thu, Nov 16, 2017 at 08:50:41AM -0800, Nick Desaulniers wrote:
>> On Thu, Nov 16, 2017 at 8:30 AM, Peter Zijlstra <peterz@infradead.org> wrote:
>>
>> > Ideally we'd get the toolchain people to commit to supporting the kernel
>> > memory model along side the C11 one. That would help a ton.
>>
>> Does anyone from the kernel side participate in the C standardization process?
>
> Yes, Paul McKenney and Will Deacon. Doesn't mean these two can still be
> reconciled though. From what I understand C11 (and onwards) are
> incompatible with the kernel model on a number of subtle points.

It would be good to have these incompatibilities written down, then
for the sake of argument, they can be cited both for discussions on
LKML and in the C standardization process.  For example, a running
list in Documentation/ or something would make it so that anyone could
understand and cite current issues with the latest C standard.

I don't understand why we'd block patches for enabling experimental
features.  We've been running this patch-set on actual devices for
months and would love to provide them to the community for further
testing.  If bugs are found, then there's more evidence to bring to
the C standards committee.  Otherwise we're shutting down feature
development for the sake of potential bugs in a C standard we're not
even using.
