Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0AA43149D;
	Fri, 31 Jul 2026 14:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509136; cv=none; b=SI8DXAX8+oQuOM+QK8MgCcXcveLrrHvfgQVvsQX79x4gdcBwoN9cQ+cBmF8NaGRKEBB59I9W0faEqpgxQ2umxo9cgPtRSKzeMvVpExJlhJogQgOdkpv/sha7uZNErBCAJa/zfCLxwvOq4TAObbCkLKDMhIh7TM3SNJVr8p12bhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509136; c=relaxed/simple;
	bh=uzNrZ6e+5N16ctstK8cAmyiZeLb+LRtdgAKcNhKSMlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=n7nwEHzkHVzQN5hxvomYdQYZaTN7IYjfhMApANUk7J4CJ+f07shpWSC/ESFO5yJYX6SLSnfuzazbuFy7voB9HRg6eqH+eOCFVNWM1MvyeKFRcoU9s1a9fKbUQkR/8v7Aljw9pakJnBXsge38VbKUpb1GlkfHzDQarxJk1OuDRGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XH+Vqqt2; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XH+Vqqt2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=+c51zGieKak5RFk55ElEaLohSctlMerHukyrYmPypA8=; b=XH+Vqqt2ujwbD01MPLqcN0Tj3q
	cvtylTDANP7NinEZ/owqkS6J3qEn5KhZdlzIemRV8ClzRfUrqlvbGy+4YteNQ8GAlDzHb7xtmklzk
	/3BscSgP9m6CNwjivZRCvIPn2SnGTVNgKTvmvTYYCdDXSnPudCv+1mJHY8w2zUo4F4dLoIbG8jP2e
	wy9Teb1qtostOmfmdVjI/yBE1J9OM/0OZ5lc41KaSMV2HsUqMjPYtfme7/RYbnYTCcXaLEu7ggxkN
	+VW+ZfPju8vb+5K+SA0wXbLo9NRueufym+CfZoY+q6KKkUUMF4tByAJKkEAHJO90+luQQZe7WR3LY
	9aLA3VAQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoUH-0000000ComQ-35bf;
	Fri, 31 Jul 2026 14:45:25 +0000
Message-ID: <219d161a-8d8b-45e5-84d6-195c80a24ddc@infradead.org>
Date: Fri, 31 Jul 2026 07:45:23 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usr: Correct a spelling by changing a latter
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, nathan@kernel.org,
 nsc@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260731102211.2327476-1-unixbhaskar@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260731102211.2327476-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/31/26 3:20 AM, Bhaskar Chowdhury wrote:
> s/dit/did/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Looks good except that the Subject has a typo in it.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  usr/initramfs_data.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/usr/initramfs_data.S b/usr/initramfs_data.S
> index cd67edc38797..e92fb59b3fba 100644
> --- a/usr/initramfs_data.S
> +++ b/usr/initramfs_data.S
> @@ -3,7 +3,7 @@
>    initramfs_data includes the compressed binary that is the
>    filesystem used for early user space.
>    Note: Older versions of "as" (prior to binutils 2.11.90.0.23
> -  released on 2001-07-14) dit not support .incbin.
> +  released on 2001-07-14) did not support .incbin.
>    If you are forced to use older binutils than that then the
>    following trick can be applied to create the resulting binary:
> 
> --
> 2.54.0
> 
> 

-- 
~Randy
