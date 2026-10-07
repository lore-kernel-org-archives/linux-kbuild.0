Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1FE3D6494;
	Wed,  7 Oct 2026 16:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791391740; cv=none; b=NESli1VRpqv0v8vfS216+50twcWgbAh2iH/4CFScLrIq/DIGEmCzAcCPq+FZljuEuSw2SfAPrpV++iTl3bzTeW1+YKsyYINnjib8dR+f1E5SMnK6quKi/weAMckW9tsNM2Gzfi2aHiJEzw9oni3pMgE3vFIlvKdRPYYK67+G4sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791391740; c=relaxed/simple;
	bh=63DBgPC5fWRWOiBsqLD2nxkypDionXxCDanuUsEwW6w=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ivcivZPdtYpo6ILBVTW3NTxYS2KxbkI4ly53n2nOiE+vsYfW7sqFKMpU8tqqOvkTy1qwB1P1ok/5SBeoP0/ia7tRflpTr8TVvXmj+h+Uiyvn3w5Vl0hFnUw0T5Ix6w4UbTvP18GfCMa99CGSzemr0Ruf5Jx3Y2/4DuKruOajezw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOZYnquD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOZYnquD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB151F000FF;
	Wed,  7 Oct 2026 16:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791391737;
	bh=TI8viKS7UbOM7Mw5YCQrqv/rB/kvhX2cfMuh/KBFRos=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=OOZYnquDByH2uDabUmrDgA+tTKw0dM/VrReZl4FuVyVXIJA8rTEtHnfiebjI/T0Jj
	 EuYch1QEufNJuRn3UAk86Rk0aJhOweQaoIvirU2z6OYbD2UXDFlbOK3xqd7NXcUMMM
	 6iUsSq1w5FNe4C4nZeptrv5Xt580ju2JvvPmJ+kx9tJ2jG7auigjTU0g0WOhlg8n5k
	 tD9vGDx7QiGm8jA4nVuRnRoipFCLvSCI66DkruL/QNpolBIZtFUzatEQ8q7fr4/qcz
	 yYKRMMidE7b3o7IEhyxbqhwLtxHwvxE9WU0XmB4UGC3FLnPYJ2yjvktqQZzxIuLkbI
	 R/o5gxLoNJt5Q==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/2] Initial ergonomic improvements to
 scripts/Kconfig.toolchain
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>, 
 Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261007-scripts-kconfig-toolchain-improvements-v1-0-1e524178da11@kernel.org>
References: <20261007-scripts-kconfig-toolchain-improvements-v1-0-1e524178da11@kernel.org>
Date: Wed, 07 Oct 2026 18:48:40 +0200
Message-Id: <179139172076.154975.7876331914722818497.b4-review@b4>
X-Mailer: b4 0.17-dev-fde28
X-Developer-Signature: v=1; a=openpgp-sha256; l=1511; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=63DBgPC5fWRWOiBsqLD2nxkypDionXxCDanuUsEwW6w=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqxnfuepnT+4vHpKWtv1Q6lkhfXEUF6lkj+6VcB
 wMSLNZldNuJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCasZ37gAKCRAHUgpwFiYS
 aXlwD/0TS+yeVVAZHlcOCoO+yTZokUN7/wSpwna3nHHc47TBkb8iAlMDA2xmKdWv8NtUn5OWgPI
 ZyTRb2soeKWbhcpiWGOvqmzeHiXdKcd14Jsz2/ChQAv1CmC+ksRVt2yxr8AoOV39xfyEFs0lWCw
 xroeK1zwHMtR68WLcJakwHE84HKKg2QEAJ3494WLXTBV8kqGkKvKfS9fCtadBCP8dIF5jbMXB3M
 ZeDt5DgOzCKTXkXxaTsu+ALhgJbs91vH1e0+ANuccLGTl5e9p9jy10Fk08crlmShoCrdjJKAfaI
 DYVAZr5SD0cP02oeNWFPd30aMnjBFJ4YzR8FFZC6CNHQmRpl01D4K5pzlTPr7q9RvNV5uZ5NaIP
 ZYJOIT6gx5FE48F45XOsU7B2QbEk6kxEQCwnfEMGjDLHfHm2rQ/F4lvYll2tz0QitBj9XPFsHbm
 sHGYUT3j/UOnRZz3VijCP6hwpEY0A3qAAzi63wGPvCg6Vr0yBfMgHp9yV8l31hsdxEu6HwdcQTZ
 FQcElryEasp5depYR1hsMq1HCvdLOh5DG0bR9oapjpHBETiBMOGS84+St1GHRItTPYWDdj/+vp2
 oEyu6jB9S4lQY0hGLri0Q9qkpsnUfWoL+OzfQBCgRWdPVugrLMSi4eiMo/K8Q1IB3HAsEQ7zobY
 V10xvCHK68s6GdA==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

> Hi all,
> 
> This series includes a cleanup to scripts/Kconfig.toolchain around
> dependencies (the first patch) and improves the ergonomics of using
> cc-option and cc-option-str in Kconfig to disable warnings, making
> Kconfig and Kbuild more unified in their behavior (the second patch).
> 
> ---
> Nathan Chancellor (2):
>       scripts/Kconfig.toolchain: Drop compiler symbols from dependencies
>       kconfig: Improve ergonomics around disabling warnings with cc-option
> 
>  scripts/Kconfig.include   |  2 +-
>  scripts/Kconfig.toolchain | 22 +++++++++++-----------
>  2 files changed, 12 insertions(+), 12 deletions(-)

Thanks, straight-forward!

When I look into the resulting .config, I'd wish, these empty string
kconfig symbols could be unset, e.g.

    # CONFIG_CC_OPT_WNO_FORMAT_TRUNCATION_NON_KPRINTF is not set
    # CONFIG_CC_OPT_WNO_DEFAULT_CONST_INIT_UNSAFE is not set
    CONFIG_CC_OPT_WNO_DANGLING_POINTER="-Wno-dangling-pointer"
    CONFIG_CC_OPT_WVLA_LARGER_THAN="-Wvla-larger-than=1"
    CONFIG_CC_HAS_WSTRINGOP_OVERFLOW=y

instead of the current:

    CONFIG_CC_OPT_WNO_FORMAT_TRUNCATION_NON_KPRINTF=""
    CONFIG_CC_OPT_WNO_DEFAULT_CONST_INIT_UNSAFE=""
    CONFIG_CC_OPT_WNO_DANGLING_POINTER="-Wno-dangling-pointer"
    CONFIG_CC_OPT_WVLA_LARGER_THAN="-Wvla-larger-than=1"
    CONFIG_CC_HAS_WSTRINGOP_OVERFLOW=y

but that would make things unneccessary more complicated, right now.

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

