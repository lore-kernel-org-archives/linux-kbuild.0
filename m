Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:47442 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728193AbfBAPLu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Feb 2019 10:11:50 -0500
Date: Fri, 1 Feb 2019 16:11:39 +0100
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] kbuild: Disable extra debugging info in .s output
Message-ID: <20190201151139.GK31854@zn.tnic>
References: <20190121095338.8565-1-bp@alien8.de>
 <20190131115820.GF6749@zn.tnic>
 <CAK7LNATGUs0PPssA=WfHojEEPuztDcNHf0NdH6ohOdf8k8PZOQ@mail.gmail.com>
 <20190201094217.GB31854@zn.tnic>
 <CAK7LNARPq7Bj+zp7bYyH_uPOyJ9a1-hD-aSq6GDLb8YdqbA-+A@mail.gmail.com>
 <20190201103038.GE31854@zn.tnic>
 <20190201103648.GF31854@zn.tnic>
 <CAK7LNAQ4juLxrdMoPumQQ-96fMorf+wfAqkNxq1X1k=0i_R4vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAQ4juLxrdMoPumQQ-96fMorf+wfAqkNxq1X1k=0i_R4vQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Fri, Feb 01, 2019 at 08:58:13PM +0900, Masahiro Yamada wrote:
> Variables assigned with ':=' are evaluated just on parsing Makefile.
> 
> The scripts/Makefile.build is parsed over and over again,
> so the compiler is invoked hundreds times to test these four options
> even when you are not actually building any new objects.
> 
> It is mitigated by replacing ':=' with '=',
> but they are still evaluated multiple times when generating asm-offset.

Now that you mention it, how about ?=

disable_extra_cc_dbg ?= $(call cc-option,-gno-as-locview-support)
disable_extra_cc_dbg += $(call cc-option,-fno-dwarf2-cfi-asm)
disable_extra_cc_dbg += $(call cc-option,-feliminate-unused-debug-symbols)
disable_extra_cc_dbg += $(call cc-option,-gno-statement-frontiers)

With it, the slowdown of the incremental build is ~0.2s (on an old laptop):

defconfig without:	9.6128 +- 0.0327 seconds time elapsed  ( +-  0.34% )

vs

defconfig with:		9.8483 +- 0.0273 seconds time elapsed  ( +-  0.28% )


-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
