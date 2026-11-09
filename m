Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208237;
	b=dR8of99E5a/FMQDM3xeQJaNyNOpYPGOO0XVqsk5KwmCmf7pAyunAm/JFcnYwTtihvLqG
	 tPaVBAmk9dQrXTQLvLpqtGJck+WRMP+/xGx7a+dtrg2tbdZizrb+/6VNS6Gn3dcfGT3Pq
	 IqUCmB75szoy5DwdLIpeeFm4+zLSfGu6CAk/IXF7PmHsIyZ+gyqi8XKIWwVrS4ziz5Wel
	 O0uFNrcMaaesav/WXq81JeeycLhODq5vuijo9w8iyic7POGJSdcmtR8JRb3bpt8x7Fi+J
	 7rud8m2pw4yq+DAM7xwqUYQdcBTQbWhN6xFHLk24xo+BIs67SYQ82FY3PbrqGAxx39g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208237;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=YQwiMbJ6wk3a8ki4tGknCqp5ZXdiEZZalr4HJ25sGLI=;
	b=mHyRVYCDOl1Bvc/iUeLz7VwfK9QgybwS5odlftGzYYl+Tzbd/9Na5ApsN40FijsGi2Nr
	 hmuyC0mCLUpelAHxE/gdvgBL6DvO+dSqn7hqqVXqgtoCI4RM+PPTIo5olUIVv4v5bzxpY
	 yVzLMubHyDZX5Z0W974wTFWrszK+lWSMrBRXMgAHZSMW+xNCWYrrem+PNalmJ1X0f59So
	 Fvl1FO4KD3BmX8rOh93fJqRpa2MCl+iQ+AyhZf077U/U9sVdpYhWX4Z6cgNaqBsNhiUQ6
	 jK3I1Q+4CYIe4oDaNgfVm3E9aUqqYT92eIK7wGahYB4psuRl2kvNM2a9Use/KE7M5tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTZeoKAA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 42492606A323;
	Mon,  9 Nov 2026 07:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTZeoKAA
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 496321F0089F;
	Mon,  9 Nov 2026 07:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794208236;
	bh=YQwiMbJ6wk3a8ki4tGknCqp5ZXdiEZZalr4HJ25sGLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oTZeoKAAqqBWr5G5W80KCtsk3DzAHDLYLkNuU204LWQKPN4YXCNBvEr7IUej2oxzY
	 0lyQCsBLOhyYoxC94GO0uQwVWfsNPPJyH6HmKDRQbj1ZXqwEdPSBmRxEBS4/mzPtjZ
	 KhW77Mk8GZdOSaL1ubEH51pkMM+oEez18cOPdooGWcoAuQ7Jx5tm9WRYg9mFOg4CGa
	 7TqmTFbOD/fr6MyGWk+ZPxgKCHfwIVV4R1Oib2XKqqi/HZbYU1jKjxewG/hra6HwXG
	 iDuzseZ6U9xZZiYC3fkMdtivJ3H71QxH6d56LYvyE058IiMKFWyHSG8qxw1ieRf/Yr
	 VmNb8quYe1lGw==
Date: Mon, 9 Nov 2026 08:10:24 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] ARM: kprobes: Rename test-kprobes.ko to
 test-kprobes-arm.ko
Message-ID: <avFx4KAiDPYlYAaC@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sasha Levin <sashal@kernel.org>
References: <20261109-arm-test-kprobes-rename-v1-1-663cdbbb90c7@kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-arm-test-kprobes-rename-v1-1-663cdbbb90c7@kernel.org>

On Mon, Nov 09, 2026 at 01:46:42AM -0500, Nathan Chancellor wrote:
> When scripts/modules-check.sh is fixed to normalize the module's name
> like name-fix-token does in scripts/Makefile.lib before checking that it
> is unique [1], there is an error due to lib/tests/test_kprobes.ko and
> arch/arm/probes/kprobes/test-kprobes.ko having the same module name.
> 
>   error: the following would cause module name conflict:
>     arch/arm/probes/kprobes/test-kprobes.ko
>     lib/tests/test_kprobes.ko
> 
>   $ modinfo arch/arm/probes/kprobes/test-kprobes.ko lib/tests/test_kprobes.ko | grep name:
>   filename:       arch/arm/probes/kprobes/test-kprobes.ko
>   name:           test_kprobes
>   filename:       lib/tests/test_kprobes.ko
>   name:           test_kprobes
> 
> Rename arch/arm/probes/kprobes/test-kprobes.ko to test-kprobes-arm.ko to
> make its module name unique and clear up the error.
> 
> Reported-by: Sasha Levin <sashal@kernel.org>
> Closes: https://lore.kernel.org/20261108225808.1809266-1-sashal@kernel.org/
> Link: https://lore.kernel.org/20261103110411.11698-1-info@daylightlinux.ch/ [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> We would like to take [1] for 7.5 in kbuild-next, so we would appreciate
> an ack to take this directly or a stable branch that we can pull in.
> ---
>  arch/arm/probes/kprobes/Makefile | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas
