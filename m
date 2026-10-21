Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602337;
	b=0DDHQAmowadcgorZ0Tdtlt98u2Fz5pRmkOcz/PYJQLL5d9QvJ3c2cqA8un2MmnK+eQR5
	 NtLbKlV5qyDQwUPHxDnXv1C8O8h6qiH9T2CPtw+f0GOJGm/p6goXCgTEMaJr2D0ys4iQo
	 4FRWZfKQz441NZ9b5l0h/H8jYT4oIdPAi/YXRhAu6DH0YGz3n1g4TxwpEXlPHqlF2Zwf5
	 BHWbq/wY5oe402zyU9NLVNJLoguhI1k05E2skIKM+0aRoZvIT0eJSCQZYGo/R4nXZbmXe
	 DhpjomoUCwriAIWngJ2DAnx6iD3DdwsKnFZ6dvUBa2SqpOeW5hvIAzbbxfg4eUwy5cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602337;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=n+YWv7xZ7J9tyfHX++8+DJOzvKfr58u47Kn7e/X4NnU=;
	b=0DYObd4NlwUoPH1nFP+3MTZyUvd6qfwnf4EXtkpkh7N2wGTSta2YQqdlDdqekvcOmb4F
	 H2/CMZkHdJOmAMPu03DCng3g4AUwrEwJ0CgMnQjjHWNKbgovH5DYHHoy/SeKkoXj6mH5q
	 vbcIipVtN6HlnXt/Br0yCdc/b7GCrWK7ayAyXizt5xss4kc3/Ut2T8MzHUCyCjQxWfPDk
	 YXUbvpxTAzqb+4HuBpyjQt3Gw7B3lXQIPJKhRJvX7zIIPQf72QBgYT3C8SqUQPtWGpyYW
	 BeTdB7T7guCGph4qMm5CGribCckWXSvGozKXNqbY2eiVUWxyJ6LgXYl0jvPHlLC9r6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="j47k/oeT";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 6AC45606A326;
	Wed, 21 Oct 2026 17:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j47k/oeT
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 753251F000C2;
	Wed, 21 Oct 2026 17:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792602337;
	bh=n+YWv7xZ7J9tyfHX++8+DJOzvKfr58u47Kn7e/X4NnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j47k/oeTrRo13g6+lIsF04cG8cCPtMbFgKw44mFNssh1bWdPxz1otkTCWVLFPRF9z
	 oVt499Ca+454AD8UZ6nndWUoiV57qmndnwoSK3HdwS727x9qdOniZo+Y5sbKXTWKir
	 F0w2VPUxmIkfRnDaHDDxe1951EQmgefj3LZDWn2XqZHc4bQnAZLiJl+eu+UB+aoNGm
	 X/WJCYXJo/chj4ssaMNY8Y4schGlQiIvm4sDUJWb6+R1oVEAAScLtx+jo00ILHCM1M
	 mJeLI6Fg0lPJO67ZrLF/ZPLzPf/4w74w83A1APMdg0DJkqwAHyCCoHIBqvFQ17Rak8
	 fGtMbPW7oKCBA==
Date: Wed, 21 Oct 2026 19:04:33 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Mathias Krause <minipli@grsecurity.net>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: prevent building single targets twice
Message-ID: <atjwobCk-mdeIlkd@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Mathias Krause <minipli@grsecurity.net>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20260923123936.2227924-1-minipli@grsecurity.net>
 <5836ab69-cfa6-41cc-a28b-5bd3ecfaea03@grsecurity.net>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5836ab69-cfa6-41cc-a28b-5bd3ecfaea03@grsecurity.net>

