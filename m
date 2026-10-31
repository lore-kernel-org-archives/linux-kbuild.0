Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793405951;
	b=xxzw67UHCX6sgGcLt71O7n4Ud2zodNZ8XBJ8EsN2/UizN66Siw15PiuHaUINJXpMVUut
	 HTSeAZ0MBpEpcOYoDjLq0BtuTFencEG4HfT2LQxywIlfUxZs+sNds/VD7yvbcoaqJdbzT
	 /geAZ4r+1p39kzbhDUUPjJtOkSgtPrpoV7KaKRAc8ds0A/R8QOUsuidl2td/7c0AaVJEy
	 7ed5TtaTJpszJmbEY+jI8zH6ReXQUUBLKWo0moTBjkxCF919BgEEa+JX5UGp7wQpKpFJ9
	 oIiY/s5aHQycmUj4+FjS+vMdZZKC0QTgjSuq7QcIkW0SGYAQ5OQ25PaVRArpFKQ91Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793405951;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=A5vHY0zFk1wHIdJy6iAnmdXIF06qycPUmmR9zkAgR1M=;
	b=CemiJb3NHlp+KJm9IfQ8GK9W1pN30A1oNMF8gquppnRgFOOvcuyQV61gs5yEJkxWuts1
	 GUbMsyIhP47pygFqSPVtwPBGGNpOExpsuCpKI31mBhU41RgRYFPkN6WWcGHMLhF5BrDnx
	 oiXy2QJBHqBMEYT/X9r9S4vHX2I8dpjhdX880gKPw3ytv+Gd73zdaRo4aAkvOwJIWoI7a
	 exwxM8oHkM9OSPdTd/QvtJ2FJF2iY+rMQydfUsS4n3/9MLRvGdg8hfXwSE4PxTTqg5Klq
	 0OT84yTZQU9O/rrBP6nYJyk/2taviPaj2FlrjhL1obRFt4deCIOWQzw1Kn79+QUAoDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QsYdoxs9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A19C606A31A;
	Sat, 31 Oct 2026 00:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QsYdoxs9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 149821F0093A;
	Sat, 31 Oct 2026 00:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793405951;
	bh=A5vHY0zFk1wHIdJy6iAnmdXIF06qycPUmmR9zkAgR1M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=QsYdoxs9WlofaW2IEb97wPZfG28j9qd9r51ZRs5YdE26Y46KdOsW2UiU3x0NVfAdt
	 K36PlocP2kR54wVb/ENe4PaFzP97fjmtCn7bSAIM0ubXzHrDo82UnVWE1whKs4TJCH
	 tkYEdxynpIHBZV5ijGlS5nKmRsyqkUYiqN8zvzxi+GEV0bGlDEWLrYyaJCI8xxFUM4
	 5Gnap4aDNqfUUfksM6Sav6HWdbbE7EJsDatIIGuVlWDXLkZWi4O2I/QeXVKjwUzbea
	 C39mfIpfZRtCHSC4HClrsu6ZDXq9So0Woyu6UqvOzF+OkUrgcgrfD4plsdpmu8io5C
	 PECWXyS78xo8w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 030783800478;
	Sat, 31 Oct 2026 00:19:11 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for 7.4 #1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261030192517.GA49624@ax162>
References: <20261030192517.GA49624@ax162>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261030192517.GA49624@ax162>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.4-1
X-PR-Tracked-Commit-Id: e58096244338308dde3fa76982c8042981ddda52
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e823910506ff3a34fb2966a9ecccc4019b2154dd
Message-Id: <179340594945.1860975.3110684212237578140.pr-tracker-bot@kernel.org>
Date: Sat, 31 Oct 2026 00:19:09 +0000
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

The pull request you sent on Fri, 30 Oct 2026 12:25:17 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.4-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e823910506ff3a34fb2966a9ecccc4019b2154dd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
