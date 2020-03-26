Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50987 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgCZJU0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 05:20:26 -0400
Date: Thu, 26 Mar 2020 10:20:19 +0100
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH 00/16] x86, crypto: remove always-defined CONFIG_AS_* and
 cosolidate Kconfig/Makefiles
Message-ID: <20200326092019.GA100058@gmail.com>
References: <20200324084821.29944-1-masahiroy@kernel.org>
 <20200325045940.GA24974@gmail.com>
 <CAK7LNAQvgT=OWVuBVrvgdZ7AAkoaV_K_Y+w9bOFxRPw_1TOSUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQvgT=OWVuBVrvgdZ7AAkoaV_K_Y+w9bOFxRPw_1TOSUA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, Linus Torvalds <torvalds@linux-foundation.org>, Kees Cook <keescook@chromium.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Herbert Xu <herbert@gondor.apana.org.au>, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Jim Kukunas <james.t.kukunas@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, NeilBrown <neilb@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Yuanhan Liu <yuanhan.liu@linux.intel.com>, dri-devel <dri-devel@lists.freedesktop.org>, intel-gfx@lists.freedesktop.org, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>


* Masahiro Yamada <masahiroy@kernel.org> wrote:

> > LGTM. I've got these four from Jason A. Donenfeld queued up in
> > tip:WIP.x86/asm:
> >
> >  bd5b1283e41c: ("crypto: Curve25519 - do not pollute dispatcher based on assembler")
> >  829f32d78588: ("crypto: X86 - rework configuration, based on Kconfig")
> >  95ef9f80ed63: ("x86/build: Probe assembler from Kconfig instead of Kbuild")
> >  1651e700664b: ("x86: Fix bitops.h warning with a moved cast")
> >
> > I suppose these might interact (maybe even conflict), and are topically
> > related.
> >
> > Would you like to pull these into the kbuild tree? You can find them in:
> >
> >    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/asm
> >
> > Thanks,
> >
> >         Ingo
> 
> 
> I did not know that these had already landed in tip tree.
> 
> They are immature version.
> (In fact CONFIG_AS_CFI and AS_ADX are false-negative
> if GCC that defaults to 32-bit is used.)
> 
> Can you simply discard the WIP.x86/asm branch,
> and only reapply
> 1651e700664b: ("x86: Fix bitops.h warning with a moved cast")
> 
> ?

Sure, done!

In case you need any x86 maintainer acks for your series:

  Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
