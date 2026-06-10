Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2CD31282C;
	Wed, 10 Jun 2026 22:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781131792; cv=none; b=k3HGDvS0ozkrJICkUIXDUCh9YOi7jCytDSIuk55CXaCuhqgYufIcC0uoSQWRcLp/ocUTgaU5O3ED53owlfc9hDkPUTk0lzvqfC88S0V/4dvtiXzATo0mAzy0jTY7lpLeoQUsaLoOCnsC5szoqqAce+nuaA5wWgXLex8nHrMuF5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781131792; c=relaxed/simple;
	bh=NAMPvSTPVRIqmpSgC6oaBv3nKJTFQuXaMUJVV2KBJFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=td3A6TLO5BscmgMokI2oZBilc47SEBT7XS5Rw4M/FPYWgBw8L3tXTldbIVavqrZrDdgQo6Xi7UZ0Z0E/xLW4AcmZnTENfHzhvvRIX1an+dwy5S4kYH/YRIqNWBtkqUU3oOmWXS4sSOkAVBpxQ33VBLfsyPeekmWpv1wiunTmlCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MGj7tv8f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MGj7tv8f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993391F00893;
	Wed, 10 Jun 2026 22:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781131791;
	bh=o3WuyORTA51/Grd/a7qKYMhKMe4Y0//OY89yZNsIf1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MGj7tv8fKL7cVvoD3StRXZWMeXBj8QeXR5Vtlpandoi2oep2lpc5eBH7jiSpE9pS/
	 eKRjaZmxhD53Fw+hKZagC3XqXTMY7RP0/hfsbXrrqj/KdRfhxEkblsOp4maGzeAuXJ
	 EA1N7LYFDfV9kGST0X+W0Rq0rOwUwYUfRPi8fohMYJUB1+76UQQItOmb8CgaQcqNcC
	 DFS9n8nAKmaqp333hfzcHgO960LvXaJusObJ8BBBNJPqET090b6u5v7CAt82ny97uc
	 c7qaLnkcOBhChzgredy7WgsE6zwqxb8zRdFE7Ei4WQT9CujDGobSB9yjuKAcuvykwa
	 4r+ceHNWVI+nA==
Date: Wed, 10 Jun 2026 15:49:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	nsc@kernel.org, andriy.shevchenko@linux.intel.com,
	rdunlap@infradead.org, julianbraha@gmail.com
Subject: Re: [PATCH v4] kconfig: add kconfig-sym-check static checker
Message-ID: <20260610224945.GB2820589@ax162>
References: <20260527142703.107110-1-andrew.jones@linux.dev>
 <178104876973.2707941.12816857648925597603.b4-ty@b4>
 <g5b6ff6h6p34mz3deqihy5wag2a3bmado6j7i4vi7q7kidmdl7@cwdht5xitxxh>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <g5b6ff6h6p34mz3deqihy5wag2a3bmado6j7i4vi7q7kidmdl7@cwdht5xitxxh>

Hi Drew,

On Wed, Jun 10, 2026 at 11:00:15AM -0500, Andrew Jones wrote:
> I've been meaning to get back to this in order to address Nicolas's
> comments, but I got buried in other things recently and have vacation
> next week. I won't drop those improvement suggestions from my TODO,
> though, so I'll hopefully be able to address them in the near future.
> And I'm happy to keep it maintained going forward as well.

No worries at all, I see quality of life improvements as "things to work
on when things are slow" and things are slower during the summer
anyways, so please do not feel like you have to rush to get these done.
Just wanted to make sure they were on your radar.

-- 
Cheers,
Nathan
