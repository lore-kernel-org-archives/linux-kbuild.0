Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E304305E32;
	Sun, 17 May 2026 09:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779010876; cv=none; b=bqoahc8eVFCkyGGfX7zxgfp9n4697RXTzYSaxs5RfvDJfeMn+CzPSFHZzaIsovraAjsRsbjKhcBZQ5VQv/q2XaEQD/9hPFwOa+YmUmfap/YFVdi7bP2jQAw4oFB8OQ/N1KgDOaFEn6SgqursKzVXZdNHxM+sNaeJ49nHrxJkOMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779010876; c=relaxed/simple;
	bh=Jl+1s3BaxlY8Sz+PAgD4XGUXffkDaCbtRl+dYwC/GH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BxVSgwqEsCa2PIRUcW1PiNWKEoCc52nkF6sKyNszvywY0Tf/3ZkPRsZG3GWBfztrA52mPOmcSJNKUNGij39UsF9asl6keHUPVLUgJ6sQRW8AhgWJftL5yVaTTemLbU4KHE/qMMCaJkme73E5Y85R4oMWRy+iE00BkNudvBwlCEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Uh/JMrdh; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Uh/JMrdh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1779010867;
	bh=Jl+1s3BaxlY8Sz+PAgD4XGUXffkDaCbtRl+dYwC/GH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uh/JMrdhcrQZnlT5lImarR8vtte5+tl986d4Q+bmIOr3zaQ5yixS5ZlCYTbndzZLj
	 hRTy09XpeFKeOkJVf+hirkhSaTapujees5CSE7lDA7XzWy1M0zYwGKQh4Rjlf64bpl
	 aUCBqUkAjmK4z/Ow8cokevkVo60fCjne8AXQQ9is=
Date: Sun, 17 May 2026 11:41:06 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Viktor =?utf-8?B?SsOkZ2Vyc2vDvHBwZXI=?= <viktor_jaegerskuepper@freenet.de>, 
	Christian Heusel <christian@heusel.eu>, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: pacman-pkg: make "rc" releases adhere to
 pacman versioning scheme
Message-ID: <724e3050-744a-483e-adf1-98b3d943d22f@t-8ch.de>
References: <20260515215913.92481-1-viktor_jaegerskuepper@freenet.de>
 <bbed7fb2-11f7-4396-a89d-881972565f06@freenet.de>
 <20260516153317.GA311940@ax162>
 <b882a024-f209-40df-ab5c-f212c1f43c7d@freenet.de>
 <20260517050056.GD1534263@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260517050056.GD1534263@ax162>

On 2026-05-17 14:00:56+0900, Nathan Chancellor wrote:
> On Sun, May 17, 2026 at 02:57:07AM +0200, Viktor Jägersküpper wrote:
> > On 5/16/26 17:33, Nathan Chancellor wrote:
> > > On Sat, May 16, 2026 at 04:27:39PM +0200, Viktor Jägersküpper wrote:
> > >> On 5/15/26 23:58, Viktor Jägersküpper wrote:

(...)

> > >>> -pkgver="${KERNELRELEASE//-/_}"
> > >>> +pkgver="$(echo "${KERNELRELEASE}" | sed 's/-\(rc[0-9]\+\)/\1/;s/-/_/g')"
> > >>
> > >> I will send a v3 patch later with the first substitution changed to
> > >> match "-rcN" where N is a strictly positive integer because this is
> > >> what we really had in the kernel so far, at least as far as I can
> > >> remember.
> > > 
> > > Do you mean dropping the '\+' portion of the regex? If so, I think I
> > > would rather keep what you have here since while an -rc10 is incredibly
> > > unlikely nowadays (we pretty much never go past -rc8), it has happened
> > > once before in 3.1:
> > > 
> > >   $ git tag -l | grep -- -rc10
> > >   v3.1-rc10
> > 
> > I was only concerned about 'rc0', so I came up with this:
> > 
> > 's/-\(rc[1-9][0-9]*\)/\1/;s/-/_/g'
> > 
> > For 'rc' releases starting from 'rc1' this matches '-rcN' where N is a
> > strictly positive integer. Since 'git tag -l | grep -- rc0' shows
> > nothing, I assume that there is an unwritten rule that counting from 1
> > is the correct choice for kernel 'rc' releases. :-)
> > 
> > Compare that to the Debian substitution code: 's/-\(rc[1-9]\)/~\1/'
> 
> While you are correct that the kernel does not use -rc0, I don't think
> it is worth preemptively complicating the regex to avoid treating -rc0
> differently from -rc1 and beyond; I find the way it is currently written
> to be more readable but maybe Christian or Thomas feel differently.

I agree with Nathan here, let's keep it simple.


Thomas
