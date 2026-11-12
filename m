Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497838;
	b=eTMbrVGLW6IUAeUW4BmU8IN7+Vf+qvZffBlL6FevSssc9dmBvwNqkGBYSpoZQAT4qTb7
	 /qsQ2g+8+zL/vrOIcF1hkw9CUwqouLlQ5JBI1u2g5Gt/Fmp++DUTIaT5/16OKL4zFjuFS
	 W/g0MktvmRXM7fFH3AL9LxsJ6zf7A12D3gAdqDzZm1fNndMJ17B6AxfdwlrZ76YbhuoXn
	 HzCd8XgyVKyTOEcscaHUCJ3uOeDS5Rnet57ixGJsiN5YG8F+AGZfQnrvdbxaslCahyMW7
	 rP57udkgoMcYd5xIRQls+MGcfMzi9x6gwj3pDNJEiluSJgeMjN53ZYmLQEF+OrbVmPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497838;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Organization;
	bh=i58snUFxY9yTSGS+iItFZzR/U5IATL55FOLI2eUySOM=;
	b=3poF5uFkqFWAQeVhia4Ah+dtQZDuL9e3QsYEjSrxGXHnizqzpN8IBGrCs46Hl5UsUJA6
	 rSLWY6vjsNeLiDBquhe+FIAycB7e1pCkHo9W+47t/QuTMPQFVtU31aChTFXHzwQI91aTz
	 nWRNRCFIRjVwkspm2e/jnTYH0+OHe6VEg/joA9nBReKCTzX7/2iCFcA51T+X3pHuBE6A2
	 Y5A9vn6MMngJSmJLJV9GGzrYSDqECPIdSJciCH2h4usHJqLSlu0PdXYYPJN1ZDvHdQFPs
	 Umy4sXaQh7z5B4vkCzH760d9kuykwu77WPrMaTUKLB5ECHj2vnqJfv40GQSJw6Khm4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yn3CRDrw;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33B1606A32A;
	Thu, 12 Nov 2026 15:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B33B1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yn3CRDrw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794497836; x=1826033836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u2UAqCB8nx4y6B7lDfmLv273jy8Kj4aMY6RjCrvO1NM=;
  b=Yn3CRDrwPwQWtOj2CZNp0Gc9SXjBlHuwMZrRf470oeDFe03oGmVyjNCt
   L7yCeuigXd1Xc+vTS7+zqjhFUO01PrIE5sQ70jB01z8wXm8X5d9THic/r
   abawsBn71QvCkIdEIIDxt084PpPxEtWJt9srmSmzq+iRt49UM/Jz/4kui
   rqDBvpjbvWi2RnDzFhS6kbpChbectRWje6RpkltBlo1LAHw/iUUv6Hd7x
   8JfKKWwWBlX4siRas8Y9ABuaPGwB9QZfHNGjecK3cp79baCl2l3UtdmfB
   ArtTBCGlLn6WJdgZzUay6ThUaeJmvWuVvOSEGAkhqLFiazgnFHLPAtLwt
   w==;
X-CSE-ConnectionGUID: TRVRuWkiTVq6/FxUff7t+A==
X-CSE-MsgGUID: BtqSalOZRMilbNfyM0G88g==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3185047"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3185047"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 07:37:15 -0800
X-CSE-ConnectionGUID: rdxpa9b5QY2f3AzeS6lN0Q==
X-CSE-MsgGUID: aQRVT6NLT9CdDCb68OE+Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8783083"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.6])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 07:37:13 -0800
Date: Thu, 12 Nov 2026 17:37:11 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	". Boqun Feng" <boqun@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: rant on Rust in kernel
Message-ID: <avXdJyqNNqopuH2_@ashevche-desk.local>
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
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

Hi!

(Cc'ed to Rust and Kbuild people)

I have two quite annoying things that lately Rust brought to kernel
(in some way).

First of all, it broke the old and nice kernel feature to build a subset with
allmodconfig or allyesconfig. For instance,

  make LLVM=-22 O=... W=1 C=1 CF=-D__CHECK_ENDIAN__ -j64 allyesconfig -- fs/pstore/

Now this makes a very good fireworks out of some rust.

Ex.:

error[E0609]: no field `disconnect` on type `usb_driver`
  --> .../rust/kernel/usb.rs:57:27
   |
57 |             (*udrv.get()).disconnect = Some(Self::disconnect_callback);
   |                           ^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`

Second one, is that now with the above feature the build is finished like
a minute (sic!) later than it was before on a good server with 24 modern
CPU cores. It started happening somewhat a release ago.

I have no clue what is there, but I will appreciate if it gets fixed ASAP!
I rely on the above feature to save my time when doing test builds.

My repo is Linux Next based, the compilers are standard to what Debian unstable
provides. Ask me any details or help with testing any proposed patches. I'm
really disappointed of having these issues.

-- 
With Best Regards,
Andy Shevchenko


