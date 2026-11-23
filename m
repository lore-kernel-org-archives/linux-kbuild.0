Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452828;
	b=fsRez3F8xUO/KMng0h1Es4Pe9wLPLmxXwEoF8EWQ67nE4LOAX5huwyz0w8G9RljTS8eN
	 ENDYTOoXGb5qXf1ppcohMeOPnysRNOwfDnnxOmO8ZPI2eezvScV7P5Lq5ePLc+q+rqtYs
	 CL/rRLJ/P/0sD9MqSEzJ6qISyyeIEV/oum/YpDN1XnRt6zlHmkYGfV+nAPvdvr1Kdd0mP
	 EDS4TLqCSlnULCMz4JDi3PyZ22GK6uwn4j8Dphz8mn4MHhzMIWF09A7YtsnRQ6WPMoRvl
	 IXZkWPhCYrcdj2l3gKYj3f+Cs1HibiyvRWiTPQPrWfUDqX44nF5cPLV4UV3guU2o1Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452828;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=HPv8LvXts+euY0KV0U6e4nJCYlvsoxCBfrj0/hwpm38=;
	b=pUvJkngFGF72PXG1XbqOyxHVnTFejmnSlesfN5ot2IV2DhtRfPXiBTjd548WWl+Ccffx
	 T5eQccl1UT+LFeJ8/G1qL97aO9Q0cvsnI2UYgoLgMMMuGdeqjfpc4jFWqblkqGjU87KhJ
	 Wf3W3+LclyMQXA5fQDdARJnAx0sIZMgI4Y2SZMHzlVDlPuI0jHFMWnlR5q/uPnCs3nKKN
	 sS4LnQV3n8fXxC8iyFPl0KsgjsM7DA0ENQZSCQOCKnYNlDW8s9f3nQijso+Wjo2LIS7H4
	 1H4yXcLdx9R4dbxloKKKyLXCjJuLNETvlxitFt7eeZH9RcUad8EzdsT8klUwQAOHZAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dZuLWmsJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id F1B00606A31F;
	Mon, 23 Nov 2026 16:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dZuLWmsJ
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 000A61F000C4;
	Mon, 23 Nov 2026 16:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795452827;
	bh=HPv8LvXts+euY0KV0U6e4nJCYlvsoxCBfrj0/hwpm38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dZuLWmsJ4Ur8+E/0/lYf4+1Y0Fio9wr7Y5cy4BK0DtngtdZuj8tLFRAEL99mYg3sQ
	 1mtOwBFLJnU3pqD/HaAjnhVsWmXaoeU2hSH5tp2f9uSihyIuMKFgUwZLS0n8MtM5sj
	 iRA8VN4Mf3E652QB2NKzdcmSIcFPpJGXvVSTmHVvQNLkrYcn7YRCVlZLoCB8ZoPmYB
	 4Vea51Q3IOPXYqM3xjv9cOdDrrmhMjY2U6ytGVZfFYpyA+kzJGGPvfhs3XyuDeln0U
	 7e62tgio9UpJV5ht6VDMIHIwE1fyIoUFPfbBTnyHEch81bvPNg9CzcRfTJhR3cOuYd
	 hIgSEQ86QPVEg==
Date: Mon, 23 Nov 2026 17:52:35 +0100
From: Nicolas Schier <nsc@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Vincent Mailhol <mailhol@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 3/3] kbuild: move scripts/mod target out of single-build
Message-ID: <awRvU8_wAUlkd1Nj@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	sashiko-reviews@lists.linux.dev,
	Vincent Mailhol <mailhol@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org
References: <20261111-reduce-single-build-dependencies-v1-0-7196ca986a85@kernel.org>
 <20261111-reduce-single-build-dependencies-v1-3-7196ca986a85@kernel.org>
 <sashiko-outbox-211218@kernel.org>
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
In-Reply-To: <sashiko-outbox-211218@kernel.org>

On Thu, Nov 12, 2026 at 01:45:43PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] kbuild: unordered modpost_prepare and stack_protector_prepare
>   mutates CFLAGS
> --
> 
> commit 08ffc13380249741520c2ea434688d701b5d0e9b
> Author: Vincent Mailhol <mailhol@kernel.org>
> 
> kbuild: move scripts/mod target out of single-build
> 
> This commit moves the scripts/mod build out of prepare0 into a new
> modpost_prepare target depended on by modules_prepare and modpost.
> 
> > diff --git a/Makefile b/Makefile
> > index 2c1289a44c560..93236f310f080 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1405,7 +1405,7 @@ scripts: scripts_basic scripts_dtc
> >  # archprepare is used in arch Makefiles and when processed asm symlink,
> >  # version.h and scripts_basic is processed / created.
> >  
> > -PHONY += prepare archprepare
> > +PHONY += prepare archprepare modpost_prepare
> >  
> >  archprepare: outputmakefile archheaders archscripts scripts include/config/kernel.release \
> >  	asm-generic $(version_h) include/generated/utsrelease.h \
> > @@ -1414,6 +1414,8 @@ archprepare: outputmakefile archheaders archscripts scripts include/config/kerne
> >  
> >  prepare0: archprepare
> >  	$(Q)$(MAKE) $(build)=. prepare $(if $(single-build),,prepare_checks)
> > +
> > +modpost_prepare: archprepare
> >  	$(Q)$(MAKE) $(build)=scripts/mod
> 
> [Severity: Low]
> Should modpost_prepare be ordered relative to stack_protector_prepare (or
> depend on prepare)?
> 
> On arm, arm64, powerpc, and riscv, prepare depends on
> stack_protector_prepare, which depends on prepare0 and mutates the
> exported KBUILD_CFLAGS variable at recipe execution time:
> 
> arch/arm64/Makefile:
> prepare: stack_protector_prepare
> stack_protector_prepare: prepare0
> 	$(eval KBUILD_CFLAGS += -mstack-protector-guard=sysreg		  \
> 				-mstack-protector-guard-reg=sp_el0	  \
> 				-mstack-protector-guard-offset=$(shell	  \
> 			awk '{if ($$2 == "TSK_STACK_CANARY") print $$3;}' \
> 				$(objtree)/include/generated/asm-offsets.h))
> 
> Previously, scripts/mod was built inside prepare0, so it always ran before
> stack_protector_prepare modified KBUILD_CFLAGS.  With modpost_prepare
> only depending on archprepare, a parallel build runs modpost_prepare
> concurrently with prepare0 before stack_protector_prepare updates
> KBUILD_CFLAGS, whereas a serial build or make modules_prepare runs
> prepare first and passes the updated KBUILD_CFLAGS to scripts/mod.
> 
> Because scripts/mod/empty.o is compiled with KBUILD_CFLAGS, switching
> between parallel and serial or single-module builds changes its recorded
> command line, rebuilding empty.o, regenerating elfconfig.h (which uses
> if_changed), and forcing a full rebuild of modpost.

Well yes,

   make scripts/mod/empty.o && make modules

leads to a rebuild of empty.o and modpost triggered by 'make modules'.
But if that is the only negative implication, this is not relevant as I
expect no human wants to build scripts/mod/empty.o as a single-target.

-- 
Nicolas
