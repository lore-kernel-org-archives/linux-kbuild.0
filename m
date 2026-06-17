Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFADD2EEE68;
	Wed, 17 Jun 2026 22:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781735459; cv=none; b=MOBpEY4zDGJmkb5x5KM/nRR+DoZrfIGE0vgocJSoSfagXPXMAjkjQelIbpVBVOYQsuojj9KJFdlwlOSqt5IGomebiGPig8okYgBZzkNfC+mi5VQkOo3qXB32neTtCeENVj6YrgU/o+AL+SJr4k9/GJgbZUrp7LL92jQ5U905d1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781735459; c=relaxed/simple;
	bh=Ix5IqDnIc6LqNbWylW/sj3UnwyPoCxbyCegDUzuVC5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INZALjX8y4Y2vJbQMeNGkEx06/72BhM1fe7wN0fX5mG1tfc9uZEIbjmZKq9QXb/HnyQJBCYrtngubJHBBJApDvw7uJ9sxBa9Rek+/xSWjPUwTL0GiE8SUbklogaVsF7I0rei4IUnd3orjuCWZbW1dd35EhoMbSpwSVvTCBezaHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3KdhQeJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3KdhQeJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B741F000E9;
	Wed, 17 Jun 2026 22:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781735458;
	bh=E5oop4TgsnZNMoD4GFdU48MAJHaPqsNP5SYe53mN4XI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J3KdhQeJIW3JD4Eb5Wn7WYwq2dcQooTmOMjA9JFDrbW2yZ/Xn/gMqExnzHgw2FOIw
	 qKLvHrG1F3sCTX+dfmsa69odAXCzrAVWVOlpkofK8jIKOiE4djJptXyXXOKXB0T01z
	 ihGVbrYAQf1jmy16T6iImgarvnb+t94VDkr+MnLerdLlOyDoZrl8ii+MQD8+jiGTGZ
	 DPYtChJyMhTGGp3qWZIJovGCY0Y0zUkKvIg8QC3WmW1liResKLp1g5w4ETZl1q/ifa
	 ZpzOCehHaCCG8LjAgRS5zA54PR0mfy18D84AnGnhSHX3YpyiYdim4vebiCeBUestrD
	 c7mVo8LsEPFEg==
Date: Wed, 17 Jun 2026 15:30:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH] modpost: release allocation when early return no suffix
 .o in read_symbols()
Message-ID: <20260617223054.GA3913876@ax162>
References: <20260610052550.187006-1-robertusdchris@gmail.com>
 <178167011232.2064238.5669414796099955471.b4-review@b4>
 <20260617214635.GA4766@soyboi>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617214635.GA4766@soyboi>

Hi Robertus,

On Thu, Jun 18, 2026 at 04:46:35AM +0700, Robertus Diawan Chris wrote:
> On Tue, Jun 16, 2026 at 09:21:52PM -0700, Nathan Chancellor wrote:
> > On Wed, 10 Jun 2026 12:25:50 +0700, Robertus Diawan Chris <robertusdchris@gmail.com> wrote:
> > > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > > index abbcd3fc1394..8e231544f9f3 100644
> > > --- a/scripts/mod/modpost.c
> > > +++ b/scripts/mod/modpost.c
> > > @@ -1585,6 +1585,7 @@ static void read_symbols(const char *modname)
> > >
> > >  	if (!strends(modname, ".o")) {
> > >  		error("%s: filename must be suffixed with .o\n", modname);
> > > +		parse_elf_finish(&info);
> > >  		return;
> > >  	}
> > >
> >
> > Thanks for the patch! While this change appears to be correct, would
> > moving the strends() if block before the parse_elf() one resolve this as
> > well?
> 
> Yes, moving the strends() if block before the parse_elf() also resolve
> this too. The reason I didn't do that because I am still not sure if
> changing the order will have any effect. I already take a look at the
> code and it looks like strends() if block and the parse_elf() didn't
> depends on each other, but just in case I missed something, I decided
> not to change the execution order and just add parse_elf_finish().

Yeah, I can definitely see why you went the route that you did.

> > I think I would prefer going that route because neither check really
> > depends on the other and we have to think less about unwinding
> > with the checks flipped.
> 
> Now that you already confirm that neither check depends on each other, I
> am more confident to take this approach.

Sounds good to me!

> > Furthermore, modpost is a relatively short running host utility, so
> > I don't really think it is worth optimizing for resource leaks like
> > this.
> 
> I want to confirm something first, do you mind if I send v2 patch with
> the change of moving strends() if block before parse_elf() in
> read_symbols()? I mean, if you feel like this is unnecessary, I will
> drop this patch. I don't mind either way.

I do not mind taking patches that silence static checker warnings when
they are either small or do not make the code much more complicated to
understand. I think this change would satisfy both of those points, so
feel free to send a v2. I just do not see these type of fixes as high
priority.

-- 
Cheers,
Nathan
