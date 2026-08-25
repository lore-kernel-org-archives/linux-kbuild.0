Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E52D345EAF;
	Tue, 25 Aug 2026 17:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787679703; cv=none; b=OBtmTpDQm7rq3UGiX+UWRt+E26XuEGM02t2fmz4E7YeXzFeREle3IH5VwSEPE2pvvThjjokdYCie0ZgH7wZXTQwVHQfslO8kqIpSO4MRqU7We/vMEElTFEbadGmC83w9VpNxkJxXwMIr50DXoLKhY5rjHZOqDcOzcsyrBsGkvTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787679703; c=relaxed/simple;
	bh=mAtKucyiNnFit1+XPwUoTrc4NXRqyoQHvRzzbWzWsaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4R9ikqOYBpxPIZ6gY5LqVLD9pSljjf2BrjCfxHF97Rmpk7i5mdhmsLXljMImyidy2MRPKKDHtoVfsXdahZB1OSUO8C5yik7EMmpacuOOf4p7Op6wQrPzG/kNuvuNaHfxSvl04Bve8EQiTVQbyyAI/2wesuEnXerLD+h2b7a1ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxWhNyDe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxWhNyDe"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3468A1F000E9;
	Tue, 25 Aug 2026 17:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787679701;
	bh=IXRnBAng9pfe/zf2f929XXk6pKXJn8GdmF1udR13S/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mxWhNyDe7FBs0foow1BoBcs68JHS2Z35VkjtfajQIHs6EdCvVsWihPRkaN0yImw+n
	 o0WIuu5IdfeA0b9tzbISA+IG/tawGb090cr7akYJhv1McJ7yZ1thajCw3RzxrJqHKi
	 DtD4mSpEStMZheMViqvhp2qirIT1bKa9kdTPXbkKBamw8k22d2lBD678uGp0558gbU
	 2ZoXdXCbMJy1c0V7abtC43ZGKCYsIg+90vb1TQZsDWnSKgMnDm66RsIeG9mb8/EmUu
	 9hKrDW74kWrV9gOrq363pOT3e+M0dEg5WGCuhDO1J772PH8pNkeJR+d3ZWngP0VFF2
	 O3KcgMgwcmcrQ==
Date: Tue, 25 Aug 2026 15:49:18 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Yuntao Wang <yuntao.wang@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH] setlocalversion: make tag local to try_tag()
Message-ID: <ao2dXh1c4M5s7DsC@levanger>
Mail-Followup-To: Yuntao Wang <yuntao.wang@linux.dev>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <20260823094913.421144-1-yuntao.wang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823094913.421144-1-yuntao.wang@linux.dev>

On Sun, Aug 23, 2026 at 05:49:13PM +0800, Yuntao Wang wrote:
> The tag variable is only used by try_tag(), but is currently declared
> local to scm_version() and modified by try_tag().
> 
> Make tag local to try_tag() instead and remove the unused declaration
> from scm_version().
> 
> No functional changes.
> 
> Signed-off-by: Yuntao Wang <yuntao.wang@linux.dev>
> ---
>  scripts/setlocalversion | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas
