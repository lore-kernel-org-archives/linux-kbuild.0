Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5432443F0BE;
	Sun, 19 Jul 2026 21:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784498199; cv=none; b=CL3qABNiYCwzRkGszZkHVF7oi19/i/Vwx5OZBCW82bBCFSuKMXhZRlLbNblrMoh4KJ1r9HsQqJM1O/J9pyFzYOUrxjktsPpfP3gdveQHPGv8bWRppYE8LMZKUYlcBsRgcKabxRHSHnS/3wX46f0leRKUF4DfzAb0tRxlsqjEhqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784498199; c=relaxed/simple;
	bh=+sMjak6KHHj4j3RAi2hv18+R97ob95wmZVNupK20Yko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f3z6CtzecQ6basXeZc7Bfn7sLJtVN22ycnjS/+sd/Ty4f1GUG9RMxPKkT10+9tSet0FjJ4RBBoV573Iweeh76tCYSyi3DnQMAKFcsvudMZyeGVagvgvcb3wX241XrZRx2bDI9JGUU12dRetaSNWxWhn7QLI0EkIzV9FtIccpFpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uNrUMtzy; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uNrUMtzy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=oLA5SJh9FslRdq53RoVr5f0/d43pGgbClbjMzsNTXWA=; b=uNrUMtzyTCMKvOOIe9e3oNQTzI
	DS3zXx9v64geswY9U7JwhmjpY2XXU8GqrzzLc/4O7uPfUFcoctELBgiZANcdS/iI/gvzaISZtD0fW
	JvAdBiiV6rI1sNIB9K2noLAqoEYMOYg76DQrtl8PXadCjST9o3ExxArfUV3OmkfzB8rDOCSx1sXpg
	N19ijeZbZauDXgOy7y+3AktV70S+BZG31/VXOi+quqTrqBYahUk3IXJ2mUePu3aBwnHLI02WeKmue
	bfr/+gyUfX0EVbp//7KT/heVeYM+7fcD3jPO7LbvHUAaoOTTSqDbNO/+oMDoWR1Wqwr1r4rVTGR63
	Cw35bzqA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlZUv-00000005P9M-3ECn;
	Sun, 19 Jul 2026 21:56:33 +0000
Message-ID: <b97d71f8-bd98-48c5-be05-c9f4f4b0a994@infradead.org>
Date: Sun, 19 Jul 2026 14:56:32 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: fix minor typos in comments
To: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: vegard.nossum@oracle.com, kees@kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260719210536.9577-1-julianbraha@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260719210536.9577-1-julianbraha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/19/26 2:05 PM, Julian Braha wrote:
> Some typos I noticed:
> 1. expressoin -> expression
> 2. A property represent -> A property represents
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  scripts/kconfig/expr.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
> index 5f900d18dae0..fa3823a97d72 100644
> --- a/scripts/kconfig/expr.h
> +++ b/scripts/kconfig/expr.h
> @@ -38,7 +38,7 @@ union expr_data {
>   * struct expr - expression
>   *
>   * @node:  link node for the hash table
> - * @type:  expressoin type
> + * @type:  expression type
>   * @val: calculated tristate value
>   * @val_is_valid: indicate whether the value is valid
>   * @left:  left node
> @@ -160,7 +160,7 @@ struct symbol {
>  
>  #define SYMBOL_MAXLENGTH	256
>  
> -/* A property represent the config options that can be associated
> +/* A property represents the config options that can be associated
>   * with a config "symbol".
>   * Sample:
>   * config FOO

-- 
~Randy
