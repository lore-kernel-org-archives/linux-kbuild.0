Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584523F65E6;
	Thu,  3 Sep 2026 06:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417954; cv=none; b=hdZtTQUwQwxRl747twwbm2fvDPNCOt49h3ZLmb/Akj99eYswaazeTtrcoG+uNwIWBofqjaAb0L4xzmWLjnaDJaPDdo/wynKt4E/qSyTLQIVkFe8sE6EYk3SbxSACRDXKlSz7hM6S0ktzY8cB0lW33hZlpQXfRpEH9ny/dGF1+Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417954; c=relaxed/simple;
	bh=P9+f1Jtxz+y2HKxAL2xMRTk91YQwfAqFofpQq7fM+lQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMT+jv/oEP8J8vVaXjPP6qCJQgoUd4GDE14Q05VjhBjRyHsHz3LE8jRON5bGdg016y16ZlkD/m61dSEzY3ucpwE4mBIchgez9/IefWLg9OALa2pYALvx8gD//gP/co0hpMfT+cKzSQ0rW672Qib8pbdPIVhnB5+s4sIi7Wj7vuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FkWYHSUw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FkWYHSUw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4127D1F000E9;
	Thu,  3 Sep 2026 06:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788417948;
	bh=taf5dbEnXKCwEorDkdZE7RlmNfzxPQBAFPEWd9Mx2IM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FkWYHSUw+O3bkx8zJ8pSVwFR4EIop+5d9/8JJSAlduoOtNlmwutl/Ztgj7TBNgklQ
	 s/f3DfnHqGO4gBBXtI8y1Og0ypyz49voMuWTybzZJpwvC0SFC6hEXurd45ArSRitZz
	 KwbiAWL+ryAj7teIq6PmLopZRmnrCa5Pvh+SyLxXT9T3XOJZQGpfTpUJHDfQQgLRfj
	 NWEuW2EYzH80uF3gQszcPjAMbH8JQmOf85HjaSUDN4vYcxEfQ0YDIBu06xCGo5Ik5x
	 X088OIooyM3jPtwcquaLxN2Ta7Umlo/TMiUuiFWpKXu5+oGxGieNrcnEwdsHoSjEc2
	 E9TljXSA9BPIA==
Date: Wed, 2 Sep 2026 23:45:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Vlad Poenaru <vlad.wing@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH] kbuild: don't delete in-flight filechk temporaries in
 asm-headers
Message-ID: <20260903064544.GA1942038@ax162>
References: <20260902161347.4163577-1-vlad.wing@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902161347.4163577-1-vlad.wing@gmail.com>

On Wed, Sep 02, 2026 at 09:13:47AM -0700, Vlad Poenaru wrote:
> Commit 2d69b891e646 ("kbuild: Support generated asm-headers in
> subdirectories") switched the stale-wrapper sweep in
> scripts/Makefile.asm-headers from $(wildcard $(obj)/*.h) to a find(1)
> invocation, so that generated headers in subdirectories are considered.
> 
> The two do not match the same set of files. Make's $(wildcard) uses glob
> semantics, where a leading '.' has to be matched explicitly, whereas
> find's -name uses fnmatch() without FNM_PERIOD, so '*.h' matches
> dotfiles as well. filechk writes its output to $(dir $@).tmp_$(notdir $@)
> before renaming it into place, so such a scratch file, if it happens to
> exist in $(obj) when the sub-make is parsed, is now picked up in
> old-headers. It appears in neither generic-y, generated-y nor syscall-y,
> is therefore classified as unwanted, and cmd_remove deletes it.
> 
> On x86 this races with archprepare, which lists both asm-generic and
> arch/x86/include/generated/asm/cpufeaturemasks.h as prerequisites. Under
> -j they run concurrently against the same directory, and the build fails
> intermittently:
> 
>   mv: cannot stat 'arch/x86/include/generated/asm/.tmp_cpufeaturemasks.h': No such file or directory
>   make[1]: *** [arch/x86/Makefile:269: arch/x86/include/generated/asm/cpufeaturemasks.h] Error 1
> 
> The same commit also converted the generic wrapper rule to filechk, so
> those wrappers now create .tmp_*.h in $(obj) too and can race among
> themselves.
> 
> Restore the previous behaviour by excluding dotfiles from the sweep.
> Subdirectories, which is what the find(1) conversion was for, keep being
> descended into. While at it, quote the -name argument: it is currently
> expanded by the shell against the build directory before find sees it.
> 
> Fixes: 2d69b891e646 ("kbuild: Support generated asm-headers in subdirectories")
> Signed-off-by: Vlad Poenaru <vlad.wing@gmail.com>

Oof :( that's unfortunate, thanks a lot for tracking this down!

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Nicolas, I assume you will pick this up for 7.3.

-- 
Cheers,
Nathan
