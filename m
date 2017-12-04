Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:45876 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751754AbdLDReF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Dec 2017 12:34:05 -0500
Received: by mail-lf0-f65.google.com with SMTP id f13so20039088lff.12
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Dec 2017 09:34:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171116225434.691af6cf@delmar.localdomain>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-12-samitolvanen@google.com> <20171116115433.GG9361@arm.com>
 <20171116130742.wijnukjetoupi4hc@yury-thinkpad> <c0c19191-e090-4768-3c46-b813713d2908@arm.com>
 <20171116212920.wixsxoccznyef4aq@yury-thinkpad> <20171116225434.691af6cf@delmar.localdomain>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 4 Dec 2017 09:34:02 -0800
Message-ID: <CAKwvOd=c1cWS+2Lq27DXhy3hs1WvXLcSF3zMRszoGamXTtsnfA@mail.gmail.com>
Subject: Re: [PATCH v2 11/18] arm64: make mrs_s and msr_s macros work with LTO
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>
Cc: Yury Norov <ynorov@caviumnetworks.com>, Robin Murphy <robin.murphy@arm.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Andi Kleen <ak@linux.intel.com>, Kees Cook <keescook@chromium.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Sami Tolvanen <samitolvanen@google.com>, Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>

On Thu, Nov 16, 2017 at 2:54 PM, Alex Matveev <alxmtvv@gmail.com> wrote:
> On Fri, 17 Nov 2017 00:29:20 +0300
> Yury Norov <ynorov@caviumnetworks.com> wrote:
>
>> On Thu, Nov 16, 2017 at 01:55:31PM +0000, Robin Murphy wrote:
>> > Given that this whole mrs_s infrastructure is a workaround for older
>> > assemblers which don't support the "S<op0>_<op1>_<Cn>_<Cm>_<op2>"
>> > syntax for arbitrary unnamed system registers (which IIRC was a
>> > fairly late addition to the architecture), the only way it could be
>> > "fixed" on the toolchain side is by removing all those older
>> > toolchains from existence. Good luck with that ;)
> commit 72c583951526
> Author: Catalin Marinas <catalin.marinas@arm.com>
> Date:   Thu Jul 24 14:14:42 2014 +0100
>
>     arm64: gicv3: Allow GICv3 compilation with older binutils
>
>     GICv3 introduces new system registers accessible with the full
>     msr/mrs syntax (e.g. mrs x0, Sop0_op1_CRm_CRn_op2). However, only
>     recent binutils understand the new syntax. This patch introduces
>     msr_s/mrs_s assembly macros which generate the equivalent
>     instructions above and converts the existing GICv3 code (both
>     drivers/irqchip/ and arch/arm64/kernel/).
>
> The question is - is it OK to drop compatibility with old versions of
> binutils (which were already "older" back in 2014)? It's not my call to
> make. If yes, then it should be possible to make this change more
> aesthetic by reverting to "S<op>" (however, it will affect more places
> as now some users of register definitions expect them to be numbers, not
> "S<op>" strings).

I don't think we found a resolution to the compatibility question
posed.  Given that the affected file is only in use for arm64, I think
the arm64 maintainers should make the call.  I encourage them to drop
support for old toolchains; the use of ld-version macros can help warn
users using old toolchains on newer kernel versions.
