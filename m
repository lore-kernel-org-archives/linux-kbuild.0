Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793398283;
	b=jjJhD/W4wdXDfSVl9bZzckiNv7SDTu2B3lLcU5qkyBoVl/+VUalN/mVEFTNOj1cLbPh8
	 PHmeR2sGVwInyUqQh+Ic+c/ZXHV3VPyEPpjl3I8JNxlqYka5js1LpHrnS0ZzM4CLsy8Or
	 sBgTPoaKgycfgQNDmuyDlWeV7Laa026VcPQ0gbB1r7U1cYVTCFXZ6R8flGQyq6bcCfVBq
	 KkeHWJ+91A8g5zLVNdjypfTgSR2UMwLX6r66S6CLEIsVpg6WiFiZBcy2LN5WZLKAUdexs
	 R/UZR7+KQxIAXEnW85dwVgxEA7xkwdKT5g1SEOBjeJjZlG2qGw7sHQgU+d6WGLIiBIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793398283;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/9Yi2qEaEo+04ZoHUXZf2/B+Xx4/Mv399Gk91xIUCYk=;
	b=q8qXjip1VodBRmjXiHsACHxNP2CGDS4TfOv83rXaneUhvi6Synp24yjR5NCbzUGkM3Yb
	 f7Vwb6oNS/6CfpuyGKD7EclbE0f3Rkxbuv1oHYuHo/4h1ew/qDQxJEwU4viDt/7F5u31z
	 nJ8Gp232GlrezT8u0BMbN7l+9g+E33puhcawqLHfnHMNFccWwzg00yTPCtXJkw4psSkdM
	 /NiebJWjcK4ybIsqm8WlA8Un8NdWsSa4oMkjWPiUBklc2nsrfoUK1ZDngaUnnzJSLnG6j
	 ufdwI8ufuZh3o95DN37MoGkx5jkygj9sO6j4TxlzSktd5ujl095NcTZi8Bj/rZU8Dnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HnySJG0+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC39B606A31A;
	Fri, 30 Oct 2026 22:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HnySJG0+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42261F000C1;
	Fri, 30 Oct 2026 22:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793398282;
	bh=/9Yi2qEaEo+04ZoHUXZf2/B+Xx4/Mv399Gk91xIUCYk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HnySJG0+PhSd4KA2MAruKVkCmkwyt8YHxIivdI1WGSeB4mnZPdi31lryacPPx9gcv
	 HnZ/lpU0hqotrTFDri3W18cYFwDYMD5kuNEzCWEp12zeVcPHTfPu+/wqhfh5svWfAc
	 79Q3D8KkNPjymgCkd5HxpNkPPRp6ZR8m9N2kzi54e/FWL4bYmbOzYBeVD6Lwucu7EL
	 bzt23/INkEdFb2ss39dmy+MthJjH9EW1O7Ixt8L1Y/qS00dXtgwT7Se6C5Tuqm9CS4
	 Tu8Iuu/fjXPJyeR8DHm7wHAuzfbKLx8s98VUZ7fDTJCl3YIQ2a5WTuGURXauK5fvqH
	 HHopjc1lDCzcg==
Date: Fri, 30 Oct 2026 15:11:21 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Doug Ledford <doug.ledford@hpe.com>
Cc: Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>,
 "Nathan Chancellor" <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 "Richard Cochran" <richardcochran@gmail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Guenter Roeck <linux@roeck-us.net>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, "Sandeep Bhoot" <sandeep.bhoot@hpe.com>,
 Iraimani P <iraimani.pavadai@hpe.com>, "Mamila Santosh"
 <santosh-kumar.mamila@hpe.com>
Subject: Re: [PATCH 00/23] Subject: [PATCH net-next 00/23] net/hpe: add HPE
 Slingshot NIC drivers
Message-ID: <20261030151121.1f232b50@kernel.org>
In-Reply-To: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 30 Oct 2026 13:58:56 -0700 Doug Ledford wrote:
>  416 files changed, 185137 insertions(+)

=F0=9F=A4=A3=EF=B8=8F
--=20
pw-bot: cr
