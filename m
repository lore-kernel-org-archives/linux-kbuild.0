Received: from mailrelay-egress4.pub.mailoutpod2-cph3.one.com (mailrelay-egress4.pub.mailoutpod2-cph3.one.com [46.30.211.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713733B3891
	for <linux-kbuild@vger.kernel.org>; Sat,  6 Jun 2026 14:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780755886; cv=none; b=lvOFcRQAYPogI9IPMkvDmczTP4etXMhoNU5SkK7m+9YhVxwfMm+P06JOnPjotQ2Vsirzo2hDN+KwRxFrTT0bA8cuYfFNn9g68JMtq1CgyckKVkdquPAE1HCJVE5HStiIlUIJS9C7Mvz0TcGawl4eC2ReZapndJeDWWEjfhkeI+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780755886; c=relaxed/simple;
	bh=PLA1NhztnfMk6fnKVXJXtJ3DVRKJ66pwsw1BOZKgKBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGEfdLiwnyE9PLkv7afW1D6GbgO/QEti9pY6cIZGju0VQnsXudcl4sUdEzDnf+K8Z06Iy4DHX0u5GSf0mboEzYIwM7uagSSXXmkxjwEHyjnpcflZegJ7cawPwnJ34uH7uIZB+TIPU6UrSPMGbl+P/oSn1NgA5F1rQdqkT989s6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org; spf=none smtp.mailfrom=ravnborg.org; dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=slB/cTK4; dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=zx9sl7iI; arc=none smtp.client-ip=46.30.211.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ravnborg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="slB/cTK4";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="zx9sl7iI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1780755808; x=1781360608;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=bMlMNKVW1rCAsroPiKZBVZjNau/we/doyyb0U83q+YQ=;
	b=slB/cTK4xOULJX/dxFHb1q79re7AQRpOTGxk/Jhy6MjLMzOU5Ii2id6/3S5N9fTipMtsGQKAlrVHP
	 +ki4vqCXTKaEkiUxxgK3GW1w1I5EmkIGyX+A9FH6BUcHtcK4SMEHlEvD9n5V8UrhnoItlnemZWHtDk
	 RcUCFFC0or4a/UNOVF5Jo4P1XPyKJ3Re/k+tCO0T3xMNhYIxSP/XniWOUL4SnLW00AWKDZDDDMIMtv
	 APsUlxwtcruxB9DsH4fPKXKbm1quM/TlRtx2xSoQJZjP6p9/Vo7LHuvoR14G5iU98MUJ4UniFRAgNt
	 OBtL8GXtm5G19wz4WbY2HUPfcTiz5Xg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1780755808; x=1781360608;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=bMlMNKVW1rCAsroPiKZBVZjNau/we/doyyb0U83q+YQ=;
	b=zx9sl7iIYQCP8OKf2ZvbVRfaacKgb9nTXfQAEoL9ijdRiyv99ygeKlDUKY3QpKXdO8lYda00A+uxq
	 H3d+zFNCA==
X-HalOne-ID: 4766d768-61b3-11f1-8589-85eb291bc831
Received: from ravnborg.org (unknown [37.97.53.191])
	by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 4766d768-61b3-11f1-8589-85eb291bc831;
	Sat, 06 Jun 2026 14:23:27 +0000 (UTC)
Date: Sat, 6 Jun 2026 16:23:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, rdunlap@infradead.org,
	masahiroy@kernel.org, grahamr@qti.qualcomm.com, nico@fluxnic.net,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kconfig: warn on dead default
Message-ID: <20260606142326.GA117482@ravnborg.org>
References: <20260606140008.271929-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606140008.271929-1-julianbraha@gmail.com>

Hi Julian.

On Sat, Jun 06, 2026 at 03:00:08PM +0100, Julian Braha wrote:
> The dead default check was originally introduced with kconfirm:
> https://lore.kernel.org/all/6ec4df6d-1445-48ca-8f54-1d1a83c4716d@gmail.com/
> 
> While I'm still working on that tool, it's not yet ready for inclusion
> into the tree. I am currently waiting for common distro packagers to
> package the parsing library before submitting the next RFC iteration.
> 
> However, the dead default check is more impactful than the other checks:
> all 4 dead defaults that were detected should not have been dead and could
> cause misconfiguration bugs. But fortunately, these were just for kunit
> tests. The 3 patches to fix them have all since been merged:
> commit aef656a0e6c0 ("powerpc: fix dead default for GUEST_STATE_BUFFER_TEST")
> commit 30cc5e2ad826 ("s390/Kconfig: Cleanup defaults for selftests")
> commit df75430515c3 ("drm: fix dead default for DRM_TTM_KUNIT_TEST")
> 
> We can actually check for dead defaults while evaluating Kconfig, which
> should be even more effective at preventing future instances than keeping
> it in a static checker.
> 
> Note that this patch will only trigger a warning when the default values
> are different, in other words, pure duplicate defaults won't cause a
> warning, as they are simply redundant.

A drive-by comment below.

> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  scripts/kconfig/menu.c                        | 22 +++++++++-
>  .../kconfig/tests/warn_dead_default/Kconfig   | 40 +++++++++++++++++++
>  .../tests/warn_dead_default/__init__.py       |  8 ++++
>  .../tests/warn_dead_default/expected_stderr   |  4 ++
>  4 files changed, 73 insertions(+), 1 deletion(-)
>  create mode 100644 scripts/kconfig/tests/warn_dead_default/Kconfig
>  create mode 100644 scripts/kconfig/tests/warn_dead_default/__init__.py
>  create mode 100644 scripts/kconfig/tests/warn_dead_default/expected_stderr
> 
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index b2d8d4e11e07..8c280292f9cd 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -242,13 +242,33 @@ static int menu_validate_number(struct symbol *sym, struct symbol *sym2)
>  
>  static void sym_check_prop(struct symbol *sym)
>  {
> -	struct property *prop;
> +	struct property *prev, *prop;
>  	struct symbol *sym2;
>  	char *use;
>  
>  	for (prop = sym->prop; prop; prop = prop->next) {
This part iterates through all properties of sym.
>  		switch (prop->type) {
>  		case P_DEFAULT:
> +			for_all_defaults(sym, prev) {
And this part iterates through all properties of sym and will match only
P_DEFAULT.

I looks redundant with the two loops were we for the latter knows it is
a P_DEFAULT.

> +				if (prev == prop)
> +					break;
> +				if (expr_is_yes(prev->visible.expr)) {
> +					if (!expr_eq(prev->expr, prop->expr))
> +						prop_warn(prop,
> +							"default for '%s' is unreachable: earlier default at %s:%d is unconditional",
> +							sym->name ? sym->name : "<choice>",
> +							prev->filename, prev->lineno);
> +					break;
> +				}
> +				if (expr_eq(prev->visible.expr, prop->visible.expr)) {
> +					if (!expr_eq(prev->expr, prop->expr))
> +						prop_warn(prop,
> +							"default for '%s' has the same condition as the earlier default at %s:%d",
> +							sym->name ? sym->name : "<choice>",
> +							prev->filename, prev->lineno);
> +					break;
> +				}
> +			}
>  			if ((sym->type == S_STRING || sym->type == S_INT || sym->type == S_HEX) &&
>  			    prop->expr->type != E_SYMBOL)
>  				prop_warn(prop,

	Sam
