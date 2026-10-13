Received: from freefriends.org (frenzy.freefriends.org [198.99.81.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C662A5187F3
	for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2026 14:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.99.81.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902514; cv=none; b=f+yIoP7pSDXL/F4C3zHELT7/Rrsvq7JSZTaTYuYFVLUj0MLRoNGo5+v30cL8PU70Y8CqnLrPT5kkDUQ/8gCTDydAhdEZFYfp90lId1vIsTFCnW8UVc0zdgo+l7fRqelb8G5IvwV9waFo0BwziWhI0hOsbL7Y4qAEsubDPrmHnEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902514; c=relaxed/simple;
	bh=SH7yZ34xee//4UKJDovZWxBWnSHzdgEIPaVlZFrHqa8=;
	h=From:Message-Id:Date:To:Subject:Cc:References:In-Reply-To:
	 MIME-Version:Content-Type; b=qPKz2PG0Xqbcj9i7gNm4IO3qjDiscr20X59u5iTVx44um8ZZWApGh60/M2H/xMQt+pGTAqcFALxd25/wiUMf4Ou76+4Kd9z3RtxzIuBw13i0MmFV5WF+k+tl2xwWBseZEFEgWkHgQogamkaIMEIuOHP5OnQKAKTgBhyJLkMN9+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skeeve.com; spf=pass smtp.mailfrom=skeeve.com; arc=none smtp.client-ip=198.99.81.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skeeve.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skeeve.com
X-Envelope-From: arnold@skeeve.com
Received: from freefriends.org (localhost [127.0.0.1])
	by freefriends.org (8.16.1/8.16.1) with ESMTPS id 69DEfVmK037815
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 08:41:31 -0600
Received: (from arnold@localhost)
	by freefriends.org (8.16.1/8.14.7/Submit) id 69DEfUAv037813;
	Tue, 13 Oct 2026 08:41:30 -0600
From: arnold@skeeve.com
Message-Id: <202610131441.69DEfUAv037813@freefriends.org>
X-Authentication-Warning: frenzy.freefriends.org: arnold set sender to arnold@skeeve.com using -f
Date: Tue, 13 Oct 2026 08:41:30 -0600
To: peterz@infradead.org, nathan@kernel.org
Subject: Re: Use of `gawk -M' in kernel build scripts
Cc: linux-kbuild@vger.kernel.org, jpoimboe@kernel.org, arnold@skeeve.com
References: <E1xDQvK-00000000Kvi-2PZ4@gleep.local>
 <20261005085332.GA2094974@ax162>
 <20261013091920.GW4121339@noisy.programming.kicks-ass.net>
In-Reply-To: <20261013091920.GW4121339@noisy.programming.kicks-ass.net>
User-Agent: Heirloom mailx 12.5 7/5/10
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Peter Zijlstra <peterz@infradead.org> wrote:

> On Mon, Oct 05, 2026 at 10:53:32AM +0200, Nathan Chancellor wrote:
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
>
> I'm not sure; Josh added that when he did the upstream version. My
> initial version very much does not have that -M on. Josh?

Thanks Peter.  Josh, looking forward to hearing from you.

Arnold
