Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721312727FA;
	Fri,  6 Feb 2026 08:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770366087; cv=none; b=EHdvJhXL9HHzYOK1LqQ4ldRn1CMAz3ITIOJxiVX1nyz/zsvQMPcLaQArTDYb6Rsg2beUHalDRxR1oEezrNxH9YyfzPi1/byA3/u4QkTSm0iIcnxN2zBIpNdfqasWyIDuoSXnogDLCaO7PjQD3ZT/A8s+demMI5+HUe88cvf4OhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770366087; c=relaxed/simple;
	bh=rFBDwKM+8eVDmElaGNAP+N2mc+0XDTWvQ5c8XhF2Ans=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpFMJtFF3PGm6l1y7Sl1il+qbvy0hqGBZoy6EjaGdRGR//ZkB2SxiRZCD/+5uIdCWaxfYd5SUhsZS5PCgr8iQAQIq+b6W9z+BpL45gLCUCFSWin1mWoBasaefjTwMqPQg/fO1ZEeBO2KV4YnSrEloee9vdIWSErt5QCAJuqKReA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QuMrpi1w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QuMrpi1w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0A1C116C6;
	Fri,  6 Feb 2026 08:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770366087;
	bh=rFBDwKM+8eVDmElaGNAP+N2mc+0XDTWvQ5c8XhF2Ans=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QuMrpi1wXa32eH6gDrOJXaoNuXAJHatfq/tqkXnblZVcUN3idUSYGd455sEGmu7cL
	 JATaVR+d4ulxZUPOdHehdc+MtkOJmTkZ4H16TqM08T53of1KWzBKRqlDCgdJ6YUgVF
	 E+32Awcw4rgO21E/azKVZLQ7FGrpZ//j04VJd9w4xMzeUyihG8A/vyobMPNuJ2+X8+
	 jikTePxTjkzaGemtu5v9BO9LWjVVWNXaHDf3LTcw7XuvUqTU7lSaE4bLNOwUH/f5Wp
	 4LiQQRx4H46IXsfY6SPFcydqSKPdoeo09nf+e0HPpCvIwXH/tvm/x4qMig3xlyKD00
	 Z6E3WE4XasLVQ==
Date: Fri, 6 Feb 2026 09:21:03 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: remove dependency of run-command on config
Message-ID: <aYWkb6_IzbNlnsM4@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20260205-kbuild-run-command-v1-1-b8cbbc3db270@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260205-kbuild-run-command-v1-1-b8cbbc3db270@weissschuh.net>

On Thu, Feb 05, 2026 at 09:49:58PM +0100, Thomas Weiﬂschuh wrote:
> The run-command target does not always require a kernel configuration
> to be present.
> 
> Drop the dependency so it can be executed without one.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>
