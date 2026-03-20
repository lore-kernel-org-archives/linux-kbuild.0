Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C2B3148A7
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2026 20:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774037676; cv=none; b=lUYCWsMAvvDN+yLnqGGm64KB0PSVhfxYuGu5LU/TIydK52K+TA8Ib4W63TDAC7zDxEaj+BzLNaWFbraJ5wHodyMl3d4D3+L7oTDP1E5suB1WGErG8ePY0M4rQGxAN2bJLq65uU3AmYwoIqHFXSE4l2iAZ03PiU046TWOTCqyFgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774037676; c=relaxed/simple;
	bh=NukA+Gj8k1vP0gYctIyoQUFS/7w0EgrK3W60lPn8jbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXcjclww64S9jrW4TzVe9j7wlx96qWWCosy1V3FVsD8OjTJKInHc8/DbqOG6rf8mIimE+TKJeH3Xx7fIQBVI6n/qeKd2jGcyd2ubXSL8Vsu35eyPm8I+9YzJoBg7FYcQSVytDzT5fK6VrE8CtXxWJJrR77sHDAXjyAYLCUEN7VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nohMSAiE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nohMSAiE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09687C4CEF7;
	Fri, 20 Mar 2026 20:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774037675;
	bh=NukA+Gj8k1vP0gYctIyoQUFS/7w0EgrK3W60lPn8jbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nohMSAiEkpiVyPKe0Ip8heGRvz5+dqhoSmqh1PuFySprV8ySzmXvQCuSkIae5D+RI
	 KBKNfOMPhvi3F9kOnmI12Rpf8G00P656YL1lef3vpqlxKdJkbYrXX7m/MTNuTfdwDL
	 JofKMtuihPj04P27thBk1oGwN4lvqlA/liXjGq1xn//X/6TzhJuZ8RJLBLnIaHu4Fe
	 X0RjEeTNNZNPVBYzI9ObYPVwoYpj7ZdPXAU8FhWyOQxdJMSj6/Bq4fO5zD9vfvQa5T
	 86ts+FXyLK8IxJZ+srahV1/1JhO6xV49YeZks97lN8rcd5kpkJJ+bkNSCumW5aw2Fr
	 lwNy8EZjlDZVA==
Date: Fri, 20 Mar 2026 21:12:53 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Dodji Seketeli <dodji@seketeli.org>,
	John Moon <john@jmoon.dev>, Nathan Chancellor <nathan@kernel.org>,
	libabigail@sourceware.org
Subject: Re: [PATCH 3/3] check-uapi: use dummy libc includes
Message-ID: <ab2qRWp2asMzQuWK@derry.ads.avm.de>
References: <20260306163309.2015837-1-arnd@kernel.org>
 <20260306163309.2015837-4-arnd@kernel.org>
 <6a93d709-2d69-4cd5-9854-18910fa69af2@t-8ch.de>
 <05fdccd7-4027-4c97-a701-a1d3019a4420@app.fastmail.com>
 <0a2464d4-37b9-4b73-b29b-3802f096d343@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a2464d4-37b9-4b73-b29b-3802f096d343@t-8ch.de>

Hi Arnd and Thomas,

On Sat, Mar 07, 2026 at 09:51:05AM +0100, Thomas Weißschuh wrote:
> On 2026-03-06 17:45:36+0100, Arnd Bergmann wrote:
> > On Fri, Mar 6, 2026, at 17:39, Thomas Weißschuh wrote:
> > > On 2026-03-06 17:33:09+0100, Arnd Bergmann wrote:
> > >>  		  -g \
> > >>  		  "-I${inc_dir}" \
> > >> +		  "-Iusr/dummy-include" \
> > >
> > > What about also using -nostdinc?
> > 
> > I just removed it from my version after I found it made no difference,
> > and I wanted to keep the changes shorter. I agree it's slightly cleaner.
> 
> Ack, your choice.
> 
> > > I have a similar (unfinished) patch flying around which also
> > > uses usr/dummy-include from the different kernel versions
> > > to avoid mismatches in case something gets removed there.
> > > Not sure if it is worth it.
> > 
> > Agreed, I certainly don't mind having your version either if
> > anyone cares enough. I suppose it would add a very small build time
> > overhead for the extra copy, but if it does help catch bugs it
> > would be worth the time.
> 
> It is less about catching bugs, those will already have been caught by
> the header tests before. But if something is removed from the dummy
> headers because it became unused, the old UAPI headers won't build
> anymore against the new dummy-headers.
> 
> 
> Thomas

Shall I wait some more days for a possible modified patch 3/3?
Otherwise I'd like to apply the series to kbuild-next-unstable.  

Thanks and kind regards,
Nicolas
