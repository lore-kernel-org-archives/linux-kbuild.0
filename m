Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACE9225403;
	Sat, 10 Oct 2026 02:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791599010; cv=none; b=fTmaNhPH6LYogwRRWhyWPHLghWpEjy/xyy13qypPaKT0LEbv75fywFdr1mYeEYNLMM3btpPfPicGRHLw2aYwET7MlZAz3p2u4Oo8jRmnGMQ85TyADHWYRK4dCtlIADLnD0TFtHXTgu1iRMxxTDZI39n+pdu9jl4b3JiUhE1VNNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791599010; c=relaxed/simple;
	bh=Oj1a3hxm4L7D80EZD4kaUuKWhDN5liOZxpZs7hpSz5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQ0F+dW8RAawTI1831bxtzm7uWfUO5q5gl07CVFiRCNgz9pEZzB8m059v3BHAJF5Xt+eqQ3AazB5OMcTElNd14pYKxtUtQNnz3/9gBPoLJHElrbwFq5r0c75rgYeoW+DRDtYWs8ofvR7Qc5jhODtVNi8sXJBAF8CGsNto6M63Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7wTFb+4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7wTFb+4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DB51F000FF;
	Sat, 10 Oct 2026 02:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791599009;
	bh=2tuSIVNlOMnIBx4zCc8eM+/FvEw/2e2qDzzbNChd+y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l7wTFb+4m8LqvH9sJ1lSEYybZAyxJXWTSiL3TLJPz0Na+SWk+pi8zW7IgiucR1xf/
	 NHLWqShpkhZUtXtzPm1CnIj+mSpWlX8Zm4AeOKrOjMgPezPqy0cpkuNMtgMS+E6iOX
	 DUDVwOsq8WU+UgqGkA0ceS52G6Mcekg55H8dqJWCPI782k9O+xGb/+bNQVBCTC6hcC
	 6fwVFoKzK2tFVqZSHfc5Jlnfkf9jiymWaZtF4nS8VwJ5w/3tYUY57c9WaLj8dJcGq8
	 2MPZJNMN1jiVVj8V1yc6pIOf/QNSSDLi7g6/2Jln3QnfPXKhy3SjmFgD5Hsnt/qWUy
	 jnz/gXhHJKKNw==
Date: Fri, 9 Oct 2026 19:23:29 -0700
From: Kees Cook <kees@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	linux-next@vger.kernel.org
Subject: Re: [BUG] Build failure in next-20261007 and next-20261008
Message-ID: <202610091922.19792FDA8@keescook>
References: <0ddb5e5e-f801-444c-aa98-0cfe814a3026@paulmck-laptop>
 <202610082200.752C6C08A5@keescook>
 <51aa9736-6e78-40db-9d4f-95dc7142e222@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51aa9736-6e78-40db-9d4f-95dc7142e222@paulmck-laptop>

On Fri, Oct 09, 2026 at 08:57:02AM -0700, Paul E. McKenney wrote:
> On Thu, Oct 08, 2026 at 10:11:14PM -0700, Kees Cook wrote:
> > On Thu, Oct 08, 2026 at 05:56:21PM -0700, Paul E. McKenney wrote:
> > > Building a kernel on CentOS Stream 9 from next-20261007 and next-20261008
> > > (and maybe others?)  on an x86 or arm64 system results in a strange
> > > build failure featuring:
> > > 
> > > WARNING: Unable to reopen jobserver read-side pipe: FileNotFoundError(2, 'No such file or directory')
> > 
> > What are your make and python versions? (Oh, the answer is going to be
> > "CentOS-patched make 4.3")
> 
> I get "GNU Make 4.3", so maybe I need to patch or upgrade or something?
> 
> And "Python 3.12.15+meta", so maybe I need to talk to people here.  ;-)

I meant, it looks like CentOS has a patched version of "make". But I
think that just changes the nature of the bug; it's still a bug that
needs to be fixed even with unpatched "make".

-- 
Kees Cook
