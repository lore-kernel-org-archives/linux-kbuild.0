Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C19390231;
	Fri, 28 Aug 2026 19:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787945282; cv=none; b=MBEDkA4V7hk2jBMgF2ToLXBPuOCgTHQz/IQidxi76FwIalJlKGEd62Jegdg9Z+ku53RgkUPv16vjPUjVbOKlz8KkTEzsfgKshjBsrqngrg6mXReMTe+Z9BCl1Fayer6HbgcJOg/OiyHu+mYY5lfH5YppTAnMgZi2aqA7dPHrtNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787945282; c=relaxed/simple;
	bh=du2++R3mgqi7p1q4a3eqxxHhW8XruKGMLjAt8JN/glI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLPcS1MO9IeCW5Bowg5fuyGH5AydA3ld7OaplPl0nkmN18ehvExRoHJFEyETe29OyXS0okRGg0sBeVt7iuLmb5seGitBYJ2sL9qcI+IRor98f+fA8HbraI8UpUE8fca3tM1XjSU7QsCzzyo7ZQ9AyVjM2WBJlE3QDBuyurf7aSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bEZQ02MJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bEZQ02MJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79241F000E9;
	Fri, 28 Aug 2026 19:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787945281;
	bh=MnFRd148/P4Gij3MoN+LcvlhwKMr0AVKuEsW9frsbXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bEZQ02MJZhJVBTBUK5QrtNbTcmVSZ1LfJEhY8ltmpltRl9J2slWZEpGw8p6TwyG3Y
	 Uu5Fz/PDELOlUTyRjdLUuhBHEsSdtuY0owfeiIZaLr8tb+4x0uZjF8Zzx8yf4cfexN
	 f8O7smSO/dkE2hriXW9zoDsTpu3q26FyApCHThIk+dsL+BBs0Wicj2Rc6slGxFtFRM
	 A5J43pa2RchtLrCQwkAlkZqTHemNLqa7fFtWuvDsSZLvYqO/jblEGC0Qx9SMaBpOl2
	 k+ilqhQjxKM7anANFU/v1Fu9R+gp024rZlimCjcCUmkTYV7VyH6iiLYXw4LPfpDuc3
	 V2P9iBKLK7leQ==
Date: Fri, 28 Aug 2026 12:27:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>, Gary Guo <gary@garyguo.net>,
	rust-for-linux@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH 12/27] kbuild: Defer running objtool to link time for all
 CFG features
Message-ID: <20260828192756.GA2820684@ax162>
References: <cover.1787890035.git.jpoimboe@kernel.org>
 <1447f9f8dc6e7e02e4a8a33ce7ae92ba49d70eb3.1787890035.git.jpoimboe@kernel.org>
 <20260828175708.GA3403925@ax162>
 <apHOMecu7SAWR2zG@jpoimboe>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apHOMecu7SAWR2zG@jpoimboe>

On Fri, Aug 28, 2026 at 11:19:52AM -0700, Josh Poimboeuf wrote:
> That was actually on purpose.
> 
> Before this patch, NOINSTR_VALIDATION was a weird special case, where
> objtool ran on individual TUs (with all the objtool-args-y), and then
> ran again on vmlinux.o (without objtool-args-y except for --werror).
> 
> This patch makes NOINSTR_VALIDATION just another OBJTOOL_DEFERRED
> feature which runs deferred, and *not* on TUs, so now it gets all the
> args like the others.
> 
> That was indeed non-obvious, I'll add it to the commit log for v2.

Ah okay, that makes sense now that I have zoomed out a bit, got tunnel
vision there. Adding that explanation to the commit message sounds good
to me, thanks!

-- 
Cheers,
Nathan
