Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:41423 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935181AbdKPQeF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 11:34:05 -0500
Received: by mail-io0-f173.google.com with SMTP id g73so5801381ioj.8
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 08:34:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171116163132.GC94341@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-9-samitolvanen@google.com> <CAKv+Gu-wYwBMV7tdb+Kax_cyPsmAB2R2ZVwJuNi9qM0kaYAs=Q@mail.gmail.com>
 <20171116114406.GB9361@arm.com> <20171116163132.GC94341@samitolvanen.mtv.corp.google.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 16 Nov 2017 16:34:03 +0000
Message-ID: <CAKv+Gu8yPSwZep-S_ke_P5BiZ3o72R=ykhixoXcyGUHa1ZxGGw@mail.gmail.com>
Subject: Re: [PATCH v2 08/18] arm64: don't disable ADR_PREL_PG_HI21* with ARM64_ERRATUM_843419
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Andi Kleen <ak@linux.intel.com>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Alex Matveev <alxmtvv@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>

On 16 November 2017 at 16:32, Sami Tolvanen <samitolvanen@google.com> wrote:
> On Thu, Nov 16, 2017 at 11:44:06AM +0000, Will Deacon wrote:
>> Right, and this would also mean that we silently load vulnerable
>> modules that are linked with either LD that doesn't support
>> --fix-cortex-a53-843419 or simply wasn't passed.
>
> You'll see a warning at least if the linker doesn't support the flag,
> but yes, you're correct. In v1 of this patch set, LTO depended on this
> erratum not being selected, but I changed it in v2 based on Ard's
> suggestion.
>
> I'm fine with not being able to use LTO on devices that are affected
> by this erratum, so either option works for me. I can even change
> this so the user must explicitly disable the erratum in order to use
> LTO. Thoughts?
>

You still have not explained to us how GOLD avoids the erratum.
