Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602335;
	b=lVREe/m+9ra490sEVOHHysFU2xoj0bDY6kwWcxawfUOjc8sNh4boek8ufbowi8YBSKTW
	 lFPWkZrx0GCMY0kTdNyqKWkMj3k+WqkUBJB/sakL4GY0U4ePZ+ESjIIcRbIQ7ozwgb5xx
	 wTRJqLhUIgBDfjKLeFqLK8tCUVygdzyVIgpoFaauY8m0VobJsBdIvRKWt23hsUVChE8uR
	 Scr/y4ImXhrTYobW5pdKnrSbzZrm8aWxJjLQj4GjDDFDBNmqGc4HSXFbB3ictBypsKR1t
	 f0ShOZqbK4U9SnZYi+SDsHNNIXjhzlErbhI4meAPXWr44Zvr/hgGXsL9H74uuAA4yNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602335;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=2m70qaMoVXLxe+eN5Q/od+n/UdaKlHhJXr7DkMg5Ui0=;
	b=wu4f6mVz/b6LBYwauXHFf93WpF0VmMT5omYzqjmBCI4+1hC6ZGmcUJArM1zQWpKLeeN6
	 DEl3rKzq/f8FPcKYFW6oAi2WD8XavLbeLXJ7lpkSqbiSkPfKQwwrgx5tAxerSvsZh8H8/
	 0VgplKO6KBURgwji+IyxDwcSAZSOfq82OKW2BVyA7rN+Lvc+gT5kCiHw8ors+WtRcaDsY
	 0CSkbCf8xYYgK9zgPbkkYxSzwJNaWBnmsE2/qKIqHKl7yoqvqaMUimJNcW+GDG30JD0HV
	 QEkUkGisCgpnph7/Ay61qnhQP3ESg42yCSGI4MC2gKlvxfR+RvHO7/AXB6DtZnIHTlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TiyGy8Wi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id F05F1606A319;
	Wed, 21 Oct 2026 17:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TiyGy8Wi
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 0682F1F000C1;
	Wed, 21 Oct 2026 17:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792602334;
	bh=2m70qaMoVXLxe+eN5Q/od+n/UdaKlHhJXr7DkMg5Ui0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TiyGy8Wi3M7rdF0AEU56uX0TKFLyv8KNY5akytxGycf+Jz6YgFhLtbSEQ64a/WR0g
	 kIYsAOFZm9UhEsL0Vr7HCSReoCJvl3D0Ll7SHpjNO0NnRVo2+weiTTo9BYakSgSf66
	 vHSpSRHqVLwXiY8bTtgb2yofQYnd1oI/O4S6fSPWv4J5XzXMZUiIlc/2jOFShgpZLo
	 DEJla4nfgBgW8Dg9qdJrNkwLLyJp2W+hpyB7yzMC6IvEKG85EVfsyqNf9nKKCMqDxM
	 Wci45nLIGQQuz9QxJ3COgCNr3m41mo7nV3e7ShU2QTe4lcfdggFtTZ2PB+t6SSMYXw
	 QL/yhLGmM6h3w==
Date: Wed, 21 Oct 2026 19:03:05 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: allow to set package name version
Message-ID: <atjwSYKodxdVObA3@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20261019-deb-pkg-v1-1-7f8e60bbede5@sigxcpu.org>
 <atfI0Uc3iWSmR49j@levanger>
 <atfaLGt-46bVugss@quark2.heme.sigxcpu.org>
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
In-Reply-To: <atfaLGt-46bVugss@quark2.heme.sigxcpu.org>

On Tue, Oct 20, 2026 at 11:16:28PM +0200, Guido Günther wrote:
> Hi Nicolas,
> On Tue, Oct 20, 2026 at 10:02:25PM +0200, Nicolas Schier wrote:
> > On Mon, Oct 19, 2026 at 09:16:14PM +0200, Guido Günther wrote:
> > > Instead of hardcoding ${KERNELRELEASE} in the package name allow
> > > the user to override this.
> > > 
> > > This can be useful if one doesn't want to accumulate different packages
> > > for every commit or micro version bump by setting
> > > KDEB_PKGNAMEVERSION=7.3 or even KDEB_PKGNAMEVERSION=stable.
> > 
> > I am not yet convinced, that this is a good idea.  Do you want to
> > elaborate a bit more, why you think this is necessary?  Have you tested
> > your patch?  I don't like that source package name and binary package
> > name divert w/o good reasoning.
> 
> The source and the binary package names can already differ due to the
> `KDEB_SOURCENAME` variable (and we're making use of that).
> 
> What this patch adds is the ability to control the suffix so we can
> e.g. build a `linux-ng-foo` and a `linux-stable-bar` instead of having a
> linux-image-7.3.17, linux-image-7.3.18 (or with git versions or …). It's
> just about having a bit more control over the generated binary package
> names so we can decide what replaces what on upgrades.
> 
> I have tested the patch with and without setting KDEB_PKGNAMEVERSION.
> Without setting this variable nothing should change for existing users.

Ack, thanks for clarification.  I'll try to review this next week.
Thanks.

-- 
Nicolas
