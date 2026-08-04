Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73793ADBA5;
	Tue,  4 Aug 2026 15:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785856462; cv=none; b=Y00eyktVtgYbcPGkaYrFLZGLCI/6vcjqnbjJUTuf4iSvAV4QfouB+R3YNxy+OHIJFMMn1sZ5u39YWRdLttxPXzwhttc6yykNhFIxX3x+96jVn7lUDmOj8nctfwhQPsylMT7ZJzdXFGTgfqm88D0+jd3prZeHkiPtIbj8HglV4lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785856462; c=relaxed/simple;
	bh=arP6j2ECDEOIayF5TjZFUg/hX8iTTTIkXCS/xGG8S3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E6zXClDX86sTLDUhalpNHyAcBdJbw87sjoSLiyZbHVo3TXNbzP7x59VMxTYOQIafxt3R7tFjfjfXUDh2WOcIjd7XEm+nXgP1pbAuCtrGv6GQPaZlD9U4zK9dsx6Gml2A42LCu6j4et6RNOYQBmAJSzkrvlfStBw0ZNndRshgzVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jlI0AiQo; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jlI0AiQo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=L6k6bUOJfkMaMOwNHqgRraQHVkTGpDwodsemPczGGhE=; b=jlI0AiQoTzn5uegQcj3uwNfnv3
	FSoaf8z3lkeK9nZ5q4lieLORo5rMGXBrX2rBU96dUt0aRPL2w2Mskj5DGIX+TmqaaIWsg4SzgpiG8
	IZirRTFtP3o4l9c7wqXJDsTM8IwdJWZSOIpx31csWP+OZd3+KLNTGLC5IMbM68Gy49a8SnEwtz9cy
	+gb1K8LuoODrMPlKboId6TPGOhJ2zwgz91ItystrVi2Ebfw8mjI84IE5RiqVTFv/Zwn8sE4x8BAKG
	fQsIHjBIQePbJh6fi088Jy25UD8VOMtiKW69KlJKIVHayrVYg0JrRlM+RXBVWvj0BZSBeOvBlnCxo
	pnS5W8MQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGqP-00000002BR2-3oCM;
	Tue, 04 Aug 2026 15:14:17 +0000
Message-ID: <583c8bfd-0687-4277-84db-55e0f5654238@infradead.org>
Date: Tue, 4 Aug 2026 08:14:12 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add Julian Braha as Kconfig reviewer
To: Julian Braha <julianbraha@gmail.com>, nsc@kernel.org, nathan@kernel.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260804141436.1451211-1-julianbraha@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260804141436.1451211-1-julianbraha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/4/26 7:14 AM, Julian Braha wrote:
> Add myself as Kconfig reviewer, as privately discussed with the Kconfig
> maintainers.
> 

Nice. Thanks.

> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 03febbc91a06..e248136bf3dd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14029,6 +14029,7 @@ F:	scripts/Makefile.kasan
>  KCONFIG
>  M:	Nathan Chancellor <nathan@kernel.org>
>  M:	Nicolas Schier <nsc@kernel.org>
> +R:	Julian Braha <julianbraha@gmail.com>
>  L:	linux-kbuild@vger.kernel.org
>  S:	Odd Fixes
>  Q:	https://patchwork.kernel.org/project/linux-kbuild/list/

-- 
~Randy
