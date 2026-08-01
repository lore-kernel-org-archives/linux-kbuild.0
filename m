Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673593EAC8B;
	Sat,  1 Aug 2026 04:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785557669; cv=none; b=buKRw8BMh9n3W3cq86y2NjDftrnv1Pk4VwB6rIU9QbK5wnpKY2FMxoWKCGP9mhmP2BpL5CySCaAaTPBJZA4qPUcXOvt633fYx613gL8MPH+KepizDD58YLOXu77GvKuey427QYzRVnR8IogKzTwDAOBmmS8RQ1u1l96IC0hqphg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785557669; c=relaxed/simple;
	bh=L+4zBx2ZaZIEJTFw8On55ZOk1eKCmkLG68McRiC/wtM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mNny/xB6sdpwf4N6yZnWSbZN/pmJfbcq4kEb7HGYf7nLhpEmYBwu6Q9761KezOTGuE1wIZ7ouH6HcbFVz8le6zXkU/nDoSpQ1BN5DmJjgAwdSNzO3C/wQCs0cMnX9oiB63kHs+PJeD9+L60X9EYS5sECXGwQ/JD/j5goYDhZtPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cevmdt+G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cevmdt+G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F87E1F00AC4;
	Sat,  1 Aug 2026 04:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785557668;
	bh=WD5Ax6u2RvfoVza16XJhjlqCeRHrkZKECC16qrIsBZU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=cevmdt+GoIereOEz1oFsM05TUPX/cAfajecYdvBmREI+NjUIqWuYfNy5bwnA+do26
	 7utiqX2ryQSiVQ9yvL5wl2yk6Crp2djl+CbhXYPL7atp9gTZCZ+d6olw33Xz9qkdDY
	 mK27oXKMkt5sPgoEq5Bz3lk4aUDCxao6LhT8gKLsFrxaoud7hMzAL5BXf+cv7pcSMD
	 CNJS+r1sX5ptEL7MkMLREIU8csbmqgdUpsvxyniMVs3TUDbXM5ngxw/quQx5abyJno
	 xPjm0L3/bqJYUjv3EwHbvHIUXGRYkjp6qeDH5jRdNhm2KLHI+ohqvTmC73yX8bQHXo
	 F5Xu/wC0MxW1g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AFA392665F;
	Sat,  1 Aug 2026 04:13:51 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for 7.2 #1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260801024558.GA3862889@ax162>
References: <20260801024558.GA3862889@ax162>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260801024558.GA3862889@ax162>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.2-1
X-PR-Tracked-Commit-Id: e5a259d98823a93459643b239b71fed7589ab669
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 02dc699f83d04069fdabc996fc22d47cda47a4a9
Message-Id: <178555763030.1016574.456009109526804823.pr-tracker-bot@kernel.org>
Date: Sat, 01 Aug 2026 04:13:50 +0000
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 31 Jul 2026 19:45:58 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.2-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/02dc699f83d04069fdabc996fc22d47cda47a4a9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
