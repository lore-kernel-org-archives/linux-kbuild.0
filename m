Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBA94D09FF;
	Thu, 17 Sep 2026 10:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642479; cv=none; b=a+zY8L9k/tCoCCQmvRCE6sUlGZVf4dVoUDlTM+kWrxNCnmupboysbRgRrdUd3JTvrWtJP1mbLuj+UK40b4rMkDzxtrchetr3sl3Jjtg+/RQyzdkGSFLd73/uzl+Unn19lBoff5WPYOrJ/0qXr1xqFC5lbDVeErKle4zJ5CYswEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642479; c=relaxed/simple;
	bh=rG1ZzCQXpx4b8hj/Kqe4tHrseuayAXL0p9ByZXOgmFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcWPqMBzkuP0mtkQXqFqqA9439end+3t8gk5dtnSWu7ngzTIheezVsH8z6p0Wq2Z+UJZqezZvbafdyNIW7tkf+TCj9l6WrIxWF+SwYO1HMjwAHhHVL63J/1h3w1HaT65JwFUOFV2yoiKRYsIDmc1kk2wlUnRXVe36fuYlcVQNlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=Mnn8+OoB; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="Mnn8+OoB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1789642448; bh=rG1ZzCQXpx4b8hj/Kqe4tHrseuayAXL0p9ByZXOgmFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mnn8+OoB2dxJ6zQ+ECtRl7Lszj1/yg7RPlu3RdeooNAMdJDRvjaOwjCaeIe47tWsW
	 kdo3+q61plhMx7FLd5OYc9WXFiNw8el86v489dlICP8Uf37wgRqSIDEljxfNyamBJe
	 jU111wCg+gjx4pnrhokctcNLtjSoLvt7JvG0x2auugf3/xJ9ssMvnwqFujCTaqlAys
	 R9iN2rV12ZwvVOHF0fwRiy6gA2+qXg5gaT8klwH1Ar6mDytGQ+NTrDdSnHZ7M/13KL
	 1iittE4/OcqM6qO6u1pgEYhQk0/uUAuhGEAs5dHL4jhfan04f3VoeNe23VjH71ZWWo
	 goLPQ88CRil3g==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6aabc6d0-0449-7f0000032729-7f000001ea08-1
	for <multiple-recipients>; Thu, 17 Sep 2026 12:54:08 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 17 Sep 2026 12:54:08 +0200 (CEST)
Date: Thu, 17 Sep 2026 12:54:07 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nico@fluxnic.net, rdunlap@infradead.org,
	grahamr@qti.qualcomm.com, kees@kernel.org, pengpeng@iscas.ac.cn,
	vegard.nossum@oracle.com, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 1/5] kconfig: promote invalid numeric reference from
 warning to error
Message-ID: <20260917-proficient-swift-of-masquerade-0ff7ce@l-nschier-aarch64>
References: <20260915211508.291790-1-julianbraha@gmail.com>
 <20260915211508.291790-2-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915211508.291790-2-julianbraha@gmail.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1789642448-407E6965-D671F190/0/0
X-purgate-type: clean
X-purgate-size: 3052
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-01  mail-id: 0D27BA07DC  external: no

On Tue, Sep 15, 2026 at 10:15:04PM +0100, Julian Braha wrote:
> The Kconfig interpreter already warns if a numeric option attempts to use
> a non-numeric option (bool, tristate, or string) to set its value (for
> example, with a 'default' or 'range').
> 
> Since there is nowhere in the tree that attempts this, we can safely
> promote this check from warning to error.
> 
> Assisted-by: LLM
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  scripts/kconfig/lkc.h                         |  2 +-
>  scripts/kconfig/menu.c                        | 39 ++++++----
>  scripts/kconfig/parser.y                      |  2 +-
>  .../tests/err_num_non_numeric_ref/Kconfig     | 75 +++++++++++++++++++
>  .../tests/err_num_non_numeric_ref/__init__.py |  9 +++
>  .../err_num_non_numeric_ref/expected_stderr   | 14 ++++
>  6 files changed, 126 insertions(+), 15 deletions(-)
>  create mode 100644 scripts/kconfig/tests/err_num_non_numeric_ref/Kconfig
>  create mode 100644 scripts/kconfig/tests/err_num_non_numeric_ref/__init__.py
>  create mode 100644 scripts/kconfig/tests/err_num_non_numeric_ref/expected_stderr
> 
> diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
> index 7e6f6ca299cf..bbc99f75b416 100644
> --- a/scripts/kconfig/lkc.h
> +++ b/scripts/kconfig/lkc.h
> @@ -89,7 +89,7 @@ struct property *menu_add_prompt(enum prop_type type, const char *prompt,
>  				 struct expr *dep);
>  void menu_add_expr(enum prop_type type, struct expr *expr, struct expr *dep);
>  void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep);
> -void menu_finalize(void);
> +int menu_finalize(void);
>  void menu_set_type(int type);
>  
>  extern struct menu rootmenu;
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 9c079e92a9ed..99a57ce0fdc9 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -240,11 +240,12 @@ static int menu_validate_number(struct symbol *sym, struct symbol *sym2)
>  	       (sym2->type == S_UNKNOWN && sym_string_valid(sym, sym2->name));
>  }
>  
> -static void sym_check_prop(struct symbol *sym)
> +static int sym_check_prop(struct symbol *sym)
>  {
>  	struct property *prop;
>  	struct symbol *sym2;
>  	char *use;
> +	int errors = 0;
>  
>  	for (prop = sym->prop; prop; prop = prop->next) {
>  		switch (prop->type) {
> @@ -258,10 +259,13 @@ static void sym_check_prop(struct symbol *sym)
>  				break;
>  			sym2 = prop_get_symbol(prop);
>  			if (sym->type == S_HEX || sym->type == S_INT) {
> -				if (!menu_validate_number(sym, sym2))
> -					prop_warn(prop,
> -					    "'%s': number is invalid",
> -					    sym->name);
> +				if (!menu_validate_number(sym, sym2)) {
> +					fprintf(stderr,
> +						"%s:%d: error: '%s': number is invalid\n",
> +						prop->filename, prop->lineno,
> +						sym->name);

I think it would be reasonable to add a prop_err() function for that.  
But that's a possible follow-up.

Reviewed-by: Nicolas Schier <n.schier@fritz.com>

-- 
Nicolas
