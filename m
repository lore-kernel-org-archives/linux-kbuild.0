Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388322;
	b=owpF3nKSkMjoWmy4FafHW5iDkcaiB+ugKmNbi9mGQPrijxuCA9CgpqyMsQIfAvq5aohv
	 OYuDUmRUIjaxUXIyA16PWoXP8GlaKpxVVlT2UMHT+uUY1uzsw59LzlvKoGwDRv1J7kBLo
	 pGF1QKMgs7Bo+r0drmYCkIADVyyolJd9ixOj90Zg3NM3vkx/W3bIu3VtRogHg1KRjpUtY
	 cgS4g78TTo/Zm7IiJH0Um5HJd12Fn+KfgkOUfsNdlUzGBNJpuLfPoJtRg89k2j2ODasw3
	 85vsTOeGd24aQzSyNfThBm//7sd488Z9tf6Q4uCsowl139j9Ti7MrqUSYhttJviRnVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388322;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=QvJDjyhibsPpz0udWvrrrSgfHyW3kU7kA7RT2HST+A8=;
	b=0thgAwys+2Hw+5Y3MvtAKEChqPyh1CGgT8fWf8lyI/hF9M2lvaRlusU5pOFIKlZBgqO9
	 KIObrH2u1a5zUhUKVhzDYL+O+qwMen+AXVXr7a78I9aB3JE988o2cju1rLAnS8Uk8OjMi
	 WMFA7nYYf1l0wHPwfFDNJS/P5mw6IYCmZ481SMXrwwW5LbpkX4mZqJ95NG9PIRZJGh70+
	 c4ekWISNOTQHoUyuqJJ8IPPsQ+WwlJO1rXLBK+Ghi50+LAo77rFB/VOI/iTMYOVSiUPEn
	 kkXnYJN1HRZAKluhSWrtiFmixLK5wn5eSyez3yf6KyJYfseTXs1j6yGWdRxTlPakl/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hcOBsaxs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D57606A31E;
	Fri, 30 Oct 2026 19:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hcOBsaxs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D8E1F000C1;
	Fri, 30 Oct 2026 19:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793388321;
	bh=QvJDjyhibsPpz0udWvrrrSgfHyW3kU7kA7RT2HST+A8=;
	h=Date:From:To:Cc:Subject;
	b=hcOBsaxsLOvc7pZuFIMj6LtT0Dp+qe27N/ww4KnfKdcyCRD76aBaw6636ffCOXhV9
	 YbNqUdT0+iEJQeKQ9vezQUX8hl2KRtH6UFs/Y66Oa8WXohvVi1dDiransN+dODutNx
	 Inj8BbXy3oj+GUSRSoCPf8gM9BxDjat0frIZecb9JgqQEJR3cRBSIdJw9Zxt6dwBEu
	 trkUqAL9aPRogYHVJRvR5z8eZqNnifTCjN6uzwhwbJpy7cPICVHOLDpSlVioZSILJB
	 +Dm0UiQU17FJOZ/egEUFMqpspFxJtdPcsEB5Ww8jWH2Gz/Lejg1/jqf1dxqgBFFgvH
	 Tza+4C+nsLkTg==
Date: Fri, 30 Oct 2026 12:25:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [GIT PULL] Kbuild fixes for 7.4 #1
Message-ID: <20261030192517.GA49624@ax162>
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

Hi Linus,

Please pull this small set of fixes for 7.4-rc1.

Cheers,
Nathan

The following changes since commit 997208ce9f43f01febac956cf9aeffe89945e3c1:

  Merge branch 'kbuild-next-speedups' into kbuild-next (2026-10-17 15:20:23 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.4-1

for you to fetch changes up to e58096244338308dde3fa76982c8042981ddda52:

  scripts/Kconfig.toolchain: Highlight cc-option differences between Kconfig and Kbuild (2026-10-20 14:55:40 -0700)

----------------------------------------------------------------
First round of Kbuild fixes for 7.4

- Move probing of '-mfentry' back into Makefile instead of Kconfig
  because it does not interact well with toolchains that support
  multiple bit widths

- Add a big comment in scripts/Kconfig.toolchain of two pitfalls when
  moving cc-option checks from Kbuild to Kconfig

Signed-off-by: Nathan Chancellor <nathan@kernel.org>

----------------------------------------------------------------
Nathan Chancellor (2):
      kbuild: Move testing of '-mfentry' back to Makefile from Kconfig
      scripts/Kconfig.toolchain: Highlight cc-option differences between Kconfig and Kbuild

 Makefile                  |  3 ++-
 scripts/Kconfig.toolchain | 23 +++++++++++++++++++----
 2 files changed, 21 insertions(+), 5 deletions(-)
