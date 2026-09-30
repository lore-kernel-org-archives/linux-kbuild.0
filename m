Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7727A4749C9;
	Wed, 30 Sep 2026 12:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771045; cv=none; b=peQS06FHKmolbP9OYcacIoPaVF3HY+MN3saybHNoX7tXeSKOi+/+Mm0HEJ0PRFe7U9Eh6MJrlMWpWkfI5HkR6HSyC9Td7DPde1fw5Kyx8tYS0lJTSJn6G+AHFtCBzW2PgsE4I+bmM7lhvVgvcVC7CwHEIjehtnMJkUhWVtczxW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771045; c=relaxed/simple;
	bh=n6iS+4cLzIybQ2cTaptgs7zBxqvhv6rSME6rPvdnA2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+Ss4niW//wxYx1pqGqiOUmit9oLwGp6lfaRqNLRmbgJaujpfCAFgDjjtP0frCDu4/w0jTbt+qT7tDe2J/Lk41wK/r3+O2yPN9E82X5JNaxT+a1Dau/eWidz/1/d8Mr6tDZFTf2c5+amgYsn4B3EN8MrvpUW23xRIc2PPduNmzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYxrjVHG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYxrjVHG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA1E1F000FF;
	Wed, 30 Sep 2026 12:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790771044;
	bh=ABCbsvnVO0SrMIlZU+2u53mg1YXPBRbdpIa386y1xOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QYxrjVHGye4g2NCu6NyBIA36lse8rH86lS0njUneGoGJuRqRcbs0fPiUa9V4WuROZ
	 9/YmLarCiTovgfRHPFnvdcMaLknjqlHU0zrLD0XoyOEvmf+Qs/sMi795AXjKLr33Kn
	 Ah5ycCjdl/JX1xSIEpsmTXY1/KkikitgZ9Q6XSTbx4sKolC5okhDAcgvEwrAKr0CCz
	 9CI7P9xCCmLTEg2STEOyjf1vDrlppqRqJZ9fIiNmqEgFOQ/DcoO96xz2Zzlw9vBoVD
	 pHowcdkE1g8HaqxaV1s1uo6UmEHBwXe8OzIc1DQ9anw/JALhF4tqiobKHSPnJ1w2w2
	 g+8F+T8qDuT0Q==
Date: Wed, 30 Sep 2026 13:23:59 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	KBuild Mailing List <linux-kbuild@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Jim Cromie <jim.cromie@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the kbuild tree with the
 mm-nonmm-unstable tree
Message-ID: <arz_Mkk0n5UqP8lW@gremlin>
References: <arz2wQWcnS9499di@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arz2wQWcnS9499di@sirena.org.uk>

On Wed, Sep 30, 2026 at 12:47:13PM +0100, Mark Brown wrote:
> Hi all,
>
> Today's linux-next merge of the kbuild tree got a conflict in:
>
>   scripts/kallsyms.c
>
> between commit:
>
>   edd7005a42d42 ("kallsyms: increase marker density to 16:1 to accelerate lookups")
>
> from the mm-nonmm-unstable tree and commit:
>
>   531980b4b17e9 ("kallsyms: reimplement mksysmap in C")
>
> from the kbuild tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks correct to me, thanks!

--
Cheers, Lorenzo
