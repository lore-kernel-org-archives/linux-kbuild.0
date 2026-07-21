Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7B63B27CF;
	Tue, 21 Jul 2026 14:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644270; cv=none; b=llixY+8fn9KwMgM09fQ2iEBxu9+4O0TYkIIBlc3KAIb9/7po/5BF1bqOWwocgrec87Aj4UVClZwsyQigRuiX2l2GDfZ5glqFMsHW7D+fOWfqm1CJmT2ALeTpLmLbHIasj1FxgheCt4HBbTU+kiniL5tj/XWJdgFOpSBGXeWORCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644270; c=relaxed/simple;
	bh=+UIp0tEAqNQZiFa9EmIzj7WbIEWmgViyRRe8+rCd9CY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LBDiR+JZTp2UIa5Ke63qsRhgWh1UFKHw2lnX5YQFMvwwS9g8I07KN51rMusJ0+WCp0dgilTS/vYeyo+PviFIJ62ZwtX6/hTCVHn2yrejDobddHilvPhUQFk01ddU7OMeR8idKB4F6cTuJ+jtr0fZGmL15wiJZA7k3Pr36eP4sOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P29gFW54; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P29gFW54"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 28C671F000E9;
	Tue, 21 Jul 2026 14:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784644269;
	bh=7QW5v5YazYjTOsHZNRYYmwW18u9BbGdsLwAAjPtmPak=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=P29gFW545R16isTmakZIiYed0T40ssMxWKD54Ny4GEZGBp/wLQiHI1Kz41iSq4EF5
	 vdof6/6rm+Ki61JY/8fVP+Zz55KiQ2p+b1OUxrxRLaKPLvRhY5Ux1Gjy1ibf91EtCk
	 /kHrAUAfSIIkp2leaf4pcsCCV26bn+L+h/eyFtKLV2h19bjKkwKZAmU5XgKqzmRSi7
	 DdoTIzfwBeStvHHCtwqvLNvv2v4JbjIz9tNTGWY7CSGNwpcvzSeI41EPsn7NWabDD1
	 yJP3XpRL4x6pH235qBYUvTPA9mIa5aRQ4KN3+/aF78SUifllATfoMU7RJLayjBF/f/
	 pQu+IMgNn6RZg==
From: Nicolas Schier <nsc@kernel.org>
To: nathan@kernel.org, Elsie Heck <its@elc.moe>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260717195939.25130-1-its@elc.moe>
References: <20260717195939.25130-1-its@elc.moe>
Subject: Re: [PATCH] fixdep: make gendered language gender-neutral
Message-Id: <178463135126.1439086.14460524097392154145.b4-ty@b4>
Date: Tue, 21 Jul 2026 12:55:51 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=828; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=+UIp0tEAqNQZiFa9EmIzj7WbIEWmgViyRRe8+rCd9CY=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqX1CaFVPgj4vahCK9a+u2Z9OzeQZW3ruYiaupU
 Xf2d5X2afmJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCal9QmgAKCRAHUgpwFiYS
 afb0EACLgZAzBMWeWXMy27gBt7xV/ilkkrzqul2XYoS6Lf43JLXVdLJDOt1w8b9SQdKr8Zw0Mj1
 iY+eyr2XSBJNQp102yfgCTTtGECawDrNF5Zkuz2n/cuHI6q1INTBJBinGNknwHJlZMaSO5f2XO4
 CNdWBDyuIrPVi1YZHMjZi70VWo7FIW91v3g6X4pKPnZ0pNc+F+bi3zE6b7jrgf17aoPXQAb4X/D
 Xdh+Xm67OJOPrtzJAc4yCHnLGpfff1m0mZgJ4Wv0oM1wBVhAaIcVbA4rJfeEf2Ldw4h/WiLsF4g
 p5cHV5IlJiz/wN8QLOxcpYwiskSrW81092Q9pux3tNDKVLyMRr15fUD+ejFJtFvUitb6nevHI8B
 CJBEx1bq5DlGUmmlbp2apBjdtl/636OM+zdAZwQcDp0LYJyvgAMGaXNaGQrY238lT6IlMeV9C7p
 s48kt1OHxggSBBxQuFdosiSO7pt6AbrXfahTQlCSvvTgTglBlzMhR047J9rYRERgz4kc4yBumbE
 NmiBGIGD0GIWUWlMph/KrCtBUSf5aAvLLS6hIrpI6SuTfmnV1AjvQ5+0H3PKUY6G9VhKERoWG6w
 KrTkDHrlHTnROIJmjAVR1/YWHSsCGFkgMb/hfvQi2qm1lfkzFnPTRFjAoTNrvG5rmpadl/fy9Om
 Ios7Bn78Es0sD+w==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Fri, 17 Jul 2026 13:59:39 -0600, Elsie Heck wrote:
> fixdep: make gendered language gender-neutral

Personally, I think CONFIG_SOME_DRIVERS would be even better, but
changing it to whatever is a good thing.  Thanks.


Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/1] fixdep: make gendered language gender-neutral
      https://git.kernel.org/kbuild/c/26171fab

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).

Patches applied to the kbuild-next-unstable branch are accepted pending
wider testing in linux-next and any post-commit review; they will
generally be moved to the kbuild-next branch in about a week if no
issues are found.

Best regards,
-- 
Nicolas


