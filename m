Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f193.google.com ([209.85.161.193]:42635 "EHLO
        mail-yw0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751727AbdKPXJo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 18:09:44 -0500
Received: by mail-yw0-f193.google.com with SMTP id j198so554572ywg.9
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 15:09:44 -0800 (PST)
Date: Thu, 16 Nov 2017 15:09:39 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v2 08/18] arm64: don't disable ADR_PREL_PG_HI21* with
 ARM64_ERRATUM_843419
Message-ID: <20171116230939.GA38360@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-9-samitolvanen@google.com>
 <CAKv+Gu-wYwBMV7tdb+Kax_cyPsmAB2R2ZVwJuNi9qM0kaYAs=Q@mail.gmail.com>
 <20171116114406.GB9361@arm.com>
 <20171116163132.GC94341@samitolvanen.mtv.corp.google.com>
 <CAKv+Gu8yPSwZep-S_ke_P5BiZ3o72R=ykhixoXcyGUHa1ZxGGw@mail.gmail.com>
 <20171116213702.GA10616@samitolvanen.mtv.corp.google.com>
 <CAKv+Gu_3R4SUC2hCUtEX_4ut9admtrBZS-S-mzQnQsoJoHPcBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu_3R4SUC2hCUtEX_4ut9admtrBZS-S-mzQnQsoJoHPcBw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Andi Kleen <ak@linux.intel.com>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Alex Matveev <alxmtvv@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>

On Thu, Nov 16, 2017 at 10:14:17PM +0000, Ard Biesheuvel wrote:
> OK, so my concern here is that this code probably only operates on
> fully linked binaries, and not partially linked object files like
> kernel modules.

Right. That makes sense.

> What is preventing us from using the large model with clang?

We pass -mcmodel=large to clang, but I just confirmed that the
attribute isn't stored in LLVM IR, which means it's not used during
link time compilation. I'll see if we can solve this problem by
passing the correct code model directly to LLVMgold instead. Thanks
for pointing this out.

Sami

