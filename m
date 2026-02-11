Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B00354AC5;
	Wed, 11 Feb 2026 23:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770853482; cv=none; b=EYm0UCSG1533EU5jzszUEEq9njKo+19Rqk2dTLuFTk62xckEltdM9Bn22xcz1UNrvNJ/2OeGFanU0uz+kydjZYXFqO+ByHlAz89CIcmL0AHs+sxyhgMcWXGIsP8rqBrDs0Dd+b1rFcOCwZTHse9+F2wv+eHy9sjPXSYUK6RiGss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770853482; c=relaxed/simple;
	bh=rjW5tJKg3bDSJoUD5tkcqWiOfnFlNMQskk0fs8QNLG8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=A7+4J99zDB8uLDa0QRLZD32G+f+EQe7Mdq4fkFv7b+J1lvRSfOHBDqfdxgc7cqFO/3iADLFUy6yJJV37MzBPYDaf2N2Jw0vsRwXvPpmdJg1BkO3q/Gjpx6Qd8tVctklJt1wT3JiDyJLhXBgJuwCWzpDXJ9vNXj4Lfa4L9UqcJpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=buH4HR1r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="buH4HR1r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535B4C16AAE;
	Wed, 11 Feb 2026 23:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770853482;
	bh=rjW5tJKg3bDSJoUD5tkcqWiOfnFlNMQskk0fs8QNLG8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=buH4HR1rnk+SS51QKbQp7UC3/wnT1Our5MMfH4ZAuV0vemlG+YPbnf9SF/cB9Wap7
	 QcHi8QxB1LbMa+1kS2oW5dHvj/yrmxnokRz9eUD5RfQ9Cyc8uHPdrT2i1kvOuceA6c
	 nMpot3dyxJG/shoWN3B4JBPZSoCGa8+AwwI9bNBcq0H7r/UalHeMxzyJupI+Dl1Fy3
	 Jl8zirYbSZKDTk6pN/TDg78Me+/ytaeqzFWsA/ibJohI1LkLtiEYhqO1QMpJepLHkP
	 TCLjwjZaxCq6if4SInXXdOL1T6yqXqylxwCU1fqGGGXikimnJfmvw01cMflfPo11wx
	 E3iFdFdpXfnsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4817039EF966;
	Wed, 11 Feb 2026 23:44:38 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild / Kconfig updates for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260209223615.GA3506796@ax162>
References: <20260209223615.GA3506796@ax162>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260209223615.GA3506796@ax162>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-7.0-1
X-PR-Tracked-Commit-Id: d8ad80a85b96649a6ef30976762660245ae61a25
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 41f1a08645abb5ef7d2a3ed8835c747334878774
Message-Id: <177085347692.796778.944210639190792864.pr-tracker-bot@kernel.org>
Date: Wed, 11 Feb 2026 23:44:36 +0000
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 9 Feb 2026 15:36:15 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-7.0-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/41f1a08645abb5ef7d2a3ed8835c747334878774

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
