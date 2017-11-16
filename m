Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f53.google.com ([74.125.83.53]:40402 "EHLO
        mail-pg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752051AbdKPVhG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 16:37:06 -0500
Received: by mail-pg0-f53.google.com with SMTP id u3so315821pgn.7
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 13:37:06 -0800 (PST)
Date: Thu, 16 Nov 2017 13:37:03 -0800
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v2 08/18] arm64: don't disable ADR_PREL_PG_HI21* with
 ARM64_ERRATUM_843419
Message-ID: <20171116213702.GA10616@samitolvanen.mtv.corp.google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-9-samitolvanen@google.com>
 <CAKv+Gu-wYwBMV7tdb+Kax_cyPsmAB2R2ZVwJuNi9qM0kaYAs=Q@mail.gmail.com>
 <20171116114406.GB9361@arm.com>
 <20171116163132.GC94341@samitolvanen.mtv.corp.google.com>
 <CAKv+Gu8yPSwZep-S_ke_P5BiZ3o72R=ykhixoXcyGUHa1ZxGGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu8yPSwZep-S_ke_P5BiZ3o72R=ykhixoXcyGUHa1ZxGGw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Andi Kleen <ak@linux.intel.com>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Alex Matveev <alxmtvv@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>

On Thu, Nov 16, 2017 at 04:34:03PM +0000, Ard Biesheuvel wrote:
> You still have not explained to us how GOLD avoids the erratum.

Sorry, I didn't realize you were asking that. If gold spots erratum
sequences, looks like it creates stubs to break them up:

  https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gold/aarch64.cc#l8396

It also attempts to optimize the code by replacing adrps in these
sequences with adr where possible, but otherwise doesn't appear to
touch them:

  https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gold/aarch64.cc#l2053

Sami
