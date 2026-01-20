Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7D33EDAC3;
	Tue, 20 Jan 2026 17:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931935; cv=none; b=dWf6i9nklYaXEf7t9DQSkw7i4iOnAaG8I8XaHKmwXZejP2AksgrkmrERTdJoHh9JdylvofDFABDKRvsLpwJaTbOgGchsTliveS39wAbF4rkTInpT9LQaavji1Eh/J9IIwLYqkkOFkJ0Rc8sV6uvtoFf2sxp8wQ2kMwwKydAlZdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931935; c=relaxed/simple;
	bh=Y9cZ7orhjjaxMihveN4lhxry2uDDss/+iMQKy1Nem28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m21pJK8N8N5PvJIwrFX9onB1z1dgnClsHNhf3f4F9oXds2LqJmPQC1DunErU3Kyaep9ny/oSpzSFdf38CGZIoZjP97f/SDgXB4Mj4NEfssVAMnbtixK24R/iJJ5z1/MhnvSTKUyG0Iz5DSKxDh0Ct2cYFlHqbRR4J8M8dDCWAuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sqrigPUg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sqrigPUg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87471C16AAE;
	Tue, 20 Jan 2026 17:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768931934;
	bh=Y9cZ7orhjjaxMihveN4lhxry2uDDss/+iMQKy1Nem28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sqrigPUgLp8CHIqvTB6si1zueozeU91+N/v9yWs4bY62qtFStLd53MjtG++o8a+s2
	 Y/PFetqqq+kdWgw2TOBB3Ark2XGfAx8lIxZT3Win+m5i9IkRWA7Nmv3+hr0x0TtI8V
	 GMqEyau6VYSSM/PYtVBat8h6sfJvLwPs7cRK710WYVD/xUBS32nmX5Q/V7QbbygWgA
	 Mrcn4zD1hRBa9o3/D/YaduSNS9rukKrLc4PvCYMJB6ZSYEDZyPQ7zUNNBYeCJd6GgR
	 4/4CRV3HqLkWCm/3Wcx4DkYxYNuOpDmBOT12se5HV6lOVjjllJO+cQf5sAWjVxrthb
	 TkBvw2tXhLkVA==
Date: Tue, 20 Jan 2026 10:58:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev, Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH v3 0/2] scripts: introduce containerized builds
Message-ID: <20260120175849.GB2749368@ax162>
References: <cover.1767199119.git.gtucker@gtucker.io>
 <20260119213516.GA1051134@ax162>
 <20260119214931.GA1058062@ax162>
 <1766d2ae-1224-4d3e-bc9f-786702989a79@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1766d2ae-1224-4d3e-bc9f-786702989a79@gtucker.io>

On Tue, Jan 20, 2026 at 10:56:46AM +0100, Guillaume Tucker wrote:
> Not at all, on the contrary I have some dedicated time and long-term
> interest to keep maintaining this.  Please feel free to add me or I
> can send an extra patch if you'd rather I did it.

I can fold that into the two changes in a natural way.

> OK sounds good.  And sorry, get_maintainer.pl didn't mention Nicolas.
> I should have checked the KERNEL BUILD entry by hand in the file...

No worries, I am sure there are quite a few scripts that we technically
own but do not have an entry for it in MAINTAINERS. This won't be a
problem going forward at least :)
