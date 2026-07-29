Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8A3397942;
	Wed, 29 Jul 2026 15:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785337819; cv=none; b=FuG1OViRI55WiEGxYs87cdbUB02DOf5V381dI8MjPRc50oyxiNZNWtOllzTNvFVFH/blPWYPhx6aZr1q2Y+mbJyQyPC8wAd5vcju1HtW4sWtGohqySjsw6qa3kOtyyCZy4M9+cFjmC4G45Kxp5r2XtI9+iyte3We+UfBJnZGSOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785337819; c=relaxed/simple;
	bh=oCfTxDq+a656t5RgFUHIkq6G6GXDBOjbPfM9vHiXq6Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nBDGtlM5o5E8jbvuVCG5UaGkwZcShW1Ld5gvUOlPMlePf6EY6LzQGlpy0hsoGDo+5fPo2h/NNR1m47cq4+e0iylpA75gtBv6bX2cHYLEx5r39TL5EE99cLCh9YfxnzAu0RPcSNRM3J0xGOhEdt9d+xmNI1kVOGkKG3xZfXAAD2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWRnwc69; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWRnwc69"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785337817; x=1816873817;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=oCfTxDq+a656t5RgFUHIkq6G6GXDBOjbPfM9vHiXq6Y=;
  b=CWRnwc697Kr+7kZrtLp6J2bvCJGuPKW7WqUMQkZdmymhBfn3H7zU2A2Y
   xOIseZz8DVZEC8j8HTNGXVyflU5mMWviDvQXTQeq+tbPchBM41QH9lgZX
   FCx+x03jENqC9xmLQyu6Hv3ndgT18waThSUKwXQJXgKz87tRvDR3jf/TW
   89+bxfrEd8hu32ACzrSfUqEDUowRNU3avXUB62UceSjT4bpvqu8Is5sae
   0yuCB+2GMYbV9WfUQQiyM9gQpqDQr6xEcWRZUp7D7QCYbTNkZ3PRHr4yi
   giFyCRNWLuMTrEivjCq6csz+8GScxNytB0Fn0eBSD0ABjCIdfRQAkxomK
   Q==;
X-CSE-ConnectionGUID: dAdsRdo2QP+pz3XrtjuGiQ==
X-CSE-MsgGUID: iSUNsWclRSycIyoWYqu1FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85961579"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="85961579"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 08:10:16 -0700
X-CSE-ConnectionGUID: rWIgYwpZRMCK10Lj65brMg==
X-CSE-MsgGUID: +0SDdbEDRySkUHmWip9Crw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="265065823"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.212])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 08:10:06 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Julian Braha <julianbraha@gmail.com>, Kees Cook <kees@kernel.org>
Cc: nathan@kernel.org, nsc@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, arnd@arndb.de, stefan.hengelein@fau.de,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, nico@fluxnic.net,
 officialnaumansabir@gmail.com, rdunlap@infradead.org,
 vegard.nossum@oracle.com, tj@kernel.org
Subject: Re: [PATCH] Documentation: warn users not to use select on choice
 options in Kconfig
In-Reply-To: <a4d8cb79-a696-4016-8c8a-a56b14992309@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260715220149.48700-1-julianbraha@gmail.com>
 <202607152119.BF8E377B@keescook>
 <a4d8cb79-a696-4016-8c8a-a56b14992309@gmail.com>
Date: Wed, 29 Jul 2026 18:10:04 +0300
Message-ID: <f362ddf2e0f3ecf41ed81f03f77577473c3e21bc@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 16 Jul 2026, Julian Braha <julianbraha@gmail.com> wrote:
> Hi Kees,
>
> On 7/16/26 05:19, Kees Cook wrote:
>> Yeah, it'd be good to add a checkpatch or even build-time check too.
>
> I'll look into adding a check for this into the kconfig interpreter.

This. I wish there was a kconfig lint option that would whine about all
the things that kconfig-language.rst explicitly tells you *not* to use
select for. (So I could perhaps eventually stop replying to people with
that stuff.)

BR,
Jani.


-- 
Jani Nikula, Intel
