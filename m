Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA3F4E73B4;
	Thu, 17 Sep 2026 17:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789665448; cv=none; b=CwvBQA+ml0XUWQBo3pZgPoeGq7dOVx0t5ZJMbq722T399E8OpZXEKAyKCB4vjBC8K2YmyHjP5CIdtlqZeULGgFT9WHibxYezlO4vvDOGN1p2yxqK/yIerLY/wQHVXBla8ho6DGEJBD5LWfKjgoVp1uau9eHdit6k2t/HPAWcW9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789665448; c=relaxed/simple;
	bh=GWp8O5r4DCIIANlxRbbS/fi3T5bn614j4bSW3qUETXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nidL9U4xMhTm6V+XT9pB4e/5+MxVI09MRSUQUP7SD+5fKx5dcPP9j2zXT8y6IwBoLWEindWRDpoKbY8vr/8Mb0GKWyFXaxpD5UYpzBMFbvkSMkfcQjv6ivdfyZtaYYVqIyopZmcFtgiX/RDkN33m5NM7vT78jBdKj5o27fXY4qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IAT+XIos; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IAT+XIos"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC5801F000FF;
	Thu, 17 Sep 2026 17:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789665446;
	bh=vmvHzDWg6YMgBhgGgqWjXs2Rz4Hi0WH1lg4V2JgejHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IAT+XIosSA/W61Gj+JEXkZ246t/BFU/hPA9re9ZPSnyOeW7r8JJ5HSUPykqZlKTBc
	 QIRO5z8D+E58dqbHcYzDctH+uCpNz9pT/AflCNQ5nZlEmcMXm/klNIpoEeQUjWx9kT
	 6TrsI5EwztHz5gbWoH4/pc1vAcIGOk7soZYhv97yPS9LR+/MhkJAsGjTDu6/VFrToY
	 zufdTbfq42FG+yqMnpThoFAGUHkXzU6iVWCUGZH8CFvj+H1if3N220ne8ALm5d8buj
	 987lTOBhOAh1BMbj/qodKEppUTNVjuo3TOWlF33uC/x6Q1rjnWpbFmLkFhxgEpRzTg
	 p1gCGXcjzSU2g==
Date: Thu, 17 Sep 2026 10:17:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Nicolas Schier <nsc@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: add header check facility as a manually run
 static analyzer
Message-ID: <20260917171722.GA356152@ax162>
References: <20260915104331.255636-1-jani.nikula@intel.com>
 <211fcac1-d85d-4680-8e55-598b2064a002@infradead.org>
 <20260916231319.GA550816@ax162>
 <71a8b988-3977-44e4-93d6-782e4447f160@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71a8b988-3977-44e4-93d6-782e4447f160@t-8ch.de>

On Thu, Sep 17, 2026 at 11:05:32AM +0200, Thomas Weißschuh wrote:
> On 2026-09-16 16:13:19-0700, Nathan Chancellor wrote:
> > include/uapi already has its own header checking infrastructure under
> > CONFIG_UAPI_HEADER_TEST and usr/include/Makefile, which avoids this with
> > a no-header-test list that includes many of the files listed in these
> > messages. To be honest, we should probably forbid HEADER_CHECK from
> > including 'include/uapi' and refer people to use CONFIG_UAPI_HEADER_TEST
> > instead, as there are other differences like being built under a
> > different C standard or C++ and such that the existing infrastructure
> > handles.
> 
> Testing the UAPI headers here too would still be valuable.
> CONFIG_UAPI_HEADER_TEST tests the headers from the perspective of
> userspace after they have undergone processing. The kernel build
> might see the same headers quite differently.
> 
> For instance the example from above:
> 
> ./../include/uapi/linux/input.h:29:6: warning: ‘__BITS_PER_LONG’ is not defined, evaluates to ‘0’ [-Wundef]
>    29 | #if (__BITS_PER_LONG != 32 || !defined(__USE_TIME_BITS64)) && !defined(__KERNEL__)
>       |      ^~~~~~~~~~~~~~~
> ./../include/uapi/linux/input.h:34:9: error: unknown type name ‘__kernel_ulong_t’
>    34 |         __kernel_ulong_t __sec;
>       |         ^~~~~~~~~~~~~~~~
> 
> These are legitimate issues, the inclusion of the necessary header is
> gated behind #ifndef __KERNEL__ although it should not be.

Hmmm, fair enough. I guess we can leave this functionality in place for
UAPI headers then but I just worry about people doing what Randy did and
reporting these issues when they are already known and handled in some
other way. Maybe the UAPI header test could grow an "internal kernel
usage" check similar to the other checks that it has at some point then
we could forbid HEADER_CHECK=include/uapi but it is fine for now.

-- 
Cheers,
Nathan
