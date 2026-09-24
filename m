Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9595B3E51D2;
	Thu, 24 Sep 2026 10:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247447; cv=none; b=b/ESpPPD4p4aVh3obybnc3hU0JxBXsRROSaR8WyRHfwBvhy/vmFfGBLU/Mq9tUQGUpMEihtWn3TL7aDKRFZ4DpdDPC/QF+RhsHmD96G4bqTJs3rg/AwJ6lFBKcCiom5dm0FujQ3ewrDt4n8cUS3+ay30vipdEnoNrRu9Rvfi9bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247447; c=relaxed/simple;
	bh=TedKenYBLBIChQl/W9Dc29bs904Civh+Evv8ETUl2Yo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=bcmu8aKcgT0bem7IF3+c7YSNVyEOn4kYlPczRvallOuh9FfdBd6p2fisJO5Q/4uMQ5sGmARtUtytnfxbS3/ntDUlEFQ9Q/ZRnTamvQ61g0Q3qyvBD1AEgbmbFUhc0+6jncDbmNJbiK9rghDfFgElLzQPP+z8ojb8gQFqxOT8VFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=h7iD0psN; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="h7iD0psN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1790247434; bh=TedKenYBLBIChQl/W9Dc29bs904Civh+Evv8ETUl2Yo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=h7iD0psNBFaAhRTF7DezTTvWqO86PTsr/aKQhQiBEhCQmbzuK5euLOv5Y56RUF3C1
	 YHm3XWH7Er9uVtdkWHzuxtstds3cjts3wyaEVshiABXS8ebPpiiarzq3EPwfeOEX9L
	 Uw4dsbmFQLFGmx+oKsn80wXfhpV4MIGtUZuTAlxVgKJNZPCnaujKzam2khBP/7mAJ5
	 2DkNORM9wDqn9jm8XVKAzNRBUb6ReWNAaLXFKpcfYQ+ZTI8WtaOXr7p7iQ6LamamNJ
	 0x8oi3lTBxTYaVmayP9iZ5Jj7Y6fjK/JyeFiV0NJBwWgNy/puuca+TO3wjgh96Nl64
	 UbnLfIpInQTVQ==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6ab5020a-03d5-7f0000032729-7f000001ca02-1
	for <multiple-recipients>; Thu, 24 Sep 2026 12:57:14 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 24 Sep 2026 12:57:14 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] kconfig: error on reverse range
From: Nicolas Schier <n.schier@fritz.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, n.schier@fritz.com, 
 grahamr@qti.qualcomm.com, rdunlap@infradead.org, nico@fluxnic.net, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260922163749.2031594-3-julianbraha@gmail.com>
References: <20260922163749.2031594-1-julianbraha@gmail.com>
 <20260922163749.2031594-3-julianbraha@gmail.com>
Date: Thu, 24 Sep 2026 12:57:06 +0200
Message-Id: <179024742687.3875862.11053097465052610200.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2864; i=n.schier@fritz.com;
 h=from:subject:message-id; bh=TedKenYBLBIChQl/W9Dc29bs904Civh+Evv8ETUl2Yo=;
 b=owEBbQKS/ZANAwAIAYjGvJyImm24AcsmYgBqtQIJQK3vLPV17JCodxHxYpuYABe4DvWZnqxZO
 xU6AkRaZneJAjMEAAEIAB0WIQQO/4WJ63TpgecLpGmIxryciJptuAUCarUCCQAKCRCIxryciJpt
 uOKBD/wNJfWGdrdapYBhMXafYUUPST1aWReCOdMaoDrbGQgfegbg5aXqCWS0gCW14DkP5SDhRsE
 MNcySar/g2T8i4CynfGZ20RxZ/W5sAwguo7VwYwJI1shQQR5nyllZVN+2LbOj9p74G3mEJL7t/K
 EoQpkvI2iWnT8V09t8SswPrK8lGNzgZtw12zWYgj+0jlTbhWZNUn5vaUDg+lkQbjqFuOitNY3xM
 zCCQ19uluDdXnFPp+pLW7xTYFhwiazLzGYBhoKVpLyuc79thv97hJfrEhKXL2Z79MuGIiLotujV
 mU8nckuNlEzXa5sVSk4GV0/33GdacqaH71iWBKG5bHPtdcCUU0MWUB3AvMq2Kv3moUoJMrD3WCa
 AQoaTzDScXk0o+/byU7FjVsQ/jfPWVhBZBWZlwWaZquIuNn08Al2/PAeq0yF9kidSSWpaLXmyat
 WMxU0UnCma8v4hE0HNkGL5SkZu3nnJ3K+oRdWB1TPw2g2SAza86nMdrn2A+W0xTbE/RYOCps1nw
 XSCvoRgScAEN2eoxBn1oyZKC0ekPHd0tKqfBotpCpeegNzNWq7EgKhQmhcKjOkSQ2KzhrlXl2Ul
 P5x9tMXtFW/bz4wSvKRHkmre0kVMughZ4tu8aAV7FC4tJEtMLU02Q4LAxM4sNMje9T5CEw+KzVB
 tSCEOqYSuwdAI6A==
