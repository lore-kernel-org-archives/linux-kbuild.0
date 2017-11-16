Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:41566 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750741AbdKPXuY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 18:50:24 -0500
Received: by mail-io0-f194.google.com with SMTP id g73so7021917ioj.8
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 15:50:24 -0800 (PST)
Date: Thu, 16 Nov 2017 15:50:19 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v2 08/18] arm64: don't disable ADR_PREL_PG_HI21* with
 ARM64_ERRATUM_843419
Message-ID: <20171116235019.GA55530@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-9-samitolvanen@google.com>
 <CAKv+Gu-wYwBMV7tdb+Kax_cyPsmAB2R2ZVwJuNi9qM0kaYAs=Q@mail.gmail.com>
 <20171116114406.GB9361@arm.com>
 <20171116163132.GC94341@samitolvanen.mtv.corp.google.com>
 <CAKv+Gu8yPSwZep-S_ke_P5BiZ3o72R=ykhixoXcyGUHa1ZxGGw@mail.gmail.com>
 <20171116213702.GA10616@samitolvanen.mtv.corp.google.com>
 <CAKv+Gu_3R4SUC2hCUtEX_4ut9admtrBZS-S-mzQnQsoJoHPcBw@mail.gmail.com>
 <20171116230939.GA38360@samitolvanen.mtv.corp.google.com>
 <CAKv+Gu9pROJ_T5twJtVn2itzav4x5fypyJWsBr5YbjWUTMFokg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu9pROJ_T5twJtVn2itzav4x5fypyJWsBr5YbjWUTMFokg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Andi Kleen <ak@linux.intel.com>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Alex Matveev <alxmtvv@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>

On Thu, Nov 16, 2017 at 11:20:40PM +0000, Ard Biesheuvel wrote:
> So at which point is the IR in a partially linked object file
> converted into executable code?

At the final module link step (cmd_ld_ko_o) in scripts/Makefile.modpost,
added in patch 12.

Sami
