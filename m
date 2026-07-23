Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE2E2EEE8D;
	Thu, 23 Jul 2026 23:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784848698; cv=none; b=e8+2kmeby+F9u25OvRcCswuH5Xs68yMb6CtYUsb6wliyrTnI5lt4K5KHS1mNGEaam4QGtvD/QAHG2vkW3k23Z1hTInYxQrbUdFxL1rGAqtyPGqP0Zjeo6zOjawVxj/bgQ9+HGqV9fQwRSxZf2IJMFahbjJaIy8vclvV3HjbNh44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784848698; c=relaxed/simple;
	bh=kAg8ocHVazWYjLOHMS3pyaL4h4XXECUWVB2xrv13Jcg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=SLmh/wECwibEeyaaSONtTmVlAIS0NJ3BDOftKymKeGMwCsOS4a/TOv226YAINn35UR2uc6tQVMPLRLXloSObyC9KesAZ+7Arx5zoXEbBrkawynBYTjv2ZpiaF/dMM3chIhDAAGHmeLAPZhdaS/Wh16+1I4dVP0ztTjDv9Nyu/Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WPJxmcS1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WPJxmcS1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A3F1F00A3A;
	Thu, 23 Jul 2026 23:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784848697;
	bh=Z5kzh8OuG4siNvL/B/DKo7kWaVZW6am3aEyq6+AZn5E=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=WPJxmcS1r7koQAg1XK2RHSGtibHlUDTXEGYiK1Ff+zoFOg0TYA6hzMiroGcXKGsh/
	 Hx955XztoQsVyYtY+ybEFQHmY+LQ2R2uvwKfy1xrfklnE4oEbJvlt5p+xSe0S6ie8L
	 PYJSySZQgcWt5/R4MPuuCbCsz2yQm6gY9HrKmkYUTjgZxk6PeEuKm7XwaxipTGXE/m
	 MLuqdJ74xG8cke3W2znV2QynbPf47f8ouc1Cu9VPEFgO+bD5hRP9RkQTETz4XHCDS4
	 rZl43gxAH5hmQa+srCfMiXysDNQ5dvXwSSH7SIsLbak7SlE6EkO4lXZopPsbtUeqgt
	 MxuAQUOAQR5jw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] kconfig: fix minor typos in comments
From: Nathan Chancellor <nathan@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, vegard.nossum@oracle.com, 
 kees@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260719210536.9577-1-julianbraha@gmail.com>
References: <20260719210536.9577-1-julianbraha@gmail.com>
Date: Thu, 23 Jul 2026 16:18:11 -0700
Message-Id: <178484869129.4095280.2850128549948384193.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=267; i=nathan@kernel.org;
 h=from:subject:message-id; bh=kAg8ocHVazWYjLOHMS3pyaL4h4XXECUWVB2xrv13Jcg=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlJC80/PV12rKMknX9uecLSx0x9ca9/L9+Rfb9l88YeR
 01HLtnojlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRJ9sZGU4lNDfkxZSJL6vt
 3G98dfb7Sx4C6tZHkyVmZloE9EsIHWVkuLx94Y6LH/81bTp+2v50WZ5yjmlK44n6U+seG3veCVI
 wYAIA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Sun, 19 Jul 2026 22:05:36 +0100, Julian Braha <julianbraha@gmail.com> wrote:
> Some typos I noticed:
> 1. expressoin -> expression
> 2. A property represent -> A property represents

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan

