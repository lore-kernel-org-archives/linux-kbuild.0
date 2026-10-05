Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D2F480DDB;
	Mon,  5 Oct 2026 13:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791206063; cv=none; b=mneWeTnUpikwHwh6Jepw2jUw+BXeZStXNj7Rew3vls3gWv+OUpJRUQfdhMepRtHLkZrKpz93asqqgmg409COpJX7DFnkaIQ8okI9k7145WhXoeBaUs0Ro0WxvkKpUcQufBNwpnWxGSV6eKPy9fjTUyJPpIVkUEHuNy0jlMdCFbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791206063; c=relaxed/simple;
	bh=fQawUH8hbyVpnUwWmOcVqTrwEEXo93CPJjDB0oqOgtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlB5c4dbgAPjYDZhwIsasYM0xblQfS+sD3RUSOmNkd0fuOQ3dYo+DeMuGBFtPBJ7MwD+sD6/XuLvog0Sc0AYwEZDRaIwLdUWMWpYgksPNypN9UpK+j5eBpcJRWXehVztwmBvCp6iXhqW4NB44DOzmbW84lM1bXkTIRgnR7CMksQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYZYcEHy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYZYcEHy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89801F000FF;
	Mon,  5 Oct 2026 13:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791206061;
	bh=S7OLgiDXmXYVLCGYMMvYHH5jexIOHRzBB7fVyc9tpB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gYZYcEHyRLxkX1fBkMYLHlNzVcOUJooTFgFVF57IUb+RYdXV+DmT8LgFq4aHtW2/S
	 LvXUUR4HvR1gSm0gHo2NLf0Y/ViqoKKpSOmN1Llod/tg1wiim67bIjoIJPl4Ypmh8R
	 4dZl7JIf7Spx1D3LkZqgblDOzk3HKetsen9xm9Jt8F7pgruwm7hIWCHIqvOWcoupQL
	 VLhgf1CwPrtUdWUpcrBypQsSBPJ6wr6m/Jr/RdXy8W62E7bFmT7ABWUXet39d2pz0r
	 Yzht3mz1wP+ZGKNmQEqlMid4VO2w8qHqqCI+JCgP80x08RZDpvOy0kQg/onpiqoI1r
	 IMNUJytf/E+1w==
Date: Mon, 5 Oct 2026 15:14:17 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	Wilson Felipe Pereira <wfelipe@google.com>
Subject: Re: linux-next: manual merge of the kbuild tree with the
 mm-nonmm-unstable tree
Message-ID: <20261005131417.GA1097851@ax162>
References: <asN8duP-cEdNqP5I@sirena.co.uk>
 <20261005060713.afde74805e607478d6bda2ea@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005060713.afde74805e607478d6bda2ea@linux-foundation.org>

On Mon, Oct 05, 2026 at 06:07:13AM -0700, Andrew Morton wrote:
> On Mon, 5 Oct 2026 12:31:18 +0200 Mark Brown <broonie@kernel.org> wrote:
> 
> > Hi all,
> > 
> > Today's linux-next merge of the kbuild tree got a conflict in:
> > 
> >   init/Kconfig
> > 
> > between commits:
> > 
> >   d514d23689356 ("init/Kconfig: make config INIT_ENV_ARG_LIMIT user-configurable")
> >   9998f5eea1407 ("init, arch: make CONFIG_COMMAND_LINE_SIZE globally configurable")
> > 
> > from the mm-nonmm-unstable tree and commit:
> > 
> >   f85147b291e35 ("kbuild: move the toolchain checks into scripts/Kconfig.toolchain")
> > 
> > from the kbuild tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> 
> Thanks.
> 
> > diff --combined init/Kconfig
> > index 914c4c3ed7ee4,352601b44b5ca..0000000000000
> > ...
> > [250+ lines of diff]
> >
> 
> yikes.  I think I'll disable Wilson's command-line patches until after
> kbuild has merged up.
> 
> After kbuild is upstream I'll take a look at resurrecting command-line
> patches for a late merge-window thing or I'll bump them into 7.4-rcX. 
> Probably the former.
> 
> kbuilders: please try to merge early!

I plan to submit my pull request for 7.4 between 7.3-rc7 and 7.3 final.

That said, I fail to see where the conflict comes from between these
changes. They don't touch the same area in init/Kconfig. If I pull
mm-nonmm-unstable into kbuild-for-next, I don't get a conflict in
init/Kconfig at all, I only get the one in scripts/kallsyms.c that was
mentioned in another thread. Is something else going on here?

-- 
Cheers,
Nathan
