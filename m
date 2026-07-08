Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A493546D6;
	Wed,  8 Jul 2026 04:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783484588; cv=none; b=M4TBitwTSqu8DTFdnN/318RbfI+EOf87uCft4D++MdmXDsfDHjOM/reRUUBDRQbocEMSpayViEzU5M5oG7P778S7NMMJDlTPQ8FJq4IIQOQVUMxQS2EeeRs8H+mLULpMSJxBAUwCkHRy0rh4cFYQj81+knODU2wkxMB7xlcMGAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783484588; c=relaxed/simple;
	bh=RunsYtFesMkjxl+CoTYoFjBJrXMWVZ9jF+NZNV9AmzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YB/EEViJmNck8bv8N0DUjvzJidhjRRFUdaF21HuwJ5RmRGlXRrVkZ8WiftOkxS+Yqm4oQeLUAZCsYJaSP3oRdbBPKAVpui3St/waQNHNK9c3WJfJyQ0ZpTpGK2AETqzbpv5lpuQ2RRUUsULz5lGzkvkpVo683VJl+Y7Lox85J8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PO12xnFv; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PO12xnFv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=/yYwtDZAFFAxkqxJIxp8Km+s7dCvLib2EDNEgsmy/Hk=; b=PO12xnFvTlr0ACZFTQCBanUTgW
	sG3QkVrAyhrrYcrlxEpNAw+x20cUaiyNQVZMoqIXR24XU70rBh/9NVsoB0/cMSuItH628YlGSya+a
	KeDGQsLh5aopEjhR9obaVClqcMVOAyS4QEUhgp4njDLZLzqI3scHDWIXgmUbwuz930a2Ow+gJxXiJ
	ZJC0Be4CIWJCVnznHc2d8kvn+syMuKVi0PjrPk2HXhyR0t/XrUw5fc6w/dZHwQfY1aSxxkEggavCU
	ST5JdCmbrzXK6C7R/PcI1tffM+BHYVxBYxTfrn/vCCPCMS8eph6LqWOpRd7BWFeXrnf9/KW2E/Su4
	YByBTuNg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJoN-0000000GJYv-3tba;
	Wed, 08 Jul 2026 04:23:04 +0000
Message-ID: <b888d106-a9ad-43be-b642-562e379fa962@infradead.org>
Date: Tue, 7 Jul 2026 21:23:03 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] scripts: fix spelling mistakes
To: Martin Weiss <martin.githubacc@gmail.com>, linux-kernel@vger.kernel.org
Cc: Martin Weiss <Martin.weiss2410@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Alexey Gladkov <legion@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, linux-kbuild@vger.kernel.org
References: <20260629082812.551273-1-Martin.weiss2410@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260629082812.551273-1-Martin.weiss2410@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/29/26 1:28 AM, Martin Weiss wrote:
> Signed-off-by: Martin Weiss <Martin.weiss2410@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  scripts/config          | 2 +-
>  scripts/link-vmlinux.sh | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/config b/scripts/config
> index ea475c07de28..dfa78cfcba67 100755
> --- a/scripts/config
> +++ b/scripts/config
> @@ -38,7 +38,7 @@ commands:
>  
>  options:
>  	--file config-file   .config file to change (default .config)
> -	--keep-case|-k       Keep next symbols' case (dont' upper-case it)
> +	--keep-case|-k       Keep next symbols' case (don't upper-case it)
>  
>  $myname doesn't check the validity of the .config file. This is done at next
>  make time.
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index f99e196abeea..c8f27e4175f9 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -38,7 +38,7 @@ is_enabled() {
>  }
>  
>  # Nice output in kbuild format
> -# Will be supressed by "make -s"
> +# Will be suppressed by "make -s"
>  info()
>  {
>  	printf "  %-7s %s\n" "${1}" "${2}"

-- 
~Randy
