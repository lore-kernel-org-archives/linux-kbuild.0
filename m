Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFC218C02E;
	Thu,  9 Apr 2026 23:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775778820; cv=none; b=sNRabKtAFs2Y1JMt5BppCFmYPheGKTvWDRRA1dDH7dutoRpGU+CsljjKG41MfQcdK3uyAzSXgA0M4fX53Br6Ps4lAQGYit9YbhwoMsNboH4lPdKGKqORhw5VFdZGvFfDDknNwLQtn72iKPkgfpv/TDSd7wsYzW9yiwkoqXsmgNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775778820; c=relaxed/simple;
	bh=g1Gdt2kg4PkQzeAkWvFP5O4RFFphl7dqFtdqqckpPnU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=UoYn8SqxxNzJJRlaFF1h+2P5mnNHvwhIwyPGjZEZ/4rf81NXaGymgDfeIl0939mjLXeEmxIWxxFYMYI7JovyWc1ejpOKOjR4kBTWgNd75yjXMESs9WFBhQSF6bo1ZSpNLgs/xlv6xxaw+m7IO2ZLc4EMXEwepStigUP59J5Lj1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJUr1pLv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJUr1pLv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13BB8C4CEF7;
	Thu,  9 Apr 2026 23:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775778820;
	bh=g1Gdt2kg4PkQzeAkWvFP5O4RFFphl7dqFtdqqckpPnU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=DJUr1pLvY9lLCLWz1JUEVehtErGwa7Udq66+scZqyIc7f9EnF2Idxn+DyUjvUOHIE
	 kbs7alzwO/SJUka+pV6EGt6D1BD0HCX8l5wlZElBiu3bksJRheITw8Tu+sSFl63/Z8
	 UqCA/fIYd1pSCTKZaKdMIHeEnlnR1yo6JZHY/BADWGkDUkMy8rufzDAjQM9Hs1dbiS
	 +qTw/YgcGaKryaJsi8+UjfdgMFb5QG74TJj0bMmAPgNuPzp+wI/uqbaqE0OsQwez8i
	 cVWCDoiBGNwwK/6pHXzrF3gfyhg8UAczysZxPy+kd+a8V2xcxTW04QtKmLbp07fuiI
	 oxQoh7Qvcs0Gw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CF173809A22;
	Thu,  9 Apr 2026 23:53:16 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for 7.0 #4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260409231842.GA3337002@ax162>
References: <20260409231842.GA3337002@ax162>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260409231842.GA3337002@ax162>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.0-4
X-PR-Tracked-Commit-Id: deb4605671cfae3b2803cfbbf4739e7245248398
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9a9c8ce300cd3859cc87b408ef552cd697cc2ab7
Message-Id: <177577879499.1790481.9241369522116748103.pr-tracker-bot@kernel.org>
Date: Thu, 09 Apr 2026 23:53:14 +0000
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 9 Apr 2026 16:18:42 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.0-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9a9c8ce300cd3859cc87b408ef552cd697cc2ab7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
