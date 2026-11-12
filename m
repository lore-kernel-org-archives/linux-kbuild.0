Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445148;
	b=DRIEv2bzd69fFTbdVpYq8naGsIFqGmphrB37yYNODOgQvxpLnrk/3Rp4xrxe6QcLcnkX
	 Z59QOhA6UdeV+K3WQmVn/JYbz+rPt/rvwLDSSf2nsfc7Q+HXx0O5ODsNnMZRXhXVnnTHH
	 2T3wbQ1msco+EuCL/OZ2NMQBc/8n3rv+kvQ4nI0m77y6qAxiHNb9CzMOXMqysy90zrlO7
	 FAnwniMiiE0hK3OYceE4cU+EMG01akMmWgSJcpqWxW3uexJqGIHJLaoHfz3q+xjGMs2Hg
	 miQazwr5556Wi+kOKmKQYvmRpKErzAYEmjlLOk3QSxLXRgEclaqA6dGoDKOFCTF1/kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445148;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Zpmba4IRGbMN4+YXi27KWIOtUip0xAP47O3DeTxxn4I=;
	b=YCIebJZtu8C3J8yJzQFbsh31TIAo+gd3tczmFi6L3XSKYZR/wA0V2bcXycuL2JU/+AOj
	 hckubl7VHPdi5/tpkBgjIXFyrcBa5uH2H/eTJu85gNE4q93wWi1noPSwdAcUlhHQxfFBL
	 PDglCoH/3KW/9UtECkmbfFiQ3TQD3zGkgBlZgH+CIBHNrDaxPouYxKw/kQ97cdyCrb9Hk
	 O/qNt+GJKZmGkxLMYtMXwkwneOtL8NnsJRrMxTilC8FFTD6orObzH6Cr1hF1I7qw5qvZL
	 mYzEJXO1HFQIjBhuIVilHYm2cgLzqv7GgWfgs6NC/tLjBxdKYzJxEG6N9NkP6w5Uxmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SKgHwvZD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDC8606A321;
	Thu, 12 Nov 2026 00:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SKgHwvZD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C361F00A05;
	Thu, 12 Nov 2026 00:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794445148;
	bh=Zpmba4IRGbMN4+YXi27KWIOtUip0xAP47O3DeTxxn4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SKgHwvZD0isxJ0F1Fz3chY5/GpCMK7j+L8Oxi1KEeBPmM7N3msSRVSMETRWKPim6R
	 ScM5km5UmuCMVLldwy6IX1mH/TBJJVCafNaA9K+o1y6PfS7U7rIcleM0SGQkg8At1x
	 GAmv4sJZl050qL0yx40yNjdea/NQLL4DMwR4ATqzSE8dRzJSKeELZlM0iM9r9Yun8P
	 AUGcHA8ujt10w+JsfyJkuPDSGUneG6ARTh4yKAxNyTmSxw0J3e+ZomAWle1KviwTse
	 GOw17v5T+0sR1m8RjmNIzcNnyw+Y7o2YGUC31gX5xuGaQST3lgZHaYiaeg5mf1G+bR
	 XV4POLrzVjgUw==
Date: Wed, 11 Nov 2026 17:59:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 4/4] scripts/Kconfig.toolchain: Document minimum
 supported versions for dynamic checks
Message-ID: <20261112005903.GA2891174@ax162>
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>
 <20261110-kconfig-toolchain-updates-v1-4-6d4fb636290e@kernel.org>
 <6d7d25fa-69ef-42b0-b7f2-bb59ebf0eb2f@gmail.com>
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
In-Reply-To: <6d7d25fa-69ef-42b0-b7f2-bb59ebf0eb2f@gmail.com>

On Wed, Nov 11, 2026 at 07:01:19PM +0000, Julian Braha wrote:
> Love, love, love this!
> 
> I tested the bounds and replicated nearly all of your results, but had a
> few notes:

Thanks a lot for double checking me! I adjusted the comment format in v2
to link the corresponding tool commit to make future audits easier to
validate.

> 'asm goto' failed for me with clang 10. Seems it was added with
> clang 11 [1]

Yes, good catch!

  https://github.com/llvm/llvm-project/commit/50cac248773c3a023e8f6ceb9938bdd5e9f15da2

I have adjusted this in v2.

> Clang 15 supports '-fstrict-flex-arrays' [1] so the check seemingly
> passed, but support for level 3 wasn't actually added until clang 16.

Yeah, I probably should have mentioned that it was only '3' that was
supported in clang-16. I added the direct link to the change in v2 that
makes that clearer.

> I think this needs a:
>     'depends on !CC_IS_CLANG || CLANG_VERSION >= 160000'
> so the option evaluates as empty string when these deps are unmet.

We don't need to add this dependency for two reasons though. The minimum
supported version of clang for building the kernel is 17.0.1, so that
dependency would be tautological. Even if it wasn't,
'-fstrict-flex-arrays=3' can be added to the command line without error
in clang-15, it just doesn't do anything.

  $ clang-15 -fstrict-flex-arrays=3 -c -o /dev/null -x c /dev/null
  $ clang-15 -fstrict-flex-arrays=4 -c -o /dev/null -x c /dev/null
  $ clang-16 -fstrict-flex-arrays=4 -c -o /dev/null -x c /dev/null
  error: invalid value '4' in '-fstrict-flex-arrays=4'

This has been a problem since the cc-option call was added to Makefile
in commit df8fc4e934c1 ("kbuild: Enable -fstrict-flex-arrays=3"), so I
did not do anything else about this in v2.

> '-mnop-mcount' worked for me on x86 with gcc 5 [3], but it seems s390
> support came later in v9 [4]

Thanks, I adjusted the comment to document the asymmetric architecture
and version matrix here. Turns out clang actually just recently added
support for this for x86:

  https://github.com/llvm/llvm-project/commit/f514b16972f785fdd3fad1d19195aad5c9324fb5
-- 
Cheers,
Nathan
