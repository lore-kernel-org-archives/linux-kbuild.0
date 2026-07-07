Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE883876B8;
	Tue,  7 Jul 2026 06:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783404680; cv=none; b=KQoJp/Rs7KC6p5sbsBc9mJpTbUKChF5nwN/eFA5WQbB2w2Co5psvMOZSaSDB+5WUwy5XqDhxXDlRhwHTwWtV4Vr8sebufsOZCJy66NQloJcirYtcPnoQT68Q3k+GGtbiQwyMFXx7wVGQGsltAeHG4wRsTsMJ+8xcCBYxvBZUAiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783404680; c=relaxed/simple;
	bh=sl3E8cC9JWrLW5kispv5DXHFFQtxHogM/QtbdMQLKag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B94uf6MyLQNQFsqJsP6cUTETegx00afmpm5olbHeNvXdjQZtRtvjYUN+Rx0JJ4LPJ5B3nmOJZXA7U7RAFo44Y6tH5sztJGJYjJr8X8Aze1BXmIQgudxb+lnlI2lWpr06OxM1Xy0FRDhbWD+MkHaMzuF4eijmsUjIc1Sek6IqsFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8Hh+TB9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c8Hh+TB9"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id DA27A1F000E9;
	Tue,  7 Jul 2026 06:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783404679;
	bh=zLjfmSYRzCv4ekRLBX0VSDhcoHRgXCSwEUWbMXTYdNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c8Hh+TB9e8hZ/lx1wYsRs5TcAinAJUOFR+4nrbky3ERJSCbbqw84oDZjy9fwn1S8s
	 4kR4eWdJBVANtMEHcrqxQEaGxQSwsgepsQm26cLrEYUSqTyeeQb7IPyPaJx0fQsgOM
	 v45wN7aP+W9HUBu9Mb6dKD4DZaPZINb3s2LJgnb0B85oev01itiaqksWapr9rX+Lru
	 /vBGGqUm/nxzPEB5S+rxEUFziv41Z3swgL3aT2xrRpFxqatZ5QhqfQNxsFN6PX/ei3
	 0qYLVmx/Zza/dRkxUmFRJi4Ntw6Dr3oymU/M1uUeTylX8jWvX10oqQCwpEIIdlrUXT
	 8LHaeRr0wuz9w==
Date: Tue, 7 Jul 2026 08:06:31 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, rdunlap@infradead.org,
	masahiroy@kernel.org, grahamr@qti.qualcomm.com, nico@fluxnic.net,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kconfig: warn on dead default
Message-ID: <akyXZylHRRgzzpDk@levanger>
Mail-Followup-To: Nathan Chancellor <nathan@kernel.org>,
	Julian Braha <julianbraha@gmail.com>, rdunlap@infradead.org,
	masahiroy@kernel.org, grahamr@qti.qualcomm.com, nico@fluxnic.net,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260606140008.271929-1-julianbraha@gmail.com>
 <20260707053143.GA1381193@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707053143.GA1381193@ax162>

On Mon, Jul 06, 2026 at 10:31:43PM -0700, Nathan Chancellor wrote:
> Hi Julian,
> 
> On Sat, Jun 06, 2026 at 03:00:08PM +0100, Julian Braha wrote:
> > The dead default check was originally introduced with kconfirm:
> > https://lore.kernel.org/all/6ec4df6d-1445-48ca-8f54-1d1a83c4716d@gmail.com/
> > 
> > While I'm still working on that tool, it's not yet ready for inclusion
> > into the tree. I am currently waiting for common distro packagers to
> > package the parsing library before submitting the next RFC iteration.
> > 
> > However, the dead default check is more impactful than the other checks:
> > all 4 dead defaults that were detected should not have been dead and could
> > cause misconfiguration bugs. But fortunately, these were just for kunit
> > tests. The 3 patches to fix them have all since been merged:
> > commit aef656a0e6c0 ("powerpc: fix dead default for GUEST_STATE_BUFFER_TEST")
> > commit 30cc5e2ad826 ("s390/Kconfig: Cleanup defaults for selftests")
> > commit df75430515c3 ("drm: fix dead default for DRM_TTM_KUNIT_TEST")
> > 
> > We can actually check for dead defaults while evaluating Kconfig, which
> > should be even more effective at preventing future instances than keeping
> > it in a static checker.
> > 
> > Note that this patch will only trigger a warning when the default values
> > are different, in other words, pure duplicate defaults won't cause a
> > warning, as they are simply redundant.
> > 
> > Signed-off-by: Julian Braha <julianbraha@gmail.com>
> 
> Nicolas pushed this into -next, where it fires several times for me. I
> have not looked at these closely yet, I just wanted to get the report
> out so that more eyes could be on it.
> 
> ARCH=powerpc allmodconfig:
> 
>   arch/powerpc/platforms/Kconfig.cputype:269:warning: default for 'TUNE_CPU' has the same condition as the earlier default at arch/powerpc/platforms/Kconfig.cputype:268
>   arch/powerpc/platforms/Kconfig.cputype:270:warning: default for 'TUNE_CPU' has the same condition as the earlier default at arch/powerpc/platforms/Kconfig.cputype:268
>   lib/Kconfig.debug:1083:warning: default for 'PANIC_TIMEOUT' is unreachable: earlier default at arch/powerpc/Kconfig:350 is unconditional
>   arch/Kconfig:1194:warning: default for 'PGTABLE_LEVELS' is unreachable: earlier default at arch/powerpc/Kconfig:482 is unconditional
> 
> ARCH=s390 allmodconfig:
> 
>   arch/Kconfig:1194:warning: default for 'PGTABLE_LEVELS' is unreachable: earlier default at arch/s390/Kconfig:295 is unconditional
>   lib/Kconfig:372:warning: default for 'HAS_IOMEM' is unreachable: earlier default at arch/s390/Kconfig:760 is unconditional
> 
> When building with clang-23, which supports '-fms-anonymous-struct':
> 
>   init/Kconfig:978:warning: default for 'CC_MS_EXTENSIONS' is unreachable: earlier default at init/Kconfig:977 is unconditional
> 
> I think the init/Kconfig and arch/powerpc/platforms/Kconfig.cputype ones
> are intentional due to how cc-option works but I know those might be
> hard to silence because they are already evaluated by this stage if I
> understand correctly? Not sure about the other ones (apologies if they
> are already known or have fixes).

thanks for the report.  I'll remove the patch from kbuild-for-next
again as there is not obvious immediate solution visible to me right
now.

-- 
Nicolas
