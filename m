Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BBF30BBB6;
	Fri,  5 Jun 2026 18:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683648; cv=none; b=OFKqTK2faNvsGWbgwyrUYZ7p6sz1MGYdv63tuyZit24Duq3NmDLmnROBeRMwMkB5aKB1rDcUV8O6mygqhieX/+MlJ4NUAgJ8L/3pdXlB4y3I1OV0O0Lz3r7BqBnm9QodEiFXhQYaTCq5VNNVeiCwn+fEieC/agXf/WT+U22CyuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683648; c=relaxed/simple;
	bh=mZ3fTA4iI4vWT2dtk2vCxFzWoW6f7mATzi20qOyNJd8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=uwipLINmzjzr8/qyuCWuw5J8k6py1fa6T/TS9BqMb6IGXIuK6885L9i4rm80NjTLrE/8exdoCKFrzhnvALvdDNv5yybUvNXyah2qYfGyxB9TyaSWWg4bjI74kIbFRt8IJc1EesCtrqEUIv/ydh1n7Dh9MYw6ejZQA3M2rhLp0VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfTDqO5c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfTDqO5c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C584F1F00898;
	Fri,  5 Jun 2026 18:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780683646;
	bh=NHnk9A1yfW3eDwkIsjx32vubqNfD+idAZp9HhZfrS1Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=PfTDqO5cQspgXbu/3v8YFUvIEl6p4x0QRQTpDipms1j1vYlW4xIcubOxcgLd/L4+W
	 y6+tRXoHW/VfrO9xKUbA2YsXMGcBePQXcT/M2ilwTbO8oauwmDT6pzdd3rMp2OXnIy
	 fW0eYBtqDi3aPZ2wk5zUyyGeUn+vghoWVzL/E17qzpdfYMUJZgRHj9iYwg9uW/8OK9
	 E4uDyqNV4TmCo51DQXZQS6fC++BqqblkEAQPKlhxYNPaeUnSUYehTE2UpopZXOPMcf
	 J4w3fHRsL9wKF6Ck/1JjBQh/Nq4oSJbFijz2a9yFlGZSLuGjZqVXQjolb4xghOXjKQ
	 Pd2wcbKeqZiqQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569943930BB0;
	Fri,  5 Jun 2026 18:20:48 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for 7.1 #3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aiMJm3Fcph8hwlul@levanger>
References: <aiMJm3Fcph8hwlul@levanger>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <aiMJm3Fcph8hwlul@levanger>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.1-3
X-PR-Tracked-Commit-Id: 65b09bfa8aa7ebe087093b591525385efb2d58b0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 06121e12c27aef6e1a09b4cdec809b9c91f6eb59
Message-Id: <178068364707.3872199.15625876309594355666.pr-tracker-bot@kernel.org>
Date: Fri, 05 Jun 2026 18:20:47 +0000
To: Nicolas Schier <nsc@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, Zhou Yuhang <zhouyuhang1010@163.com>, Zhou Yuhang <zhouyuhang@kylinos.cn>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 5 Jun 2026 19:38:35 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.1-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/06121e12c27aef6e1a09b4cdec809b9c91f6eb59

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
