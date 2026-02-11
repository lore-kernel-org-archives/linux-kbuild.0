Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA4F346AC0;
	Wed, 11 Feb 2026 20:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770842029; cv=none; b=tZ+vgzXbJrjoS/Mit3Enni9t05lA1hSCON8/kJqpq9AhlSLDKAa1+taF+mwHtnHwsfihAfx39M9WpUckUzt3PKGm1wYh1dezF5YjTKg4ko6hymWEctwq6igpIZm1mb0F/TpvHwWJvuGWsAyaPXjzIyZNVnYpslKrR7uGka0Ulfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770842029; c=relaxed/simple;
	bh=0PtkEtIBVYnyGPfqDgurxA9mj5crQ0fRXLZLhQyKJjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTiwfFEAiswMYGVOGJuORLGRY81GycbfOt1pOhlyTCxtmETLCE66vEefWpaz5ey/uAUPxdAR8j6HGDdtPJpJlDL29BG60AedkZ+fyqRmSHLZClah/4YLNk4qLIl7CsYfCdboE6cQ+yGSyHMYqLdzrjVL+4MtT5NVxPXQ2izxRHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CH9ved4z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CH9ved4z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A01C4CEF7;
	Wed, 11 Feb 2026 20:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770842028;
	bh=0PtkEtIBVYnyGPfqDgurxA9mj5crQ0fRXLZLhQyKJjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CH9ved4z22llNSH14wZHCTLEWnqArYCxAaRAOva65VixjPVtmJtfGPUpFcbLGDswp
	 wyS2xcC3LO7SuwGrNyM8uYzbw8hDP+S4jRWZC2eCNdXMG9gXg/orPiJbgQzRrv1dzB
	 2soYroET6g8lwTvoMhsYt8wW+Nj9SopQYZ1O9bXhGZ+XY3n7eorczDcYf6XWWTzLof
	 CyWABcCfqiRupDaBvgHFzJgsUU8ek75VoWn5Z1xX92MCXOMa+B0qA43nwExPBz1Q+i
	 ycaRkUfeLJ0ttPYAyHdJ+erw0JbjIZfPOh8jMsWA44sii4r0zZ6+ePdBOgbLlZGWB2
	 jVBoRvWw2KAAA==
Date: Wed, 11 Feb 2026 21:33:35 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Steve French <smfrench@gmail.com>
Subject: Re: [PATCH 0/2] kbuild: rpm-pkg: Address -debuginfo build regression
 with RPM < 4.20.0
Message-ID: <aYznn-a-pzDay2KX@derry.ads.avm.de>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Steve French <smfrench@gmail.com>
References: <20260210-kbuild-fix-debuginfo-rpm-v1-0-0730b92b14bc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210-kbuild-fix-debuginfo-rpm-v1-0-0730b92b14bc@kernel.org>

On Tue, Feb 10, 2026 at 12:04:47AM -0700, Nathan Chancellor wrote:
> Steve reported a build issue with commit 62089b804895 ("kbuild: rpm-pkg:
> Generate debuginfo package manually") on RHEL9, which has an older
> version of RPM than what I tested. Turns out that RPM 4.20.0 fixed an
> issue with specifying %files for a -debuginfo subpackage.
> 
> The first patch restricts the new -debuginfo package generation process
> to CONFIG_MODULE_SIG=y and RPM >= 4.20.0 to ensure it is actually
> necessary and working. The second patch restores the original -debuginfo
> package generation process from commit a7c699d090a1 ("kbuild: rpm-pkg:
> build a debuginfo RPM") when CONFIG_MODULE_SIG is disabled to keep the
> -debuginfo package around for older versions of RPM.
> 
> ---
> Nathan Chancellor (2):
>       kbuild: rpm-pkg: Restrict manual debug package creation
>       kernel: rpm-pkg: Restore find-debuginfo.sh approach to -debuginfo package
> 
>  scripts/package/kernel.spec | 57 +++++++++++++++++++++++++++++++++++++++------
>  scripts/package/mkspec      | 38 +++++++++++++++++++++++++++---
>  2 files changed, 85 insertions(+), 10 deletions(-)
> ---
> base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> change-id: 20260209-kbuild-fix-debuginfo-rpm-718f81dbcaa6
> 
> Best regards,
> --  
> Nathan Chancellor <nathan@kernel.org>
> 

Thanks!

I cannot test this properly right now, but the changes look good to me.

Acked-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas
