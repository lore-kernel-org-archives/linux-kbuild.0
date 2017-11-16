Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:36668 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933850AbdKPWOS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 17:14:18 -0500
Received: by mail-io0-f195.google.com with SMTP id n79so6847401ion.3
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 14:14:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171116213702.GA10616@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-9-samitolvanen@google.com> <CAKv+Gu-wYwBMV7tdb+Kax_cyPsmAB2R2ZVwJuNi9qM0kaYAs=Q@mail.gmail.com>
 <20171116114406.GB9361@arm.com> <20171116163132.GC94341@samitolvanen.mtv.corp.google.com>
 <CAKv+Gu8yPSwZep-S_ke_P5BiZ3o72R=ykhixoXcyGUHa1ZxGGw@mail.gmail.com> <20171116213702.GA10616@samitolvanen.mtv.corp.google.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 16 Nov 2017 22:14:17 +0000
Message-ID: <CAKv+Gu_3R4SUC2hCUtEX_4ut9admtrBZS-S-mzQnQsoJoHPcBw@mail.gmail.com>
Subject: Re: [PATCH v2 08/18] arm64: don't disable ADR_PREL_PG_HI21* with ARM64_ERRATUM_843419
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Andi Kleen <ak@linux.intel.com>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Alex Matveev <alxmtvv@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>

On 16 November 2017 at 21:37, Sami Tolvanen <samitolvanen@google.com> wrote:
> On Thu, Nov 16, 2017 at 04:34:03PM +0000, Ard Biesheuvel wrote:
>> You still have not explained to us how GOLD avoids the erratum.
>
> Sorry, I didn't realize you were asking that. If gold spots erratum
> sequences, looks like it creates stubs to break them up:
>
>   https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gold/aarch64.cc#l8396
>
> It also attempts to optimize the code by replacing adrps in these
> sequences with adr where possible, but otherwise doesn't appear to
> touch them:
>
>   https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gold/aarch64.cc#l2053
>

OK, so my concern here is that this code probably only operates on
fully linked binaries, and not partially linked object files like
kernel modules. The same applies to ld.bfd, which is why we need to
use the large module instead of a code model that may emit adrp
instructions..

What is preventing us from using the large model with clang? I know it
uses movk/movz pairs rather than literals, but this shouldn't matter
for modules, given that we support static ELF relocations.
