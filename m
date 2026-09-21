Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8863AB262;
	Mon, 21 Sep 2026 19:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790019408; cv=none; b=K5fnA902bnQYgpbrR81N+91OiOGCtqMu2zvM2ZN+NXxcEj166fT2jReQtO8EQuslvmUnqGrEH/PTuDHvBk4iH4awfb0VHQ89tO2MO5dNxOWkgMKb3XcOp319SLJHgcTpkuFh0PCkAsUKfkS7KNr8sUIX1jU9Q0XUrS7/AWZmBGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790019408; c=relaxed/simple;
	bh=p+hsRbtggipGRlvawCSQiuTfGXhSi7fAKUWvu52k1HE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMmmwm79ReHOti960nZi+aX+A9R5waRjSEdig8UAfbuL37Gvj9Zk9pTV2b199pBZcdmE4arLP4G26tf53M0/BbYPFh8Vn/DvsxMQd/RglSptNrOwX4RaeiWhTTtAWGtmwP6TckX4baFej3/PmbmVGgfB8ULrwtI1ht6l7HvbCAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ksMNhp1C; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ksMNhp1C"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0AEGmw/epH5jwYb4WUwW6Xy4DepIZNHBEAJLwk3xrWA=; b=ksMNhp1CVf86ZnALhuXNxYU1eo
	T24hDcDfTMjwEZdwpGkD1Td5mu0X4noIcvr/ZFilWP0oAoSrJv+FEtcIBy+XVRFz+NT3ZOqGQcBcO
	1I0oKSEKwdbs9yK88lY8Ck2xad2s9B/vJDLUADhkU9S+zzwMXy4fhgUanX1XhdMxmwpY7hrCJuHZj
	LbN3baTR23iLoknTPKdYdUiqeFfQHm1CCqbDmEx+RGQQehp+BIL6QRNe5KZgpuSu7b5vSiyr1RbIi
	iQCs2f6MOWLGCtOcL5DfWQVUpAdrBMLeytcp+jAQ7rlyCDawnqOZ+wrZdHdxjuAwtqh8XPFfz+bOp
	g0kMTJWw==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jog-000000059Ey-3lBx;
	Mon, 21 Sep 2026 19:36:42 +0000
Date: Mon, 21 Sep 2026 20:36:42 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Osman Ahmadzai <osmanahmadxai@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, nathan@kernel.org, nsc@kernel.org,
	apw@canonical.com, joe@perches.com, tglx@kernel.org,
	gregkh@linuxfoundation.org, linux-kbuild@vger.kernel.org,
	linux-spdx@vger.kernel.org
Subject: Re: [PATCH v2] README: rename to README.rst and make the doc
 references links
Message-ID: <arGHSsj96C3C3C4x@casper.infradead.org>
References: <20260921050038.76985-1-osmanahmadxai@gmail.com>
 <20260921070556.6909-1-osmanahmadxai@gmail.com>
 <e08514b5-87f6-4a2b-8080-7d7d8e802f99@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e08514b5-87f6-4a2b-8080-7d7d8e802f99@infradead.org>

On Mon, Sep 21, 2026 at 12:24:08PM -0700, Randy Dunlap wrote:
> Hi,
> 
> On 9/21/26 12:05 AM, Osman Ahmadzai wrote:
> > The README points at some sixty files in the tree, but it has no
> > extension, so it shows up as plain text and none of those paths can be
> > followed.  You have to go and find each one by hand.
> > 
> > The content has always been reStructuredText - it uses reST section
> > syntax for its headings - so give it the extension to match, and wrap
> > each in-tree reference in an anonymous hyperlink whose link text is the
> > path itself.  The rendered text is byte-for-byte what it was before; only
> 
> What causes README.rst to be rendered? Is it named README.html?
> I don't see it being rendered on a clean 'make htmldocs' build.

I believe this is some github thing.

There's something very strange about the diff being sent.  For some
reason it shows as a delete + create rather than as a rename + changes.
That makes it hard to review.  Please investigate and fix.

Also the commit message was not revised to match what v2 actually does.
