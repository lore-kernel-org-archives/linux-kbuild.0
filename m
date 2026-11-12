Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481711;
	b=0p5ne3LPJ/ntd1fNTx3nu1XsJlcyEEEPMD0A54rVYKZFhmqOVuOd9ldKuNEkdDX6XD/p
	 vo5mOUiOM8Cy7KEOKAcsDmo2o9tHIiqBkK7OMtx6IlNtt/mxWBTHn3n4w0lYebKOjv7cN
	 W5GOlWX6a187LG3dmOXpoznDKh8vVcNajzeX+G7FH+UXXXM/Z4TVBpZPZQRQcLUJFAHIg
	 W3/4eN+GiKu68IMv8kIjwLO1eRjILjBICCzX2THe85CowvMhlEUPjqQOxW3rloUQaeBfa
	 4R9vHfxWrzclziB6NAzjI2FlD07iTIeRqlEvICTmhcRj798DzJ/hIxFWe+znD1ddFag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481711;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TDilRXmeoxSYY8jkfX8dDP7Escz54QuAh7M2Ulo9+Cs=;
	b=CLuekLYlQAdH95wyc6xHWbvbcA72LmCEAMG8CESeF95srEzgURvle5BtAZlmXBaJ9z3P
	 MyxJSk2HU1y3juw2ImKQzFl6XzBsXJi1YdrN5t6c9zbZ7Bcwq6vy27gfQsTV/+oNY1rua
	 kR301ODKrsKSG7vRijUp4P3pLAOWpFarlkEBqc4ppfrU6tAC2EYOijDXMJT8SyqM9mefk
	 oQJjlQLGNSn9pldLhhHHb0hR8dMf4/XypZLfyHR8lpU6WEax5kuLzc/1C8nGUSYgij8p6
	 kRxjMLmAkRfxgMmC9pomnPyaeIPjDzVXvBDBQcx1hfMZup3SqHxvKkdRBdR0yme1uRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dr7lfaXe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 11F3A606A32D;
	Thu, 12 Nov 2026 11:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dr7lfaXe
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 26B1D1F00A05;
	Thu, 12 Nov 2026 11:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481710;
	bh=TDilRXmeoxSYY8jkfX8dDP7Escz54QuAh7M2Ulo9+Cs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Dr7lfaXeRCNPoJ94w6Skhx/lyd5atzlFhP1aiBAmmZABVuwE9Sk9p1dZ9OQGqRWqf
	 PMUmiShRp81N9U1hz2nygO3HkGjoyK7IiattZX20nMVxSrNoeGQcaWW+XH1Y+t/dzJ
	 KWJlnmCziTgbV63d2FGFkXHWo44m9HCPS3tlGOYwaIXkppDCoSCwpno5pmRvY+MbOr
	 a35G0/0Y+Hq1Zm4tY7xOhIaicb0PkctrLPPpm9C5RixYgr0zX/7upQodCiMA3apNTa
	 H8IM2b1pDp5rHBv/m2fGjjeWtmrSE0SkveOaRXrhoe5aP206Z5XztDhRqdiqRcnlqe
	 50GhF+Ef5jPAg==
From: Nicolas Schier <nsc@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] ARM: kprobes: Rename test-kprobes.ko to test-kprobes-arm.ko
Date: Thu, 12 Nov 2026 12:08:23 +0100
Message-ID: <179448168647.2348885.1879119670707585702.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109-arm-test-kprobes-rename-v1-1-663cdbbb90c7@kernel.org>
References: <20261109-arm-test-kprobes-rename-v1-1-663cdbbb90c7@kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 09 Nov 2026 01:46:42 -0500, Nathan Chancellor wrote:
> When scripts/modules-check.sh is fixed to normalize the module's name
> like name-fix-token does in scripts/Makefile.lib before checking that it
> is unique [1], there is an error due to lib/tests/test_kprobes.ko and
> arch/arm/probes/kprobes/test-kprobes.ko having the same module name.
> 
>   error: the following would cause module name conflict:
>     arch/arm/probes/kprobes/test-kprobes.ko
>     lib/tests/test_kprobes.ko
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] ARM: kprobes: Rename test-kprobes.ko to test-kprobes-arm.ko
      https://git.kernel.org/kbuild/c/73d83cea

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).

Patches applied to the kbuild-next-unstable branch are accepted pending
wider testing in linux-next and any post-commit review; they will
generally be moved to the kbuild-next branch in about a week if no
issues are found.

Best regards,
-- 
Nicolas

