Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:36713 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751523AbdKQJyu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Nov 2017 04:54:50 -0500
Received: by mail-it0-f66.google.com with SMTP id 187so1249823iti.1
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Nov 2017 01:54:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171116235019.GA55530@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-9-samitolvanen@google.com> <CAKv+Gu-wYwBMV7tdb+Kax_cyPsmAB2R2ZVwJuNi9qM0kaYAs=Q@mail.gmail.com>
 <20171116114406.GB9361@arm.com> <20171116163132.GC94341@samitolvanen.mtv.corp.google.com>
 <CAKv+Gu8yPSwZep-S_ke_P5BiZ3o72R=ykhixoXcyGUHa1ZxGGw@mail.gmail.com>
 <20171116213702.GA10616@samitolvanen.mtv.corp.google.com> <CAKv+Gu_3R4SUC2hCUtEX_4ut9admtrBZS-S-mzQnQsoJoHPcBw@mail.gmail.com>
 <20171116230939.GA38360@samitolvanen.mtv.corp.google.com> <CAKv+Gu9pROJ_T5twJtVn2itzav4x5fypyJWsBr5YbjWUTMFokg@mail.gmail.com>
 <20171116235019.GA55530@samitolvanen.mtv.corp.google.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 17 Nov 2017 09:54:48 +0000
Message-ID: <CAKv+Gu_A9khxGbMoBX+r=d2XeKpKfLP9cxW0a1E2wGV8az91_w@mail.gmail.com>
Subject: Re: [PATCH v2 08/18] arm64: don't disable ADR_PREL_PG_HI21* with ARM64_ERRATUM_843419
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Andi Kleen <ak@linux.intel.com>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Alex Matveev <alxmtvv@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>

On 16 November 2017 at 23:50, Sami Tolvanen <samitolvanen@google.com> wrote:
> On Thu, Nov 16, 2017 at 11:20:40PM +0000, Ard Biesheuvel wrote:
>> So at which point is the IR in a partially linked object file
>> converted into executable code?
>
> At the final module link step (cmd_ld_ko_o) in scripts/Makefile.modpost,
> added in patch 12.
>

OK, so all IR objects are converted into a single .o file
encapsulating the module image. Does this give the same benefits as
LTO linking IR objects to a fully linked executable? Even if it does,
partial linking is not something the toolchain people are usually
crazy about, so it would be nice to have some confirmation that this
is a usage model that is fully supported.