X-Developer-Key: i=n.schier@fritz.com; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1790247434-7FFD5EF9-2CF265FE/0/0
X-purgate-type: clean
X-purgate-size: 2866
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-02  mail-id: 4ECE7A086F  external: no

> As discussed on kconfirm v4 [1], it was decided to move checks directly
> into the kconfig interpreter once where are no findings from kconfirm.

s/where/there/

> This "reverse range" currently has no findings across the tree, so let's
> add the check.
> 
> Currently, if a reverse range is attempted, such as:
> 
>     config EXAMPLE
>         int "Reverse range example"
>         range 2 1
> 
> then the value of the option defaults to its "lower" limit of 2. If the
> option is visible in the frontend, then the user gets trapped in the value
> selection interface, since there is no value that is actually valid for
> the user to set.
> 
> Note that this only checks ranges that use constant values. Statically
> checking ranges using symbols would require SAT solving, or similar.
> 
> Link: https://lore.kernel.org/all/20260904220559.GB2787252@ax162/ [1]
> Assisted-by: LLM
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
>
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 118af2dde722..cc335f6db257 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -274,9 +274,9 @@ static int menu_validate_number(struct symbol *sym, struct symbol *sym2,
>  static int sym_check_prop(struct symbol *sym)
>  {
>  	struct property *prop;
> -	struct symbol *sym2;
> +	struct symbol *sym2, *lower, *upper;
>  	char *use;
> -	int errors = 0;
> +	int errors = 0, numeric_errors = 0;
>  
>  	for (prop = sym->prop; prop; prop = prop->next) {
>  		switch (prop->type) {
> @@ -325,8 +325,22 @@ static int sym_check_prop(struct symbol *sym)
>  			if (sym->type != S_INT && sym->type != S_HEX)
>  				prop_warn(prop, "range is only allowed "
>  						"for int or hex symbols");
> -			errors += menu_validate_number(sym, prop->expr->left.sym, prop);
> -			errors += menu_validate_number(sym, prop->expr->right.sym, prop);
> +			lower = prop->expr->left.sym;
> +			upper = prop->expr->right.sym;
> +			numeric_errors += menu_validate_number(sym, lower, prop);
> +			numeric_errors += menu_validate_number(sym, upper, prop);
> +			errors += numeric_errors;
> +			if (numeric_errors || lower->type != S_UNKNOWN || upper->type != S_UNKNOWN)
> +				break;
> +
> +			if ((sym->type == S_INT &&
> +				strtoll(lower->name, NULL, 10) > strtoll(upper->name, NULL, 10)) ||
> +				(sym->type == S_HEX &&
> +				strtoull(lower->name, NULL, 16) > strtoull(upper->name, NULL, 16))) {
> +				prop_err(prop, "range lower limit '%s' is greater than upper limit '%s'",
> +					lower->name, upper->name);
> +				errors++;
> +			}

Thanks, looks good to me.  I don't like that we do these strto{u,}ll()
conversions everywhere repeated.  But I think it's ok for now.

Tested-by: Nicolas Schier <n.schier@fritz.com>
Reviewed-by: Nicolas Schier <n.schier@fritz.com>

-- 
Nicolas

