Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9C81E7660;
	Sat,  7 Mar 2026 04:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772858028; cv=none; b=ChWqGA3GZJI412UrY/huMWDS0WrVe0G/UI8ev78tRTO3AkO77B2vXGcDAnBYWm/kkzIQ8In7SSwXgI2vJnExtoh8FucExbHwKAo0RnvFHUB2jzhWaqiFKrh6eM80F7DbTpHZZSCInP4gkvpNZTk7FwZEQB3DWszr63ZGUbMpSic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772858028; c=relaxed/simple;
	bh=VBWm1N++pJlTh2a36ACeCD9ilQe1CIc5yO5lEDhJLqM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=u5yWbW6s0u/VkO1Syq2cWe5JdNCikp0STqwPHoMv/8PB3fgybGnBngIdJ08YyPiuUGYdQjA6aPy11u3dTlicurHI21q+QQnlUltAIkADLfaIoMxnwx3Qaaj8KUgvBu+U8VdzLfT2cbE0N06WHgSWsHvu3E3yb8IR3dHh5VTkQpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVFb9sL3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVFb9sL3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44617C19422;
	Sat,  7 Mar 2026 04:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772858028;
	bh=VBWm1N++pJlTh2a36ACeCD9ilQe1CIc5yO5lEDhJLqM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cVFb9sL3H1Pj0IlweYCVIe0y1ETl6Y/EQpyKUkLVzozMK8sc62WQD32gpUBpUDTUD
	 Oo2+tA7pTCGbDKzkX3YWPYDxiINH2brKAI2q1ngaQY/ARvx3mMBORGjhBd3ftyMk9K
	 FuKeRilXphfq5Y8GKQcfdSY1+EKw+4WNiPz1xoc2zRerd97JWPtoljA0NzBCqcked3
	 aTCDxSm5WzDR4eYr1FUUwJlM+VyAX5JOAToxDveM84I4L9VlYTevHfU89YvSo74J8S
	 oUFUL6ijRtZIo8f9m7awDDnj6YPnoUJavuK51gcksQlKmb8NE1fJO7qMdnTNsTC8xO
	 z00tm0xMTY/Dw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D1333808200;
	Sat,  7 Mar 2026 04:33:48 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for 7.0 #2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260307011249.GA748682@ax162>
References: <20260307011249.GA748682@ax162>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260307011249.GA748682@ax162>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.0-2
X-PR-Tracked-Commit-Id: fdb12c8a24a453bdd6759979b6ef1e04ebd4beb4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4ae12d8bd9a830799db335ee661d6cbc6597f838
Message-Id: <177285802716.165831.7642724864177860710.pr-tracker-bot@kernel.org>
Date: Sat, 07 Mar 2026 04:33:47 +0000
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 6 Mar 2026 18:12:49 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.0-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4ae12d8bd9a830799db335ee661d6cbc6597f838

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
