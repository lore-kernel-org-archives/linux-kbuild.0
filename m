Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792526585;
	b=Gjr2j+GgWva83zIkOgctZWYGuGMW3cD/5rO0HvsPmJ7RE3KT8uKqga8PkIe1aACU4R4t
	 SBIde4rDrfSSbhVyEgW+HP948HkkbWPDWol/UJmCFaVX5cCtF4zBJKqGytYAXdqMDE+hT
	 ecpn+Ewgc33uN+7mGXMi4wDmn3UTKGWCkz71554qt3EHeBbrcM/MlX/l9vTLKbGH6S05W
	 KNa1LstmYGSF8j8fe/sYy8pW65lr9x0rjOiXZHj/pPkHYJvVOJT+3BVNcgbfwyGrqk9+b
	 kUod/W9R9XnrrYga/v+iOhzD9VDlVTaXbQGvI7xTARWLZNd6HZeYHm3d2Wlnhfg4Krg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792526585;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=Pku0lFbvxT3mbVhybB/c/cLdbEfIKpHTEc3Odql5vdw=;
	b=iQ5+PTRQQvn2n4L4aG2xJcYUGUultii6LRgoRYl+ciNFj1J5zIVUcpJ5zQN8bCR3cX8U
	 GatZR/xvkK/F+zqhivjwEMa5b6BIFhmBYnFlubNqThDBzvwmEEtyuh6pDL38ZG5zbaG2j
	 1ySm0hhfgmSMPt/bpqlEHzcnUM37WuTZR4RPd4XunsCiXb/09AsiZLRtqK2h8YMHzB2+j
	 +6zqv70bb8zzlu13iLHaAkJ8icZMcIpnkUUoWRMfGHQ+0Aq3j0GLU4mtVIaZPA8nGmQnM
	 /IUSNbrhEbEET5ebODKldjAduRv2PtO7HAQ+5x98wg7hctIXgEleSPDho8O6hhHD7Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dvdrdRUQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id EFBFD606A319;
	Tue, 20 Oct 2026 20:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dvdrdRUQ
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id EAD581F000C9;
	Tue, 20 Oct 2026 20:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792526584;
	bh=Pku0lFbvxT3mbVhybB/c/cLdbEfIKpHTEc3Odql5vdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dvdrdRUQdp5aDmxlGlQR2lFlMry4nRGg/99jRhNRmIqO97Ac2h+rfU6Y/kLe92z8M
	 +nMgvz1H232syuZdyBS1Ph8KRQnGpUA/ji4IT2r6rYPQPIoBz5a7ZPglFQoRMvHUbh
	 Nf6aLWWgSf4RSRiewMx055VTBZSDFtWB5zd/rfbCMwP5uicGAW8Q94sk1asEaBInb8
	 Mi2GlkhuvGpj25U3mxJQxzzurG2oThz+pxG9eIEUjyIvd4XbPwk7it+GjkPtbVfzpI
	 H34/c9Er0ZxIDmeJXB3P3UeiPZJxN9XEZKGRMWzlRcvFnVVhChJnm06HKwKrC1k2J/
	 DxnPjDkIOLefA==
Date: Tue, 20 Oct 2026 22:02:25 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: allow to set package name version
Message-ID: <atfI0Uc3iWSmR49j@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20261019-deb-pkg-v1-1-7f8e60bbede5@sigxcpu.org>
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
In-Reply-To: <20261019-deb-pkg-v1-1-7f8e60bbede5@sigxcpu.org>

On Mon, Oct 19, 2026 at 09:16:14PM +0200, Guido Günther wrote:
> Instead of hardcoding ${KERNELRELEASE} in the package name allow
> the user to override this.
> 
> This can be useful if one doesn't want to accumulate different packages
> for every commit or micro version bump by setting
> KDEB_PKGNAMEVERSION=7.3 or even KDEB_PKGNAMEVERSION=stable.

I am not yet convinced, that this is a good idea.  Do you want to
elaborate a bit more, why you think this is necessary?  Have you tested
your patch?  I don't like that source package name and binary package
name divert w/o good reasoning.

Kind regards
Nicolas
