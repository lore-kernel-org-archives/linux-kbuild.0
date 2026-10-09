Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B463176EF;
	Fri,  9 Oct 2026 00:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507384; cv=none; b=gD10L0BwWxjlbc0RGibsRgJp708m6iYoHE96gEbzltgvEeKf617yLZ8yr9u5tDn4tGEcK4nkaByQzN94KSorZDvsggP+UWyPuHCG2/a8dtetS2NISviq3CH+tZ2Ztu1j/VmKyKpit4J5mbB4trZ7dNqpgiQOyj9fNVU/qys+bI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507384; c=relaxed/simple;
	bh=wdLjigYZjy8IjBIlWCmAc4XLW/tD8vl5ODF1pmAi5oM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZEITwIx3XrLZ9ivwYQm3Gvxc30bVQgMeApg8le+w0fIB9NL7G2NhycDkST3mgdbYSWZwmoC7ruHDJVbsaMgSnQHsucdvBE9DiYZu3FGtJMSO2ZxdNosDRdJEnQMO+az6SKF5p8KF74avTCP5bTbMxhlNJSkBjfopMAAusHf66HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aw5RMIkW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aw5RMIkW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A6B1F000FF;
	Fri,  9 Oct 2026 00:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791507381;
	bh=pm0kTSMT12s8o5tLUX+9ptUiwXok7Gmw4DJmohvTw2Y=;
	h=Date:From:To:Cc:Subject:Reply-To;
	b=Aw5RMIkWMtlfi7pNlqoV1IuIVzsUwVt9l8vRSD5FyTNFJRI765VGtGcQRGJIKOD3H
	 PdzA7VCaU5O1OokFMmVB2IuUfRmnKMTnEb6jVb5kZb2lVawzy2eJJkx900ogdcRmSp
	 5MnCValPufJTgb1E+aRHcQD6Y6J5e84mcFzESolOwVDXJ3S+etKCuW+zkndiP1Pqyr
	 eJV6o6nupGZ+qCM7cTCyDGztsNNno8kwmR1W/sOeWX7B6fpsB9nr0s0vIMJyqcYNW5
	 Iv7JYUCBmdstpA7/BjN3Snxw5J05Hi/oX9E6oMnzd9RCZiNPLdNQgoDccpU7ybas9Z
	 j/p6UigbmCohQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 51D5DCE399B; Thu,  8 Oct 2026 17:56:21 -0700 (PDT)
Date: Thu, 8 Oct 2026 17:56:21 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org
Subject: [BUG] Build failure in next-20261007 and next-20261008
Message-ID: <0ddb5e5e-f801-444c-aa98-0cfe814a3026@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!

Building a kernel on CentOS Stream 9 from next-20261007 and next-20261008
(and maybe others?)  on an x86 or arm64 system results in a strange
build failure featuring:

WARNING: Unable to reopen jobserver read-side pipe: FileNotFoundError(2, 'No such file or directory')

However, a kernel really is built, and restarting the build immediately
after a failure succeeds and generates a good kernel.  Doing a "make
clean" causes the next build to fail, as does changing a sufficient
number of source files.

My reproducer is:

tools/testing/selftests/rcutorture/bin/kvm.sh --build-only --allcpus --configs TREE02 --trust-make

But a simple "make -jN" suffices.

Bisection converged on this commit:

48ebe1cbbeb5 ("kbuild: compress the kernel with pigz if available")

Reverting this commit gets rid of the bug.

The bug does not happen on my ancient Ubuntu laptop.

The failing systems have a pigz command (which complains bitterly when
run without arguments), and the immune system does not.  On the failing
systems, "pigz --version" gives me "pigz 2.5".

Do I need a specific version of pigz?  Does this commit need a
version-number check?  Are my systems pigz-intolerant?  ;-)

Less flippantly, is this a known problem?  If not, what debugging
information can I provide?

							Thanx, Paul
