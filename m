Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A3D27B50F;
	Sun, 17 May 2026 19:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779046341; cv=none; b=UcYCPkxsU6ePilHTi/dzW7wryWCzYkcnccwwcr3g05EiGxQ67jqehqv5vaqLGEKH/pqDSqVKpBSloXrvkJUDVZRH0INKWdHBMNQkK01NJEhkLvKcTnn2MFI17qilRJSMUdP1sJ2dEFV0g3rVnHml9lZJvxuHDNSYiuZJzR7Sxo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779046341; c=relaxed/simple;
	bh=avn5CQvZgtce1tfFBFR5ATGxxKqyLNG/9BipwNfFWZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F91DkkU56JZajh14nb9VLjJYjmjh9zqnI6ZPIqSvTKDpoM8f+KV0IYGL89R0AlJGhWSIfL+DVvHoUvTPkZMaPx06n1YdaCKlpyiq/YMBfIKDH/T/scNjJ6pp1Yd2pzda08KRK5/XZx5Ash0EVXtWno0InDCzwBOjL0R992aOSqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKchwa5V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKchwa5V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD776C2BCB0;
	Sun, 17 May 2026 19:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779046341;
	bh=avn5CQvZgtce1tfFBFR5ATGxxKqyLNG/9BipwNfFWZc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JKchwa5Vp09IHmwDh4LV7dZ4mMGM+JIiHTULy/qOG3CSUvkzb8ng9y4gmo266PmTI
	 MrPS1QuLxYllYKaxgRpWbEA6rm020sRy1VOlfoJCr0AT0JyTccVjwD6WgUQ04JS6Bb
	 Q5Pcz4PjZMB/MMu+GFGYXHK0l//cCnY7eNJ9W1D5q1sv7qRF3SRj14kaFroyXlOUUg
	 3igQfpATN6cfOkvdDLcoOI9bYPWnrDXSSOcE+TlGxB4ni3dvNHizxcMBSre39n7jxx
	 NPCVkIKU6ATxyvxy21PRGXJsEXTXHm+Pqviw0dMwKy5SXGoI5rCoNTH5qaxfWZRvDP
	 0h8gmHPnH8j8Q==
From: Nicolas Schier <nsc@kernel.org>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	=?UTF-8?q?Viktor=20J=C3=A4gersk=C3=BCpper?= <viktor_jaegerskuepper@freenet.de>
Cc: Nicolas Schier <nsc@kernel.org>,
	Christian Heusel <christian@heusel.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: pacman-pkg: make "rc" releases adhere to pacman versioning scheme
Date: Sun, 17 May 2026 21:31:53 +0200
Message-ID: <177904624848.2106304.3951268538220995206.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260515215913.92481-1-viktor_jaegerskuepper@freenet.de>
References: <20260515215913.92481-1-viktor_jaegerskuepper@freenet.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 15 May 2026 23:58:45 +0200, Viktor Jägersküpper wrote:
> The package versioning scheme does not enable smooth upgrades from "rc"
> releases to the corresponding stable releases (e.g. 7.0.0-rc7 -> 7.0.0)
> because pacman considers that a downgrade due to the underscore in
> pkgver (e.g. 7.0.0_rc7), see e.g. vercmp(8) for an explanation of the
> package version comparison used by pacman. Package versions which are
> derived from said releases (e.g. built from git revisions) are
> similarly affected. Fix this by modifying pkgver in order to remove the
> hyphen from kernel versions containing "-rcN", where N is a
> non-negative integer.
> 
> [...]

Applied to kbuild/linux.git (kbuild-fixes-unstable), thanks!

[1/1] kbuild: pacman-pkg: make "rc" releases adhere to pacman versioning scheme
      https://git.kernel.org/kbuild/c/f2be8dd2

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).  Patches applied to the
kbuild-fixes-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-fixes branch in a week if no issues are found.

Best regards,
-- 
Nicolas

