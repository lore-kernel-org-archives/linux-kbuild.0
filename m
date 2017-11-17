Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:42520 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756444AbdKQSuA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Nov 2017 13:50:00 -0500
Received: by mail-io0-f182.google.com with SMTP id u42so9715386ioi.9
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Nov 2017 10:50:00 -0800 (PST)
Date: Fri, 17 Nov 2017 10:49:55 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v2 08/18] arm64: don't disable ADR_PREL_PG_HI21* with
 ARM64_ERRATUM_843419
Message-ID: <20171117184955.GA39391@samitolvanen.mtv.corp.google.com>
References: <CAKv+Gu-wYwBMV7tdb+Kax_cyPsmAB2R2ZVwJuNi9qM0kaYAs=Q@mail.gmail.com>
 <20171116114406.GB9361@arm.com>
 <20171116163132.GC94341@samitolvanen.mtv.corp.google.com>
 <CAKv+Gu8yPSwZep-S_ke_P5BiZ3o72R=ykhixoXcyGUHa1ZxGGw@mail.gmail.com>
 <20171116213702.GA10616@samitolvanen.mtv.corp.google.com>
 <CAKv+Gu_3R4SUC2hCUtEX_4ut9admtrBZS-S-mzQnQsoJoHPcBw@mail.gmail.com>
 <20171116230939.GA38360@samitolvanen.mtv.corp.google.com>
 <CAKv+Gu9pROJ_T5twJtVn2itzav4x5fypyJWsBr5YbjWUTMFokg@mail.gmail.com>
 <20171116235019.GA55530@samitolvanen.mtv.corp.google.com>
 <CAKv+Gu_A9khxGbMoBX+r=d2XeKpKfLP9cxW0a1E2wGV8az91_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu_A9khxGbMoBX+r=d2XeKpKfLP9cxW0a1E2wGV8az91_w@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Andi Kleen <ak@linux.intel.com>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Alex Matveev <alxmtvv@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>

On Fri, Nov 17, 2017 at 09:54:48AM +0000, Ard Biesheuvel wrote:
> OK, so all IR objects are converted into a single .o file
> encapsulating the module image. Does this give the same benefits as
> LTO linking IR objects to a fully linked executable?

Yes, it does.

> Even if it does, partial linking is not something the toolchain
> people are usually crazy about, so it would be nice to have some
> confirmation that this is a usage model that is fully supported.

I confirmed with our LLVM developers that while this is less common,
it's fully supported.

I will also drop this patch in v3 as passing code model to LLVMgold
fixes the issue with LTO.

Sami
