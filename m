Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8BB3793A8;
	Fri,  4 Sep 2026 22:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559567; cv=none; b=pEB2czPdWnWkiDfuSr7va4DOFSM6KXUb7ILk/jW7zTFtfvlm4gcMvt98C8vb6kCFzGaYAIGAgYYc3II24LKVrkBYGMoh3yNyAqeB3gawia2w3Sw9ObSr4rxakjT8C+bUyTdOnU08fZmNg7At9zdbuVX1Z936f/AAAFUJ1G6DrxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559567; c=relaxed/simple;
	bh=wm8+PJgjzSuZhpUrikIaCkC4jmcwOl8RfhMbnlQcNLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0DRIxLcfqr/ylca57iqwp01m+13wD4aEWaMkvxL2gcSU+pBgvaagVvG39wqyYDWR9ZR8s+yh48GZLnlbrQB9j8SdqXogUv3CMy0VMwqhM5VlNMcg4CzdFWy6YCR17ebJE3u4DzUDLG36wGhqjiYVHDymRlsTGk9S7HbyVEZhMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqZu5Vy+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqZu5Vy+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FDA1F00A3D;
	Fri,  4 Sep 2026 22:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788559566;
	bh=IhCuvjICr0da7Vv1N/Ln8gkn39nWeE9v8Ut5DX4sgLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EqZu5Vy+TsZdjTulipWcd1k84qtAZ27EWvDVP+Vly1Yy8oyq8McojME5+1ZPetjsu
	 RaSFkdu5a1XHDR1GLF9I9YzkpTyx6hAanrMB1eSkD5OgK9n73Oo1a13xhJrAw/5Srh
	 pKC+OD5dHcR1CssMwbB/1ISPFfZ+VT3+u56XAc4DtBnljvI9eh/c+0F4hE7bePMWZ8
	 iizF+GcfTYhHM4J4CYY/oYvNSPXdFDTnSOYXdqMrxvrU7eOcf/XhIjMx5H7fV/57Nx
	 yjQcPMslS39mnGLolOX9qWj0CkO58hmfpAOJ2bANNmz87Ffz9v1qSHiN5ZNdbAaUg6
	 2S37nas+r4PQQ==
Date: Fri, 4 Sep 2026 15:05:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: nsc@kernel.org, ojeda@kernel.org, akpm@linux-foundation.org,
	jani.nikula@linux.intel.com, gary@garyguo.net,
	gregkh@linuxfoundation.org, arnd@arndb.de, ljs@kernel.org,
	andrew.jones@linux.dev, masahiroy@kernel.org, corbet@lwn.net,
	qingfang.deng@linux.dev, demiobenour@gmail.com, ej@inai.de,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v4 0/5] add kconfirm
Message-ID: <20260904220559.GB2787252@ax162>
References: <20260727001623.2794156-1-julianbraha@gmail.com>
 <51ade68e-7a0c-454e-a48a-4c72f7a730ac@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51ade68e-7a0c-454e-a48a-4c72f7a730ac@gmail.com>

On Fri, Sep 04, 2026 at 01:29:16PM +0100, Julian Braha wrote:
> As I've been getting more comfortable with the in-tree Kconfig
> interpreter, I've been wondering if the community might prefer the
> gradual integration of lints directly into Kconfig, instead of as a
> standalone tool. Similar to a comment by Jani on another patch [1].

Yes, I would think from a user/general developer perspective, it would
be more useful (and frankly, effective) to have these sort of
lints/checks in Kconfig directly so that they just run as part of a
normal build.

> Otherwise, I can do a round of self-review and send a v5 for this
> series. I already noticed some dumb typos in the subject lines, but any
> other feedback on v4 would be welcome if kconfirm is the preferred
> route :)

My apologies for not getting to this sooner, I have been busy with some
other projects. I will try to play around with this from a usability
perspective (which is what I am most concerned with at this point). If a
v5 is mostly prepared, I would not mind seeing it even if we want to go
the in-tree interpreter checks. One option is to take kconfirm into the
tree, fix up the warnings it generates, then moving the checks into the
interpreter directly while dropping them from kconfirm (since the tree
should be clean at that point). I am open to opinions on that though.

-- 
Cheers,
Nathan
