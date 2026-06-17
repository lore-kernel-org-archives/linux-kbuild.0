Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCF831282F;
	Wed, 17 Jun 2026 21:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781730258; cv=none; b=ZOXm4ciNoUYwJW1g/hi++IE/UXRSsw6QXXQBb3A29t+KMspyiy/iTYNqivJgEmK3RYklxhCScfZvynC72d0baR5Xjh4MtSmSJ4w3kcDLizrunVQzaHLUjJUlGm7gdiYBLHDTHxXRCQNoUwoLnuoNjrVdxkCx2lHlk6cvIxgUU/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781730258; c=relaxed/simple;
	bh=QwTOZ9VA1ryphxbdJwlz1eYufmeqzJe7F3vJbTo8mF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9TGCfY9aGmohqhkHWmWDpTAhKolzMZ/zx5NrR5udRCVduE0NTPnw3PLF7jjuQ6BuKSqHcuB+19xNyGH/cZn+UGbSnbxXarihaNlWK2uhmscYhaktSOnvG8PKjLOCTC1GKjzCJc0JpmAV/ikM95v6GXJayRtCbcIkygVcSSzfXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2UybZMy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2UybZMy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E201F000E9;
	Wed, 17 Jun 2026 21:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781730257;
	bh=2CnfC7Q+1g0GiQpM9dq8vOVmAkHHooubPu9Nh2vPy4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n2UybZMyk01pBAXmpmCcE+9zWDQeG1Q8EYoa50ArlVOuhgjn1g6r9xrtitWsiJFIC
	 3ZMwsoBiIwV+1RNaM1aNK7UCR0s3m/9revuZQQYQBLawyvElK/8+5+uvb1QwzIt+dv
	 tXYLLLj+ciMQ/0r2eXjo4viE72tbBj4bSwbRYMZxfzXI0dsnDvDZfDdR00mOkGxQI0
	 2HoUoqVl3MKV0/OtxHepCGqTDGvX+A75ePe74UHvzrUxadlx0YdBI1RFf15pOZdyHJ
	 PTMfe8RoOZ3Wmt7Rcoja7gY4HGQA2gXQ5WapTs/P18Ba2BtciY+Y/x5nGCucpRAWkN
	 W/NYzxG8eI6/A==
Date: Wed, 17 Jun 2026 14:04:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Rong Xu <xur@google.com>, Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Siddharth Nayyar <sidnayyar@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	=?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>,
	Alexey Gladkov <legion@kernel.org>, Johan Hovold <johan@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] modpost: Ignore Clang LTO suffixes in symbol matching
Message-ID: <20260617210410.GA3894029@ax162>
References: <20260615222019.4116687-1-xur@google.com>
 <CAF1bQ=S3SLC4d6ODFfAFRMw_kLWq0wFqhCM9Uz_yEW3004b3wg@mail.gmail.com>
 <71a166bc-06c9-4a84-b61b-6b0d7c6c6585@suse.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71a166bc-06c9-4a84-b61b-6b0d7c6c6585@suse.com>

On Wed, Jun 17, 2026 at 12:48:10PM +0200, Petr Pavlu wrote:
> On 6/16/26 12:43 AM, Rong Xu wrote:
> > A more direct fix for the warnings in
> > https://lore.kernel.org/oe-kbuild-all/202606111233.kM8oo8Df-lkp@intel.com/
> > looks like the following. But I believe the solution provided in the
> > patch is more comprehensive.
> > 
> > -Rong
> > 
> > ======
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index abbcd3fc1394..1f0a379b43c8 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -967,7 +967,7 @@ static int secref_whitelist(const char *fromsec,
> > const char *fromsym,
> >         /* symbols in data sections that may refer to any init/exit sections */
> >         if (match(fromsec, PATTERNS(DATA_SECTIONS)) &&
> >             match(tosec, PATTERNS(ALL_INIT_SECTIONS, ALL_EXIT_SECTIONS)) &&
> > -           match(fromsym, PATTERNS("*_ops", "*_console")))
> > +           match(fromsym, PATTERNS("*_ops", "*_ops.llvm.*", "*_console")))
> >                 return 0;
> > 
> >         /* Check for pattern 3 */
> > 
> 
> This variant makes more sense to me. The initially proposed patch
> modifies the match() function, which is a generic function to check
> whether a string matches any of the input patterns. The modpost utility
> uses it to match both symbol and section names. Adding symbol-specific
> knowledge to this function seems odd.

Yeah, I had the feeling that it was a bit of a layering violation as
well. I think I would prefer this targeted fix for now since I will take
it as a fix for 7.2 in my planned second Kbuild pull request. We can
revisit the more comprehensive fix if it is needed in the future (while
seeing if we can address it outside of match() regardless).

> I noticed that LLVM has recently made improvements to reduce the number
> of these ThinLTO renames [1], which might be worth checking out.
> 
> [1] https://github.com/llvm/llvm-project/commit/975dba28633d2f3746a8a370741b17024b0f5f9b

Indeed, we have started using that for regular ThinLTO when it is
available as of commit dc3b90751d6f ("kbuild: Reduce the number of
compiler-generated suffixes for clang thin-lto build"). Distributed
ThinLTO support will follow when LLVM 23.1.0 is released.

-- 
Cheers,
Nathan
