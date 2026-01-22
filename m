Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C963D1CC6;
	Thu, 22 Jan 2026 05:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769058964; cv=none; b=HxKc/Pfdz3khdlX5wA7y2CEb3dn9OBbtqoYjQE4HxOx1kOOQMvcz0UZ9Vjd0WEdcUBpVqGXJtUanss1VkYgCi6HCjlZJIosTh+NfCf+T8COJwHKGpqlyFS6zHfMFJBF3ARP0reTQNXC024nSWCjM0as9HaoAljSkQscbuLpQjjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769058964; c=relaxed/simple;
	bh=4ghNtqmg7P2jnHza5enYtjUGGuGoUWVJ0/r0XZRtLYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rzJtWAaxOJGLHVjpWEYYCO6MDw7pykfNLOKBZC2h63wp+gR3aAZekyp82KLl2+IcgX231UMVMK2SzrLnClOs5LQPOR+0wJB9hIKkRhF1J44mSYgi+GpRygOrH0XQQxpth3RRyPv9IFTfXlvPNillu6GzOoWfmAxIhHdqX5L6aiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFDBWcOV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFDBWcOV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE50C116C6;
	Thu, 22 Jan 2026 05:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769058962;
	bh=4ghNtqmg7P2jnHza5enYtjUGGuGoUWVJ0/r0XZRtLYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iFDBWcOVbGj44bx8QbTUygmAZJpRJwxPBDcP7PkTYC4HkCSyffpQASsRrCGtOJ84P
	 tUp74tB2Is1U+TzAE6mYYfQFsBG7YmoUmJNvoHHvYil3zVZCi7NrOa6t+FLP7IdRfV
	 iTfU6xbOOY7hILqWB9T5yGAccpntHanancQPDGmW9BPgjKwvgJWRgFbT3bxcYRlNmq
	 bIGtTVl/BOpPMvlh+zYOZN27GH+YbWpGKJSn9aySmLIqJhL6YNLuuKYBy8It/vN+Ed
	 lCe0oHmntZdmTIxXwzDYdWMYPfgTdEaVZnSBv8HYmXbRlUDbs1Mk/KS4fdJVIok8gQ
	 Y0+4eiUI4st/A==
Date: Wed, 21 Jan 2026 22:15:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/3] kbuild: Make sure to generate config file
Message-ID: <20260122051558.GB3770486@ax162>
References: <20260120123730.30487-1-yangtiezhu@loongson.cn>
 <20260120123730.30487-3-yangtiezhu@loongson.cn>
 <20260121234748.GA2137017@ax162>
 <1bb9876f-cb1f-e088-cb9d-f76032f0d395@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bb9876f-cb1f-e088-cb9d-f76032f0d395@loongson.cn>

On Thu, Jan 22, 2026 at 09:14:07AM +0800, Tiezhu Yang wrote:
> Currently, CONFIG_IKCONFIG_PROC is set by default on LoongArch,
> the above error still exists, it checks /boot/config-* first,
> here is the related code:
> 
> tools/testing/selftests/bpf/unpriv_helpers.c:
> static gzFile open_config(void)
> {
>         struct utsname uts;
>         char buf[PATH_MAX];
>         gzFile config;
> 
>         if (uname(&uts)) {
>                 perror("uname");
>                 goto config_gz;
>         }
> 
>         snprintf(buf, sizeof(buf), "/boot/config-%s", uts.release);
>         config = gzopen(buf, "rb");
>         if (config)
>                 return config;
>         fprintf(stderr, "gzopen %s: %s\n", buf, strerror(errno));
> 
> config_gz:
>         config = gzopen("/proc/config.gz", "rb");
>         if (!config)
>                 perror("gzopen /proc/config.gz");
>         return config;
> }

Ah but it still falls back to /proc/config.gz though, right?

> Yes, this works well for LoongArch. If there is no need to do this for
> all archs, I will only touch arch/loongarch files.

Until there is a wider insistance on including these as part of the
install target, I think it would be best to keep this in arch/loongarch,
as that is the only architecture that would notice in this case.

> By the way, I do not know why it can not generate System.map by the
> installkernel in practice, could you please check it?

Is installkernel a part of the kernel source? I am not sure where to
begin to investigate that. Could be an inaccurate comment as well if
installkernel's implementation has been updated.

Cheers,
Nathan
