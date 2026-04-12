Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B11C2765C4
	for <linux-kbuild@vger.kernel.org>; Sun, 12 Apr 2026 16:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776010815; cv=none; b=T4hVDJiwFdrheBtZ0pw7lrSDRjDxf4jy+ZzfMUFa21TWWcUZjLO8gWXL7OFgh4a5CP/gFrOEJVR5FUhOsHP0ZHqkUs3b5mZrcko5HkPTTwfS7bTWpgXlxDeF5AA7IUSfWAvEDMbsuN87vPUczTMKQmJGrUr73cF+UvhA03uOcbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776010815; c=relaxed/simple;
	bh=JitUAvb5HTIxzDp1I2YpHYJVJ5fKgLUL97jVxAZZ5KU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGbFySjEPJYiOTvXmrqiJF4gfUHTBHwg4L2unxUN2w/BMy5xJKG4OI4FJcoUd1YDjmT6ebr7g15Q1teTcgIJ8CsDR1FufnsPfxbtrTgPKln/dH2G20YtWkMKLpvUtT90bxglE4bjQ0/fDxGG5CSY7qr7YMvKnpq62KHs6lXKrrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMFnQxim; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMFnQxim"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 480FEC19425;
	Sun, 12 Apr 2026 16:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776010812;
	bh=JitUAvb5HTIxzDp1I2YpHYJVJ5fKgLUL97jVxAZZ5KU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cMFnQximGoEHH2u3r/9UMrhJLXNtO3BbEQnJ3MwSKdiMZ1yZ89nZLnZhAfOU7BQhk
	 Wt64mn90LVxFPLe62rkDt7nF1p2Y/tt3oVRNFXLBWecHuYxccO9NMcl0yPRSdPg7YZ
	 Zyav6bZfCM68NDewOZcZ/7kTgIO5yHvIv1TK/biMU3PxjzCkPVusOao9ZzLDLdiEjC
	 /Zj34gai5yXngzySs16UadqWnzguWFoFWmg7ngRCXwyPmjJK5+khywKzPZtms1v2WZ
	 iwQDtGDRsMmKH9LOp45yNqJXQ09uiJ9uTkt3xCyBZeMHwO32yxMCNvV9JHvGo3EtuE
	 MkL+nzQ3LPqXw==
Date: Sun, 12 Apr 2026 18:19:54 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Andrew Valencia <andy@linux486.org>
Cc: linux-kbuild@vger.kernel.org
Subject: Re: Kconfig olddefconfig nukes 32-bit
Message-ID: <advGKvtLfEb1vwNK@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Andrew Valencia <andy@linux486.org>, linux-kbuild@vger.kernel.org
References: <af3a3eea-ae34-4f94-b17c-43f154e80ff7@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af3a3eea-ae34-4f94-b17c-43f154e80ff7@app.fastmail.com>

Cc: linux-kbuild

On Sat, Apr 11, 2026 at 10:55:15AM -0700, Andrew Valencia wrote:
> Hi,
> 
> I'm working over in the 6.19..12 world, and brought over a working
> .config which I updated with olddefconfig.  Long story short, the
> config was converted to a x86 64-bit config.
> 
> The issue is the new config entry 64BIT, which has a default value of
> ARCH != "i386".

yes, there is a 64BIT Kconfig symbol defined at arch/x86/Kconfig which
is true by default for non-i386 builds.  According to my git tree, the
corresponding lines did not change since v4.18 [1].

[1]: https://git.kernel.org/kbuild/c/104daea149c45

> On my 32-bit x86 build machine with its 32-bit .config, the default Y
> is being selected.  Is it possible i386 is not the correct name for
> ARCH on this target?

I guess, that you want to cross-build a 32bit-Linux on a 64bit-machine,
right?  How did you call olddefconfig (e.g. make ARCH=i386 olddefconfig)?

Kind regards

-- 
Nicolas
