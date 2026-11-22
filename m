Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795331472;
	b=Gp9yNxgI/VUIU1hL/ST5sFGTvf6rFe/fnPVs2kOeuWhKPPsmoxqpyhgot4fQr5QX5ASf
	 EwVf2TRlpyy89HHaWfZwzI5J9uy/aWxbuLxpV7B7Q18rUQSukqHYYS9Wp9ABQKgbxHm8a
	 TpfH2Rm30/kaXeoP3A6yas36DfCfFAV2N0f5+CjALpK+tTDQb8HrIGv0iCu2azYl1exTA
	 v0cYUCh/eLqkqaJFAhnP6csst1UNosPymgHs4O7ULSNe0+s1tFkTbVHH/OYvOwI0BMelu
	 mJi3H5rkEiGZuCIwv2vSY5uYObQfryE9axcOFsGbGjnbFlOHSkuMdw1PlMM1rfK1+xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795331472;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WGVXuX8FpbA5+VqRa+nez2mFJUcC/jKPxLrKVutuuMg=;
	b=y6ylO2Q9HTy/z7CtymdtRaYAgpPbSCXlYzzpe8mVTPveq9/mtbiZFfO0RKjdEd9Cc88t
	 7yAGttfP3BwRWg5s3E0Mq1RbZZkpZGLUE1OVm++/A3RTnRN07CDb56LGbjpTMmv9S2TbD
	 6pVxx1ri9RanrPndXs4AZCo/TsdFPPHjotVtFWwF1cCpN39Q+rUjhK4aBfIaJ20h3z5ho
	 msWesdfdPiFKIA4i1yOeKY52Q4tWplms4lk8fBSAOXwcZOaAixpTAtsVTTmoUsAygsDB4
	 Im2+qAF/+pODnjPukXL6G5mREaFEpq5sr+8ycsCk6lqAyRVNZGUWL9ahZVp/x0DPxOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MioN923+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BDF606A331
	for <linux-kbuild@vger.kernel.org>; Sun, 22 Nov 2026 07:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MioN923+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879C01F000C0;
	Sun, 22 Nov 2026 07:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795331471;
	bh=WGVXuX8FpbA5+VqRa+nez2mFJUcC/jKPxLrKVutuuMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MioN923+GadIW5QIn4JrPKIfwPs9lQyfPF7CYMFZ2MAHGe3860TCY2aEMzlDl9wOd
	 zSdHM4JJ9pMtVQ32BKiT+uGoYrVfmnf0S6XVEYnXnOBL5pS/rbfywb3nJfNhguXJmf
	 TOBZsFOdTfk0bLzlu9Sdyt40dLO290EbV5RYgrFEhjnPDaIo8021Ht6aBC8QRtMdhL
	 mu/YeSBo6O9pnJZeM73K68B5TKpj2WLG1rap1ym8bLZA5hdMmU10fHtOHa5Btsy7J7
	 fPgFngXAmFAVrltCSkmi6HzhZhqRzQD+S1o7GqG3ocbPMy8WaJ6FnnRuZMnja32cJc
	 cuvt2X5j3xaTg==
Date: Sat, 21 Nov 2026 23:11:10 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: arnold@skeeve.com
Cc: peterz@infradead.org, nathan@kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: Use of `gawk -M' in kernel build scripts
Message-ID: <awKVHTlHymhuIca2@jpoimboe>
References: <E1xDQvK-00000000Kvi-2PZ4@gleep.local>
 <20261005085332.GA2094974@ax162>
 <20261013091920.GW4121339@noisy.programming.kicks-ass.net>
 <202610131441.69DEfUAv037813@freefriends.org>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202610131441.69DEfUAv037813@freefriends.org>

On Tue, Oct 13, 2026 at 08:41:30AM -0600, arnold@skeeve.com wrote:
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > On Mon, Oct 05, 2026 at 10:53:32AM +0200, Nathan Chancellor wrote:
> > > Hi Aharon,
> > > 
> > > On Sun, Oct 04, 2026 at 09:26:58PM +0300, Aharon Robbins wrote:
> > > > I'm the maintainer for gawk. I see that it's used in the kernel build
> > > > scripts in combination with objdump.
> > > 
> > > For the record, the only place where I see '-M' used with gawk is in
> > > scripts/objdump-func, which is not called during the kernel build
> > > thankfully.
> > > 
> > > > In particular, I note that gawk is invoked with the -M option, which
> > > > uses MPFR for arithmetic (although the precision isn't changed beyond
> > > > the default which is the same as for IEEE hardware floating point).
> > > > 
> > > > I am wondering if the -M option is really needed here?  The reason I
> > > > ask is that I plan to deprecate MPFR support. The upcoming 6.0 release
> > > > (I hope in Q2 2027) will issue a deprecation warning when -M is used,
> > > > and 6.1 (late 2027 or early 2028, I hope) will have MPFR support removed
> > > > entirely.
> > > > 
> > > > So, I wanted to give you folks a heads-up. If -M isn't needed, now's a good
> > > > time to remove its use from the kernel build.
> > > 
> > > Adding Josh and Peter for the rest of this since they have
> > > added/supported this script.
> >
> > I'm not sure; Josh added that when he did the upstream version. My
> > initial version very much does not have that -M on. Josh?
> 
> Thanks Peter.  Josh, looking forward to hearing from you.

IIRC, I added the -M for doing 64-bit arithmetic, but really only the
lower 32-bits are needed for computing function offsets, so yeah, I'll
fix that up.

-- 
Josh
