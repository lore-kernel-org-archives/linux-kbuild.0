Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEC219B5B1;
	Fri,  7 Aug 2026 00:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786063161; cv=none; b=UT6KFL+dZ7OTZxLew6sXC5VZm4nJIr1t2svcQj6ehTIAkkH/aZvGGNGOnSIrq8datBxUHXsVoI67dGKxOSxo3Qe+z3h2bzLr69MYN/v7bipaC/C6Kna6T/Rg4QjTsprPzusxs183owtqcmRx5KGn8F7Bv+GX0lwpd9di5RCxqaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786063161; c=relaxed/simple;
	bh=350wj4IYOzCgZEGLxeCjUvl2zZTwTBoasnL05zAqtZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOtDB2/7chHQegLWxWXEyv+87IRgdFHUN8nPwvIALm40WC+bRGAz6wn0LFudwtM2H+0I8/2ChALwNj+xPW0skuK4TNsykFNBU+n5zT3nXIjqhQRErKEAgskvMylxbEAZneOWvNWmxzUhluUAPsc1/MDN4k52DJEVSibUEde4MGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fcs+ti4M; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fcs+ti4M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786063159; x=1817599159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=350wj4IYOzCgZEGLxeCjUvl2zZTwTBoasnL05zAqtZo=;
  b=fcs+ti4MgfMSHDcJkU25JYbzjBKsWTY+8eZCEla8zSlcGMQzqVH8f11o
   XaeI6Bi/nGUsCsNaftkXVdG26JUN7rGg9ERbGXreyQJahIP+nFAHtTXCg
   wsGatt3qZMTcGeo1+OabT++Bh+uWDO6aBUrM3XSzRmF4ETzPoScWmOUFa
   J6B71Pp6rpLLsdUaAGqQuv6M0nM6IODl7dNM9IdWtMtG5xB0nS7mP+SVr
   yTVn0onK84d2Vw9KZfShu//febSsD7XxLPG8KYobLzoo2b11z1NEf26mP
   A6UvUXA7UOOtKWK9W22ldNUxLOelUAwX2bPqbcuwVPLcnOFNDWzwtDAUM
   A==;
X-CSE-ConnectionGUID: 5ySmRi2jRSCOVBfWWK2ucA==
X-CSE-MsgGUID: yAUwSpGjTZywT85aNZS25w==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86877315"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="86877315"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 17:39:19 -0700
X-CSE-ConnectionGUID: 4bSyfMdVSR2PwGo5uLHLQQ==
X-CSE-MsgGUID: IqXm05y7Rsan6GI5mj93IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="300465395"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 17:39:13 -0700
Date: Fri, 7 Aug 2026 03:39:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: phasta@kernel.org
Cc: Kaitao Cheng <kaitao.cheng@linux.dev>,
	David Laight <david.laight.linux@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Hildenbrand <david@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Kaitao Cheng <chengkaitao@kylinos.cn>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex@shazbot.org>,
	David Matlack <dmatlack@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Joy H . J . Lee" <rkr0k0r@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] list: Add mutable iterator variants
Message-ID: <anUpLYVuq-q6W0HB@ashevche-desk.local>
References: <20260730095041.35715-1-kaitao.cheng@linux.dev>
 <20260730095041.35715-2-kaitao.cheng@linux.dev>
 <fa3d31c188640d013c8da2f3a1be32188926e4a5.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa3d31c188640d013c8da2f3a1be32188926e4a5.camel@mailbox.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jul 31, 2026 at 08:54:14AM +0200, Philipp Stanner wrote:
> On Thu, 2026-07-30 at 17:50 +0800, Kaitao Cheng wrote:

...

> With spin_lock_irqsave() you're also
> forced to carry an integer around that you yourself never need.

Maybe not the best example since we have cleanup.h :-)

-- 
With Best Regards,
Andy Shevchenko


