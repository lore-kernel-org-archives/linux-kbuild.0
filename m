Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588291;
	b=3bTESP+GT+b6SuLleebCej44o6QNs/w+vum8mc92f+hvCfLCETjazJMQv53ujNS786dk
	 XjvWY13dzSQFqINtGJ5GQlpE5XiAO7Vh5fGgs4TBh/aip15aclrmqHNffIMBVicmCWR8G
	 rSMP/PFHhYFWwol1D+kieoXORkV9AsaCX6zU2gat0+9lakdXdArTemOISoRU5BbHEEyKj
	 OdNqjJn2EylwRD0I4bO95nr3pr3GTgWj9EOLusK91m1vx8mrVSxyfeL2nxo0Msyy9xgkJ
	 61KfgJ5b/6TKwT+g9Lh+LBczo9kVd4tkUnuWKztIySZFmsAq20frWCma5pJyei/6Y6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588291;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=rxzLIMM/c8Ep1ewy7LMRLafB+oVmkjl4kE4MbP8LtPk=;
	b=UJxKAbCNo4huudh1/4v6wAYDIsW8MXIM31pOkzJvblYZg3dPJ2/7tW57LuPa0DLjAz6h
	 1nSrl7SyrXQmcHhWc33XO5VZsRPJlrQO6rsbjIgtja5xfWDlXH2K2NVKehm2ZRW5umJiY
	 GS3baarAkePOr1tlVC3qzcUzYvWnYxVaMIx6di+wsdGFYd6gXRAcTnUpLXpjfCY7F9y61
	 HG5fYDUfHV8WRG8OevuSJ20O5NWoq6f9z89oi05YW8mzxN0P24jPVPjevN+cZOMyK3GoZ
	 P6FtamIc5nRZAKm4mAHgiEec+oGwbcbXL3qEEAhn0DJ8PI/D06rkdSBmIeroBtsUA1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OQ5htJx6;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ECE606E20D;
	Fri, 13 Nov 2026 16:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28ECE606E20D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OQ5htJx6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794588290; x=1826124290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=m6haUncwr93hsVexdH0BpDD+rx6GbKCTtL0uV1UmNIA=;
  b=OQ5htJx66Dq+OlK7LYn+yNGSpKDo7aN2fTQYbgWlaBNdcsA6u7a7W4rS
   uWIg6X1b68Lk2wsBBTAOwEoS3a71eh2u04rANSzkv72v18tueeDG2i59k
   V6VPbbYyN2w45TVfPyiDvkuPK1vWsTn365CDu3MGVyF0Xhvw04SabZsPO
   RBj15HIup+X3ZTTHIpE+8XLRJuGpmWRDvGQTML5SuTUsvIo0QnVI1dy78
   909sOYFZt4yqPlniMmBlB1TH+Rhd7GYSdDQqS1SF+l1dMkjp3npwE7bpu
   WozbNFku8RIG0N8jz9WZoOQ3+QaV8APyEPIUFs1cUIPuVxbVBw3MvW3tf
   A==;
X-CSE-ConnectionGUID: j4d/QIXUS9qI05o+8i/NIw==
X-CSE-MsgGUID: rgKZmAM/SLSxQ4C6jwVJbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3266810"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3266810"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 08:44:50 -0800
X-CSE-ConnectionGUID: GPZxIY9HQbyOMaASZXt3+A==
X-CSE-MsgGUID: 0X6smTg6QG6GPlHewqYeZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9131369"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 08:44:48 -0800
Date: Fri, 13 Nov 2026 18:44:45 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	". Boqun Feng" <boqun@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: rant on Rust in kernel
Message-ID: <avc-fQWSvmtHhtCO@ashevche-desk.local>
References: <avXdJyqNNqopuH2_@ashevche-desk.local>
 <CANiq72nw+g=RTvR-zZh29D0=MOwNYboNSeKkNr_Z4v74Q4hn1w@mail.gmail.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nw+g=RTvR-zZh29D0=MOwNYboNSeKkNr_Z4v74Q4hn1w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 12, 2026 at 10:59:21PM +0100, Miguel Ojeda wrote:
> On Thu, Nov 12, 2026 at 4:37 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> >
> > First of all, it broke the old and nice kernel feature to build a subset with
> > allmodconfig or allyesconfig. For instance,
> 
> > error[E0609]: no field `disconnect` on type `usb_driver`
> >   --> .../rust/kernel/usb.rs:57:27
> 
> This doesn't sound related to building a subset, but rather a known
> toolchain bug -- our `rustavailable` script checks for that. Are you
> seeing this warning in the log when you build?
> 
>   ***
>   *** Rust bindings generator 'bindgen' < 0.72.1 together with libclang >= 22
>   *** may not work due to a bug
> (https://github.com/rust-lang/rust-bindgen/pull/3278).
>   ***   Your bindgen version:  0.71.1
>   ***   Your libclang version: 22.1.8
>   ***
>   ***
>   *** Please see Documentation/rust/quick-start.rst for details
>   *** on how to set up the Rust support.
>   ***

Yes, indeed. Any idea what to do (see below)?

> In particular, you mention Debian unstable packages: I cannot
> reproduce the issue in pure Debian unstable, nor with `LLVM=-22`,
> unless I also pick `bindgen` from Debian stable (rather than Debian
> unstable) which is older (and then I get the warning above).
> 
> Can you confirm which toolchains are you using exactly? Ideally
> checking the `CONFIG_*` values in your `.config`, e.g.
> `CONFIG_BINDGEN_VERSION_TEXT`.

Ah, it seems I was mistaken, the distro is Debian trixie which sounds like stable.
Unstable is on my desktop.

> > Second one, is that now with the above feature the build is finished like
> > a minute (sic!) later than it was before on a good server with 24 modern
> > CPU cores. It started happening somewhat a release ago.
> 
> This is a bit vague, and there were some changes to the build system
> recently, but I agree with Nathan: it may simply be that you got
> `CONFIG_RUST` enabled.
> 
> It could still be something else, of course -- if what Nathan suggests
> doesn't work, then could you please compare the kernel config file
> between the "good" and the "bad" points in time you have, and/or the
> build log?

It works what he suggested as a workaround.

> If that still doesn't explain it, then could you please do a quick
> bisect if it is reproducible on your side?

-- 
With Best Regards,
Andy Shevchenko


