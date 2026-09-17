Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6C24DE702;
	Thu, 17 Sep 2026 16:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663023; cv=none; b=Hr5NonPwDGLivmMhEkpLZQfDrSeM9hW+19B41W44MnIC9BrBCyPr72Y+54SPHCn9KgrCRkaHAreTtUorD6DDY6bhh2PioFz/NAmvytWJMJdINJTNGc1WqxDKUYdS0l8rrRHpIP3unTxm1IdSevOJWsan1Uf1a7rz/NihifhEk7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663023; c=relaxed/simple;
	bh=efcdlNaQan0hBB/M7eIj7YYFKXbfh006qzGcRCypXVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvGDT4/+/VcA3mvbvVRqRglL9GAa6xLg99OGRoekYqousFoBcYvojHk5k78Sz8iUXHhmd6GmAW0ppkvNWq8OIeNVoHrk3LEnAIlC9sHkIjo+T0G5NRCYZPyrGmxFQpcjNbsPe3ZTqAhTHksFlAjjz8D/flL3eisal8zx+MjTduM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=MeGoYymD; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="MeGoYymD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1789663017; bh=efcdlNaQan0hBB/M7eIj7YYFKXbfh006qzGcRCypXVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MeGoYymD8X1NQHcTEqzCjiefQkxKn/ZyoX2I/pDdXxyi47s1q4HbgI8r2b7SALi0N
	 C/0EUjW30XlLxtkq1MQfl8C8kjyAq0UAIGCe7myvJqQxdRAeVnpG0/pjZvOdxKbC/g
	 J8V9TMdOMKOoBe07/PBKdnO2+w+2b1V9n+mgTrH7F05uyPd1jl6nEIIXd6rl/VvHn7
	 0SB6o26mKueSbIuBPHMl4iSu+2OdyfceNiG2TOoFsoV1BWer3meiFnIGHBt/iHdnlS
	 AphwVEMbrvLiqZLpW/wN9Cp3+8bEfPHJnsKKiLBc6U2DvllMWSoaShKIcxRwdLwVU6
	 PjGeaFQZNlsGA==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6aac1729-6dc7-7f0000032729-7f000001d008-1
	for <multiple-recipients>; Thu, 17 Sep 2026 18:36:57 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 17 Sep 2026 18:36:57 +0200 (CEST)
Date: Thu, 17 Sep 2026 18:36:56 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nico@fluxnic.net, rdunlap@infradead.org,
	grahamr@qti.qualcomm.com, kees@kernel.org, pengpeng@iscas.ac.cn,
	vegard.nossum@oracle.com, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 5/5] kconfig: use unsigned integers for hex range
 checks
Message-ID: <20260917-nocturnal-dramatic-donkey-e1f8e1@l-nschier-aarch64>
References: <20260915211508.291790-1-julianbraha@gmail.com>
 <20260915211508.291790-6-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260915211508.291790-6-julianbraha@gmail.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1789663017-10C910BC-33EAC6D4/0/0
X-purgate-type: clean
X-purgate-size: 1245
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-03  mail-id: 9A0C2A0816  external: no

On Tue, Sep 15, 2026 at 10:15:08PM +0100, Julian Braha wrote:
> While 'hex' values should use the bounds of 64-bit unsigned integers, the
> range values are treated as signed (checks use strtoll).
>=20
> For example:
>=20
>   config HEX_RANGE
>     hex
>     range 0 0xfffffffffffffffe
>     default 0xffffffffffffffff
>=20
> the default value should adjust down to the upper bound of
> 0xfffffffffffffffe, but since the check incorrectly parses both as
> LLONG_MAX, the value stays at the out-of-range default of
> 0xffffffffffffffff.
>=20
> To fix this, let's use a union of signed and unsigned integers to
> represent both 'int' and 'hex' range values, then use both strtoll and
> strtoull where appropriate.
>=20
> Assisted-by: LLM
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  scripts/kconfig/symbol.c                      | 41 ++++++++++++++-----
>  .../kconfig/tests/warn_changed_input/Kconfig  |  5 +++
>  .../tests/warn_changed_input/expected_config  |  1 +
>  3 files changed, 36 insertions(+), 11 deletions(-)
>=20

Thanks for the whole patch-set, I appreciate your clean-up and=20
strengthening of kconfig!

Reviewed-by: Nicolas Schier <n.schier@fritz.com>

Kind regards,
Nicolas
