Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCC94266B8;
	Mon,  3 Aug 2026 17:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785779266; cv=none; b=PJQRZdI9IjwRxLC0gQb01rHo0B35EO8LZyFD4VGvZI2tnLqI+Ov5Bd1ewwELKYNaVw1XphrM3obchsvnOIEERg5DLZdKh3S0/P0EoOrYyGcirbaIXhY50N10bJxz+6x/AnuMV337v4l4d1aCpEfa/VbLk3KX89+r2L/kPYZ9dV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785779266; c=relaxed/simple;
	bh=0sTU1fpEu65hKzJ0k7vE8ohFC/J4eNw56g3641nekTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MEmpGVv4cgK/erHWsC/oAtH9xlQGpTWKSVERVAW44K1gt0wszZcO3gxaPcBVM0ZPeXTJD3XVa/L12pfA0RD4WUOH4/EkSKrCRUf+5lOA7h5FeyipdI0CtIvT4CWkaEJY46ycEx96ObWskXPAA//AL99qBZlNus35eziu9cxCeJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WHU2JrNj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WHU2JrNj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 810D41F000E9;
	Mon,  3 Aug 2026 17:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785779262;
	bh=TZ1yW1pbkntBGTkHm8QiMh1/R2wvz/33KKg9bDtln6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WHU2JrNjJiEi+GPcBuC2XaRz1kaquSVBjYO9hhRQQv1RZPDv8YXmUCzKwzlcAJe5J
	 Zr7xCTkgybzy6thZrmPYsYRwYDFMgKa6Orpgi+BSrwLu4/qGaAg9TrIVI2a1Y8JTdy
	 0Dc8Dfe+a3jKOQA6KSo5wvdbftNIHMDF60PbNJw8pVENUY6gLUPgHvgdjjA4ehxyEj
	 aaeyRaz4bcwx0MB8gCG3/XEzNbxS2RPYBFaQJ/ahjx2ZLmGmiCPRNpMOL5e8O4GIyi
	 ZA8N9/hqmG4kI4a9BBaoM0DyPmVlm7WR5E+k8fbf4C6Y8vtoJ0bohFX8kVNsAhf+OH
	 1Sd2Als0b+T1A==
Date: Mon, 3 Aug 2026 10:47:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, arnd@arndb.de,
	stefan.hengelein@fau.de, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	nico@fluxnic.net, officialnaumansabir@gmail.com,
	rdunlap@infradead.org, vegard.nossum@oracle.com, kees@kernel.org,
	tj@kernel.org
Subject: Re: [PATCH] Documentation: warn users not to use select on choice
 options in Kconfig
Message-ID: <20260803174736.GA1067866@ax162>
References: <20260715220149.48700-1-julianbraha@gmail.com>
 <am-W4tuI0k7MKXVP@levanger>
 <30650585-9d4d-4771-af7c-7c3908281719@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30650585-9d4d-4771-af7c-7c3908281719@gmail.com>

On Sun, Aug 02, 2026 at 08:36:58PM +0100, Julian Braha wrote:
> On 8/2/26 20:13, Nicolas Schier wrote:
> > Adding the check to kconfig seems to be
> > pretty simple:
> > 
> > diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> > index b2d8d4e11e07..149d3ee59b58 100644
> > --- a/scripts/kconfig/menu.c
> > +++ b/scripts/kconfig/menu.c
> > @@ -287,6 +287,11 @@ static void sym_check_prop(struct symbol *sym)
> >  				    "'%s' has wrong type. '%s' only "
> >  				    "accept arguments of bool and "
> >  				    "tristate type", sym2->name, use);
> > +			if (sym_is_choice_value(sym2))
> > +				prop_warn(prop,
> > +				    "config symbol '%s' uses %s for '%s', "
> > +				    "but '%s' is a choice value", sym->name,
> > +				    use, sym2->name, sym2->name);
> >  			break;
> >  		case P_RANGE:
> >  			if (sym->type != S_INT && sym->type != S_HEX)
...
> I actually detected 5 of these across all architectures, and already
> submitted patches for all of them (thank you, Arnd, for all of your
> help):
> 1.
> https://lore.kernel.org/all/20260729203845.387239-1-julianbraha@gmail.com/
> 2.
> https://lore.kernel.org/all/20260801160140.2391000-1-julianbraha@gmail.com/
> 3.
> https://lore.kernel.org/all/20260714112047.2304856-1-julianbraha@gmail.com/
> 4.
> https://lore.kernel.org/all/20260723104933.117413-1-julianbraha@gmail.com/
> 
> With #5 already in linux-next:
> 5.
> https://lore.kernel.org/all/20260723122818.437802-1-julianbraha@gmail.com/
> 
> > I am considering to prepare a patch and add it for kbuild-for-next (but
> > not to kbuild-next) to raise attention.
> 
> I think the Kconfig interpreter should completely error out for these,
> but of course, we need to wait all of these patches to be applied first.

It looks like number 4 has been picked up as well. Given that we only
need three more patches to be accepted to turn this into a hard error, I
think it would be better to hold off on taking the documentation patch
and just push for the hard error next cycle. If these patches are not
applied to other trees before 7.3-rc1, we can ask to take them via
Kbuild with Acks and/or stable branches for 7.4.

-- 
Cheers,
Nathan
