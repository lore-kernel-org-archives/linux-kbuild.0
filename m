Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3056F64A8C;
	Tue,  1 Sep 2026 00:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788221728; cv=none; b=G8WDLo4+EwN2wqzUy51iNUUX8H+iC6ZeQLn146kiAwmhkXOP1Y9uVJq3tTQzfDHxHI7eJqRcIYZi/mNbNsxWvYk8RUtB23rNrdqCTg72A5rbOPS843Wc8UXBxdHDhP5ybA9y+mcB3jeWuZSZwm1r4pFMXduD+d+sl9Wmbnpdd8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788221728; c=relaxed/simple;
	bh=5vMDHhZ+0A2Xm+N/7nAlZJWIxMjCuGKanoeno4hcZmo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rebaVocK59cw6ompR89pyIc1U2giOOoQpQdtsqwQy349dR9nIPPwmRfFbBvimmGJzOFnprVRgAUxZoSGlweGxlSHh6z+3TjWK8cG8iBacAfyQL6UgAoauv8WE+2s2ctrYdPBpdkkrDoLn5F+9T7AAyyU5qhVrMphjuc/vo8fM/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BfeGxmKE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BfeGxmKE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 242F61F000E9;
	Tue,  1 Sep 2026 00:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788221725;
	bh=1I7ynJu2ytq03AWWyjwj7LZEKvRUFatBc402ODpm9KU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BfeGxmKElAU9KEgRou22DO/koHkKAR2F4LgOrlkvwvXWDui+mtf1X2yqy+KZeGat4
	 E9OwwcAl6Vl1h8HelZIBGyb+TuxDeCCtMBlwN4OBaay2B4twiLnl4ZIDzi0RvymFCF
	 s/uarUywYLcrsQvfM22mLcybuBoTVwpx5ZPt8HfmSru4sKfuEYmkAVA69dFYKlwkX0
	 Z89Z0U12zipmlDtHYZ4F0/aHy2e1sntJzbj3OFJf0PxEp9Dx3Qq0ihmgrwtuiQnKel
	 uJ7ubgplK01y/FuKHgEKcSQaTY5/PwpaXOOvIArfP/Gooj7KB1zmJRt6nGn2YtKUPU
	 QeCmCd/Wp+iKg==
From: Nathan Chancellor <nathan@kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yuntao Wang <yuntao.wang@linux.dev>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <20260823094913.421144-1-yuntao.wang@linux.dev>
References: <20260823094913.421144-1-yuntao.wang@linux.dev>
Subject: Re: [PATCH] setlocalversion: make tag local to try_tag()
Message-Id: <178822171873.4128818.6966319791092529167.b4-ty@b4>
Date: Mon, 31 Aug 2026 17:15:18 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=712; i=nathan@kernel.org;
 h=from:subject:message-id; bh=5vMDHhZ+0A2Xm+N/7nAlZJWIxMjCuGKanoeno4hcZmo=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnTJCXuLOGLnLYxQuK58q3bLUp3Fbqil6ke+VBjce/OD
 bYN37jNO0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBExE8w/DP9pGmwbvXhaZyd
 NfMzBT6KvDwXGhr12mb7mw41w5K5S3cwMjS3/ZYtFFmw8ciS5w++qreGHxQMfjTVKkV8r4h3/Ex
 eDiYA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Sun, 23 Aug 2026 17:49:13 +0800, Yuntao Wang wrote:
> setlocalversion: make tag local to try_tag()

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] setlocalversion: make tag local to try_tag()
      https://git.kernel.org/kbuild/c/ba0e6a6f0fe7a

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan


