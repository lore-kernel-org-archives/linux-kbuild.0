Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369FE2135D7;
	Wed, 28 Jan 2026 11:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599665; cv=none; b=LrKDwcirZR3Xr9KRI48fzNI2ImmDQ+zLt+NqwCNaRch18WFS5rZ8dsizsOkyT6xqopWnGXikrQ8kStHajRV9cv+FzMC/aee9hf2227NjyCLGTyswY9sJplzDW/F3DO1IXn+XPoexByuggKa16IzOwXAVSyQGa8IvVrQVvjr4Mfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599665; c=relaxed/simple;
	bh=B7EggOGuQ49twJSOTy/UtZkBVafO8/Y3BubNTR+04eY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g874BaZcpI1MCAezHkSDh4p/BURWSMJxxoS97D6FdH38yzC5LwzfDMk76j7wP7ZcOOu1yID9cugdGQWzEztDOhHRZPzK0F8E+IMdVx0XP5D2T9ZWFdHaxGus1p+M5nOph9AO4aIQwl+FP+bW6NY8VH0DAm1W6dYqidQZgfhnOSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sHNIw78Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sHNIw78Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1D9C19421;
	Wed, 28 Jan 2026 11:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769599664;
	bh=B7EggOGuQ49twJSOTy/UtZkBVafO8/Y3BubNTR+04eY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sHNIw78QbU1IMCoWQzIA621kMgagggccaTyLStgQqFF1nmJPH/2JjQECeIXLjUiM2
	 a2B3NZxabGsEnWADUAGS+4U66ip/1p0RLWExh6KxkXxKK8yReFHMHvFxOUB0mplCI4
	 228XkABbQInNFZt02rQUWUdW/Db81yS7JIQ+2p2+dnBOdUKvRftgO9mmo1j6e3Qd8O
	 L39eQzL1HYJrwMwLnK9lCe1IN8/MscgZttmsJvulebdyFbehVUgeJBZjXH3mx3Xsmv
	 aIAhfNmTkpOF5ew7jqzB7d6FQ4p47mEUyvlLSrVjuUJhqDQaepayT76Tzvo/lqkhWb
	 EN7tTbjOJo0qA==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Uday Shankar <ushankar@purestorage.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Holger Kiehl <Holger.Kiehl@dwd.de>
In-Reply-To: <20260121-fix-module-signing-binrpm-pkg-v1-1-8fc5832b6cbc@kernel.org>
References: <20260121-fix-module-signing-binrpm-pkg-v1-1-8fc5832b6cbc@kernel.org>
Subject: Re: [PATCH] kbuild: rpm-pkg: Generate debuginfo package manually
Message-Id: <176959965189.1301244.15814296328206965994.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 12:27:31 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 21 Jan 2026 15:29:15 -0700, Nathan Chancellor wrote:
> Commit a7c699d090a1 ("kbuild: rpm-pkg: build a debuginfo RPM") adjusted
> the __spec_install_post macro to include __os_install_post, which runs
> brp-strip. This ends up stripping module signatures, breaking loading
> modules with lockdown enabled.
> 
> Undo most of the changes of the aforementioned debuginfo patch and
> mirror commit 16c36f8864e3 ("kbuild: deb-pkg: use build ID instead of
> debug link for dbg package") in kernel.spec to generate a functionally
> equivalent debuginfo package while avoiding touching the modules after
> they have already been signed during modules_install.
> 
> [...]

Applied to kbuild/linux.git (kbuild-fixes-unstable), thanks!

[1/1] kbuild: rpm-pkg: Generate debuginfo package manually
      https://git.kernel.org/kbuild/c/62089b80

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-fixes-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-fixes branch in a week if no issues are found.

Best regards,
-- 
Nicolas


