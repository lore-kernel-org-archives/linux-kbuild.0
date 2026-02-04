Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FBA2E7BD6;
	Wed,  4 Feb 2026 07:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770190748; cv=none; b=YC9uct/MAW+jsbAjQhqKH+Au4lYSTrKSIYS9Ms7u84gPR4IHmk+PXSXW+8EwMg7qd6IPVBfQGtrvsbdVyHJ4GOCNjNasl2vJtQxscFImtlJXvJ6ZZY/eE94jhxqT0HBfGL4tacYoPR9KTKwgNmMYNr/68sKOuGUkNRzwzrrKeJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770190748; c=relaxed/simple;
	bh=jm8ETM88T1Nh7wj9NJT4Pb7+gDCX0n49jTCaPgtkxqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AdPnUSybo8XvN5oPNs9lOI85K/m8eUozIcS5FYQfyft+bRHcS1OWIgdyhXUcXvH3Mcbobu313+rj9RPV9UK2qdsBH/Pd5sy4FvAty3ErLMnJVupTufFQzCbmQ76gyttvV/BCsof4Sk4UlwcGXi63CzcU/G4MbBuLvyZzadIJlEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvS0dvoi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvS0dvoi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C97C4CEF7;
	Wed,  4 Feb 2026 07:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770190748;
	bh=jm8ETM88T1Nh7wj9NJT4Pb7+gDCX0n49jTCaPgtkxqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JvS0dvoilM1BQ2JE50/FGbPUF7Dn3azlQBfnPFERwmBSaf/BZhKxYNycqw4iV1LrB
	 QrLVw+EO/omaEUq36t4pVWCfKpl65+hR0ImV/t7UgioCIDQE47FwXQSmEC+pixrJoD
	 JwITZc2y8K6Hxe2qIeiTG2SqQpNpDGo0qy1bBW4TU5qhM35A5rmQeKUJmPISZMTkGy
	 8O+x5nwIJKh9I12YeUbWcYJPhStavmxO867oMJzA32/3StBwqPNEhVobuH1UTBPBdc
	 dKdkZMPLXbxt1qa2dsSx72y4ERvA1PdItBBXfAgOhlhFzpy7m+SHxd4mCmi3iRByvV
	 wtJ3HvS/Hit0w==
Date: Wed, 4 Feb 2026 00:39:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Rong Zhang <i@rong.moe>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] kbuild: Do not run kernel-doc when building external
 modules
Message-ID: <20260204073903.GA1632007@ax162>
References: <20260130-kbuild-skip-kernel-doc-extmod-v1-1-58443d60131a@kernel.org>
 <176987242178.1743608.5094531752561489739.b4-ty@kernel.org>
 <CAK7LNARR9bZQ9t9emcVzmL+P7xYemu=8s8v_LshQ0-m_zEE9mA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARR9bZQ9t9emcVzmL+P7xYemu=8s8v_LshQ0-m_zEE9mA@mail.gmail.com>

Hi Masahiro,

Good to see you around.

On Wed, Feb 04, 2026 at 04:02:10PM +0900, Masahiro Yamada wrote:
> On Sun, Feb 1, 2026 at 12:15 AM Nicolas Schier <nsc@kernel.org> wrote:
> >
> > On Fri, 30 Jan 2026 14:37:47 -0700, Nathan Chancellor wrote:
> > > After commit 778b8ebe5192 ("docs: Move the python libraries to
> > > tools/lib/python"), building an external module with any value of W=
> > > against the output of install-extmod-build fails with:
> > >
> > >   $ make -C /usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build M=$PWD W=1
> > >   make: Entering directory '/usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build'
> > >   make[1]: Entering directory '...'
> > >     CC [M] ...
> > >   Traceback (most recent call last):
> > >     File "/usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build/scripts/kernel-doc.py", line 339, in <module>
> > >       main()
> > >       ~~~~^^
> > >     File "/usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build/scripts/kernel-doc.py", line 295, in main
> > >       from kdoc.kdoc_files import KernelFiles             # pylint: disable=C0415
> > >       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > >   ModuleNotFoundError: No module named 'kdoc'
> > >
> > > [...]
> >
> > Applied to kbuild/linux.git (kbuild-fixes-unstable), thanks!
> 
> 
> I believe this is a wrong direction to go.
> 
> Since kernel-doc is a part of Kbuild,
> all dependent libraries should exist under scripts/.

Is this around the recent moves such as 778b8ebe5192? I guess Kbuild was
never consulted on that change and I missed eba6ffd126cd, despite being
CC'd, so that is on me.

I did wonder if it was worth it to package these files in a previous
change but Mauro seemed somewhat opposed to it (but maybe I
misinterpreted something):

  https://lore.kernel.org/20260130063056.72fbe458@foz.lan/

Perhaps tools/docs could be moved to scripts/docs and tools/lib/python
could be moved to just lib/python to have everything live logically
outside of tools/ and make it easier to package?

Cheers,
Nathan
