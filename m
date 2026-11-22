Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.99.81.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795347591;
	b=KqwlCVgS/FuRpJIdC2T6PRHZ1jTkO8dbGRu1qqirh9QWdyOdhZczFmJHuT+ie8qcgkHM
	 K8Iv2zfbrX54Ewa5G6TTsaZQo1yqJ34rLGdvvRK88gKZ4RuVjQ0GyjWGBHsNcKIYfEU8C
	 x3ud58yL/xy+tIhUjsC6TpGTU+TGEYQGKzGt3UOksRVHaWPo2AzckJCAz1AG+7A48CVvQ
	 +OhiIeGJ/tBpNd5eSWHdjszwlILfS8qmo00agqD0IaTSArIX0hbfFrpRW53Y3cfACAGke
	 0ATxbzY4iGAuAOkb2FUmZxMK1YJW6+0HfX7POg2McC5JtpZPF7t0jdiXd+iq0LtDdmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347591;
	h=DMARC-Filter:X-Envelope-From:Received:Received:From:Message-Id:
	 X-Authentication-Warning:Date:To:Subject:Cc:References:In-Reply-To:
	 User-Agent:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rv1/yi0daMGTYd696JEdRAbi2+zLKoqfeJrSxX15au0=;
	b=S1Jd7fAaRZYnNPdQa9PH+MdTZeE2QTq/Dhn/BawnHDzz3cuDA04FaQv+A+i+WuKNta7R
	 xtPsNkZ59vCJykPHPWSDCh1J8UtT6ARoaxLYRiaPTH8NiElk9pIYTdFsDARiY+isdvwri
	 Iq6r8MhxVmL75eyIdyyOrrZViq3k2NPpCsKN5mIshdjxNpsYSmhKFWWTvgO45WGOVqXLE
	 kRlarFeKQpiYctD8tJRY0IDncHNWGu3KqQfS7FBHVUgqGYdYLE+HvsJJi9pCSj/X6UrYD
	 aHjdFWrjs8xtUNqzKCV0dYPUUUfL0xZx0gF3CNRnAIFp6EzAdrYtAXkau9ym+uKcoow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=skeeve.com;
	spf=pass smtp.mailfrom=skeeve.com;
	arc=none smtp.remote-ip=198.99.81.75
Received: from freefriends.org (frenzy.freefriends.org [198.99.81.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8407606A320
	for <linux-kbuild@vger.kernel.org>; Sun, 22 Nov 2026 11:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8407606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skeeve.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skeeve.com
X-Envelope-From: arnold@skeeve.com
Received: from freefriends.org (localhost [127.0.0.1])
	by freefriends.org (8.16.1/8.16.1) with ESMTPS id 6AMBdOTi174183
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 22 Nov 2026 04:39:24 -0700
Received: (from arnold@localhost)
	by freefriends.org (8.16.1/8.14.7/Submit) id 6AMBdM7W174182;
	Sun, 22 Nov 2026 04:39:22 -0700
From: arnold@skeeve.com
Message-Id: <202611221139.6AMBdM7W174182@freefriends.org>
X-Authentication-Warning: frenzy.freefriends.org: arnold set sender to arnold@skeeve.com using -f
Date: Sun, 22 Nov 2026 04:39:22 -0700
To: jpoimboe@kernel.org, arnold@skeeve.com
Subject: Re: Use of `gawk -M' in kernel build scripts
Cc: peterz@infradead.org, nathan@kernel.org, linux-kbuild@vger.kernel.org
References: <E1xDQvK-00000000Kvi-2PZ4@gleep.local>
 <20261005085332.GA2094974@ax162>
 <20261013091920.GW4121339@noisy.programming.kicks-ass.net>
 <202610131441.69DEfUAv037813@freefriends.org>
 <awKVHTlHymhuIca2@jpoimboe>
In-Reply-To: <awKVHTlHymhuIca2@jpoimboe>
User-Agent: Heirloom mailx 12.5 7/5/10
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
Content-Transfer-Encoding: 7bit

Hi Josh.

Below.

Josh Poimboeuf <jpoimboe@kernel.org> wrote:

> On Tue, Oct 13, 2026 at 08:41:30AM -0600, arnold@skeeve.com wrote:
> > Peter Zijlstra <peterz@infradead.org> wrote:
> > 
> > > On Mon, Oct 05, 2026 at 10:53:32AM +0200, Nathan Chancellor wrote:
> > > > Hi Aharon,
> > > > 
> > > > On Sun, Oct 04, 2026 at 09:26:58PM +0300, Aharon Robbins wrote:
> > > > > I'm the maintainer for gawk. I see that it's used in the kernel build
> > > > > scripts in combination with objdump.
> > > > 
> > > > For the record, the only place where I see '-M' used with gawk is in
> > > > scripts/objdump-func, which is not called during the kernel build
> > > > thankfully.
> > > > 
> > > > > In particular, I note that gawk is invoked with the -M option, which
> > > > > uses MPFR for arithmetic (although the precision isn't changed beyond
> > > > > the default which is the same as for IEEE hardware floating point).
> > > > > 
> > > > > I am wondering if the -M option is really needed here?  The reason I
> > > > > ask is that I plan to deprecate MPFR support. The upcoming 6.0 release
> > > > > (I hope in Q2 2027) will issue a deprecation warning when -M is used,
> > > > > and 6.1 (late 2027 or early 2028, I hope) will have MPFR support removed
> > > > > entirely.
> > > > > 
> > > > > So, I wanted to give you folks a heads-up. If -M isn't needed, now's a good
> > > > > time to remove its use from the kernel build.
> > > > 
> > > > Adding Josh and Peter for the rest of this since they have
> > > > added/supported this script.
> > >
> > > I'm not sure; Josh added that when he did the upstream version. My
> > > initial version very much does not have that -M on. Josh?
> > 
> > Thanks Peter.  Josh, looking forward to hearing from you.
>
> IIRC, I added the -M for doing 64-bit arithmetic, but really only the
> lower 32-bits are needed for computing function offsets, so yeah, I'll
> fix that up.
>
> -- 
> Josh

Thanks for answering this.  I'm glad you won't need -M and will e
able to fix things.

FYI, should you need it in the future, Bash can do 64-bit integer
arithmetic, and there's also GNU bc.

Thanks,

Arnold
