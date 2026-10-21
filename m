Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616656;
	b=r7YPufP9rOiIqBJWY4APUPfkwSDtxc5UrKJ5GKx3VL35XfWuBpH2ahatokAAQrOZOiF6
	 uat/uzfqUJ9pX+pLHwKnllSPtdyj8zeTN1eZvAmpowBmKsLJaGLfZ5sfw5HAPQuWr2bGc
	 jcs0mtcuP3TBzo8u9zvxaoQaXGpFLp5XM5q2/cny+gB+Xl7y7QyBL5ldQx32xDXJvddSj
	 Hv1kwY8Hr6FhtU56EBVrAqphqJq3qpsVXFkiCbWEh6ZBlt7ggIgtvFsAD+HSRY2Eq7jRJ
	 ggUmYYSDeqe6XiLNw0qD8Isyb3J7Njvt9uoIpQlZ7UnW3MOFQ70sCsffjowxf1VZeYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616656;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=o5y/fqfKLMDRn/adOUldnNTZ3hYv7nIWGIZ3/2e7N3M=;
	b=EZ8ZmaSfQ1s4M/AfwtQfxU07TvIl9Y8JFSHi3h3G1NwCLuS5K8V/WFGzPWWgKW+96hjc
	 /1r6Y9FW3EcQw+VihEjlhhZo75OvPhPgxW4B3JI0AI6mmPOKL+xu2oMZ7yWbQC5vlkIlW
	 BjKjTV9q3H5FDuf+SIksFPhZdBYAxDOOXXFiGNflRCrVygd1tDYsXCBRfdhWPdSEmVVnL
	 D58lFflMN9QSgP/28Zvgf5r7+ysZEtOIn169MnEJPQkjz3103rw928YDqxFdueMwc5sQM
	 j4lor1U0/JeSk6tnAN6mlwnL0wGE3xRfPy7zKcmoO+12wslmpG/07eLGFZgg6F150yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YsrN+EGB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67904606A323;
	Wed, 21 Oct 2026 21:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YsrN+EGB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4545C1F000C1;
	Wed, 21 Oct 2026 21:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792616656;
	bh=o5y/fqfKLMDRn/adOUldnNTZ3hYv7nIWGIZ3/2e7N3M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=YsrN+EGBEr5pczdmobZW6agrnq7E1gjfFVjWuKmSLSbcdBiDqlnkTGikbBW0GXB4M
	 KmhfDW1kObhE+Shxk0ab44WJ0CPe6usZbi4aLNbGdiRQHf62pT3VxGJ1QA6OCH3sjd
	 WeyaeivwFDT76Rmq/ZeC+iJJKobGl7Ez7pfb0kyebBayWIISHlzBZ6hcjeRJlx3ywE
	 14zFX+plrd4IU/QlRVxGnWlszSw6KBdG4BEqzmpm51/svcouSZbniR7aXTYEJ1OPoA
	 DZtWHqZ4aOREDwJgnzFd9NYUC6mC4yqQJ4Jdtoi7Y8M2LB2U1nPnlUtJjC1aJQVCib
	 4M7X4GSSCNdYg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2FE380A962;
	Wed, 21 Oct 2026 21:04:16 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild / Kconfig updates for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261018035817.GA2365306@ax162>
References: <20261018035817.GA2365306@ax162>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261018035817.GA2365306@ax162>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-7.4-1
X-PR-Tracked-Commit-Id: 997208ce9f43f01febac956cf9aeffe89945e3c1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bb29b957eaaa15be33243550d9ee576c2d601669
Message-Id: <179261665480.1307528.64120501098618904.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 21:04:14 +0000
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sat, 17 Oct 2026 20:58:17 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-7.4-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bb29b957eaaa15be33243550d9ee576c2d601669

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
