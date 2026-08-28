Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE9B377558;
	Fri, 28 Aug 2026 18:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787941196; cv=none; b=em0TXin9RRvdft5Hdg7cRLf4EoEi4DAL48hTdrEdJzb6XpPzyR93MaCb4C0z1mzsTX2mbpudpRxtSNR87KpNO4HmDjuIJhuo8+R1lTInK9S+1OtkpIIeAM4Ev2/agMHJTBVmqhZW8hISNTELIkTw6Ab4uvx866GolF7CWm9SvN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787941196; c=relaxed/simple;
	bh=Gmkm1CKKvuwG0nOx21V442fHYD2q07JwmEiVxD9s6cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+udNDOJh4hV0LulxzT2wnkzeAtuy0zSkQ2bOWFNxld4x9YrqZmsRkSKn8TIW3SKBt6O1DLZe/2CdJeLbJrXQnoLifnsc0hgNjIaTHOMuo5pZ/dxHBU2ew2/uBdm3SS8BpeGs8dl7YJnSYpqIGdKXthyRawtt8cnWEyR9O9/lFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMpISOQV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMpISOQV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C0E1F000E9;
	Fri, 28 Aug 2026 18:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787941194;
	bh=IrxB68grrNfgpTQDQloS6vgIUBD2TBdi7EM0BXy+OBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oMpISOQVcpZfl7r4F6OU32/y3INZkf86fZ/SBBbREZ4ogqwLV5mznex9B6gJOQUM9
	 P+DfwvrO6mlv8wFFr/suiRWX4kQEz4wYWN3CyuSQItbeUvZyeqpzkOoG0LSLnqB4kM
	 pgILwcsVe/3WdxL5ab5ZAQNtUgpLDl0XfBLFoxNypfD7pE+RIuwtfXLtbUhItCpIP2
	 vXznXmJFQzHYnvYGWCLqbKQUv6DgIkoNnKOgdPKJQPKC0EMJeFjPtVTxdgXGX4uug7
	 cjs+R5pq6OApqLZWSb+DM0KM8+iikMnIZXVVAzOx1SEpfFT5PGmM0I8/PTKRmyYIAW
	 bT946EzcHw/qA==
Date: Fri, 28 Aug 2026 11:19:52 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	linux-kbuild@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH 12/27] kbuild: Defer running objtool to link time for all
 CFG features
Message-ID: <apHOMecu7SAWR2zG@jpoimboe>
References: <cover.1787890035.git.jpoimboe@kernel.org>
 <1447f9f8dc6e7e02e4a8a33ce7ae92ba49d70eb3.1787890035.git.jpoimboe@kernel.org>
 <20260828175708.GA3403925@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260828175708.GA3403925@ax162>

On Fri, Aug 28, 2026 at 10:57:08AM -0700, Nathan Chancellor wrote:
> On Thu, Aug 27, 2026 at 09:51:41PM -0700, Josh Poimboeuf wrote:
> > diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> > index 9bac917e8b819..df1e3584883e6 100644
> > --- a/scripts/Makefile.vmlinux_o
> > +++ b/scripts/Makefile.vmlinux_o
> > @@ -30,20 +30,12 @@ endif
> >  # objtool for vmlinux.o
> >  # ---------------------------------------------------------------------------
> >  #
> > -# For CONFIG_OBJTOOL_DEFERRED (IBT or LTO), objtool doesn't run on individual
> > -# translation units.  Instead it runs on vmlinux.o.
> > -#
> > -# For !CONFIG_OBJTOOL_DEFERRED + CONFIG_NOINSTR_VALIDATION, it runs on both
> > -# translation units and vmlinux.o, with the latter only used for noinstr/unret
> > -# validation.
> > +# For CONFIG_OBJTOOL_DEFERRED, objtool doesn't run on individual translation
> > +# units.  Instead it runs on vmlinux.o.
> >  
> > -objtool-enabled := $(or $(CONFIG_OBJTOOL_DEFERRED),$(CONFIG_NOINSTR_VALIDATION))
> > +objtool-enabled := $(CONFIG_OBJTOOL_DEFERRED)
> >  
> > -ifeq ($(CONFIG_OBJTOOL_DEFERRED),y)
> >  vmlinux-objtool-args-y					+= $(objtool-args-y)
> > -else
> > -vmlinux-objtool-args-$(CONFIG_OBJTOOL_WERROR)		+= --werror
> 
> Did you mean to drop this line or did it accidentally get culled in
> cleaning up the conditional statements?

That was actually on purpose.

Before this patch, NOINSTR_VALIDATION was a weird special case, where
objtool ran on individual TUs (with all the objtool-args-y), and then
ran again on vmlinux.o (without objtool-args-y except for --werror).

This patch makes NOINSTR_VALIDATION just another OBJTOOL_DEFERRED
feature which runs deferred, and *not* on TUs, so now it gets all the
args like the others.

That was indeed non-obvious, I'll add it to the commit log for v2.

> > -endif
> >  
> >  vmlinux-objtool-args-$(CONFIG_NOINSTR_VALIDATION)	+= --noinstr \
> >  							   $(if $(or $(CONFIG_MITIGATION_UNRET_ENTRY),$(CONFIG_MITIGATION_SRSO)), --unret)

-- 
Josh
