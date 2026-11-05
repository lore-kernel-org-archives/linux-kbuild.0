Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793920686;
	b=OChnjvLA5xP+jUL8tcyonQu5t3GqmdiTc1hvQ6yMkPioBsLUePtYt8kQ8eswV/WkTLNl
	 gKFbI0vVwASWkiO20Hi9rT4KindGoVW9YmMlt0yWpsX7piLQGYc3byGBI8u0jJf3mwQDT
	 YzmmVOFNzO4aSczH5htRs7WvYj/L9G1ml9ZG3yZuNpvbLMSE/lnxCdCSwXUHFR1eM+SJT
	 QVozCzv9ayGXEL1ZxisY8cMplXA1F6mO5l8VLMQXqBTdwADX3k2vz/bnkBh+CWSvNWJRx
	 s/Tao8w8EOfU60FB8JY9u1GleKvxdsZq8xJhHfjnqfjDjoCXU97ywHrutJB0Z0gzYyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920686;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=LLBT3fIs+QyMgnm4/BOAC3O77kfYjrJFrpO3Z6fPboQ=;
	b=MuD6XolnzaaADTGuw7E0dRGfQHk1U3QnqKFngu6sQFRJm+D/QJ1iSTFre7JFe1VFUbQ3
	 VJHn1MRkZmiI/8CBoadshfDV0xtjX16/ISGK457kUI1CTjdUWrTpMzs1OEh5mOasvqIFa
	 6OYhYQ1URniEvGKwsQncUXZHoyOho2P7Pxn/lXVfJAJQHR8/VgFFUfKLdz/hh19HxtAFu
	 an95xNG9COUcf6/GjLYEnf2y03CDSizH16G8oHv/aiB2E49+xF0vwSAPtEImnjesxcFQ0
	 OJlgKAeFXIj4zsAHPVkVz3GTGEuiTllw+5bKZRo6ySLifirJ72cXQ4/hj0fcnREOLxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Sw7/Uh+s";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536CF606A337;
	Thu,  5 Nov 2026 23:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sw7/Uh+s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FEE51F0089F;
	Thu,  5 Nov 2026 23:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793920686;
	bh=LLBT3fIs+QyMgnm4/BOAC3O77kfYjrJFrpO3Z6fPboQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Sw7/Uh+sGM9CE4YHVWf3sv23PJdOHlcPchNaE+4kJ0CKmf07skJHDk4zfrXuhyUV4
	 ZJNhcG3yVithaONSw0Md21gkIpVlR0dqiSWMKKPdj2VEX8b8AQht8ds7SsDZaB9fyd
	 YvbZrY/oVG+awXBZQMudlNSYO2yvzDEqnSfZScgcWs/XTe/qxlJmysrzCDZBufiQqT
	 hFaN26fK3cpRPxCDVjICXkbCn+9j5w4crvvPgx5aFh6USIry0C/zWOZCY4bmsVjxMb
	 k+IVnJH0dCUtRHI1zEYsf3u1WAiTrbhRWD8hdkpB/F9ApWefckg+w6CnhkAWyrW4xV
	 y5hsrbdDJYtjQ==
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
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] kbuild: deb-pkg: allow to set package name
 version
From: Nathan Chancellor <nathan@kernel.org>
To: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261025-deb-pkg-v2-0-8c33a4ac18ad@sigxcpu.org>
References: <20261025-deb-pkg-v2-0-8c33a4ac18ad@sigxcpu.org>
Date: Thu, 05 Nov 2026 16:17:59 -0700
Message-Id: <179392067912.309869.4678019018758746329.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=718; i=nathan@kernel.org;
 h=from:subject:message-id; bh=FQrliNKztXb4IlGJivKQ1UxqgIiRpNSqAmVWP7qUK+U=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlv+Va6rdjwLdS96krTn5CLD9Kb5qusKNob0vgm6/wck
 51WIufvdpSyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJLDzE8Ffur3G+9OsNPtGr
 ORb6Z86ffueQwlqzuGmOop/mHg6U/X6PkeGVm/K5NYXTU6elRIbU2v1+bfZrHssr68ikeWsSio3
 kbzIDAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> Instead of hardcoding ${KERNELRELEASE} in the package name allow
> the user to override this.
>     
> This can be useful if one doesn't want to accumulate different packages
> for every commit or micro version bump by setting
> KDEB_PKGNAMEVERSION=7.3 or even KDEB_PKGNAMEVERSION=stable.
...
> Guido Günther (2):
>       kbuild: builddeb: Use ${KERNELRELEASE} consistently
>       kbuild: deb-pkg: allow to set package name version
> 
>  scripts/package/builddeb |  4 ++--
>  scripts/package/mkdebian | 12 +++++++++---
>  2 files changed, 11 insertions(+), 5 deletions(-)

Sure, this seems reasonable enough to support.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan

