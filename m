Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A369B3859E2
	for <linux-kbuild@vger.kernel.org>; Tue,  4 Aug 2026 11:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785844053; cv=none; b=grvZscPSfY4MV+//tc8EmBVzeq6J82+wdgqTHpqxmCKjdFYKUFGNsc5HjR+oTk/dR+CtAnYUoxk1krxYGABATt3IGzf/b8i6LZsmO3+dya5BbtTxCJeDRq+1QhAf/MVSjq1/MdZlpPW+noozReF2Zh7ojshcLzKDVspUB96+ti4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785844053; c=relaxed/simple;
	bh=YxTihr2FKqqg15L4T+zYc4haluog+fODFjtwP/2zRQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJfRnwtfQ+tb9zUE8xPSbZJsTXQ31nxUvzJ7L9mwB4hH+sX0IpO+2kHqsGWXbQbgBPb18KecvatdakzHLgVmg/OAyL7UGMsdUnMDtvdNim9Df1xjy03+bVm3Hy8baPgsfy23D7O+Q5pKT51gyuqbHsHioXDmH3OuNMPJfHSyQOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcTAN2dB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcTAN2dB"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E91AF1F000E9;
	Tue,  4 Aug 2026 11:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785844052;
	bh=RqIMvCEKi8L5o/D23Z1ZdSRlk6yoWYsdiou41oaSKDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bcTAN2dB6HcCgzehkQiJjSedv7SQ2/PZyLJs50cat34WL6880XNrRHHTQMLGmPiAd
	 BBQUuekY++++l5eEn9xeIpfcFFY/ev3d9SZEeo9GIPshtKkwC+wRKjgWKndq858uTK
	 JENWDqvgTvB6ltTBX0DmpyhTOE57rG4owiI1nRZxhSjkRYCb/zlNeRWulAF3oD7vdE
	 iduLdGHWLMpq/KbIlTFnLh0aIeJfh8IiJMbFf5jKsyyqvJCuQ2JWodJ/lyeqzvXCN9
	 /8Hjp9qQXFNkcLkoHD0lmaIj0UQMqKF6nFGAiJpj71+U0NJ0Y/StBaOKr31Scbkm4x
	 TMKfarsivzGFg==
Date: Tue, 4 Aug 2026 13:38:41 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Tj <tj.iam.tj@proton.me>
Cc: linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 0/2] Move tool for generating initramfs cpio to
 scripts/
Message-ID: <anHPQQp0Fjd3HPwj@levanger>
Mail-Followup-To: Tj <tj.iam.tj@proton.me>, linux-kbuild@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
References: <anEE6Zy9DmNzOqDZ@mail.iam.tj>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anEE6Zy9DmNzOqDZ@mail.iam.tj>

On Mon, Aug 03, 2026 at 09:15:39PM +0000, Tj wrote:
> I've almost finished the feature to add to usr/gen_initramfs.sh::dir_filelist()
> parsing of:
> 
> filter:/path/to/filter_script.sh:/path/to/directory/
> 
> A generic solution that can generate a cpio list dynamically.
> 
> My feature's current status is "working well".
> 
> I use it to include a sub-set of just-built modules in the initramfs
> with some additional ./Makefile top-level magic.
> 
> I noticed this proposal to move scripts so want to provide a heads-up.
> 
> I described the technique as 'sneaky' in my email of 30th July:
> 
> "How to move usr/Makefile call to just before vmlinux_a target ?"
> 
> In it I add usr/Makefile.add_modules. It relies on being able to include,
> unmodified, usr/Makefile, and use its targets.
> 
> Does moving usr/gen_initramfs.sh to scripts/ infer my 'example' script
> 
> usr/gen_initramfs_dirlist_filter.sh
> 
> should also be prepared to move to scripts/ ? It feels like that would
> be moving it from its logical home.

I think so, but guessing w/o concrete patches is probably not very
reliable.

> Due to the trial-and-error process whilst developing it, and much additional debug
> logging to understand call flows, it is not currently in a state to propose.
> 
> My aim is to clean it up by end of this week (8th August) and post an
> RFC patch series.

Please go ahead.  I will not able to have a in-depth look at it before
mid-August.

-- 
Nicolas
