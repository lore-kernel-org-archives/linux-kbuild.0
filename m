Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4723B33F8AD
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Jul 2026 00:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785372777; cv=none; b=LLhy1cgjyyH8YE8JY4GwqsL7M88APk93g3Lz9pY6dVIRbuT/x4P8zkNoygk5EDnH8In72fKuOPc4Rsf49G3wwj9WOYGJqQ9oaA8gCNMdIj5y0S8j/VhiXsXez+5QA9BYV9bv1rZo3nJH6UKNxrdzovRu82dE8Ma/3IeN59GpGxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785372777; c=relaxed/simple;
	bh=MOctM8uEXSbyQLnMVAYbHYhXXXD5sqaElykXVrA0310=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgK7IzEZ9AAkji11cwem5U9If/K92BX5snfCGQbOkd8VZJb9ez6PP4z1vFJMiIcSVeiVNlpURI8WgL8ybgDfRkmSKyI5UwCWXSocF7tt5AdwvXvsRqQW8O5oplCof69ZYV3uNfdZpUH41YQAkv64l8Q/bd4mLNidRPmpGXw5Qnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWUvz7PZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWUvz7PZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767961F00A3D;
	Thu, 30 Jul 2026 00:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785372775;
	bh=6AYWf6ylACgtmjo8y5MDL5jGa2ISU46xhBoGZkc8WCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lWUvz7PZ8e7SmgTjme/rLW3l5AP14p3p0YN3afn+W/ngdON/ve5L5j6gX1zJjEk/8
	 QKqkbev1P3LVxg9jPW1qWeUafuJRO+QFfku06fywvh9pLGYuvWX8SfE35Ia6pUROCf
	 eWrS+DV7qMPTf1gwR/2T7iDsUvL/Fh0O8xXVnlIbmV33sdq1m7GIVtWs4rftJrLZ2N
	 1MHKBa2JdgdN3gJuWSCY650Nndd7ZrYk6cRvv29fdqI2hx5NxXQlFlZoQjjagTZ6RQ
	 dev1UNkvgXsrD46o3KJMhpvtlIHNwdkEBZQ45HGHb5CyL6msKnRbr6cAngQOLWUG8m
	 G3raqkrjwDJ0A==
Date: Wed, 29 Jul 2026 17:52:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Logan Finley <logan_finley@selinc.com>
Cc: linux-kbuild@vger.kernel.org, n.schier@fritz.com, nsc@kernel.org,
	rashinkar.anish@gmail.com, thomas.weissschuh@linutronix.de
Subject: Re: Re: MO flag not working properly for building out-of-tree
 modules, tries to replace the Makefile in the kernel's source.
Message-ID: <20260730005251.GA3819292@ax162>
References: <20260729231242.GB1120279@ax162>
 <20260729233641.189148-1-logan_finley@selinc.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729233641.189148-1-logan_finley@selinc.com>

On Wed, Jul 29, 2026 at 04:36:41PM -0700, Logan Finley wrote:
> On Wed, Jul 29, 2026 at 04:12:42PM -0700, Nathan Chancellor wrote:
> > Does
> > 
> >   https://git.kernel.org/kbuild/c/39d6e68f50f4a444a6ba23b9ea2eaee806601c6d
> > 
> > resolve this issue for you?
> 
> Yes, it does. I apologize; I didn't see that there was already a fix.

No worries, it is a little hidden away. Thanks a lot for confirming that
it works.

-- 
Cheers,
Nathan
