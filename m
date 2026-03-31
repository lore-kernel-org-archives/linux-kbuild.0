Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD35F19992C;
	Tue, 31 Mar 2026 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774973390; cv=none; b=VotWFZL9NSEkTdyJgbZnbKU7rvoOphvHC+tI1W+4JLwGCE8+yK0pO/DCykHb0RZDWZAQyvW7pQWp6HntguPD3qU58tbFQAoFIdbifTvKHfKcsAii9D8ZA9ztLU1D8rTsTWWaVnNZ8WmZE5KpdRFMG1Qv+18vPKmGh0W21PEww8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774973390; c=relaxed/simple;
	bh=dMM2gBPn7/pIXHSnp8TLc/oT2yDE1tbsiC6m8POzWms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TIepMfWKMrtY+O6HTobvXBy/j235yIiHZHYxBGHgpdayRnWGZxeeiGbc3dZsnIwls5T4GiHzu0Fwis6K2lEwqcptz9mQZjw8CLH0/ZBtfK2hLCdBHz2/W2Kq8lkimmgpk1EQxMhzbNpIARiOMXkgEOr5e95UJpkjGQotFNV8mqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWTBkgJ3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWTBkgJ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12AC3C19423;
	Tue, 31 Mar 2026 16:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774973390;
	bh=dMM2gBPn7/pIXHSnp8TLc/oT2yDE1tbsiC6m8POzWms=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YWTBkgJ3YyIWXy/LfuIc6wUMdvgM+8l2yHC+x/UOECFD8+Q4reHZkJDAjpj+4wKd4
	 xRnn2nIIpPaRCqJQKZ3xPQCHGQLEGgxH82qZK5gck2pe041IjJ+ruPTXsgfTXroqZ3
	 UKRNxoR0l+3V7Iiz+1SVR/BR9kQb99tHdYrUlAqUC7fjerFIqAK8aaXuFwGLTsshNI
	 iqGCB7Pmv/WG7Gxay5W84plDT+EYo9+FFHupOQnmZM/68vz/qgFFf3drkaHuPFPxRt
	 Pta3IlKLBjEeTzYR/TrHayr15yUq1AMCSzPQWI+b6Yz3nD8G6DEbap4mr9Z0yPtvmb
	 barHtpfynVbkg==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Janne Grunau <j@jannau.net>
Cc: Nicolas Schier <nsc@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] kbuild: modules-cpio-pkg: Respect INSTALL_MOD_PATH
Date: Tue, 31 Mar 2026 18:09:38 +0200
Message-ID: <177497336364.2732896.246906403037876696.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327-kbuild-modules-cpio-pkg-usr-merge-v3-1-ef507dfa006c@jannau.net>
References: <20260327-kbuild-modules-cpio-pkg-usr-merge-v3-1-ef507dfa006c@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 27 Mar 2026 09:30:29 +0100, Janne Grunau wrote:
> The modules-cpio-pkg target added in commit 2a9c8c0b59d3 ("kbuild: add
> target to build a cpio containing modules") is incompatible with
> initramfs with merged /lib and /usr/lib directories [1]. "/lib" cannot
> be a link and directory at the same time.
> Respect a non-empty INSTALL_MOD_PATH in the modules-cpio-pkg target so
> that `make INSTALL_MOD_PATH=/usr modules-cpio-pkg` results in the same
> module install location as `make INSTALL_MOD_PATH=/usr modules_install`.
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] kbuild: modules-cpio-pkg: Respect INSTALL_MOD_PATH
      https://git.kernel.org/kbuild/c/b205a1a5

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-next-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-next branch in about a week if no issues are found.

Best regards,
-- 
Nicolas

