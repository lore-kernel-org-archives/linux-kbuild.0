Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659CE334685;
	Mon, 16 Mar 2026 22:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773698560; cv=none; b=hDO6y4J3F1aejZsNYlrXNaJdBErwTTenY6LUZzevvPcODUGZv62YZMkdhZkN6nwZENJWlB+DGWCRGuAKExG++jth69P1nBes0XntOIRXhlyOrAS1rJlG0GsWOIpdQgWQidycwL5Aq0xX4W7o4hjS4p3Z8yJYXsjupiQdHSHduoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773698560; c=relaxed/simple;
	bh=iKTO2INH8tfq8xHYkkj4MolAtoK0jFQ+5aWerp0+6lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTLoIxsMp+uyRn6zGasyOfnP+lYZ7HFI+Gd8STZ7awhGmw9UHpvbhHzj/kWNTwnc6VyuRRxZ6Sb0TyeMz3/+I9jHzayFp8p5sXknpUL212M3IPUrWTy9F2ZNG0tFygx3i5MdIpVmeU2pvU27VOAXVuKLKIL5bPia+ESi39fVgIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rarqajf6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rarqajf6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83041C19421;
	Mon, 16 Mar 2026 22:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773698560;
	bh=iKTO2INH8tfq8xHYkkj4MolAtoK0jFQ+5aWerp0+6lU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rarqajf6Dli0SvBm2pit3d7rrtLBlXuKbbK/qtte9iq5q40UC9DMojxkRuVBpuysu
	 RiDiLd9TTr7y7wvh0Ms2hjV9UYDVYCMljVsp5vJgFHtdzzb1TP414iiex8lbheCgBt
	 i9PY/PtHTrKf43Yu2hg2Ei0pEPyRVzIDFKILoyst9kc9BTQRE8fyRh2GwrnCHTauo9
	 HKCgcxqnKxtHTkgjHHKIvMrjyy/NtL4fDVs2BjVEB4H3qkCm/IEbMBSd+WoK4C+4jk
	 70OTkeMsotyNCWSU/4eZNrbQ3h/G9BNkg/Tn3j7XcNxkbDIPLrnpFBHWMIAoMC9fPI
	 oUZEo8WP4cM3g==
Date: Mon, 16 Mar 2026 15:02:35 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexander Coffin <alex@cyberialabs.net>
Cc: Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: kbuild: Update the debug information
 notes in reproducible-builds.rst
Message-ID: <20260316220235.GC1329928@ax162>
References: <20260313-kbuild-docs-repro-builds-fdebug-prefix-map-updates-v1-1-3aeeef7fa710@kernel.org>
 <54c081d15d727c87a6e6fce35f2ba561@purelymail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54c081d15d727c87a6e6fce35f2ba561@purelymail.com>

Hi Alex,

On Sat, Mar 14, 2026 at 09:44:31PM -0700, Alexander Coffin wrote:
> I finally got around to reviewing the reproducible builds again and I'm
> pretty sure it is supposed to be `-ffile-prefix-map` (not just
> `-fdebug-prefix-map`) with KCPPFLAGS to also handle macros, but I could be
> mistaken. I can try to build the kernel reproducibly again, but it has been
> a while since I did this (sorry).

Thanks a lot for taking a look! '-ffile-prefix-map' is the same as
'-fdebug-prefix-map' + '-fmacro-prefix-map' and the kernel already sets
the latter in Makefile (this documentation mentions that in the next
paragraph), so it is only necessary for someone to set the debug
variant.

We tried to add '-ffile-prefix-map' instead of just '-fmacro-prefix-map'
but it breaks quite a few things for the average developer so it had to
be reverted.

Cheers,
Nathan
