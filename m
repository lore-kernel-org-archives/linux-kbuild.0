Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5541332ABCD;
	Tue, 19 May 2026 16:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779209242; cv=none; b=S1VEg5bcHx16uvsO2k44T3QIuAkCbET1OLXA3MmcY3TUb0Pfqko7763b6XzmNoC2e7Ai1ocNXoK34I6BzgX8ArqhTuuN63eZqSlWU8S28Gop6vQRung63RLhJQni/2r/39F0vuB8AL/CJGKyrnrnS0o+4PESNp4VnWgH+gUve2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779209242; c=relaxed/simple;
	bh=MtePwgsLJ0/7c3e4hGtrDj36L+yXI8B/0GDpbIa+afk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Fh3tD30qeEhZPP5boQYTIluWauq1mdOChC0/p45OK9NC1rbScvtDa6oNjRqDiTxlKsG9JgJy+hKyg3uGHoI5rm/8dVMdsLjhzqAT2SXlTX9kZ6VyxtKxA1fEED+VJ970Gu/mV+DWyra07QHH+dT++tSEGQGDg1Zpp4gTUdkSJmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avjz4dTY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avjz4dTY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3310FC2BCB8;
	Tue, 19 May 2026 16:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779209242;
	bh=MtePwgsLJ0/7c3e4hGtrDj36L+yXI8B/0GDpbIa+afk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=avjz4dTYNGSL3Q91oOVQt21KCSfQNazyZoCYm9sTwvSZSlQyX0M+ZtHzNhLHIXKJC
	 X6rUl46p/1nsys2qaszTIjfGjNgNK5Zey4PpkOJo2E5g0msnh1zxPfAb1Z8FaBFOkf
	 /hylW/mTHo5s2eFSu8zghpF47Ufh+VoFXIlXNMN5zxrmbrLpZB8U1zc/JTBE4kqf0Z
	 qOI5NGjTrTa+eR3S15h+49EARnqfC22uYbQBKaM3ktKSlCsmDzjVuiTtHsm8Jxz+HH
	 x0Qt2KyXkVYL5w5VpQ13wqxb5wnnfPLjgJW+ZIlis3Ib1SaH04NAtz4GzVEcZcx6a+
	 Hevxg3+oaNQZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56C503930E35;
	Tue, 19 May 2026 16:47:34 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for 7.1 #2
From: pr-tracker-bot@kernel.org
In-Reply-To: <agw9cJdbgFDGXKNj@levanger>
References: <agw9cJdbgFDGXKNj@levanger>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <agw9cJdbgFDGXKNj@levanger>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.1-2
X-PR-Tracked-Commit-Id: 202550713128da20d9381d6d2dc0f6b73839f434
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 650d21334c4fbbdbf085b9f542cc530a7d5cd4fd
Message-Id: <177920925303.2803208.17735416279066144584.pr-tracker-bot@kernel.org>
Date: Tue, 19 May 2026 16:47:33 +0000
To: Nicolas Schier <nsc@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Hasan Basbunar <basbunarhasan@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, Viktor =?iso-8859-1?Q?J=E4gersk=FCpper?= <viktor_jaegerskuepper@freenet.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 19 May 2026 12:37:36 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/650d21334c4fbbdbf085b9f542cc530a7d5cd4fd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
