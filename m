Received: from freefriends.org (frenzy.freefriends.org [198.99.81.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0786A3D75AA
	for <linux-kbuild@vger.kernel.org>; Thu,  8 Oct 2026 07:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.99.81.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791444587; cv=none; b=m6PeIY6+6UcBnMUG7hUkqdeXEkHEFVFBkhrueMC8X2gAmpdoIoKz5tFJEWkcPjzW+jyIRUnI3DPUiZm4bsyEbzy97dGDwrezkzlxFo3Gt/8WuHwyk6+2pk+FFl58zXcx3Enrbnk5IGSfWfXK6yS2anauoxmt0n6l08PEGxRt79A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791444587; c=relaxed/simple;
	bh=wbrCbcnBkvMLRpdHSFLp19vOu6ij1+YlH7Fqm0kkh64=;
	h=From:Message-Id:Date:To:Subject:Cc:References:In-Reply-To:
	 MIME-Version:Content-Type; b=Mj1pZXS5COTgRKdh1Fvp7KbIKOoX1iAp9zwEtNvh8GZ++u3rXXqOPg9TPAkOvgndGo6Hv4WpmbswXVCNEuHvc5aRQuuKn5fPbrrpUhYTjiw1Mt3ggR+stHXfjarqF/eR4708JHHpHdtC0PgM1Xb1mbq+5Iypj05tFyd61DB8z7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skeeve.com; spf=pass smtp.mailfrom=skeeve.com; arc=none smtp.client-ip=198.99.81.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skeeve.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skeeve.com
X-Envelope-From: arnold@skeeve.com
Received: from freefriends.org (localhost [127.0.0.1])
	by freefriends.org (8.16.1/8.16.1) with ESMTPS id 6987TLum032856
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 8 Oct 2026 01:29:21 -0600
Received: (from arnold@localhost)
	by freefriends.org (8.16.1/8.14.7/Submit) id 6987TKQT032852;
	Thu, 8 Oct 2026 01:29:20 -0600
From: arnold@skeeve.com
Message-Id: <202610080729.6987TKQT032852@freefriends.org>
X-Authentication-Warning: frenzy.freefriends.org: arnold set sender to arnold@skeeve.com using -f
Date: Thu, 08 Oct 2026 01:29:20 -0600
To: nathan@kernel.org, arnold@skeeve.com
Subject: Re: Use of `gawk -M' in kernel build scripts
Cc: peterz@infradead.org, linux-kbuild@vger.kernel.org, jpoimboe@kernel.org
References: <E1xDQvK-00000000Kvi-2PZ4@gleep.local>
 <20261005085332.GA2094974@ax162>
 <202610050902.69592lvj021580@freefriends.org>
In-Reply-To: <202610050902.69592lvj021580@freefriends.org>
User-Agent: Heirloom mailx 12.5 7/5/10
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Josh, Peter,

Anything to add?

Thanks,

Arnold

arnold@skeeve.com wrote:

> Hi Nathan.
>
> Thanks for the note. gawk -M is also used in a file named check.c (I didn't
> save the full path, sorry), which has the objdump-func script embedded
> in it for calling via system(3).
>
> Josh and Peter, looking forward to hearing more.
>
> Thanks,
>
> Arnold
>
> Nathan Chancellor <nathan@kernel.org> wrote:
>
> > Hi Aharon,
> >
> > On Sun, Oct 04, 2026 at 09:26:58PM +0300, Aharon Robbins wrote:
> > > I'm the maintainer for gawk. I see that it's used in the kernel build
> > > scripts in combination with objdump.
> >
> > For the record, the only place where I see '-M' used with gawk is in
> > scripts/objdump-func, which is not called during the kernel build
> > thankfully.
> >
> > > In particular, I note that gawk is invoked with the -M option, which
> > > uses MPFR for arithmetic (although the precision isn't changed beyond
> > > the default which is the same as for IEEE hardware floating point).
> > > 
> > > I am wondering if the -M option is really needed here?  The reason I
> > > ask is that I plan to deprecate MPFR support. The upcoming 6.0 release
> > > (I hope in Q2 2027) will issue a deprecation warning when -M is used,
> > > and 6.1 (late 2027 or early 2028, I hope) will have MPFR support removed
> > > entirely.
> > > 
> > > So, I wanted to give you folks a heads-up. If -M isn't needed, now's a good
> > > time to remove its use from the kernel build.
> >
> > Adding Josh and Peter for the rest of this since they have
> > added/supported this script.
> >
> > -- 
> > Cheers,
> > Nathan
