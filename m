Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794587824;
	b=4LdRP5jy7VA+5/VKa3C0v1fnCM7t5DxJTZ6lLHOKRWAOcmvFSIcgAEsE3TMfnaBuLxae
	 CJJgq6HVL1YNiKXg0wXE0b6BReyRYHuyFaLaQTJiqVIyxRSv0rYuAocecGamq1fL8d/D3
	 kFeABI6AOah0fIY7qFJ9mz4Y6D+Nx8WfmsyIA0ArfF8CKVs6Wp7N+tLzjvIo8PvOrPwi4
	 WYOMQOVno++DXIpL8AKqQWZAWy2ESCBbWji/iCcbhUop/f5/xv82P5BiHUGp3MNM1tX9c
	 kwR9kWIrrwxLPNAu2nUS6fWJYeLASr9kgZp9rhciG6I8RxQE1HYeUeuuL81QrU/ngjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587824;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=gBy9A8CXbQpral/EbSsaLlYPBMxysRiyGlfRbALVuP8=;
	b=ggOvCJKtFrjN2IF9yVRHx8o44FZbfHWhHe4ZIQvMdKj/2nPmLRSkJBvd+FT45IzRffVK
	 ykx5YaOH3zVHmhhr+YY912zyPD+H18fdtynxVUE8yvt4azbX09Gi6tSpjZGiSedWr0NqC
	 1PMRmnjdOkFwvYnFpaWIviCE2HBRyjuI9qISSHaTsTyq+Bz7RQIe6vOnrOhhAT+nr82yS
	 vtioBk0SaTDqxRYK7DT05z7A8yHkN2pheZiEEUGikseDDhvJkyCae7fDAXRw6U3bpLLuB
	 4KX8QTEPKPyKb8i/PYBdDG7XxrXZl5SyOC+vysXaWw9BeP9c2p1TvnnA68ECEG1vl+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fqgq2jxx;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7FA606A323;
	Fri, 13 Nov 2026 16:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F7FA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fqgq2jxx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794587824; x=1826123824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8gDAZ18rPNXLCmzOarBPnGCqfpqUBUhx4FE/88BdXiY=;
  b=fqgq2jxxExYiJAXzn0x6LWTBbi9gmxyIYZ/ojIRQi8/1LZBL9OLaIcwP
   GhScbmQvIWNbWcdJ0+2s4eSs1gXRRxbzipPoMXSz8h67WmVUo3zovBcR0
   Yc/6kJZxrvkqkF2ORL6y2NCXi17T19mYBjacCgJzCND9rUg585TRx9jj0
   eLepopokri6ZPEeZ3Sghh5nmS4WZZUyxc8TLAPWb8nCQ8/aof1LYCx04/
   aFVdtkPZAzNdz8jay+ernYI5Q6X8KsKMDB92fgs60kvkn1RAANsGviRBX
   ygmwemrjJHE33rK4W3Ny7kp+kjCznFKl+xj3ohcu2gK6aVgp6GFp+1cL5
   Q==;
X-CSE-ConnectionGUID: ii9rT6p4T6i8uoHuVIPsgQ==
X-CSE-MsgGUID: xAlHpV/eSw+AGHF1O15N4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3300384"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3300384"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 08:37:04 -0800
X-CSE-ConnectionGUID: Uoqo+KSRROq1g8vy+27/ow==
X-CSE-MsgGUID: ZOkGohn7RcaLvgUvXp2DVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="10866458"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 08:37:02 -0800
Date: Fri, 13 Nov 2026 18:36:59 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	". Boqun Feng" <boqun@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: rant on Rust in kernel
Message-ID: <avc8q6zydMFgDiy0@ashevche-desk.local>
References: <avXdJyqNNqopuH2_@ashevche-desk.local>
 <20261112214240.GF4107043@ax162>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112214240.GF4107043@ax162>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 12, 2026 at 02:42:40PM -0700, Nathan Chancellor wrote:
> On Thu, Nov 12, 2026 at 05:37:11PM +0200, Andy Shevchenko wrote:
> > (Cc'ed to Rust and Kbuild people)
> > 
> > I have two quite annoying things that lately Rust brought to kernel
> > (in some way).
> > 
> > First of all, it broke the old and nice kernel feature to build a subset with
> > allmodconfig or allyesconfig. For instance,
> > 
> >   make LLVM=-22 O=... W=1 C=1 CF=-D__CHECK_ENDIAN__ -j64 allyesconfig -- fs/pstore/
> > 
> > Now this makes a very good fireworks out of some rust.
> > 
> > Ex.:
> > 
> > error[E0609]: no field `disconnect` on type `usb_driver`
> >   --> .../rust/kernel/usb.rs:57:27
> >    |
> > 57 |             (*udrv.get()).disconnect = Some(Self::disconnect_callback);
> >    |                           ^^^^^^^^^^ unknown field
> >    |
> >    = note: available field is: `_address`
> > 
> > Second one, is that now with the above feature the build is finished like
> > a minute (sic!) later than it was before on a good server with 24 modern
> > CPU cores. It started happening somewhat a release ago.
> 
> You are probably seeing this behavior within the last release or so
> because of
> 
>   2625480a1bf7 ("hardening: Default randstruct off with rust for better allmodconfig support")
> 
> which allows Rust to be enabled with all{mod,yes}config to make -next
> testing easier.
> 
> As for that particular error, is it a -next regression?

No, I can easily reproduce that on v7.4-rcX.

> > I have no clue what is there, but I will appreciate if it gets fixed ASAP!
> > I rely on the above feature to save my time when doing test builds.
> 
> Note: The following is my understanding, Miguel or other Rust folks
> might correct me.
> 
> You are noticing the face that certain Rust crates like kernel are built
> in the prepare target, which will run for pretty much every build; it
> has been this way since Rust has been merged, you are just noticing it
> now because Rust is enabled in your configuration. I believe this was
> done to ensure the kernel crate is built and available before drivers
> were built via recursive make since they consume it. However, as you
> have noticed, this implementation bogs down the build and the same
> problem exists for Rust drivers that depend on other Rust abstractions
> and such.
> 
> Miguel and I chatted about this at Plumbers and we absolutely want to
> get it resolved but I am just not sure how quickly that will happen. In
> the meantime, you could just use KCONFIG_ALLCONFIG to disable
> CONFIG_RUST during configuration time so you can still use a single
> command:
> 
>   make ... KCONFIG_ALLCONFIG=<(echo CONFIG_RUST=n) allyesconfig -- ...

Thanks, this indeed helps. But I prefer not to remember this type of hacks.

-- 
With Best Regards,
Andy Shevchenko


