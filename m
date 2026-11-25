Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795576018;
	b=epIr3ltJhFmjq9MCtdjUWOFZO5AQvL4mngYitpjIA3TvZuWVbpAv3HLW5YWx6Vtpkw7z
	 TI6Hn6kzQm6mQ+MvhU1CgMEKoznzTR7C9uyiSu4rJTm6spBLoIu1u4WEy9dKmXbYyWXKD
	 6fO0jhZTrJtS6Pdw1RjD3OD7x/HiRBFIAcaMdcQ3uy78+kx/dAfQ6m18mkjqH1bKMghPd
	 kLhNvbiHmifYQoX/P2rydh15Sj3tFScPcSJCKvxnPBf3NwahYUA2qIOKMG5JtI4hCavRY
	 vHMAvYYfhsd/VMxgrcY+QRr1alU+WegD0qoouil36aRwzB+QtGEDCY8Dodjea/5wvag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795576018;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=X01M37vtnb5PSXNYqW5T1ZO4yds6vtXWHeZ1c4iujGk=;
	b=OOsK272lz3I8nCDrAO5jmFA86cLGJh3FGmYE0Zs51Tv9BM7YHZCL+apBXPmmt+XMNTR1
	 p0J4KEzDHIY0gnxdjvWalw6Kmqo9C3udyNoK9GnJnHD89Lpn/Sh0zVWOZ3b3lpHA69ltS
	 XXq4FlX0rcT0TiGnPnwk6foqIvNJmFtx953qjbmQCMjRd4QRMgU5i/CtkDUE8Ypdtm+fI
	 HcVHUVbZ/IXCudg0hh89SRk1vJZvsCVeBQLAeg/AfDaat12I9NS3GQDSPlj45zmXdDTJA
	 BNh7vQznH6pnSxAxxOKQeurbCy2fmfMrrcDEm+sL2BXn5jsiajnNvl6C3ldkXx2pTyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HQKL3oMn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBF8606A31E;
	Wed, 25 Nov 2026 03:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HQKL3oMn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444F21F000D2;
	Wed, 25 Nov 2026 03:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795576018;
	bh=X01M37vtnb5PSXNYqW5T1ZO4yds6vtXWHeZ1c4iujGk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=HQKL3oMnFS/+I/Xv7iUNnk/iU9YMtZSIqJm4vIPBq+aU+Q+xDXTrkbr8IzC0DfTbH
	 DWID99xnxAZTBv/InS2RiZd0R7e+wTnuxdyndf1FgQzTjbYHgra7LiAkYUraWQkx3d
	 m8WXnwHZsDiRi4lYso2QRvHn3HqbCQxXeS0t6wXeOducT0ulub1XkAX4Zez1gboQYx
	 655ulRSw74H9lKZNBdc6tOVxDm50VNZHTZ3Vjs/mbDub/0i87y5N56JYqDl7MGSY/x
	 mmYcADi0qMO2VdSSQfkjkr4LfXZ/n46xQ8y/UXHdIkiM/a8BvVB06C0ZCX2+Cr2XA5
	 /F3858/Ghs/6w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A4713808209;
	Wed, 25 Nov 2026 03:06:58 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for 7.4 #2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261124035200.GA1950519@ax162>
References: <20261124035200.GA1950519@ax162>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261124035200.GA1950519@ax162>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.4-2
X-PR-Tracked-Commit-Id: 3df238d7a9f5ac7d78115958fd7a36139f61ca34
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4ca7b0f616629ca70148c45707e10455f3135fd4
Message-Id: <179557601676.190026.8943913611717875396.pr-tracker-bot@kernel.org>
Date: Wed, 25 Nov 2026 03:06:56 +0000
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

The pull request you sent on Mon, 23 Nov 2026 20:52:00 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.4-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4ca7b0f616629ca70148c45707e10455f3135fd4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
