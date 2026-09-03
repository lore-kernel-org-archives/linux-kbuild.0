Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B99481FD1;
	Thu,  3 Sep 2026 22:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788474540; cv=none; b=DSRhdzEpJ98n3Ova0shb4eBN0L5Slsx6vtQhQ/Rjt2nJ5Q+kkvbM+ydc+hQt+K/Xmy4aizA7HI68+8eOEcvP0lWXnRIwn7wnAwMFbFyJDadMh8irx7zvxtHPgz7KBewsy/SDJEharv8ky7jJihMjao+nkF1irFPbuvLJ7cUJ3iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788474540; c=relaxed/simple;
	bh=SyITXCnjJlaxlH52HX2p2vD8eItiZZmrSazF0nbgEjQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=N5i9bREUdxcY3kuLVWRDB1l64j7cKlvCLINsZZf/sVfaezMEgPU+Mv0MdM6ssp3mSo7ha5EQUH6ERYaxbKeA6BwBkcmD76Uc+XIcWeH69JITbXG4ZzMh4cLkBsLC7JqV5bkPpmrp1OIAMi8ZMGq1KhTpu5WxvZEvW65a53835UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdnVy40B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdnVy40B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5C61F00A3D;
	Thu,  3 Sep 2026 22:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788474538;
	bh=jefocC3SdEz+teSp9iBjOKBiNcjgY2UDGd3nAgnVDLk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=fdnVy40B/KXBTrSyIGoVn3phAZvpkFa/F1KosDiMDxT/Y04cLDqU+ECvKZpE8PGLJ
	 a4HGOlI47rioW/5Z6yjpafoQAcMeIN8QmbwHVhKoXU82Bbng8DYKq2+nSkDB1LgaTw
	 0SxssdmUY7XwiScLN96O7V7PLuN4mS5bTT5SUYLcIvuhUYEm8iCfHTyhYNWimdAyNe
	 fsjenl9ln09wdjjFE/NfyPHmden7ADl4vwzXSpQz+GiFNhN1sJ4UXoFaDaWiFwGBFI
	 H96wuwMpV24tY1bbLrAF7Xhh7pDBeXMx+kLk9FJYVNhLovZA21VX5tK/+k0xvpXWMe
	 gaVCycnYl6N6g==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] kconfig: fix extra output from savedefconfig on
 out-of-range defaults
From: Nathan Chancellor <nathan@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, geert@linux-m68k.org, 
 xiang@kernel.org, chao@kernel.org, zbestahu@gmail.com, 
 jefflexu@linux.alibaba.com, dhavale@google.com, hongbohbli@tencent.com, 
 guochunhai@vivo.com, michael.bommarito@gmail.com, kees@kernel.org, 
 vegard.nossum@oracle.com, sam@ravnborg.org, u.kleine-koenig@pengutronix.de, 
 mmarek@suse.cz, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>
In-Reply-To: <20260830221129.2668354-1-julianbraha@gmail.com>
References: <20260830221129.2668354-1-julianbraha@gmail.com>
Date: Thu, 03 Sep 2026 15:28:42 -0700
Message-Id: <178847452255.440755.3609720780671235760.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1926; i=nathan@kernel.org;
 h=from:subject:message-id; bh=SyITXCnjJlaxlH52HX2p2vD8eItiZZmrSazF0nbgEjQ=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkzvywKaDxtVb26870DI8OhooWfm9JC4tct4WPx+3xbp
 mjjmSU+HaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAi19kY/rtq5DOKXON6tvOE
 upXpxuJXK8u0n89hPLxtfXvjqSc2XZcZGfrNqqbUbPl8xNZXSvzKunlBMXbGQVGlDquW3tq4//H
 H14wA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> The Kconfig interpreter currently allows defaults that are outside of the
> range bounds.
> 
> In these cases, the 'sym_validate_range' function will adjust the default
> value to the nearest range bound. For example, see this example:
> 
>   config A
>     int
>     range 1 2
>     default 16
> 
> Here, since the default value of 16 is greater than the bounds, the
> effective default value gets adjusted down to the upper bound, 2.
> 
> However, 'savedefconfig' writes non-default values, and without being
> aware of the automatic adjustment to the range bound, it would write: A=2

Should that 'A=2' be 'A=16'?

> This limitation is also documented in a comment: "The following fails to
> handle the situation where a default value is further limited by the valid
> range."
> 
> To resolve this, let's factor out the default-range adjustment logic from
> the existing 'sym_validate_range' function into its own
> 'sym_get_near_range_bound' function for 'savedefconfig' to use too, so
> that it compares against the effective value.
> 
> Adds tests, accordingly.
> 
> Fixes: 7cf3d73b4360 ("kconfig: add savedefconfig")
> Assisted-by: Codex:gpt-5.6-sol
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Closes: https://lore.kernel.org/lkml/CAMuHMdVyUAA3L4mUkSjmnuE3cvj-+N8z-Bhxsh1wa-FQWc=fjw@mail.gmail.com/
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Thanks for the patch!

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Given this is a long standing issue, it should probably go via
kbuild-next for 7.4, especially in case this results in problems like
noted downthread. I would revert commit ab74edaeb1ae ("erofs: Fix
EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS default logic") on top of that.

I will wait a little bit for the folks CC'd downthread to reply to those
instances impacted by this change before applying this.

-- 
Cheers,
Nathan

