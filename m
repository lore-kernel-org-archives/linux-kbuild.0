Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D18E37B407;
	Sat, 12 Sep 2026 23:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789255533; cv=none; b=Q1NCI+Ha1cNSpY68PyHNgrteS14tJg/b1QxdwkhD6KQLyHZ8ds2F+bMcQqRLVisqw6S0nji8dc2RDsfyTeoFd1hM8w5xUAR2toDvHD2Ww45/rBR0XZGlmG5G0FJ6P4j9HJqUFbArmLoWu+Xnel21Ojo1M8sBX5t5r/TtrQveP3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789255533; c=relaxed/simple;
	bh=llYuSIHYvDL3muFcLNHhfqmtKEgSsGiOxwF2RaFxMtk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=uFzTj790Yte2ykdpfXSCLMDPWllv4oPWJKgAcMuA+po5iN0gzvEjxZF5oVaIQunHCH35ROTt0/VI7QYQBF+VbLVOz5wpvuJCYpDTNyiHS775GFe+1+WlrDQ771cItaFAlSpe8nz5jm5MfhsWZxgMtT/bNzM5fQ5gfnWqcmPqGk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWuCvqUm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWuCvqUm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F631F000FF;
	Sat, 12 Sep 2026 23:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789255532;
	bh=S92pSckPukZ0AQmCeA839/SK0lLmHulHtc1sHsvtmdo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=oWuCvqUmx7Qage/SNsDUHR1o/zEN9QTv57k7HWQH5T4FhoxATFO4P5EWpkQhvrXZV
	 zKQ12DJL9N6JrjIg+PPYwWuCIo4OUn+Lh7HR3PkW8JGUrxl/guwDR5r5t/RxVVQQZs
	 W1L3EClw5Z5EoOs5jeO4t6D0S80o8X/i+6prqFDt83SscYVpm4TfSjzLbrQc4Nke5A
	 W4ktbRatK69eRcHCnXswPdtKukH6ZbC53FKXy4UiCpfZhlk0akHtZHNv2KUl+8EJ6N
	 BMgelhZCJJRzgKlB0vr+E4Frj6/j3dbtajYJaNnFHCn/bxqWva1k+liKDfGQ1LhqI7
	 9SuRFWtFz4zTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56BD53809A22;
	Sat, 12 Sep 2026 23:24:29 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for 7.3 #1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aqWY3gsP1nBj7EjT@levanger>
References: <aqWY3gsP1nBj7EjT@levanger>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <aqWY3gsP1nBj7EjT@levanger>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.3-1
X-PR-Tracked-Commit-Id: 59351365ac271b5e0eb180f211c531476a36221f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3ce99a68f7d5b878a7746d479591a18651a8238f
Message-Id: <178925546802.3683640.14250979925457913724.pr-tracker-bot@kernel.org>
Date: Sat, 12 Sep 2026 23:24:28 +0000
To: Nicolas Schier <nsc@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, Vlad Poenaru <vlad.wing@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 12 Sep 2026 20:24:30 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.3-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3ce99a68f7d5b878a7746d479591a18651a8238f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
