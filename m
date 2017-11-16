Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:47024 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965324AbdKPQcy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 11:32:54 -0500
Received: by mail-it0-f43.google.com with SMTP id r127so652535itb.5
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 08:32:54 -0800 (PST)
Date: Thu, 16 Nov 2017 08:32:50 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v2 08/18] arm64: don't disable ADR_PREL_PG_HI21* with
 ARM64_ERRATUM_843419
Message-ID: <20171116163132.GC94341@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-9-samitolvanen@google.com>
 <CAKv+Gu-wYwBMV7tdb+Kax_cyPsmAB2R2ZVwJuNi9qM0kaYAs=Q@mail.gmail.com>
 <20171116114406.GB9361@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171116114406.GB9361@arm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Andi Kleen <ak@linux.intel.com>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Alex Matveev <alxmtvv@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>

On Thu, Nov 16, 2017 at 11:44:06AM +0000, Will Deacon wrote:
> Right, and this would also mean that we silently load vulnerable
> modules that are linked with either LD that doesn't support
> --fix-cortex-a53-843419 or simply wasn't passed.

You'll see a warning at least if the linker doesn't support the flag,
but yes, you're correct. In v1 of this patch set, LTO depended on this
erratum not being selected, but I changed it in v2 based on Ard's
suggestion.

I'm fine with not being able to use LTO on devices that are affected
by this erratum, so either option works for me. I can even change
this so the user must explicitly disable the erratum in order to use
LTO. Thoughts?

Sami
