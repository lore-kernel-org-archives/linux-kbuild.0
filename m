Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119852;
	b=CFO2NXtxWh/DkH8+y+Ux3Riwownz/ZmqgkstTny5F7n23OiVPnB+pfwaAbf+xy9jgb+L
	 jTcxlP20sVDNdgPVOH2rNbHkQ42zFzfRrNAda2nmMsARz9Ue8RMhaAqpbZ42cBycsZ3Ar
	 4vFKXxl21uw+0PJ3y0zeFBBztEgf3I99KROkMYttvoiEHBkUFwHB67IorY8Ilax9utDrF
	 +DgtjayddzVmr1KqjLw8BrygDr+l4CibMiSERXTtnVbiQGWIyj4mjqWwQIrEQkZqLm6Ts
	 iXZUO4fGcSCHoTBpu5r3YODSN5rBTlSzcpvzQjAohTI5QlRK7COPjqgeNVW47ri82fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119852;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=NEN0atKg/M3F1a8/0+/P4ZK6rfO9L4rm/xzeeNC7L3Q=;
	b=Gtx/8W/c9cZreME79uuACmjdlpWnsd/63MkBJNxyEPKALhjyoJHqS4a20+JnUIBbONj1
	 ePUeeN7k81qn3sL4eFWQ68w+08faJs7/VP7Ayt3VDlJvzK5/oWE5etYMz5kdA9zc4PCRk
	 EGAmr0cvuYJ32yXQz7AAU8LB6d7vHGNiPpAAjtoEGRHalKiQ0m/HgiJiVfqR+ClQtRB6h
	 ebHRXgqfT27fFIchke04ecffX8mvZTSHTbn5amQLCDPR22nOkkdSUx8OY/JdOl9NXsMm2
	 9kV7XCUpvviHZ9EajX206/iAoTw5ggvCmWG/+QdJYxEbi87+G8N0RIYF5LBMELy8cXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XAvohrvw;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E29606E4CA;
	Thu, 19 Nov 2026 20:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E29606E4CA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XAvohrvw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795119851; x=1826655851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JCHXofKG4BjXdQuJ/JAqQItB9QfzqxZYzwScTVo02+M=;
  b=XAvohrvwBGtHvmL2MpPHmtKw9m2VlAXaJIGmCWH340Q3eYBXcbJsE3aQ
   C1dWIziiQ+HgbLb4C6Wjdb1S2611NUjhBMweXbW9ios/G5aCtJeoNxC9j
   XIY1LQfeOabTNyBABk2/MOwY4lVjOVw3M1v01USgtOqcqWC21EFvdRN6s
   DWKP7r2zpB+E1WOB4Bf3ChrcFXOBWF8zyu5938vwAYdOVlYsOjmfyOSEL
   dvxVc8L48KUXKs7tQNDcZu0H7RFhZ6qAq4z8FkgiQWusan9XCNOMQkw8G
   x77yvVqMQQJncSI2dl6VO6t/IiBLSja56v+gr/RCnock8qucF/N3MJ/Ed
   Q==;
X-CSE-ConnectionGUID: nOqHn7C2QfK12aJyBZNvtw==
X-CSE-MsgGUID: Ub/P3bynTg+MfQrg4jGFzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3903699"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3903699"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:24:11 -0800
X-CSE-ConnectionGUID: excDA9WDTXKDaqLKx4dK6g==
X-CSE-MsgGUID: TxWBSIFOTV6/yOBNrMYwLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10814598"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:24:07 -0800
Date: Thu, 19 Nov 2026 22:24:04 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	". Boqun Feng" <boqun@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: rant on Rust in kernel
Message-ID: <av9a5P6ciEEjmxbO@ashevche-desk.local>
References: <avXdJyqNNqopuH2_@ashevche-desk.local>
 <CANiq72nw+g=RTvR-zZh29D0=MOwNYboNSeKkNr_Z4v74Q4hn1w@mail.gmail.com>
 <avc-fQWSvmtHhtCO@ashevche-desk.local>
 <CANiq72=RbzZHgZEMfLkDRQx-_PoxEfgL_Ar8figchde5u5qc=Q@mail.gmail.com>
 <avq_fOVO4dina23a@ashevche-desk.local>
 <CANiq72mWNJ6qpxUrsGHGiRHeqb=uHMzqEuYLOkK50i40T=yHNw@mail.gmail.com>
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
In-Reply-To: <CANiq72mWNJ6qpxUrsGHGiRHeqb=uHMzqEuYLOkK50i40T=yHNw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 16, 2026 at 10:28:12AM +0100, Miguel Ojeda wrote:
> On Mon, Nov 16, 2026 at 9:32 AM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> >
> > You mean for the in-kernel builds or in general? If you are talking for
> > the former, this needs to be fixed as the version  we supply via LLVM make
> > parameter (as you can see in my command line examples). Another story if
> > this is broken on the clang level (but then how kernel is built?).
> 
> Hmm... I don't understand what you are asking, sorry. Can you please clarify?

make LLVM=-$VERSION supplies the version of the compiler, can it be used
to understand which libraries to take?

-- 
With Best Regards,
Andy Shevchenko


