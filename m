Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF93818E025;
	Wed,  8 Jul 2026 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513121; cv=none; b=q9WaZU/QvOI21QavR3Hv7JQiLWuO65HlcmU/+TAf4kjWsnbS/HrZQIDKxSW0mCAWZlAHVsL/jWQ7pkE0AOdyaQ0AitlhNbj9Y8epEhUN5qFMA8AO6/wRrLjwfkGUpYwn9YgL5fRMpUtwq1Rlo0qyRuSit5u2Vd6HyzmROu2oLFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513121; c=relaxed/simple;
	bh=IKF8CcUn/FXQMzHZbJfapDbpjPT8GHAm/ze7GQ7Ha8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nz8M9Ojo698IW+xGbPc84ShP/15FzVKOcyNl7kz4Xok35xXSVFl0ObA6rPTAoKeF5i3ne2OpQA/4LOBa00oPhACXNmm9YUJXdaXLIOIk4eRjWALApk+Zw1tAeuoj30ZbJ/45kBmB2Rhv1+ERBISbLqyn0cknQ+xN4QnZREXv6yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=LkFwf5Cg; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="LkFwf5Cg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PlbPaQamaVsN81RoNEpg2vUgVCrJMo5yc6p6yam5T3Q=; b=LkFwf5CgW+fqIf1/qYG5xVxWZp
	tPL3LOAN+bQStemzAbktEjeGJz7nNZn88HLI8fhwlaRu/rjj/pY6OlSy9a3AaUgbWfHnb/UjBryZv
	SMr6QEsDhM44DIPQF4+y3PvgbWcNrRc8XH51Vs+8PTHKj05gnE2+2t06LA82KO9txR6KLeuPyvzao
	8VRLXcoApEVzPwiyTStMfjjmO8VmvGEcv8fzhfEA3msZtsby3uk/zGY55w6gJdlIMJUnX0Tx12WEM
	rE+EWeEW9me8KhCj0lNgQlghCw4yRx3cKv9ftVD1AfnaLudUxZgMqqbpei2r30RpIARlcL74Et4n0
	NWsN7xxg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1whREb-002wRs-2Q;
	Wed, 08 Jul 2026 12:18:37 +0000
Date: Wed, 8 Jul 2026 05:18:34 -0700
From: Breno Leitao <leitao@debian.org>
To: Gustavo Luiz Duarte <gustavold@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: kconfig: merge_config.sh: keep temp file in the
 output dir
Message-ID: <ak4_9kLYFbv4sqF0@gmail.com>
References: <20260708-merge_config_output-v1-1-e35fa223d6f3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-merge_config_output-v1-1-e35fa223d6f3@gmail.com>
X-Debian-User: leitao

On Wed, Jul 08, 2026 at 04:04:54AM -0700, Gustavo Luiz Duarte wrote:
> merge_config.sh currently creates a temporary file in the current
> directory. Create it under $OUTPUT instead, which allows running the
> script against a read-only source tree.
> 
> The default behavior is unchanged: $OUTPUT is "." so the file stays in
> the cwd.
> 
> Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>

Reviewed-by: Breno Leitao <leitao@debian.org>
