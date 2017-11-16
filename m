Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:46989 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935242AbdKPXUl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 18:20:41 -0500
Received: by mail-io0-f196.google.com with SMTP id t11so6966571iof.13
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 15:20:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171116230939.GA38360@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-9-samitolvanen@google.com> <CAKv+Gu-wYwBMV7tdb+Kax_cyPsmAB2R2ZVwJuNi9qM0kaYAs=Q@mail.gmail.com>
 <20171116114406.GB9361@arm.com> <20171116163132.GC94341@samitolvanen.mtv.corp.google.com>
 <CAKv+Gu8yPSwZep-S_ke_P5BiZ3o72R=ykhixoXcyGUHa1ZxGGw@mail.gmail.com>
 <20171116213702.GA10616@samitolvanen.mtv.corp.google.com> <CAKv+Gu_3R4SUC2hCUtEX_4ut9admtrBZS-S-mzQnQsoJoHPcBw@mail.gmail.com>
 <20171116230939.GA38360@samitolvanen.mtv.corp.google.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 16 Nov 2017 23:20:40 +0000
Message-ID: <CAKv+Gu9pROJ_T5twJtVn2itzav4x5fypyJWsBr5YbjWUTMFokg@mail.gmail.com>
Subject: Re: [PATCH v2 08/18] arm64: don't disable ADR_PREL_PG_HI21* with ARM64_ERRATUM_843419
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Andi Kleen <ak@linux.intel.com>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Alex Matveev <alxmtvv@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>

On 16 November 2017 at 23:09, Sami Tolvanen <samitolvanen@google.com> wrote:
> On Thu, Nov 16, 2017 at 10:14:17PM +0000, Ard Biesheuvel wrote:
>> OK, so my concern here is that this code probably only operates on
>> fully linked binaries, and not partially linked object files like
>> kernel modules.
>
> Right. That makes sense.
>
>> What is preventing us from using the large model with clang?
>
> We pass -mcmodel=large to clang, but I just confirmed that the
> attribute isn't stored in LLVM IR, which means it's not used during
> link time compilation. I'll see if we can solve this problem by
> passing the correct code model directly to LLVMgold instead. Thanks
> for pointing this out.
>

So at which point is the IR in a partially linked object file
converted into executable code?
