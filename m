Received: from freefriends.org (frenzy.freefriends.org [198.99.81.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDFE43C05F
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Oct 2026 09:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.99.81.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791192356; cv=none; b=XQC6/8mgM5V1CQyD+5IxlgMUXEYkODZB7egjZ2z9dOw44JKaG4M9OzugBzMJJj16lDkEUKcclBgc5WA6xAWKfX0xyzu/jT1m74/Q54/RdUiG74oPfIM333C4wauaePcotIxoyVpZCa80KXiQ7kJyXZekpY8cnAssGtrCI7SMBY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791192356; c=relaxed/simple;
	bh=uWw86y3OkpbF3PXzYl6YkZiErIg/TZkC5ctFzA3PCPw=;
	h=From:Message-Id:Date:To:Subject:Cc:References:In-Reply-To:
	 MIME-Version:Content-Type; b=VRbzw3OE2TQeonygS/mWburl1uQg2DHBlfz0By0hNcsKfUbNzeqHwnCE2pyyIHQmkyJ+oG2esMRBkh0TO5zqENKiE/e/JjodD+9JbR4RoC7Sy8JZkm9JDfo9bugicyHurezKp4Pu7yOP7IGLXhNJV6/dgsJHqqXpwW8dZsJK+Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skeeve.com; spf=pass smtp.mailfrom=skeeve.com; arc=none smtp.client-ip=198.99.81.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skeeve.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skeeve.com
X-Envelope-From: arnold@skeeve.com
Received: from freefriends.org (localhost [127.0.0.1])
	by freefriends.org (8.16.1/8.16.1) with ESMTPS id 69592lIJ021581
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 5 Oct 2026 03:02:48 -0600
Received: (from arnold@localhost)
	by freefriends.org (8.16.1/8.14.7/Submit) id 69592lvj021580;
	Mon, 5 Oct 2026 03:02:47 -0600
From: arnold@skeeve.com
Message-Id: <202610050902.69592lvj021580@freefriends.org>
X-Authentication-Warning: frenzy.freefriends.org: arnold set sender to arnold@skeeve.com using -f
Date: Mon, 05 Oct 2026 03:02:47 -0600
To: nathan@kernel.org, arnold@skeeve.com
Subject: Re: Use of `gawk -M' in kernel build scripts
Cc: peterz@infradead.org, linux-kbuild@vger.kernel.org, jpoimboe@kernel.org
References: <E1xDQvK-00000000Kvi-2PZ4@gleep.local>
 <20261005085332.GA2094974@ax162>
In-Reply-To: <20261005085332.GA2094974@ax162>
User-Agent: Heirloom mailx 12.5 7/5/10
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi Nathan.

Thanks for the note. gawk -M is also used in a file named check.c (I didn't
save the full path, sorry), which has the objdump-func script embedded
in it for calling via system(3).

Josh and Peter, looking forward to hearing more.

Thanks,

Arnold

Nathan Chancellor <nathan@kernel.org> wrote:

> Hi Aharon,
>
> On Sun, Oct 04, 2026 at 09:26:58PM +0300, Aharon Robbins wrote:
> > I'm the maintainer for gawk. I see that it's used in the kernel build
> > scripts in combination with objdump.
>
> For the record, the only place where I see '-M' used with gawk is in
> scripts/objdump-func, which is not called during the kernel build
> thankfully.
>
> > In particular, I note that gawk is invoked with the -M option, which
> > uses MPFR for arithmetic (although the precision isn't changed beyond
> > the default which is the same as for IEEE hardware floating point).
> > 
> > I am wondering if the -M option is really needed here?  The reason I
> > ask is that I plan to deprecate MPFR support. The upcoming 6.0 release
> > (I hope in Q2 2027) will issue a deprecation warning when -M is used,
> > and 6.1 (late 2027 or early 2028, I hope) will have MPFR support removed
> > entirely.
> > 
> > So, I wanted to give you folks a heads-up. If -M isn't needed, now's a good
> > time to remove its use from the kernel build.
>
> Adding Josh and Peter for the rest of this since they have
> added/supported this script.
>
> -- 
> Cheers,
> Nathan
