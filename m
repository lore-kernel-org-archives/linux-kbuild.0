Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171D03B14D1;
	Thu, 25 Jun 2026 16:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782406195; cv=none; b=chJQKH+8ZcNhvb7WsOlnEf/RU30MgrXmHWRWUWlEpqsAnK+X+M1fm9GLXE0fcHF5RcVauzl/Qsf7xebco3jAwsr++ta4QftuOIIhf9mX2f612v9k/Ve4WQpegmlZEHaOnCI+sLN/1JtL9S248GxJygNH1dRSaT3Casv1Jj3AH/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782406195; c=relaxed/simple;
	bh=+STH6SsA9FaT9trcoF+zZ2CI1QOCjmB5ND+4C47zdk0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=foVmvTdU3/G4M2Q89hL0+BIYxX1TE/EvNTKstEqzjppR/3dDFNCTQPK72go64b8E2nx2f7Nv+zKjCzXEw8W+k0g1Lv9JEsi33nUop8qxC1XUdUgRP1ZIj/JlFuncQb+ErTTgo2Zy5QwZBgkoZVi7x2kExYqo4LxXczznzXynEM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOuUN4a5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOuUN4a5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECCD1F000E9;
	Thu, 25 Jun 2026 16:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782406193;
	bh=ImKjhJ/K/IMrh35in8J7zgCcucCwpESfnkyB0KTEpvw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=OOuUN4a5K432VQNOJOWBFjT6Og/YPDFGR5c6/0TeSPVsKh86oMfm4ZXeqN6yBE2eb
	 4RrtolIloyg+usYbaTN9x3IxRZ2IvXaaw1D5rZH8D/4arz0cuHYUgKXH/FFBvEaTzZ
	 Hjf5wUIIYgg6UkxTJcoGs3LaKwu6pDBcL+7PV44H4K192Dz2C21Qh23ZYmf2sEK0B1
	 15X5m8vVz3fzqnmpukR/lqIaPXVxFOIGUvykuI9+rUL93cpY9XS6zGAJ2c3bj+4+bL
	 RD2FPh3woxP8neBZoLPfdRe4UdNN7yA57/m8WhGrqnlY1m0jq3yOTEnYhn5WAcPgft
	 NZ6mXsfllaYlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93AA43938789;
	Thu, 25 Jun 2026 16:49:42 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild updates for 7.2 #2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260624225711.GA1132314@ax162>
References: <20260624225711.GA1132314@ax162>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260624225711.GA1132314@ax162>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-7.2-2
X-PR-Tracked-Commit-Id: 645323a7f4e55bb3abb0cb003b6b9dc715c8dc21
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6cc37b86f80985774809aba82283fe0d564d870f
Message-Id: <178240618122.3815539.5269824950971859636.pr-tracker-bot@kernel.org>
Date: Thu, 25 Jun 2026 16:49:41 +0000
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 24 Jun 2026 15:57:11 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-7.2-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6cc37b86f80985774809aba82283fe0d564d870f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
