Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479972C859;
	Fri, 27 Feb 2026 08:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772179939; cv=none; b=Vd8kpJXC4NQc3Iqh9OV4axbWYUmV9hI9Z8rhV01E7GwVUzFx/o9K0FZNuAE8HUho3CWDf9CEmM9XAm3L11P9XkD2OCLjCU/I1/B/QV8Lcb277XAHidV7UUTdP1QWyin4GCK+UO7A7uj40L9YkEj1kPNMyONov6kAfgqjd8E0cxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772179939; c=relaxed/simple;
	bh=2YW0xpQ35zi4SXo4K6Q76X9ID+4VIjZ33QUmae7hFaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4UzlKYgZxqzBd4ENyb7wYo9RtIEDlaacS3Xjyb7pW8hWa2BxqKRIjMlu2Ol0CRgqU45dNNqk9wRhpJ1m9AhgxMude6nH9g1W8ulW4cOV7eiXHgcvklfyI1Kp/BmXv1UtXcQO+BUSk6cgfjX1Oof59SwPoZR475rclQJCuw23+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MlIUj4t3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MlIUj4t3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A355CC116C6;
	Fri, 27 Feb 2026 08:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772179939;
	bh=2YW0xpQ35zi4SXo4K6Q76X9ID+4VIjZ33QUmae7hFaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MlIUj4t3n0CNVMTVZwUEyn7o/MimM7l+gyNkLti/e8Z6sLYdqDEiWHbehYpGq6Ova
	 26hOBmTO24VvWge1BXlPgk1qNW4zgZzXsb1Hp0ZbcX5eW21gs4brTbbbeWg1+D0qag
	 4xi+O92e66aseou9kbAgIAApYIAG/jbFoYV8DafQAT6uDF0DkbNBRgHva/mST0YeMm
	 bQ1p0jOKngAss/Munn3xc69nB+n/icgsAxITobuNEuSAt45BoexNKv4GSEOP504R2J
	 5lZbi5YxxdyRccZllkk3kkG0ofVQEwk8KSF+kjIEnq1WgY5YY5jwHZaP8dq3tqLmW5
	 RZZd68EdzpJMg==
Date: Fri, 27 Feb 2026 09:10:27 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation/llvm: drop note about LLVM=0
Message-ID: <aaFRc0OR-NlPQcQ8@derry.ads.avm.de>
References: <20260226-kbuild-llvm-followup-v1-0-201cc2a492d9@weissschuh.net>
 <20260226-kbuild-llvm-followup-v1-1-201cc2a492d9@weissschuh.net>
 <20260226214349.GA1534917@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260226214349.GA1534917@ax162>

On Thu, Feb 26, 2026 at 02:43:49PM -0700, Nathan Chancellor wrote:
> On Thu, Feb 26, 2026 at 10:23:57PM +0100, Thomas Weiﬂschuh wrote:
> > Since commit 502678b88cb3 ("kbuild: Reject unexpected values for LLVM=")
> > LLVM=0 generates an error instead of silently behaving unexpectedly.
> > 
> > Drop the now unnecessary note.
> > 
> > Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> 
> It might be worth keeping the note about LLVM=0 not being the same as
> omitting LLVM altogether, as neither the documentation nor the error
> message will say why that is not a valid value. Maybe:
> 
>   ``LLVM=0`` is not the same as omitting ``LLVM`` altogether. If you
>   only wish to use certain LLVM utilities, use their respective make
>   variables.

Yeah, I think that would be a good thing to add, too.

W/ or w/o:

Reviewed-by: Nicolas Schier <nsc@kernel.org>

If nobody complains, I am going to add both patches to kbuild-next
within a few days.

Kind regards,
Nicolas



> I don't feel that strongly about it though. Regardless:
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> 
> > ---
> >  Documentation/kbuild/llvm.rst | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> > index bc8a283bc44b..441d8786fcbc 100644
> > --- a/Documentation/kbuild/llvm.rst
> > +++ b/Documentation/kbuild/llvm.rst
> > @@ -71,10 +71,6 @@ recommend::
> >  
> >  	PATH=/path/to/llvm/:$PATH make LLVM=-14
> >  
> > -``LLVM=0`` is not the same as omitting ``LLVM`` altogether, it will behave like
> > -``LLVM=1``. If you only wish to use certain LLVM utilities, use their
> > -respective make variables.
> > -
> >  The same value used for ``LLVM=`` should be set for each invocation of ``make``
> >  if configuring and building via distinct commands. ``LLVM=`` should also be set
> >  as an environment variable when running scripts that will eventually run
> > 
> > -- 
> > 2.53.0
> > 

-- 
Nicolas
