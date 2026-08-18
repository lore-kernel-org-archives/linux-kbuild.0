Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EE4486BBF;
	Tue, 18 Aug 2026 19:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787080549; cv=none; b=qp4t9aLG5py7zZaMrJUMz4FPQWyNrZMtl7VDEOxJrJxLj4IjGJHV8IlYosfxUNk4b2CWh8ieIpAhpWfzJmNF2iaEANmZ3QdWYpK7nOlfROCZBanp/W2XB1ZiQSdWmtrB2QqKdjWftDljKgzOksdi9uN9776t388M7mm2woZy63I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787080549; c=relaxed/simple;
	bh=4qzseEJj5T2TSog2KpbeiOOjeutWQaX+LlPg0m78nRs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=RRL3HoXXYF/u451iCfJcA9sSR/2VKonJuo8cuNpHnoWFy3Br4iwjRlsa/6r4vnP/5CmxjcV77DrX2WalI4Ri1cNgv8hoQF8WKsv5g2KH9L1tgTP5Q6cV9JgXNVWRLRJhnsMLhllwJv5AV8fB4eOMWvI8iA7SLVa3qM7hKWv+lvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4+up3BW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4+up3BW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171141F01565;
	Tue, 18 Aug 2026 19:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787080536;
	bh=abqWOphIYx8cTSTuO9hGpyCWO7gJpSGtjhllj+lJbB4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=k4+up3BWdBFMrjbzCffBZuF4iF7cE2c/0VG/QmEfpSDJM/tzDYdQcW3Kt70y2Rp6Y
	 T8CnSK6U39G/4fXcfiMOGwflz/yACViiCAbqbMQPx+gQlNrdDrSrPxC6JlR/8PM7QQ
	 Tg0j8wIvgafTttLxorWOhxsOxEgbVFNJa2+lbPSH0Az7mX44QMezg+iYS1NN5sCF0P
	 hNCCPa0Br4owL0l4BWlmUNe/oVe8xlBU8bpzk3G6VvvmK2qM7Nv+SiXyLnfTeqkHVT
	 NI6n9zSJtLDSTJE9uPEcTTD+yRM9yUWRh/bK+y/4KRmwPLp5SNr8xDPvjRvqaZRdlE
	 yAMiJTTDBfinQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0C543927051;
	Tue, 18 Aug 2026 19:14:48 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild and Kconfig updates for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aoC62sXUrC5okGsd@levanger>
References: <aoC62sXUrC5okGsd@levanger>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aoC62sXUrC5okGsd@levanger>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-7.3-1
X-PR-Tracked-Commit-Id: d900723d78adec229996aefbab0dcaa66a177b77
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3abe3d0223dd1ceb3af6543b71db3856762603a8
Message-Id: <178708048735.2235733.2639923477514667539.pr-tracker-bot@kernel.org>
Date: Tue, 18 Aug 2026 19:14:47 +0000
To: Nicolas Schier <nsc@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Ben Dooks <ben.dooks@codethink.co.uk>, Bhaskar Chowdhury <unixbhaskar@gmail.com>, Breno Leitao <leitao@debian.org>, Elsie Heck <its@elc.moe>, Gustavo Luiz Duarte <gustavold@gmail.com>, Jani Nikula <jani.nikula@intel.com>, Julian Braha <julianbraha@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Martin Weiss <Martin.weiss2410@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Huang <sef1548@gmail.com>, Nicolas Schier <n.schier@fritz.com>, Nicolas Schier <nsc@kernel.org>, Peter Collingbourne <pcc@google.com>, Petr Pavlu <petr.pavlu@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Robertus Diawan Chris <robertusdchris@gmail.com>, Rong Zhang <i@rong.moe>, Sergei Litvin <litvindev@gmail.com>, Simon Glass <sjg@chromium.org>, Thomas Huth <thuth@red
 hat.com>, Xi Ruoyao <xry111@xry111.site>, Yuntao Wang <yuntao.wang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 15 Aug 2026 21:15:38 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-7.3-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3abe3d0223dd1ceb3af6543b71db3856762603a8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
