Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF5826FD9B
	for <linux-kbuild@vger.kernel.org>; Wed, 10 Jun 2026 16:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781107247; cv=none; b=c/9AfqU6ZxN4jCblm8ED4uCW6G53s7f6wNEU9ml+2LH7qW9Ki0EKDhFXUCcJzSNRrJZaQjnMbwvfastJdu4L+mogSv1FhgsPCPFaezlkrCQEjv7SULTMfb/YbcogYgtO2hVbPoiCc31B3CYZDKbm0wdk3Cpn+nVmmY5AroPFh/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781107247; c=relaxed/simple;
	bh=F3CqFJpNvqu/pcAAEW4qvTza9jBgLa7hoPp5g9Sj2h4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8nt/mkahIyC3FVSct3o1ywthaOnRosu6WgueN23stIYzoaKAhvcB1dstEZVscGbWMmDxWaFOgBuVnZaWsnuD1D9Z2X7x1/KJVojP25iwo3h+KC3gqGbgGvijQVrKWOEDDSze9S+d2djwsOMfG6HrcQW3BWZs45tS+MzgGoV7rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fqAaOyeR; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fqAaOyeR"
Date: Wed, 10 Jun 2026 11:00:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781107243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rzgtGHVPM1ftx7M5mHi91OCGdfZy2KJgCQyJ9wwrAms=;
	b=fqAaOyeRF+3piHxcrv3/mseLVBiNsCsVDgwNtdJGWAiOQ/J7r9bS28cKt+9x7OkxYSj173
	8nHZlpGxKGKsGz+mc82SnuNQks3mMo72hGoQPHTrthpab4GsKc8JX1De/x+uTOrwiurtO/
	r+lULxdiNoIjymNx+bs293YJK8/22eA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nsc@kernel.org, andriy.shevchenko@linux.intel.com, rdunlap@infradead.org, 
	julianbraha@gmail.com
Subject: Re: [PATCH v4] kconfig: add kconfig-sym-check static checker
Message-ID: <g5b6ff6h6p34mz3deqihy5wag2a3bmado6j7i4vi7q7kidmdl7@cwdht5xitxxh>
References: <20260527142703.107110-1-andrew.jones@linux.dev>
 <178104876973.2707941.12816857648925597603.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178104876973.2707941.12816857648925597603.b4-ty@b4>
X-Migadu-Flow: FLOW_OUT

On Tue, Jun 09, 2026 at 04:46:09PM -0700, Nathan Chancellor wrote:
> On Wed, 27 May 2026 09:27:03 -0500, Andrew Jones wrote:
> > kconfig: add kconfig-sym-check static checker
> 
> I took this in its current form since perfect is the enemy of good but I
> think some of Nicolas's comments are certainly relevant, so please feel
> free to set fixups on top of kbuild-next as you see fit.
> 
> Applied to
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next
> 
> Thanks!
> 
> [1/1] kconfig: add kconfig-sym-check static checker
>       https://git.kernel.org/kbuild/c/f58316a441b46
> 
> Please look out for regression or issue reports or other follow up
> comments, as they may result in the patch/series getting dropped or
> reverted. Patches applied to an "unstable" branch are accepted pending
> wider testing in -next and any post-commit review; they will generally
> be moved to the main branch in a week if no issues are found.

Thanks, Nathan.

I've been meaning to get back to this in order to address Nicolas's
comments, but I got buried in other things recently and have vacation
next week. I won't drop those improvement suggestions from my TODO,
though, so I'll hopefully be able to address them in the near future.
And I'm happy to keep it maintained going forward as well.

Thanks,
drew
