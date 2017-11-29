Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:45946 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752083AbdK2XaN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Nov 2017 18:30:13 -0500
Received: by mail-io0-f195.google.com with SMTP id e204so5547545iof.12
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2017 15:30:13 -0800 (PST)
Date: Wed, 29 Nov 2017 15:30:08 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [v2,12/18] kbuild: add support for clang LTO
Message-ID: <20171129233008.GB138088@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-13-samitolvanen@google.com>
 <20171118132139.58ac5e4c@roar.ozlabs.ibm.com>
 <20171120202152.GA89108@samitolvanen.mtv.corp.google.com>
 <20171121110152.23fb751a@roar.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171121110152.23fb751a@roar.ozlabs.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Tue, Nov 21, 2017 at 11:01:52AM +1000, Nicholas Piggin wrote:
> I just wonder are you doing this because there is some worthwhile
> performance gain? Or to enable more testing and development of LTO?
> Any clues for why a user would want to enable it.

I'm primarily interested in CFI, which with clang requires LTO; not
for the optimizations, but for source visibility. We do expect to see
performance improvements with LTO though, especially if combined with
PGO.

> Thanks, if you could. Possibly file a request with LLVMgold too, it
> seems to be that toolchain support for archives is quite strong, so it
> will be good to keep pushing for that.

It turns out LLVMgold is fine with mixed IR/object archives, but we need
to use llvm-ar to generate symbol tables for them, and there are some
compatibility issues with objdump that I had to work around. I'll send
v3 for review once I receive some feedback for the clang/gold patches we
need first.

Sami
