Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC9C29BDB1;
	Fri, 31 Jul 2026 00:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785457986; cv=none; b=tKkOcRIMVkLrFr2jiyzNPQtKTAsUFJ5N/obK8COFVDnTAt/cxmdF9nvczrBv1XLLqf0uETwPstYRkCfgclhpidzTtZxlem6c4NOcrudzDYmbBU6U6y8sH54o7mUglpGBKUmfTWEEkfo3IBo9xZsiMz1PSLq7LgekEGiBVxhZrDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785457986; c=relaxed/simple;
	bh=SVvbfIcAP8682s9VFSvwN5VzjsyB34OUmCjoRDaaLW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J9stdodZtKFmjh3Axzh1pwXX/1eXUTkmmxles+hmHF1HAP41LSjB1JelSqVSPdWZ1ZXW6ZXLc2QeQxN8ZXqwQcgL2L4YMaicYX8apwHFjecUTlcZWmeR5s2rFnecFCnzpAXDHflFnfzPW1P++tofCBOSgQHiEf3UvKfW1StJd8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=0XeNK4Ww; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="0XeNK4Ww"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=oO1CDOT9gnOjmaMCIdL5hkiO1oxiUXMIc71j6JK28vs=; b=0XeNK4Wwtd+ZSoEmb1/YASz+Mk
	jAN22g245EZWos2l2XQ9gh/4i8tnB7EzEM17uxZk4P/QIc7ViQtFSuDyUi3eFaRKAGFT7Ow+bGFTR
	IG9GVAFxjnK62GoPHURZXsa/T4D76/BXdCJGB2LEC9qo+UAf/nLZcEtlND6jxrR4eJmdBGIQomRpK
	DjfSZD6Wv+bfyl8H9kI0Ykc5jkDHcHJMe7dhm2eJByJSj01LUmn68KeoZYU2lBZ3PrBnAax2lZAYd
	SlNmeLzj42WONH1eYw0F9rWew1zGySuipbL0gpXng5Hc+ls9TACPejvMMYVkAJCugKzJA0ICDS4Go
	L4qxJmqg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpbBG-0000000BYUw-1DHP;
	Fri, 31 Jul 2026 00:32:54 +0000
Message-ID: <d8d934fd-fb24-42d2-8a43-ee43a2fc1405@infradead.org>
Date: Thu, 30 Jul 2026 17:32:53 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: warn against using int, hex, string
 options as expressions in Kconfig
To: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org
Cc: jani.nikula@linux.intel.com, arnd@arndb.de, stefan.hengelein@fau.de,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, nico@fluxnic.net, officialnaumansabir@gmail.com,
 vegard.nossum@oracle.com, kees@kernel.org, tj@kernel.org
References: <20260730140108.683967-1-julianbraha@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260730140108.683967-1-julianbraha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,
I haven't had time to really look at this yet, but...


On 7/30/26 7:01 AM, Julian Braha wrote:
> I've been working on type checking Kconfig, and found some instances of
> dead code due to conditions that always evaluate to false.
> 
> For example:
> 
> config FOO
>   int
> 
> config BAR
>   bool
>   default 'y' if FOO
> 
> This 'if FOO' will always be false, regardless of FOO's value (even when
> FOO=1). The same goes for strings and hex.

Does it help to say
	default y if FOO > 0
or
	default y if FOO != 0

Oh, I think that's what you suggested below. :)
Sorry, I just read that part.

This is unfortunate IMO but yes, let's at least document it.
Thanks.

> See also this related patch:
> https://lore.kernel.org/all/20260729210546.394392-1-julianbraha@gmail.com/
> 
> Let's warn users against this usage.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  Documentation/kbuild/kconfig-language.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index ab2822d7ca1c..aee84b294a56 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -320,6 +320,17 @@ An expression can have a value of 'n', 'm' or 'y' (or 0, 1, 2
>  respectively for calculations). A menu entry becomes visible when its
>  expression evaluates to 'm' or 'y'.
>  
> +Note that options of int, hex, or string type should not be used directly
> +as expressions; these will always evaluate to 'n'. Instead, to check if
> +one of these options is in use, consider using one of these heuristics::
> +
> +  <symbol> != 0
> +  <symbol> != 0x0
> +  <symbol> != ""
> +
> +because int, hex, and string options will take these values of '0', '0x0',
> +and the empty string, respectively, when the dependencies are unmet.
> +
>  There are two types of symbols: constant and non-constant symbols.
>  Non-constant symbols are the most common ones and are defined with the
>  'config' statement. Non-constant symbols consist entirely of alphanumeric

-- 
~Randy