On Wed, Oct 21, 2026 at 08:53:56AM +0200, Mathias Krause wrote:
> On 23.09.26 14:39, Mathias Krause wrote:
> > When building individual targets via 'make path/to/target.o', target.o
> > may be build multiple times concurrently, leading to build errors like
> > below:
> > 
> > $ make O=~/O/vanilla-7.1/ -j$(nproc) arch/x86/pci/intel_mid.o
> > make[1]: Entering directory '/scratch/minipli/obj/vanilla-7.1'
> >   DESCEND objtool
> >   DESCEND bpf/resolve_btfids
> >   CC      arch/x86/pci/intel_mid.o
> >   CC      arch/x86/pci/intel_mid.o
> > fixdep: error opening file: arch/x86/pci/.intel_mid.o.d: No such file or directory
> > make[4]: *** [/scratch/minipli/src/linux/scripts/Makefile.build:290: arch/x86/pci/intel_mid.o] Error 2
> > make[4]: *** Deleting file 'arch/x86/pci/intel_mid.o'
> > make[3]: *** [/scratch/minipli/src/linux/scripts/Makefile.build:551: arch/x86] Error 2
> > make[3]: *** Waiting for unfinished jobs....
> > make[2]: *** [/scratch/minipli/src/linux/Makefile:2229: .] Error 2
> > make[1]: *** [/scratch/minipli/src/linux/Makefile:248: __sub-make] Error 2
> > make[1]: Leaving directory '/scratch/minipli/obj/vanilla-7.1'
> > make: *** [Makefile:248: __sub-make] Error 2
> > 
> > Please note that arch/x86/pci/intel_mid.o gets output twice and, in
> > fact, tried to get built twice, causing the two parallel builds to
> > interfere with each other.
> > 
> > The reason for the double build attempt is that the target can be
> > reached twice, via arch/x86/'s Makefile and via arch/x86/pci/'s which
> > both end up in '$(single-subdirs)' as both fit the prefix match.
> > 
> > Only the latter should be used as it contains a cflags override for
> > CONFIG_PCI_DEBUG=y which would be skipped when using arch/x86/Makefile
> > to build arch/x86/pci/intel_mid.o.
> > 
> > Fix the multi-match issue by using only the deepest match instead of all
> > possible ones, which requires two changes:
> > 1. Limiting 'single-subdirs' to a single match per target and
> > 2. filtering out deeper targets in the recursive make invocation.
> > 
> > Also de-duplicate the list of target subdirectories to simplify the
> > use of '$(single-subdirs)' in filter expressions for multiple targets in
> > the same directory.
> > 
> > Fixes: cc306abd19e8 ("kbuild: fix and refactor single target build")
> > Assisted-by: LLM
> > Signed-off-by: Mathias Krause <minipli@grsecurity.net>
> > ---
> > I ran into this quite a few times in the past and only now gave the LLM
> > a try to dig into it. The bug only affects certain targets and only when
> > mentioned on the command line, so regular 'make -j$(nproc)' isn't
> > affected.
> > 
> >  scripts/Makefile.build | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index 0f4fdc119e58..d5f58513d02a 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -534,7 +534,10 @@ endif
> >  # Single targets
> >  # ---------------------------------------------------------------------------
> >  
> > -single-subdirs := $(foreach d, $(subdir-ym), $(if $(filter $d/%, $(MAKECMDGOALS)), $d))
> > +# A single target may match nested entries in subdir-ym.  Descend through only
> > +# the deepest match so that two recursive makes do not build the same target.
> > +single-subdir = $(lastword $(sort $(foreach d, $(subdir-ym), $(if $(filter $d/%, $(1)), $d))))
> > +single-subdirs := $(sort $(foreach g, $(MAKECMDGOALS), $(call single-subdir, $g)))
> >  single-subdir-goals := $(filter $(addsuffix /%, $(single-subdirs)), $(MAKECMDGOALS))
> >  
> >  $(single-subdir-goals): $(single-subdirs)
> > @@ -548,7 +551,8 @@ $(subdir-ym):
> >  	$(Q)$(MAKE) $(build)=$@ \
> >  	need-builtin=$(if $(filter $@/built-in.a, $(subdir-builtin)),1) \
> >  	need-modorder=$(if $(filter $@/modules.order, $(subdir-modorder)),1) \
> > -	$(filter $@/%, $(single-subdir-goals))
> > +	$(filter-out $(addsuffix /%, $(filter $@/%, $(single-subdirs))), \
> > +		$(filter $@/%, $(single-subdir-goals)))
> >  
> >  # Add FORCE to the prerequisites of a target to force it to be always rebuilt.
> >  # ---------------------------------------------------------------------------
> 
> Ping! I know, it's the merge window but this patch may have fallen
> through the cracks as there was no response so far. Just trying to take
> care it doesn't get lost.

thanks for the ping.  The patch is in my review queue for the upcoming
cycle.

-- 
Nicolas
