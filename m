Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086C727E7DA
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 23:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769212692; cv=none; b=niyDoPR7mTeyfh34lNHCHNKsAQgNrb992VmVc7Qu1iNSC6tdzXpe3ltRrJr/vyi+spvuIkFDC4PNmnlfshbl9P9CLNlbHBJbwH+wqi4ovurnq6y4dA/hkWld2D9Nqfz7n7KOfGBJ9lg5bEfaOA0Q2NL3e/mtThcnys+YjplTo9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769212692; c=relaxed/simple;
	bh=9hy3CDhp8XIOyFTqiAOPnfLpZesk2ukjsYbAVRpiyeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J6v9khJrlkRnmnXEFV9MKckqSY6iD2Alqn4wtiDuyruuE0I4wZ2+u+aljyAN5slKvQjOXfFVv66h1vVGB1rFccGhVkz3IaSDZwRoFMBr5e2Q8F3Eej3qR3w3SGe9uflsAMv2XocKBO36WxhvbSOch90v4zjkTMVwZa/uNuC+ONk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VlY9kaAg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VlY9kaAg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBED1C4CEF1
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 23:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769212691;
	bh=9hy3CDhp8XIOyFTqiAOPnfLpZesk2ukjsYbAVRpiyeY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VlY9kaAgg+d4qseavhZvCouwCuvNrnBJI1m6UAjFP8akB7acpcHgyy6j35CAPMoFO
	 SGUP9LbefHH28OLlWwYFhEA08zwLrK6canpvf1DWFB12f8IBajLUcjIa1cHwRNFjLu
	 K8W3d4aG1m6snE3gNd1tcOnHBeNoR6e+sRBdogw3nfnDH2DnHnsblcXCu/R4F/lXuo
	 RVjyCf9nCyRqShYa6RclERP/BzREDznzl/mCtBp54QeP25rIvXa4hD4/9GPRH9omHe
	 ZqcjaWPWciXLoiv1BfYVuroQ0HqJR39l+/nJ7mjRlaQdgArphuyTg/aRbXAX+liTlR
	 0KJVTHDYhmgwg==
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8c2c36c10dbso372632985a.2
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 15:58:11 -0800 (PST)
X-Gm-Message-State: AOJu0YzitGwd6uIBjXTxfH8CiU+zA3K+6+PptjZy1lmqqia/cM2HTR0c
	J1I8dNXqK/ovmjJlUA9HQqfESiAdWFIyJ2je1gCZsc2a7nIv4edJtZnuVjPEDlApnC3c93WtFRf
	pK0P3DdEyqccSKCXVEQ7jXuRPdeZITxw=
X-Received: by 2002:a05:620a:710c:b0:8c5:2032:3766 with SMTP id
 af79cd13be357-8c6e2db250emr579655985a.35.1769212691064; Fri, 23 Jan 2026
 15:58:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPhsuW48m9pPbKsiiNDnagrtF2vLYwHSZWUASirhFKgUSVrzQQ@mail.gmail.com>
 <20260123205359.GA95167@ax162> <CAPhsuW5XfLkAkEWVosGQFhgKj4f_Fez0G0fsT_6D1dbZuudr4w@mail.gmail.com>
 <20260123234418.GA206716@ax162>
In-Reply-To: <20260123234418.GA206716@ax162>
From: Song Liu <song@kernel.org>
Date: Fri, 23 Jan 2026 15:57:59 -0800
X-Gmail-Original-Message-ID: <CAPhsuW54fjr1tP+khcMYQ3qTjN_Eff_rm0dM4h3=TpFVwAdh5w@mail.gmail.com>
X-Gm-Features: AZwV_Qj1Qptgf7UAZuCBJfafbfO0TaAfAyb4qgH1dX7q8Zl71b2rIjPCI6gA9Ig
Message-ID: <CAPhsuW54fjr1tP+khcMYQ3qTjN_Eff_rm0dM4h3=TpFVwAdh5w@mail.gmail.com>
Subject: Re: make olddefconfig surprises
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 3:44=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
[...]
> I do not think something like this exists (maybe a SAT solver? :P), at
> least not as part of the kernel tree. This is basically the same thing
> as not being able to turn on a configuration in menuconfig until you
> have gone through and enabled all of its dependencies. I personally use
> menuconfig when trying to create a configuration fragment for minimized
> reproducers on top of defconfigs because it is easy to see the final
> diff when everything is switched:
>
>   $ make defconfig
>   $ make menuconfig
>   $ git diff --no-index .config.old .config

I also use menuconfig to figure out the dependencies. The problem of
this approach is that, if defconfig changes, specifically, if a dependency
is changed from y to n in defconfig, the fragment may stop working.
IOW, the fragment assumes some dependency is enabled by default,
but there is no guarantee that the dependency will always be y in
defconfig. This should happen rarely though.

I guess figuring out all dependencies is not too difficult? But I guess
the reward is not very big either.

> You could start with defconfig or a more minimal configuration like
> allnoconfig depending on how the selftests config is expected to be
> used (as a base or merged into other configs).

Thanks for sharing these tips.

Song
