Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DD123E35F;
	Fri, 31 Jul 2026 01:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785459611; cv=none; b=at/OvCZUkwJELUuQTdSFCRsvDFq7mN90xM4mifKeepqBKDfwdhGGXKi33Yki+Z9KLAuPTWpB3/McHptgipM9tfLqA9cHW3SUovrn7hSsXg/HN99BCvabHOeN0n8ie9eFFzsEw2CIVo30MH6NXQpn++QUUNUWmakEyudga1OXyx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785459611; c=relaxed/simple;
	bh=2z0GRfTKeZwLgYvKvsdrfdVjwQFTcBUVD0ATs/nkh6g=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=APKYBbKLBUsadRQuL3UZdJQfy3XP0ScdACFG+TfHQieWdNpW50NtPKyfsKfVOhhQG2msHNwkrSqETTZGBmtdA+RGQNYy/SXniUeTIUD5hS2dTZSl7+qQX5nkPV6HrvJWFMQxti76Lbn7UdcTrFVdTSptzQx8bzcOtvJAI1FUZC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pu+esVdR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pu+esVdR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637A11F000E9;
	Fri, 31 Jul 2026 01:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785459609;
	bh=SMiUO+LO+UmXH2tAJwCdb5LT/UkZqB36a8S71AyaG0Q=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Pu+esVdRDXV+PPI8dBzEgT7AIw2uFvx691DKiSHw5AIKo9Ti5f9K9N1g0v5JpWfXe
	 3zPz4gp8htQyE8jfWdl2bG/cPioLt3b7GxKQJNcPFL1w1nXYfGgebNLIDgOvT4i0+9
	 VnO3AQGmCpNAGTQ1fGzsyKV+8ezJpYM1IxY9O7slEdBaATdmZJxgS5Rg455Ft1EuDB
	 mU9//pOw1xvgTpqkEVi6shduXFhgU4VeMQNhGn+GofWuLBfLuPpFoY2UkDBF7H5T2z
	 xkvNNwVHCjJ3TavOs2WrT1Mq0mDi9E5EVpTU4QZD/cMuAsa5k6g4zPE9VC292IGuFL
	 0WTqkyc78Dt5g==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] kconfig: fix submenu rendering of negative
 dependencies
From: Nathan Chancellor <nathan@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, kees@kernel.org, xry111@xry111.site, 
 hyc.lee@gmail.com, jeffbai@aosc.io, vegard.nossum@oracle.com, 
 rdunlap@infradead.org, grahamr@qti.qualcomm.com, nico@fluxnic.net, 
 masahiroy@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260721193028.313342-1-julianbraha@gmail.com>
References: <20260721193028.313342-1-julianbraha@gmail.com>
Date: Thu, 30 Jul 2026 18:00:02 -0700
Message-Id: <178545960208.3004192.10262827405138720875.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1719; i=nathan@kernel.org;
 h=from:subject:message-id; bh=2z0GRfTKeZwLgYvKvsdrfdVjwQFTcBUVD0ATs/nkh6g=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnZn6dzmNRNkV913DawVbxS7OrBFQxf/rtuiVQXrz12p
 fWn/5zyjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRYFGGfzqH1/0TTl5zZdac
 XVm7vfli56+bN1Nx8nOH6SabzfR1HkUyMuxTS5FimVGzM7Aua77jOYmwW6z3pmy5JC8u8/vAzY6
 4iawA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> This fixes the "ironic visualization" issue reported here:
> https://lore.kernel.org/linux-kbuild/cbe95c15d2760f6fce8eaf207c969ce8fd3703aa.camel@xry111.site/
> 
> where a config option FOO is nested in the submenu of the previous option
> BAR, despite FOO actually depending on !BAR.

I would prefer to have a short standalone blurb about the issue reported
at that link so that the commit message is self-contained. Move the link
to the trailers with the Closes: tag.

> I've only tested locally on x86, but as far as I can tell, this only
> changes how 2 options are rendered in the menu:
> 1. NTFS3_FS, no longer in the NTFS_FS submenu, and
> 2. MTD_BLOCK_RO, no longer in the MTD_BLOCK submenu.

These both seem like correct changes from what I can tell.

> Assisted-by: Claude:claude-4.8-opus
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Tested-by: Nathan Chancellor <nathan@kernel.org>

> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
> index 16f92c4a775a..2b91d16bf14f 100644
> --- a/scripts/kconfig/expr.c
> +++ b/scripts/kconfig/expr.c
> @@ -738,6 +738,39 @@ bool expr_contains_symbol(struct expr *dep, struct symbol *sym)
>  	return false;
>  }
>  
> +/*
> + * Check if the expression references 'sym' in a way that is satisfiable
> + * with 'sym' disabled, e.g.'sym!=y'.
> + *
> + * Expects that expr_transform() was already called on 'expr'.
> + */
> +bool expr_contains_symbol_negated(struct expr *dep, struct symbol *sym)

I get that this mostly mirrors expr_contains_symbol() but I am not sure
I love the name since the symbol might not actually be negated. That
said, I don't really have a better suggestion :/

-- 
Cheers,
Nathan

