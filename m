Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793853309;
	b=A0D7XMLg4BPcTX2E3TMEgWEQtDIrc8kAWquBbes4gLBayGn9t71hKH6dpMtBOaV/Ap1A
	 J4qbdejaXzpCMRLrDzVypJuqmaPoyG6DwdQcMbriPidGdihVdGO6HcWJsBumrz9ia0JNZ
	 q1YO6sEwutA2PsPZ2cZTY8F+d5sZ5kSWWHilOpjnVXzqZJtoTur/4gydQy+dX8debjvaI
	 CciuBPsVL6iwrgJKGWPxXYLX5a52qOidWG6mAS0s/RMeVCnu8mOUXM3e54Via7hVGWl4g
	 hXM8Q/SFihff9+d2W0RxtDwtRuyevXrn6ZXPqfbJPRV5p8tZ9BFRjxq9vI0bYBxm3ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793853309;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=jI7UeUK2expo9dhtKwGqTj4Fr4eR1+We21j4Gx6/NFo=;
	b=GjneZYHH/MQONTY9a4zoSRO8Zpt2K2GS3qzXnXN2TmCfrYxOvamAxAIhFDHr5LuJK65c
	 yZvvPKs3flahpQ9Xz1dS6BSFPNMDdfH10JNG6StpQhf4wzkZEC5VGYz/MzQIkBybGBvlB
	 iMfU8Z7VE0aIF3Lttltw5G5IAiO+RTcskDC8dq3dSfK6JCevF82pC6k4ueQSS6tA/fPp3
	 Gbolf93+spLYJOZBYfA/pmn+ph600vuesQ6g9/9sW9T/txnsOiDU7+J0b9iifQ9chC9af
	 C68Tm3hE7EgvK0pfeXHT0SgaxecanC/vDytEcORmP6mU6QbBx0Ib2wO0ueWtJqVBQfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B0hyO3dy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC264606A326;
	Thu,  5 Nov 2026 04:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B0hyO3dy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C006F1F000C1;
	Thu,  5 Nov 2026 04:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793853308;
	bh=jI7UeUK2expo9dhtKwGqTj4Fr4eR1+We21j4Gx6/NFo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=B0hyO3dyyCWh0wZdLa8uSUjViUTUfUU0prXXQvb10QyHv7XGMzL5kI+PN5YVwQnv6
	 y3GeKFYcna7hBoq3eVsKARPI+5nyUaW0JLpPuaihAswE+SnZ/8TAxRXY0uP+NvFE8D
	 18qyOzgc+2GWyr5q8mKPBVQmiC0anP6ZO4bUUvpsYeIo4AnsTc5Nbj2OYkhsXtCB8u
	 pzrK2Z/7nq9CBqiXCvOfjaZtCpId130ETF8fgPYCnYVNSc0uSpndH/XL7c68yjlZjv
	 HiQbTxsN9A1sCnDw/vfb/K55Djfrzgq+k9BiOfGan3eO9PG4q3E+u2MNFm4HcwH79b
	 r9x5wdeFAP7JA==
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
Subject: Re: [PATCH v2 0/2] kconfig: error on reverse range
From: Nathan Chancellor <nathan@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, n.schier@fritz.com, 
 grahamr@qti.qualcomm.com, rdunlap@infradead.org, nico@fluxnic.net, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261014134017.2310819-1-julianbraha@gmail.com>
References: <20261014134017.2310819-1-julianbraha@gmail.com>
Date: Wed, 04 Nov 2026 21:34:56 -0700
Message-Id: <179385329678.826739.6569799593744815029.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050; i=nathan@kernel.org;
 h=from:subject:message-id; bh=bjjxg9IgldkzU5Fv1BBNUeGpFO2CvLRdhTgGKg9urZk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlv2Muv36q7IdWS5pmTUaTNqi2fsbjlqN4cZ/erb8QCV
 i4y22LVUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACaygIPhn7U6Z/jylRaOours
 NyKiz2913FogkPeCd/vZ710NcZUitQz/c7eUylxk3pOjyDNN8Lz1rrQHZ+dtFzu901Xi2OxH+ev
 3swIA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> This series adds more input validation to Kconfig, specifically checking
> that ranges for numeric options are properly ordered. This check was
> originally introduced as part of kconfirm [1], but there are no findings
> for this across the tree, so the check can be added directly into Kconfig.
> 
> Patch 1/2 adds a prop_err() function to match the existing prop_warn(),
> which is then used in patch 2/2 where the check is introduced.
> 
> [1] https://lore.kernel.org/all/20260904220559.GB2787252@ax162/
> ---
> Changes since v1:
> - fix typo in commit message: where -> there (Nicolas)
> - adjust warning and error printing to match gcc (Nicolas)
> - handle case with multiple (conditional) ranges (sashiko)
> 
> Link to v1:
> https://lore.kernel.org/linux-kbuild/20260922163749.2031594-1-julianbraha@gmail.com/
> ---
> Julian Braha (2):
>   kconfig: add prop_err function to simplify property error handling
>   kconfig: error on reverse range

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan

