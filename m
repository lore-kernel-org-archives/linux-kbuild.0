Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5556F282F22;
	Mon,  2 Mar 2026 22:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772490558; cv=none; b=mUs8JYexKaiYre/WyHqPrgua6/3HBLeE6bEZjOmjAJqSW6mmpBDl2Gr8RQsyCAN6DBMCIRN3n/tbrV+u0jc0ZURvEgHAaUC0d91Vj+X7DjOiHZJg+I3Ho106enpg0a4J/n7xdWHlc1P3rLJbcjDvzj/WxKRkp/W0kCayQIE7p9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772490558; c=relaxed/simple;
	bh=HJ1OG24xRAqMsZyg9iPUoOR2qTZCTeNclsBMZEvJBVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeBKm6go3EFyGJugrraEXTykAr/7fUf2CgUntnVVjfL9vbRvnQiinT+ELusNP5AQKRDDaclxp1LzLHP9TkarlNxP+86IG3xyQ8a8gqatKZnN3it6QLed3vaNyAgvOSvexe2dOpEDm2xL4FZzrw3DmT0wgkgyg2m4fGQtId/9N2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rw+YzvVV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rw+YzvVV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1632CC19423;
	Mon,  2 Mar 2026 22:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772490558;
	bh=HJ1OG24xRAqMsZyg9iPUoOR2qTZCTeNclsBMZEvJBVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rw+YzvVViv4ZeIWQf09JCqIOiqLhkKC+JZN/2SI3q+bdI/4u7UHj0nH/6A8p0F+4T
	 UNa9ArzIzEyReZMdoQWc8CEsmzdTdE2q43dpI2LJIs6qTLc2BN0ZTooJCvY4Kt1Uql
	 CEOQV6FcSx6bruFz7A7b7RVnLIeO4LvTUnjlcLPP9q4+VFthVuUtK2m6go32Nt55dI
	 fWxHIy8XMO20X9GqT2NrcpWoYc1Thc+MxOO4kXefuLMJtFCXAZtRpHju+rBdwvvp0h
	 ++cqEZHGUF1e3UfjPHn8CGrB34HVfVlzsFaaKchBsXYCIt+CiOdfGOKI0PlOv0oLSv
	 GpdQmxzjOtFAA==
Date: Mon, 2 Mar 2026 15:29:14 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexander Coffin <alex@cyberialabs.net>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: KCFLAGS vs KCPPFLAGS for -fdebug-prefix-map
Message-ID: <20260302222914.GA3292653@ax162>
References: <b8dfe7035d19fd611b9be55ee3145fdb@purelymail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8dfe7035d19fd611b9be55ee3145fdb@purelymail.com>

Hi Alex,

On Sat, Feb 28, 2026 at 08:34:37PM -0800, Alexander Coffin wrote:
> From personally building the kernel a few months ago (reproducibly) one of
> the parts that was incorrect in the docs was that is says to use KCFLAGS
> when you should use KCPPFLAGS for the following. I had forgotten to report
> this until now and I'm not sure exactly what is expected to make a patch to
> the Kernel docs, so I am hoping someone else can do the probably one line
> fix (or maybe 2 if you count the other reference to KCFLAGS in the file).
> 
> > When the kernel is built out-of-tree, debug information may include
> > absolute filenames for the source files.  This must be overridden by
> > including the ``-fdebug-prefix-map`` option in the `KCFLAGS`_ variable.
> 
> from `Documentation/kbuild/reproducible-builds.rst`.

Thanks for bringing this up. I assume this is due to the debug
information generated in assembler files. While the KCPPFLAGS suggestion
works because it is included for both .c and .S compilation, I think it
would be more proper to recommend applying '-fdebug-prefix-map' to
KAFLAGS in addition to KCFLAGS to insure the flag is only added when
truly needed, just as a defensive measure against compiler and Kbuild
changes. I can send a patch for this later.

Cheers,
Nathan
