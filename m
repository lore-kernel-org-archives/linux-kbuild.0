Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=24.134.29.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792530995;
	b=FZk/n3svZuAqLaGEDQmvvAIL5kdAJWNcM8yfBD2HGh/9QnwGwkfXP/0tkx/0AtHCLLU9
	 FEK4MzSLF8Xxp4FHtyujgMf3WE/BfcxS/T/OYnQJnGCQhOt9eWKFJ/Cku8xGAREyVV+/3
	 bdiJej5TUg6AJg5rRrbYWOpBXNtz0OQ4l4nD5wQCHuxB7DG99PfdW6f9PbpYPuQL16MUW
	 qbPOwSr6T2b6IIK4pQN5kUbqIqCrx/KhqxglsiVJFboV14nz82WL889+hshxkE2MfzUkS
	 lJK4X0e0I9hPNVCz/tfovj6StgJk1VZrcqHouXmEfB3gn0N+CM61qoAV7UsRokjrKRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530995;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=B3bLfthOSt3xqxUAUmOf2sxcjhbrnVatnteg2vCqEnE=;
	b=hTbt3hb181Q2N1/oiHmHVtYrftTKBQ2sLRZi0p/B4mctYQwhPdnZEPA9WN+R206VP597
	 TFRYkUYa3dpiyrTqgMQWjkDZKMCChw5J+jPDkQ6DzdCYoeieC66kJouBVHnuZwxxsh5WT
	 FMNRsXpJVg1nX0xPm0FV0q86A3Q4DfNxHu5zycChhAEMKhYrOPvTXLKWJ4iXrFof7jESf
	 MofRu6UP/kHGvcrWa+wo/kgiFrP6/l7S4q7GMtZzZJJkmYqcm9F6Xt8yrVz90NhlwM18I
	 8ayu3sh/5bpiVqU7eT+Hn/zjR8/WUhlCweOxGFrjZ62A1zxqhzidcBVzLiTMoyFKlBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sigxcpu.org;
	spf=pass smtp.mailfrom=sigxcpu.org;
	dkim=pass header.d=sigxcpu.org header.i=@sigxcpu.org header.a=rsa-sha256 header.s=2024 header.b=leVLvjKi;
	arc=none smtp.remote-ip=24.134.29.49
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447A3606A31E;
	Tue, 20 Oct 2026 21:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 447A3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sigxcpu.org header.i=@sigxcpu.org header.a=rsa-sha256 header.s=2024 header.b=leVLvjKi
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id 62121FB03;
	Tue, 20 Oct 2026 23:16:31 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_BaVwh42QpA; Tue, 20 Oct 2026 23:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1792530990; bh=VyoPL1jP6f4OLw+ga/Nomuw6eRu/BLjfUuCHxxV2oSc=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=leVLvjKi2s7EsPIiqAG0GTAUm/EE6GQ8U1w+dY7+U8M8yoiQ5JD/Z5dtf6ZU6b7l7
	 fJx/s0Jr3dKuHLVlfXR93AR7AmiWFg8RRvU/8GW9HeNudqiFmMw7ZwOpmtIxqz/Dq3
	 vAeMrKitsRxhjuEHdmJUQFiy5a8pq9gkVUAqSLP6Ado/p2bkCCgCYozbR2VcEPWBDk
	 RhYD0TkgsM3FkwoHaJNMdkSPVzaKR8FHrMC6/+V+ePZ+T6MuEnq+4dODhS46y7IBE7
	 SVrgOdXv7ZRpqmK4PV4OA8U4ouo7CILn7vxu018dHTYD5Gpyp59V/ZsV5V5L/WLGS5
	 SJstSe90H/3oQ==
Date: Tue, 20 Oct 2026 23:16:28 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: allow to set package name version
Message-ID: <atfaLGt-46bVugss@quark2.heme.sigxcpu.org>
References: <20261019-deb-pkg-v1-1-7f8e60bbede5@sigxcpu.org>
 <atfI0Uc3iWSmR49j@levanger>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atfI0Uc3iWSmR49j@levanger>

Hi Nicolas,
On Tue, Oct 20, 2026 at 10:02:25PM +0200, Nicolas Schier wrote:
> On Mon, Oct 19, 2026 at 09:16:14PM +0200, Guido Günther wrote:
> > Instead of hardcoding ${KERNELRELEASE} in the package name allow
> > the user to override this.
> > 
> > This can be useful if one doesn't want to accumulate different packages
> > for every commit or micro version bump by setting
> > KDEB_PKGNAMEVERSION=7.3 or even KDEB_PKGNAMEVERSION=stable.
> 
> I am not yet convinced, that this is a good idea.  Do you want to
> elaborate a bit more, why you think this is necessary?  Have you tested
> your patch?  I don't like that source package name and binary package
> name divert w/o good reasoning.

The source and the binary package names can already differ due to the
`KDEB_SOURCENAME` variable (and we're making use of that).

What this patch adds is the ability to control the suffix so we can
e.g. build a `linux-ng-foo` and a `linux-stable-bar` instead of having a
linux-image-7.3.17, linux-image-7.3.18 (or with git versions or …). It's
just about having a bit more control over the generated binary package
names so we can decide what replaces what on upgrades.

I have tested the patch with and without setting KDEB_PKGNAMEVERSION.
Without setting this variable nothing should change for existing users.

Cheers,
 -- Guido

> 
> Kind regards
> Nicolas
> 
