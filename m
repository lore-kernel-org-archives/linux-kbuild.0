Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3950625B09B;
	Wed, 13 May 2026 23:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778715067; cv=none; b=kKiCCX22k4jN2qhCbRbO3SHNNnBhWtSNofgOmz1enIvJOtdQAeFMPZM953zfV/24/a3eJBGLPh8yqUWTQdmv9k9YUoeB8QhQG6wqgdsiuaOOhtJ0htVd6NjmI+2HndhHqtJOsswR3mi4XHw8Gi0jV6EtvAWyAxHl8PIClkLE1V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778715067; c=relaxed/simple;
	bh=bfoJR+cp92Pc+7sxpkLF5l1KjEDO9Q555ahXmwt8i/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TVl9jW3x+pEO1lW78uuJbokqVFqHVr0ytWBjEcqJD1s2LyqUMsVAdDqDXEkpiI7S35XW4U1/qPgVsYuwTjVeve3WlVoNPUi0cTbyNoKPDIT0BGg5MDamAARM7mBWnRsldYy3/5RmHK+ksTugtUh4BKRhUJTsfyIERka1AOC3uEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bPWNUcM2; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bPWNUcM2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=huRuWpMpBeJX9TrDd8V9NJj7n2mcOd9/ELoRA1aGWCA=; b=bPWNUcM2BbYdaYRsj6//H/lkfh
	57QSDDfpr3lt2Pq0n8O2m6JivzC2mHiJnI9p096wUo5MKFf8TkHNJVi2LVqL+sXHYBXjb1wKnsq1e
	Rpb6mgSLSU2xrRiiviGS/J+3qlhtU1lRo+3gzBBtJWKjCopdqPuIEnKfe2o3KxxN5zmF0i+/6Zi9j
	OFBb+AiIHpyvUYjO8M41YHN8DrZqeuvtQs792oEaQWeMTJ14vn8uylmupl6en5UuVm+nfqH1MKwaQ
	mV6Hc1xrgLFU/Wbs441IfSw38F0IRVZA/9eenm1Dsry/8eDYi63OD3tkyR4CN85pWeWVbvACkKwzp
	2uns16NA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ2e-000000042H4-2VEN;
	Wed, 13 May 2026 23:31:04 +0000
Message-ID: <f3ed50d2-24e3-4816-a811-44a03faafc8f@infradead.org>
Date: Wed, 13 May 2026 16:31:04 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: add kconfig-sym-check static checker
To: Andrew Jones <andrew.jones@linux.dev>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: nathan@kernel.org, nsc@kernel.org, andriy.shevchenko@linux.intel.com
References: <20260513210329.637892-1-andrew.jones@linux.dev>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260513210329.637892-1-andrew.jones@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/13/26 2:03 PM, Andrew Jones wrote:
> Add 'make kconfig-sym-check', a static checker that finds Kconfig
> symbols referenced in expressions (select, depends on, default, etc.)
> but never defined via config/menuconfig anywhere in the tree. New
> dangling symbols are reported as errors (exit 1) unless they are
> listed in an exclusion file, e.g.
> 
>  KCONFIG_SYM_CHECK_EXCLUDES=sym-check-excludes make kconfig-sym-check
> 
> The checker also warns about uppercase N/Y/M used as tristate literal
> values following the same logic as checkpatch.
> 
> This new static checker is the script used for [1] with a few
> improvements to avoid some false positives.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216748 [1]
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>  Makefile                             |  7 ++-
>  scripts/kconfig/kconfig-sym-check.pl | 93 ++++++++++++++++++++++++++++
>  2 files changed, 99 insertions(+), 1 deletion(-)
>  create mode 100755 scripts/kconfig/kconfig-sym-check.pl

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
