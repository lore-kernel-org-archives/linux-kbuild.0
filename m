Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2AC4A263D;
	Tue, 15 Sep 2026 23:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789515372; cv=none; b=NKsCFq8mh56y4qbDcDgJJ46mkz4AyflhLs7FHVgz44TZkEbng0MOwLjEU3nkyIWCgVoFyLUdBG7UZyj3oaMQk2DKgnqX81otvG6MBPNjkBKb1bexqixYhs/avtAkDfMwZHQo4R1dwvCi5VOjDGRHrlwqjqOXa2uPqdWBl0fSoCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789515372; c=relaxed/simple;
	bh=FkRN2jawdYwKATblpAyNJWwSu9H7DD7f8FFPlu0YGkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooqXq6e0DE9bKz8Q8rNbC/cOR7dQwy3mjHAybqF0d+yRRxs0L/xwvQlGaQWglm8tIVhoI6vx4+16+Vk37xZzN0hKEQr/x91RgcmTlkuOm1stf4YlgsC821EyzaczBhuhGQl37EjUtyOvHiD6T9HB0l7a0JKWYf+MuG2hr6Vufng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jr00ImAX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jr00ImAX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AE221F000FF;
	Tue, 15 Sep 2026 23:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789515371;
	bh=Ap01zyCMjD8ZanzGzZL1XJVEy0iBaTJoQEUJTBau1OI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jr00ImAXCtVgkm2snvvAMscp4pu2FydPj39Ai4N6inRBx8IMN1NHZz6JFCpTGbTyX
	 QFwiT1LfZx8ZhePsjKijICXxhYLk7n2782e8jCRp54DecYLzK7xuoCC7Uf3auYSuUQ
	 CU5lkHrYHbMNR/MGa2ZLb6zflNXaVAETw2kY47gtnQjMEfpdljeHPmv/MKCEsy/SLH
	 m/HL55NkgFUAviWyKL6Xb2bwyaslTVnggPD4FFNMnOfUeaNqq5iRYEXfwdnZWVcBj4
	 rwA3lynaKv8QlW9r7Lhf3VqTWqGMqA2F7VpoNuSsIkmx8W1nXGhk8URaRCRanNbv5p
	 Ip9U/1waqJbFQ==
Date: Tue, 15 Sep 2026 16:36:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: Erkan Erdem <hexvalid@gmail.com>, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ariel Marcovitch <arielmarcovitch@gmail.com>,
	Valentin Rothberg <valentinrothberg@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] checkkconfigsymbols: resolve revisions before
 resetting the tree
Message-ID: <20260915233606.GA863881@ax162>
References: <20260907103739.23212-3-hexvalid@gmail.com>
 <0122859e-028d-4860-b2ea-dcd709e4c505@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0122859e-028d-4860-b2ea-dcd709e4c505@gmail.com>

On Tue, Sep 15, 2026 at 12:43:29PM +0100, Julian Braha wrote:
> On 9/7/26 11:37, Erkan Erdem wrote:
> > The same problem affects --commit with the current branch name.
> > 
> > Fixes: b1a3f243485f ("checkkconfigsymbols.py: make it Git aware")
> 
> While it's good to support this, I don't think the Fixes tag is
> appropriate here, because this wasn't really a bug... it was just
> unsupported functionality.

I guess it is because neither this change nor the below change did not
take care of disallowing the branch name with '--commit'. That said, I
do agree that I think a Fixes is a little superfluous here, I would
leave it off of future revisions.

> > Link: https://lore.kernel.org/20210901145212.478066-1-arielmarcovitch@gmail.com/
> 
> This commit added a check that will cause the script to exit if
> 'HEAD...' is passed to --commit. So it seems like this patch should also
> remove those lines now.

While I do agree that we should revert this change, which is

  d62d5aed3354 ("checkkconfigsymbols.py: Forbid passing 'HEAD' to --commit")

in the tree, I think it would be better done as a separate commit, whose
justification is that HEAD is now properly resolved as a result of this
change.

-- 
Cheers,
Nathan
