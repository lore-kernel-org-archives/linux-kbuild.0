Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793921423;
	b=kFVCRa1jtYpl/ot0HpqG1kekgoqKCWtbSzVPKLPi999GQalvDqd1r+psQl/Efgtg+ySf
	 cCoD+HNl8pdaF3UFKBHcPmYznTon7a8o5j5gyqJlxATZmqf4eeyK72OKQ+u4oXu3XhSrJ
	 b2eC2jf6JFPTzpI1TJ2lvm5LLk/UwSznZVhnSp1UzXpUXVsIjGVXGB0lUzl9WLg6QVe7k
	 CubMQe7ofhOMJ6vRBlAiyLrKUKsjsYkVfqqRArB5OuU3fkgU2auW9+GqyopmFWkjtgkex
	 CNlAbPcF6+jFXGKUQAZh29jr8voJxoEf7WZqbNeqYudekxR5yk/hcd/7sNlGNmkeNJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793921423;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pyKXN0SXCPt6/yPfxPF10ZCbAp+HRAd5lqMhGpg4nfo=;
	b=X6G2GF44AV7JZlNyVZoe2z/4n7THUbIZiPdiqWhFtiztLdeJBFJ949b02ElR30/6tjJ7
	 imk+BhuGaytjNP2BsxfiFAxvdkomqj9gmDAr/clK57rETuSFkZYaDhZfKMldgQ+bptI2l
	 Sv9efKwTGeTvBp3kXHUX6Y+H2Fv0QD4jiPRBCHLoN5M7N5d+1rW303bSyf1NXHWkRb+BP
	 gEGWBn2R71C055R6j7OXpQCCt/vS6yXkssjCPo2ZipProMS+m49LZfGWuQTIYmTbwUiO0
	 qyLa/5nKhzA46b7qRDJSs/iwK/Pm6O92vUEisz77IQ8VDxzv3FGeoeKfA8KO8507c8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XXmD+IOg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A043D606A326;
	Thu,  5 Nov 2026 23:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XXmD+IOg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B441F0089F;
	Thu,  5 Nov 2026 23:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793921422;
	bh=pyKXN0SXCPt6/yPfxPF10ZCbAp+HRAd5lqMhGpg4nfo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=XXmD+IOgPg6T3/yvzNU/eEjp7s+0h2C0gVdZBGGPJN0PVpX35EyFonKq0NQw2LCgZ
	 O1N0Ue41u+qXE+5WPMlrwHuacS0oUczp3huSrUDHWT/wl73zm9mgFwxxmTbx0xYLUo
	 fbAKQK7/tIT73bnhfPuLhfid33cJ5JdBhF3NGLDsGC2K7vKjOwWrFmIH9pRbZj/XBD
	 65fM+cuB43yvEWmz5eMHeFosClXPyBG0D/Unz0+K4+uGOCDwY2566ZFIeMPSaKdz/E
	 hqpq7fOGq2rTRIi+G2T99/RMn4aI0GXc2hvTLjdyx1/sPHgvf1nKfgL6vWdoWM105g
	 LKnWMtyU1BRvg==
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
Subject: Re: [PATCH] scripts/tags.sh: fix Kconfig indexing when using etags
 from emacs package
From: Nathan Chancellor <nathan@kernel.org>
To: Vladimir Gorsunov <gorsunov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
In-Reply-To: <20261027102543.22151-1-gorsunov@gmail.com>
References: <20261027102543.22151-1-gorsunov@gmail.com>
Date: Thu, 05 Nov 2026 16:30:09 -0700
Message-Id: <179392140967.309869.988919677823258508.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=525; i=nathan@kernel.org;
 h=from:subject:message-id; bh=aImRHO2nx0ULduOoK3360OIMtjki4s+rgKy14sxbRZc=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlvBdsPnJiSYjd/pmmKvVJs3rMX+yST5n670njk2es18
 ZPO/Xhv3FHKwiDGxSArpshS/Vj1uKHhnLOMN05NgpnDygQyhIGLUwAmkljGyPBr4l4uSz7zRVbr
 38TyHqp59DXkwJozSorhiW7qTo0Z3fMZGS4fuHu8Qmaf3NMXqXZ62y39HQrsnp5N2bM0890B43L
 VTewA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> '+' and '?' operators in regular expressions are handled differently
> in Universal/Exuberant ctags and emacs. In emacs, + and ? are
> operators, and \+ and \? are literals. In Universal, it's the
> reverse
> 
> Replace \+ with an interval the same way \? is handled already
> 
> Signed-off-by: Vladimir Gorsunov <gorsunov@gmail.com>

I don't use ctags or emacs but I suppose we can just take this and see
who complains if it is broken.

Acked-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan

