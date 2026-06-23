Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABE230D410;
	Tue, 23 Jun 2026 16:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231046; cv=none; b=NNDEsdD3FKnD7mArfoS64rmZBUSugShx5iZ2h6l8Gyh4egKsamfYKek15Exb8RhY2DY5QxSBJWOr94V+0JLlj7dpYm/I8/navSnqtj8EGTc7hy2Q9RQMwmJuRlGack57xtfZDeyOzKiQpRuQhCQ/XkFnycdSX+1hJF35HJ+5ivc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231046; c=relaxed/simple;
	bh=wWvMXfjrWCeJKu4Ntx+JySZPuCcNrV9PPz1N5AAuDnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTYqlS68MjVg6nAak8SX0E3pUVuSPQLvBFn95kZ1SJTuB+4e0YdOVQdwGvGTzdWxzpTq2fSkcyxKV0Mj3CvYhzY+egqATzx5KtwactE7ewaj8yzfiA/z1K+H+y+O1UbGydKK76NUEAae1toktKdDq4nRvgo5Tdp08sM+kYtvrmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+OfX2Kx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+OfX2Kx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782231044; x=1813767044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wWvMXfjrWCeJKu4Ntx+JySZPuCcNrV9PPz1N5AAuDnI=;
  b=E+OfX2Kx/9tiYLHFsuTuSmCo0p0K/FGPYg0UToEVD3YFyGOscvKXkN4W
   F8dDld6bqY6VLShQev0pJaM6TyeO1etw9Emaz/dBmvLrM9gQV5k+fGs8K
   ca7iwTR2LtfW/rJoL4liJOCpp7woP94G2XIH1pSpAp4h5hZzesuBSkNBv
   59P7npxMynQNfDmHIt5BkAgMB9d/5x7r5719vMqJ/4xWZOMuNcaxolw9e
   jgKhu+46JxaUY3g3ChMecvyGG8kWqgR1eAl83HKzqhbYH7YF6uMniNq+e
   3pFs/UgguOxM/lQ09LnK16c/7AINcNVc/oPjAF9AAOFqRi7BGSX5q+1yW
   w==;
X-CSE-ConnectionGUID: Z7ziyRg8TbGdkGfE1VwKNQ==
X-CSE-MsgGUID: lUaXwJ7DSI2xlULhxMcNag==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="70495228"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="70495228"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 09:10:44 -0700
X-CSE-ConnectionGUID: 7mrp2mDlRA23lQlKmJNlcQ==
X-CSE-MsgGUID: LJOm3gISQvaOKgOGTRO6jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="245188529"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 09:10:41 -0700
Date: Tue, 23 Jun 2026 19:10:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: Andrew Jones <andrew.jones@linux.dev>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	nathan@kernel.org, nsc@kernel.org, rdunlap@infradead.org,
	tfiga@chromium.org
Subject: Re: [PATCH v4] kconfig: add kconfig-sym-check static checker
Message-ID: <ajqv_zGbMzuDZlp8@ashevche-desk.local>
References: <ajo4DVWoSaEZtBDa@google.com>
 <h3gyuwk2f53msfeuk3urxsfhrcsevb2rqszfh7x3laiwl2bma6@5edux2cyact7>
 <f2520b56-59d8-45d1-8f38-90f2472c96e9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2520b56-59d8-45d1-8f38-90f2472c96e9@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jun 23, 2026 at 04:25:15PM +0100, Julian Braha wrote:
> On 6/23/26 16:18, Andrew Jones wrote:
> 
> >> I wonder if you have seen KCONFIG_WARN_UNKNOWN_SYMBOLS which seem
> >> to be addressing the same (or very similar) problem (unless I'm missing
> >> something).
> 
> > Thanks, Sergey. I wasn't aware of this. Is there a way to combine that
> 
> The two tools do not do the same thing. One is a check on .config and
> the other is a check on the Kconfig spec.

...otherwise Sergey should never been able to cleanly build kernels
for a long time, I suppose.

> Drew and Sergey, please try each other's checks.

-- 
With Best Regards,
Andy Shevchenko


