Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:49844 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751152AbdKPLn6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 06:43:58 -0500
Date: Thu, 16 Nov 2017 11:44:06 +0000
From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v2 08/18] arm64: don't disable ADR_PREL_PG_HI21* with
 ARM64_ERRATUM_843419
Message-ID: <20171116114406.GB9361@arm.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-9-samitolvanen@google.com>
 <CAKv+Gu-wYwBMV7tdb+Kax_cyPsmAB2R2ZVwJuNi9qM0kaYAs=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu-wYwBMV7tdb+Kax_cyPsmAB2R2ZVwJuNi9qM0kaYAs=Q@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Mark Rutland <mark.rutland@arm.com>, Andi Kleen <ak@linux.intel.com>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Hackmann <ghackmann@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Alex Matveev <alxmtvv@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>

On Wed, Nov 15, 2017 at 10:29:12PM +0000, Ard Biesheuvel wrote:
> On 15 November 2017 at 21:34, Sami Tolvanen <samitolvanen@google.com> wrote:
> > CONFIG_LTO_CLANG depends on GNU gold, which can generate ADR_PREL_PG_HI21*
> > relocations even with --fix-cortex-a53-843419.
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > ---
> >  arch/arm64/kernel/module.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> > index f469e0435903..fec9a578f122 100644
> > --- a/arch/arm64/kernel/module.c
> > +++ b/arch/arm64/kernel/module.c
> > @@ -336,14 +336,12 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
> >                         ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 0, 21,
> >                                              AARCH64_INSN_IMM_ADR);
> >                         break;
> > -#ifndef CONFIG_ARM64_ERRATUM_843419
> >                 case R_AARCH64_ADR_PREL_PG_HI21_NC:
> >                         overflow_check = false;
> >                 case R_AARCH64_ADR_PREL_PG_HI21:
> >                         ovf = reloc_insn_imm(RELOC_OP_PAGE, loc, val, 12, 21,
> >                                              AARCH64_INSN_IMM_ADR);
> >                         break;
> > -#endif
> >                 case R_AARCH64_ADD_ABS_LO12_NC:
> >                 case R_AARCH64_LDST8_ABS_LO12_NC:
> >                         overflow_check = false;
> > --
> > 2.15.0.448.gf294e3d99a-goog
> >
> 
> I think this change is reasonable in itself, but i do wonder how we
> can ensure that the adrp instructions that GNU gold does generate are
> not affected by the erratum, given that modules are partially linked
> object files, not shared libraries.

Right, and this would also mean that we silently load vulnerable modules
that are linked with either LD that doesn't support --fix-cortex-a53-843419
or simply wasn't passed.

Will
