Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB14254AFF;
	Fri, 23 Jan 2026 23:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769209252; cv=none; b=JZaTfNZziv6TYi1YBN0jkx2NyJc8yWOnJyCLaF4Cb3QauZxclDZPTlqzKz6TJ0s6TMaRBYiRYrXu/RtzdSGSl/0fKIopQ8JVQRH5Kf2kHVJSf6NT59qufcpUL1DyG28841Fu3uy3pHBvEJMHL5N4W60qst5v/0xdeceZ/L49i7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769209252; c=relaxed/simple;
	bh=MldoWLkElqwFFjSBiTpavWBvxwEkis7UUkg2BBOSAcg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ZPPohd6rQCwl3QYBTNpgRSw91MC2/TpXxOkBdti2yIdisWCJdW/RMfsnWNdY9bfmtFeUNSQWa44/UCcyqILCwpfiECuxxu7TgGaBMZHIC8eAYa/X1aH0dJ+S+CuHdiAAzIbBLILZcXQJxo9hWcxwr2ILdIqq0jztWC5OcXjDqHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bfKdW+/k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bfKdW+/k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ACDAC4CEF1;
	Fri, 23 Jan 2026 23:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769209251;
	bh=MldoWLkElqwFFjSBiTpavWBvxwEkis7UUkg2BBOSAcg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bfKdW+/kV04WLheGuwgmSstVlUIqQcAvw+MXNN+iPJa8aXCLR1Evav6/ba+xTxypS
	 XhFYSi85Od9hty1XaiEKFhsfxN0Id+BM2mEy1scW++GYu9zm5td1jYfapBU7imE6OI
	 NxUDr2/hqhxDCcsekc0BgzR66n1CJzg1e/C9fDW0OfRsTcq2Zhi5W1bYkgMDKkYwkx
	 i729/rj3WbX8iA00x8IahNks9OcAIlQ7PB5VX1U+9CYOZD3gtE0csewES8wFD7DV+n
	 7kM6BrhCJvUAgfjWChsB5YH3vjkvEI78VIpTGqHnnX2g22bVFkKWkMJpibXjUG82IQ
	 TmwJomq1+xb7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BC6B3808200;
	Fri, 23 Jan 2026 23:00:48 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.19-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <aXPmxBcHT-FqfAKB@levanger>
References: <aXPmxBcHT-FqfAKB@levanger>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aXPmxBcHT-FqfAKB@levanger>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-6.19-2
X-PR-Tracked-Commit-Id: baaecfcac559bcac73206df447eb5c385fa22f2a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 62085877ae6592be830c2267e35dc469cb706308
Message-Id: <176920924722.2742293.10334422593118345070.pr-tracker-bot@kernel.org>
Date: Fri, 23 Jan 2026 23:00:47 +0000
To: Nicolas Schier <nsc@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild Mailing List <linux-kbuild@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, Carlos Llamas <cmllamas@google.com>, Arkadiusz Kozdra <floss@arusekk.pl>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 23 Jan 2026 22:23:16 +0100:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-6.19-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/62085877ae6592be830c2267e35dc469cb706308

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
