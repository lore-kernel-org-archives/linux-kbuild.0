Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934300;
	b=a2Zhry2I+xa2GRMuCZBU5UOGNtW/hAhZgw+0VounPh5mBNUH4pEF8TNTXUFPKUobi4Vk
	 Ds5xDbH0FGEcVotEIwk4FGlno211V7saNwrIqguFMel5nVX2vLuMYFSDdxWsJqzuhTxaz
	 3lqdZifKa4qilGv+NpHrlA9DNRaOMmd3evjdTJcXLHswcr/8W9uvrBVRF68fi9M7xFB/B
	 PI3JERZC6FYQpUvRu47wtc525Jec2F48zdCRKzp0S6QFR41Qw7PzWbv7cq5IRGLdDTdxO
	 Y3bKR9YSNqn2X9q6VV6qVtJ7w2RTUBONDbuGwtUB9Xc2AGJ4RhUy6sHwfEt8b9cmrxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934300;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=X9VcMBZ8VVLhOdrEYZ2CkBeaw5wjCp2oNi0ObYxlpVs=;
	b=UW5MU2J4yHmXJU2e3yClya4pEEwpyPOs2OF+0PNIHoKOPSNNEaqj7nNYoSD0G/awDNrM
	 kgy/eulfE20Rs6fsY1DZ0lBHwRxdDK2gWL6sqc1pD9v2h+iRN8Irvpr6fuxhS9GM2MvXX
	 HCowzAM1tlZgS7KrCgHthRMjUA9mR1ehjfRmkNCkeEzUc53lSL7IS5Imemmz5zrC4r3ze
	 RR0XLUvM2/7kP8XqPoYFKehPopCklagF7mC/pg5zaoQ0C0MNXw+TTp8OIZX2lGhvh0pjG
	 M+V2bHhrU5kmI9gFIG24qyhKFBnxePGO/q0ip7YcdBR7spJMvW1QlzsUiEkGndKWq/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G3z7vBK7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FDB606A331
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Nov 2026 03:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G3z7vBK7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E4561F008A3;
	Fri,  6 Nov 2026 03:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793934299;
	bh=X9VcMBZ8VVLhOdrEYZ2CkBeaw5wjCp2oNi0ObYxlpVs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=G3z7vBK7AEUzVhIqGdvqvUZO3x2nOrpdml9hIoziIIfNytKL2+rIabkpsjvOKSse8
	 uyDUYPKM2K08HOX6QYCF2/TSt/y424wDdclt2wgMAykwGJKCY7cNsey5UoAYZS+Tp4
	 YNtKsgCarWsyBufRQ0H6i/EKJozKWXEwSnfRf1RbTZ27YBTW4s6+BpGdX7kDchLQbU
	 dPFJdE7fjZ/1mkVlm5v/XFBWcwqUc7SdngnPKsOtveOLvOYF5ARHz2RgamYQED17Ky
	 wke2QocRlD2auutr1UR/kdSBc6YpJeqKFxwSzQm4UByxBjISEepIb1mLLJwvOb44HN
	 b5UsCqIO7EbTQ==
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] scripts: checkkconfigsymbols: match complete numeric
 literals
From: Nathan Chancellor <nathan@kernel.org>
To: Hamdy Abou El Anein <info@daylightlinux.ch>
Cc: nathan@kernel.org, hamdy.aea@protonmail.com, nsc@kernel.org, 
 linux-kbuild@vger.kernel.org
In-Reply-To: <20261103164203.129644-1-info@daylightlinux.ch>
References: <20261103164203.129644-1-info@daylightlinux.ch>
Date: Thu, 05 Nov 2026 20:04:51 -0700
Message-Id: <179393429142.309869.2458871384675038461.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=872; i=nathan@kernel.org;
 h=from:subject:message-id; bh=gWEQ/Lw+88yY3MJ4vxU0LXIkOCbs/ciIcHOMGmx+YCQ=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlvna9HFL5i2buZuSVswvYXL4294sPTdpwX/pfZNutmi
 MUbtWfPOkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBE6t0YGe5Ob9kfWLfs0n41
 m97ANu+3J8JkVy+Pmn8n/s+Gola2p28YGdZ+1VvDcGbxRvnlB2L/f1t1cq/38jbZ77yXLcNeO2Q
 9XM4HAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> REGEX_NUMERIC.match() also accepts the numeric prefix of a symbol such
> as 64BIT_MISSING. The reference is then discarded as a numeric value,
> so a misspelled digit-prefixed Kconfig symbol is not reported.
> 
> Require the entire token to match the numeric expression.
> 
> Tested Kconfig dependencies and conditional defaults containing
> 64BIT_MISSING and 32BIT_MISSING, alongside decimal and hexadecimal
> literals. The symbols are retained and the literals remain excluded.
> 
> AI assistance: ChatGPT/Codex identified the issue and prepared the
> change, commit message and executable regression tests.
> 
> Fixes: 0bd38ae35522 ("scripts/checkkconfigsymbols.py: support default statements")
> Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>

Seems fine.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan

