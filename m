Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729CC26158B
	for <linux-kbuild@vger.kernel.org>; Tue, 23 Jun 2026 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782227915; cv=none; b=TPHeohZz9vGCNMqvmtwIczQT7q+fvHO2rJp8BXjnBDTQjpDpfE9nkIaA2Roay5hMSxyvjeE+tIwVi3MNXK6ukYUgDeH2rBZVmtOIOjlAGe7fcfXNrbaHMuYtgEknph4Hnn5+D0JDntd0Jc3dTA2fYf3Os7QPWgJlKYqP0RP+5zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782227915; c=relaxed/simple;
	bh=e2Vm2Ih/eK0lnJYJgsGGFv/CXizBMAdDyeGdZf8KXYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avs3D+NixnvUd8x/74I12oXDHMdRb/5cbchAK8hYc2hkHvk8youehnhsXEMeXC3QE38TCv9JkFK6n/NmLE2UM+ExtvyY9JLg8o1COLZjx/bhvoCYfZoUCDdabOo8c8KtykcV1mQd8aXsd2assAEP2EGewmFazQZovO0nRGsctus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wvw99glr; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wvw99glr"
Date: Tue, 23 Jun 2026 10:18:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782227902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MVSeRzDbFE6tjjCnmOuuVXHH5OPwzR2CrGQBcP5gIpY=;
	b=wvw99glr9Mb5n2m+J4TWV1LaiLTO0Oo9+/8TJrxkAC1d7P1YdtF7jWzABay99Ixo4fKF/o
	neEKgkLQgbC1IZFWvIuIRvH8WG3581daYerOJ5QjV86dxUOnMjBtiCR/pPo6hqAwmG6xgi
	MADhyhBMTQb5Unp6luG4tYp/Qj9R24g=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: andriy.shevchenko@linux.intel.com, julianbraha@gmail.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, nathan@kernel.org, nsc@kernel.org, 
	rdunlap@infradead.org, tfiga@chromium.org
Subject: Re: [PATCH v4] kconfig: add kconfig-sym-check static checker
Message-ID: <h3gyuwk2f53msfeuk3urxsfhrcsevb2rqszfh7x3laiwl2bma6@5edux2cyact7>
References: <ajo4DVWoSaEZtBDa@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajo4DVWoSaEZtBDa@google.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jun 23, 2026 at 04:49:13PM +0900, Sergey Senozhatsky wrote:
> Hi,
> 
> Wasn't on the Cc list, hopefully I didn't mess up the headers.
> Just saw this on LWN:
> 
> [..]
> > +	@echo  '  kconfig-sym-check - Check for dangling Kconfig symbol references'
> >
> > +kconfig-sym-check:
> > +	$(Q)$(PERL) $(srctree)/scripts/kconfig/kconfig-sym-check.pl $(srctree) $(KCONFIG_SYM_CHECK_EXCLUDES)
> 
> I wonder if you have seen KCONFIG_WARN_UNKNOWN_SYMBOLS which seem
> to be addressing the same (or very similar) problem (unless I'm missing
> something).
> 
> Basically, what I have in my build script is
> 
> # perform kconfig symbol lookups: handles renamed, removed, etc. symbols
> export KCONFIG_WARN_UNKNOWN_SYMBOLS=1
> # make kconfig symbol lookup warnings fatal
> export KCONFIG_WERROR=1
> 
> And then make fails whenever .config has something that is not
> supposed to be there anymore.  E.g.
> 
> .config:1606:warning: unknown symbol: SENSORS_APDS990X
> .config:2498:warning: unknown symbol: APPLICOM
> make[3]: *** [scripts/kconfig/Makefile:85: syncconfig] Error 1
> make[2]: *** [Makefile:760: syncconfig] Error 2

Thanks, Sergey. I wasn't aware of this. Is there a way to combine that
with some "make all" type target in order to find all the dangling
symbols that the static checker finds?

Thanks,
drew
