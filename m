Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AC82110E;
	Fri,  2 Oct 2026 16:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958267; cv=none; b=YHaAozYIj5vT8Ttp7W846SiZlLhO2Ho3TpLwbbyLCzX0lYslZf+scqtc1KrkWG9n0lZvxwPqqBkcCIXiP8HxwCxqNxMIRl3iSB9L4whrYqPiriWwD4SRdUGNlh1NIMIoN51AnYtsJ8GJHSmZyiA+7l1XJWSzWquVeDhnds/D2Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958267; c=relaxed/simple;
	bh=lxgjUUAnZAZo9Yq50ba0+9DERmTUNAPkrTbxhyNdhU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLN2Xohw9If+nNkU7jOndxXSsYtGhQY6+WSxD5/k9BKrbSbdMvCMtglHm7vkY6tHGClllk22LOcSw/7mBes+IsVJWzi+Dvbg9BHuO0HzItA6Yw+nXSXfjUtSOojckShRuoMZLlnppG4fgzWlPYPYPNaTn2P40utAkx8+sAGQ5Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVmP6mLW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVmP6mLW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F291F000FF;
	Fri,  2 Oct 2026 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790958266;
	bh=XvK+bPpafeOlO7y2OLbae7RD+paZS2cGqHv1W10YMhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BVmP6mLW1tqbuluEuUoEMqw93t8Tb0IMXGPJOXyDU4fZx5GPTy2CWt3FbheBEPupZ
	 HP6tFQZR7tCq+y8GzQDOsUC8TVuHCZTEJqiUpZGdDnEFXZVIRBMii5BTHStrllWN0t
	 6uzQcXK+bRXMud9cMGqeseGP1gYfrcOS05PkAfOML/5fD5AhzBY/7t1rNyX+prP4QD
	 3upKOLf68i1eZtWbiSWRySwYOknegk1dxDF19v47unjApzzPVuDYwPjRLJSXk6btHt
	 VPC19CiIz1dGeFzE+AiGqlcFGxkyVDq7iaN0hq0qW2k8aqkbPd2EQ3jfk+BOmj+ir7
	 Vj9Xuf6VWXY7g==
Date: Fri, 2 Oct 2026 18:24:22 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Nicolas Schier <nsc@kernel.org>
Subject: Re: linux-next: manual merge of the random tree with the kbuild tree
Message-ID: <20261002162422.GA288990@ax162>
References: <ar5-4Yq3wtmXTWnD@sirena.org.uk>
 <20261001192731.GA713751@ax162>
 <e7b1d231-f862-4f58-8cf2-3670066f8451@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7b1d231-f862-4f58-8cf2-3670066f8451@sirena.org.uk>

On Thu, Oct 01, 2026 at 10:13:03PM +0100, Mark Brown wrote:
> On Thu, Oct 01, 2026 at 09:27:31PM +0200, Nathan Chancellor wrote:
> > On Thu, Oct 01, 2026 at 04:40:17PM +0100, Mark Brown wrote:
> 
> > >  -config PAHOLE_VERSION
> > >  -	int
> > >  -	default "$(PAHOLE_VERSION)"
> > >   
> > > - source "scripts/Kconfig.toolchain"
> > > - 
> 
> > You appear to have dropped this source line, which I believe is the root
> > cause of https://lore.kernel.org/ar5-8C-j_JT5OYQm@sirena.org.uk/.
> > Restore it and the resolution should be correct with no build errors.
> 
> You're quite right, sorry - I got distracted by the complictated bit
> with having to update a non-conflicting file.

No worries at all, glad it was something simple in the end! Hopefully
there should be no more conflicts from that shuffle.

-- 
Cheers,
Nathan
