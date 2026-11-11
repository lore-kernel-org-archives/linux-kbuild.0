Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418541;
	b=HVlbKBlt2PxPsHGnyRyvUN7ZfYiABb8HIQK5inXZ3Oho3wBLXCI3jTzhrUhaU8e/IqVn
	 1dlIaqchm9/k4ZB9Lv77JDnhcDis8jtDa4Uvij62u0R9Vc1eaQmpqowUKQL+xHin3Jyp1
	 rbB7iih+dh5NLxkHykZrYql7cLnbgZGAH9oZpEH2WL0xFRUQGF4tA+1cpyIYSPcOvAfpZ
	 yGd1TinGm8D05SpmOv5fQM00Cwrib2vDskBmJYQLIMNoF3K4Rf3IGEFVRFhJBYQMXyVMQ
	 a2dewfmhYYYJldbBp6EzpzJ0AA9E8TiD8jWrDzibSBB9mFRXkzp1bpu2vq02IDNMvqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418541;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=R+e2lGCAv1NlsNOsp9GBA9nI6P/T/nJKUWp+rnHPQEo=;
	b=iKiKut9GmF3nv8La5DRdU5zh+fdtheaDKSC/69fbToPgiXyrTyzAIQ0VTJa6PfHyqcvo
	 ubAe51iUIDSL/A71gzT8LtYz0AyRex+76RTuIigoc1jlZgIPdma+kWirM8WRhG34n5j8U
	 JtPmcD27DjRwBX3DUckt7y09rwrl1iIDKw1aiSbIuwrHEfMYbtd5V0D8h1BFAxXOEsZAe
	 81nWQNqlTgq3TYiQV6gw5FX3p5C1WVDvzvqDxRvqUzrIjLQSe6MA6r8ntEcd8w4dw69gl
	 IqDoTln73WVbL3755TI2AvMkGFeAPMCVd5Xh6YfjWOTEyQ54uZgyxTfOdda40NlsnFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OfQYBrK4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5D7606A31C
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2026 17:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OfQYBrK4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604481F00A08;
	Wed, 11 Nov 2026 17:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794418541;
	bh=R+e2lGCAv1NlsNOsp9GBA9nI6P/T/nJKUWp+rnHPQEo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OfQYBrK4uvQnZAtdLXITEs8jadLP/KTh54DAslDxzgD5XLySQY8n3lzOhbFMxUqoz
	 HlaT1q8L8qsQU+yFS9KGZHVZqVJz6E6kafc4Qk7YF/f4gZ31ja5z6SnlTAWs/K67Qp
	 GpUktwybt/vZw+VhvBDTkvM9oOPNdvj9HH2AqjQ4kxFIu09gpoYhbnKoz337Epnynx
	 TE5PrBWdiDtC3A97738tqjb97uxz/ZYqC8l69LH66QtJNJmlJz/Ub65O79r1pVOk8w
	 qPBMRW0+dPF5rPBrDfHxFbzvoJ3+m/u06QAXcycDugKuHhvtcsQL8o8MWotHTnfpiL
	 Ks3CUlMNcVQEw==
Message-ID: <sashiko-outbox-209420@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] kconfig: wrap long expressions in menuconfig
Reply-To: sashiko-reviews@lists.linux.dev
To: "Julian Braha" <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: ojeda@kernel.org, a.hindborg@kernel.org, nico@fluxnic.net, rdunlap@infradead.org, grahamr@qti.qualcomm.com, jakub.git@horky.net, linux-kbuild@vger.kernel.org, gary@garyguo.net
In-Reply-To: <20261110173526.1548434-3-julianbraha@gmail.com>
References: <20261110173526.1548434-1-julianbraha@gmail.com>
 <20261110173526.1548434-3-julianbraha@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 17:35:39 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] kconfig: broken '(' and operator wrapping in
  expr_print_gstr_helper()
--

commit 89202a55a9cf081fc680fbfa051ebe8d0cfa7113
Author: Julian Braha <julianbraha@gmail.com>

kconfig: wrap long expressions in menuconfig

This commit wraps long Kconfig expressions across lines with matching
indentation in menuconfig search and help text, keeping '!' prefixes and
value annotations attached to their symbols.

> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
> index 2b91d16bf14fb..9284ccb20259c 100644
> --- a/scripts/kconfig/expr.c
> +++ b/scripts/kconfig/expr.c
> @@ -1155,30 +1155,40 @@ static void expr_print_gstr_helper(void *data, st=
ruct symbol *sym, const char *s
>  	if (sym)
>  		sym_str =3D sym_get_string_value(sym);
> =20
> -	if (gs->max_width) {
> +	if (gs->max_width && !strchr(str, '\n')) {
>  		unsigned extra_length =3D strlen(str);
>  		const char *last_cr =3D strrchr(gs->s, '\n');
>  		unsigned last_line_length;
> +		unsigned int prefix_len =3D strlen(gs->s) - gs->wrap_pos;
> =20
> -		if (sym_str)
> +		/* Ensure the value annotation stays attached to the symbol on wrap */
> +		if (sym_str && sym->type !=3D S_UNKNOWN)
>  			extra_length +=3D 4 + strlen(sym_str);
> =20
> -		if (!last_cr)
> -			last_cr =3D gs->s;
> +		last_line_length =3D strlen(last_cr ? last_cr + 1 : gs->s);
> =20
> -		last_line_length =3D strlen(gs->s) - (last_cr - gs->s);
> -
> -		if ((last_line_length + extra_length) > gs->max_width)
> -			str_append(gs, "\\\n");
> +		if (last_line_length > gs->indent + prefix_len &&
> +		    last_line_length + extra_length > gs->max_width) {
> +			gs->s[gs->wrap_pos] =3D '\0';
> +			str_printf(gs, "\n%*s", gs->indent, "");
> +			while (prefix_len--)
> +				str_append(gs, "!");
> +			if (!sym)
> +				str +=3D strspn(str, " ");
> +		}
>  	}
> =20
>  	str_append(gs, str);
>  	if (sym && sym->type !=3D S_UNKNOWN)
>  		str_printf(gs, " [=3D%s]", sym_str);
> +	/* Ensure '!' stays attached to the symbol on wrap */
> +	if (sym || strcmp(str, "!"))
> +		gs->wrap_pos =3D strlen(gs->s);
>  }

[Severity: Low]
Does expr_print_gstr_helper() mishandle wrapping around "(" and wrapped
operators?

When expr_print() formats a negated parenthesized expression such as
"!(A || B)", it emits "!" and then "(" before the first symbol.  Because
strcmp("(", "!") is non-zero, printing "(" updates gs->wrap_pos to point
after "!(" and resets prefix_len to 0.  If the first symbol plus its
"[=3D...]" annotation then exceeds gs->max_width, it wraps after "(",
leaving "!(" (or "(") dangling at the end of the previous line.

In addition, the guard "last_line_length > gs->indent + prefix_len"
assumes only indentation and "!" can precede the first symbol on a line.
After " && " or " || " wraps onto a new line (or after "(" or "[" is
printed at the start of a line), gs->wrap_pos is updated past that token,
making last_line_length greater than gs->indent + prefix_len before any
symbol is printed on the line.  If the following symbol and its value
annotation exceed gs->max_width, expr_print_gstr_helper() wraps a second
time and leaves "&& ", "|| ", "(" or "[" stranded on a line by itself.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110173526.1548=
434-1-julianbraha@gmail.com?part=3D2
