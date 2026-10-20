Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=24.134.29.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792525704;
	b=sCAuh0KZ35xsB7cnb2Abyigg77cKAl3pNrOHmhz9+pdFY/9yKy8UwhbT32kgNx+VnJ/3
	 7DKbSm78WXWMl0CYkBP+/MGMgCp6yzmXwiL6ZylZK1diOyuUl1RAQzeLaJSCAqRKvph2C
	 3xAdiZ1gwI2jl69NMNrpWkLgXTJ9F9R2SGKAtykzPWRdD0IU/sM1Ibp+EvGMDB4+dVjzZ
	 rnsX4GW29Bh177LTxIYUGF+xnfPdLmClhqQBHg7RZoJqTCEJM3nz4UM/LmEB1D5LHpz0F
	 PCWdA2lH9EOPi5jkLvgxH5P1Bz0w/hIKR/R6wCGRmyaE4NBGaJydDUEqb/8sRhvtC5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792525704;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=h5roEAuVHTY/cgyIMpvAeK1//9K48fpoKjZERhs7pAQ=;
	b=2U8Zfolqepe2hrMLbBPXWvT5USMvw8Hd80Sw8zb12+gUICXhA8x7P34sPdREmnWADtUu
	 IKKS9iBmMuxyj1qguX/9SYtdISq+2AjUEvOcl8uiF9P7z9a/GiCmWCpXVB00JVIjWTdkT
	 2PWaaVE80OSgqNjGE3byUc+KiprxlCnKyhD2ilzBc51uB1AIIb/ICcEx8txoLJZf/tkc6
	 yeEGDfxzcj9UY0+UX1PbGPtuD0HIrLCmKP8UNoZjJ61m8iQl/QxwIrLt36pewtPzf7/kc
	 H5D+HhVQTyJy0y87/xC/HIw/vJFvxsEKY8+KnercGdiwktB4FUDmDCk8oglXetFSLrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sigxcpu.org;
	spf=pass smtp.mailfrom=sigxcpu.org;
	dkim=pass header.d=sigxcpu.org header.i=@sigxcpu.org header.a=rsa-sha256 header.s=2024 header.b=puRb4H5i;
	arc=none smtp.remote-ip=24.134.29.49
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38844606A319
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 19:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38844606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sigxcpu.org header.i=@sigxcpu.org header.a=rsa-sha256 header.s=2024 header.b=puRb4H5i
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id 877F3FB03;
	Tue, 20 Oct 2026 21:48:13 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfXsRat3eS58; Tue, 20 Oct 2026 21:48:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1792525692; bh=oSfuBRS6OILPNF+ZPqvmTpgL4m5ntEHuSe0w+gMxnqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=puRb4H5inBU2xrJh178T+N4tFpbClFv9K8hMzzvnRigXJK2gjkWcBjNebjILeC53y
	 sCFS5VdIpKfm6fhYISnAu/dvLs8ql4nX/IEtC15Hym4rOCA+ZkTwcOlxOCuKCwA6bx
	 3Y91oUlqdz4UqSD1Wp8gYu4aWhEJzK+aOsidxJmNay6a3pFGG13M+2qsEiuACl2BMf
	 caXUfKwy7KkGPr8KN3Vp+q2fxry0vp08Y/RitwkzirPXB0e2WzEob/pqE0hA6/KyWZ
	 UbFfLUxJKQ71M6L8V+JnWVRIHAf2qFVhq0Od3FeGA6dk+v6QVVmtmdM/DcEOLx+4hs
	 8jU4nTI8dHBIg==
Date: Tue, 20 Oct 2026 21:48:10 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: sashiko-reviews@lists.linux.dev
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: allow to set package name version
Message-ID: <atfFes2OpYRhsgFN@quark2.heme.sigxcpu.org>
References: <20261019-deb-pkg-v1-1-7f8e60bbede5@sigxcpu.org>
 <sashiko-outbox-179507@kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-179507@kernel.org>

Hi,
On Tue, Oct 20, 2026 at 07:16:51PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] kbuild: deb-pkg: broken build symlink in install_kernel_headers()
> --
> 
> commit bc8efaaf9e21748a005be3c75bb9c6c2334ac049
> Author: Guido Günther <agx@sigxcpu.org>
> 
> kbuild: deb-pkg: allow to set package name version
> 
> This commit introduces KDEB_PKGNAMEVERSION in scripts/package/mkdebian to
> allow overriding the version suffix used in the generated Debian binary
> package names instead of always using KERNELRELEASE.

That's true, the script should use ${KERNELRELEASE} when referring to the
kernel version and $version elsewhere. Other parts of the script have
that correct so it's just a:

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index ba1defc616524..5fdc9ea0dcca4 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -147,8 +147,8 @@ install_kernel_headers () {
 		"${srctree}/scripts/package/install-extmod-build" "${pdir}/usr/src/linux-headers-${version}"
 	fi
 
-	mkdir -p $pdir/lib/modules/$version/
-	ln -s /usr/src/linux-headers-$version $pdir/lib/modules/$version/build
+	mkdir -p $pdir/lib/modules/${KERNELRELEASE}/
+	ln -s /usr/src/linux-headers-$version $pdir/lib/modules/${KERNELRELEASE}/build
 }
 
 install_libc_headers () {

I'll fold that into a v2 after waiting a bit more for other feedback.

Cheers,
 -- Guido
