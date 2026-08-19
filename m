Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592F63FC5D3;
	Wed, 19 Aug 2026 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787135290; cv=none; b=CxndH+JfX/OR/dFDJtK5x18QeuGOof9uOb57EyAMMx1BN+F/tul0f78/ez23CbPj+shlqbv27iKIrKNQb7RTUPCSkuctCtYLklHiNZ9aqkxb7GpGDlfBtJH4wVgqWuw6Hd+rEJwzdSyYp8gkVosqnsyBneLeHigRWTOWXuV+MxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787135290; c=relaxed/simple;
	bh=FGbJ610WDfdmhr86J0OuPYgMeEL5ErjaIK6S+Ar1hc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=da//EmKJDawxa9HO03WxX5QziyQ1TqGpLwd536i9oWjxHHNTrWgZx10wDShcEJBJXtwmwovCxW3f5imP8ri/fdHFa9FPl8LcatNXr3PUyYdj+JxRh2nWB6lU+kY8KO09B9H8AtPIrR8bWKMj9ZOoPGpDcosgtkdsXQZqMVDznAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=mVjNBhFT; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="mVjNBhFT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1787135255; bh=FGbJ610WDfdmhr86J0OuPYgMeEL5ErjaIK6S+Ar1hc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVjNBhFT732u1BIpmtqbYqzMJgS+PCCNjw9tABTwsk12j3P897/NlkXfTUVOBsO2Q
	 PR5N199FXXFFEkv8288d3QQeTMv1RTx3bcXCFhZKTyFjpng+t2WvFcjTYeKHe/6Ath
	 Um3hrnkDlF26AzJR2Nq00j31f2uUAEyS6iG2jy469wndL67QawjBU45tU/DqAY73bO
	 LUFn6AsPmHU574N4ABkss/dHRCMY5clgSVNNiGocOXaIPOqtfkDAvaZzhT24ScUfK8
	 fjUG+rHVkezfDzPCCTkfFun+XHEOT3p5rb8NPu7nOoT/QGN/1DsrP64ZhoSxtx5p1S
	 SquD8DJeEouzw==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6a858517-701f-7f0000032729-7f000001e5f6-1
	for <multiple-recipients>; Wed, 19 Aug 2026 12:27:35 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed, 19 Aug 2026 12:27:35 +0200 (CEST)
Date: Wed, 19 Aug 2026 12:27:34 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: use prefix-map for host and user progs
Message-ID: <20260819-super-seriema-of-attraction-4c0a0d@l-nschier-aarch64>
References: <20260819-kbuild-prefix-map-v1-1-f5168b96fac0@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260819-kbuild-prefix-map-v1-1-f5168b96fac0@linutronix.de>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1787135255-B143E2CB-C56F0EC2/0/0
X-purgate-type: clean
X-purgate-size: 1135
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-03  mail-id: 86E2CA02F3  external: no

On Wed, Aug 19, 2026 at 09:53:38AM +0200, Thomas Weißschuh wrote:
> Host and user progs may also use __FILE__.
> 
> Make sure it shows up canonicalized, as in regular kernel code.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>  Makefile | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 130926fa592e..322b5ce9f218 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1188,7 +1188,10 @@ export CFLAGS_GCOV
>  
>  # change __FILE__ to the relative path to the source directory
>  ifdef building_out_of_srctree
> -KBUILD_CPPFLAGS += -fmacro-prefix-map=$(srcroot)/=
> +CFLAGS_PREFIX_MAP := -fmacro-prefix-map=$(srcroot)/=
> +KBUILD_CPPFLAGS += $(CFLAGS_PREFIX_MAP)
> +KBUILD_USERCFLAGS += $(CFLAGS_PREFIX_MAP)
> +KBUILD_HOSTCFLAGS += $(CFLAGS_PREFIX_MAP)
>  ifeq ($(call rustc-option-yn, --remap-path-scope=macro),y)
>  KBUILD_RUSTFLAGS += --remap-path-prefix=$(srcroot)/= --remap-path-scope=macro
>  endif
> 
> ---

Thanks!

Reviewed-by: Nicolas Schier <n.schier@fritz.com>
Tested-by: Nicolas Schier <n.schier@fritz.com>
