Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E75280A51
	for <linux-kbuild@vger.kernel.org>; Wed, 20 May 2026 13:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779283182; cv=none; b=BT71+F4IyAuw0Ac7KLlCyo23vaqvy0FC94sxHKDDFItbMgJhq6/iQoXo2X8R+1VctPIqG3xSk81yTmi2bsJHE6xIIGYAt+zWRmyS7gkTvbR/3HwLYFaZFjGT6BdZqC5XToyNwe+aJr/Nzrz7VZhSMYmfiOg6oA0hJavZwJOA+Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779283182; c=relaxed/simple;
	bh=t/70BYWRaYYYUZ+K9iR3ZJGPOCMWp1VN6BiJwlSbg1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPzpKx23xxfjL06746bLcviMBfngqDoMAQYePCUbCIKxGV2XDtHuAePyz1usN8mxy6DPK5zdMG6JINCTX2dvgO/t1P0EyHxYYyJkioS0JDaqKmaEeG/xTCNAUPD4CX2BwosUjdzWqwdb/AE0GAKfNu1wVWDzRicL4CwZssXRJJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JDPhT55i; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JDPhT55i"
Date: Wed, 20 May 2026 08:19:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779283167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=76i56gKZLHT8Ggj85k5S5MMdHFhq7hFd6tSC4ZRoaXU=;
	b=JDPhT55iVVn8OQ/5EgNv9gbrKKHbRmYpKwq//FRrBoeE+Wz1RKk7WdkQvbE7keEhS5fFMN
	2MQ2SaHo/vgLMk8yvLRjW5xZmY0o12bjp+LbkFLEHOE9Wn/4/e8zdOwGQeSQn4GMq8fc1U
	geFzV/7TLqYlNJmNWv2m+Ocb9y4G5x0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Julian Braha <julianbraha@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nathan@kernel.org, nsc@kernel.org, 
	andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v2] kconfig: add kconfig-sym-check static checker
Message-ID: <svrftave4mr7tozt366io6umg4bnqplnelk2sb55jpnenlf3yx@akqtot744swj>
References: <20260519215804.84025-1-andrew.jones@linux.dev>
 <e0ee7e31-0f0d-4dfa-acc4-c1822aa031da@gmail.com>
 <423ffdf6-fec6-4165-8c27-8c729558384c@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <423ffdf6-fec6-4165-8c27-8c729558384c@infradead.org>
X-Migadu-Flow: FLOW_OUT

On Tue, May 19, 2026 at 05:39:40PM -0700, Randy Dunlap wrote:
> 
> 
> On 5/19/26 4:59 PM, Julian Braha wrote:
> > On 5/19/26 22:58, Andrew Jones wrote:
> >> The checker also warns about uppercase N/Y/M used as tristate literal
> >> values following the same logic as checkpatch.
> > 
> > Hm, I tested this out by manually adding a:
> > ```
> > config KCONFIG_SYM_TEST
> >   default Y
> > ```
> > 
> > to the end of the root Kconfig file, but the script didn't actually
> > catch it. The hint about casing only appeared with the 'N'.
> > 
> > Could this be a bug, or is the Y symbol actually defined somewhere...?
> 
> It's defined in a test file:
> ./scripts/kconfig/tests/choice_randomize/Kconfig:19:config Y
> 
> Could the script be seeing/using that?

Yup, looks like it. But I still need a v3, because I see I broke things with a
v2 change I made trying to satisfy sashiko. The script now outputs a bunch of
junk along with the dangling symbols...

drew
