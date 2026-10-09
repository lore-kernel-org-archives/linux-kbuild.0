Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0834F4740;
	Fri,  9 Oct 2026 18:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572094; cv=none; b=hKC9GThyPHSdvxCiyeulUOGuwhTlW+yPjM1iofx+irQo7zHOLXbJnnn8RygZPEtmWj+v25Dc+FXhQ1oCvWpQf+2bGcQfrEj6CbncBcIcrulWd3ckdM2byqoEBf+6yhfUCcaBTT/a33jj+5IcoLNkKtM4otWZuE6qVNbajOknISA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572094; c=relaxed/simple;
	bh=fTGDyuEZ/Hw9OVLNB+hQZPy96KdvIJWdiqN5AFNDWdE=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ZypUMbIPX7GC+6ibqCfCAsdGkzqpzaBKFTxOoVx7pPHp2oX7565kQOuDDPLEdjhod1F9tj/KS/s9chiIJPXlGJzuAZ/ps6KGIEweXFVeQ/SlOCpPtppsKkKt07JEKxJ28o9SAMz0ZBWOiew50c4036g7JLzFhfDSPEjZqhaurBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2yPZp8n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2yPZp8n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A424A1F000FF;
	Fri,  9 Oct 2026 18:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791572093;
	bh=A6sX3mhnOFnH7/gD6VofQFLuUDEVPRZBAJD0us3JldU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=S2yPZp8nNLAjZzkoS43Q6W+nQwztBis4XNZD6n+OH3v0LxqnMDDyXKL9joHcnq/7r
	 /P6sU0uPubg2UdUiWEMOGSnfUq8QnaCVrfAQmksEyvOHJxeXemmqWoZoRqzuq6l7NV
	 55uzzCXJ38LtVfwBWTIkBOOZB1dfxOO3ESCI0GbrdqtSpIqehD1l429mTUwvWRyU4G
	 65aqNxBhe7Yfb+uvReNqZ8ULjs9IAg4L+5CxFEzvCVi6LqAo8Ne+qqTCOrfgBXJpF/
	 nuxyhZu9KwlAsUOjxmA6J16UlCN5RMIaGO69fU3A0gE65haPUx9O13upSGUbjOB4rc
	 Yd4TEf/ulEQNQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] kallsyms: copy constants from __KERNEL__ to user, drop
 the inclusion
From: Nicolas Schier <nsc@kernel.org>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Denis Benato <denis.benato@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, 
 nsc@kernel.org, thomas.weissschuh@linutronix.de, chewi@gentoo.org, 
 abelvesa@kernel.org, linux-kernel@vger.kernel.org, 
 Kees Cook <kees@kernel.org>
In-Reply-To: <20261008-fix-kallsyms-v1-1-3339fdac2ab3@gmail.com>
References: <20261008-fix-kallsyms-v1-1-3339fdac2ab3@gmail.com>
Date: Fri, 09 Oct 2026 20:54:42 +0200
Message-Id: <179157208243.362135.3553274020133646760.b4-review@b4>
X-Mailer: b4 0.17-dev-fde28
X-Developer-Signature: v=1; a=openpgp-sha256; l=2324; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=fTGDyuEZ/Hw9OVLNB+hQZPy96KdvIJWdiqN5AFNDWdE=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqyTh0sv5nicVkWQ25PhmxHqaUMEtN2VD5Yt1ey
 8BmacoTFXKJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCask4dAAKCRAHUgpwFiYS
 aYeYD/9zNxvUYI3JBvADzB7j48bRDEu4RKktNDFgEoJAe+jlTR/KdS3XQeEkev9n3o6is4to9oP
 pLPdH1SsP1w2rG7WxAc0lRjdrx3kjUAv61aW9IH/Mlg2lI8CP3kZfNklDy/Gcgzs2C/bgd3nXZG
 Xtn2lX9vWrQnG7A9tgkHiJsnLhyb6M/SuvHAejR+hfs0u6mam/gWsQ4jOrH/dt2DSESsFQ3JDAO
 h6QUkJn9Ll9GTbOGBTU+98fShiwWG42x7FXeWPuidvssSsnoQc1sAsOOF3VjSWflioDPmujMy8Q
 GdjiIasCjl5gRdmfwOBhUUMrVuIf1EcvtZHTQI8GvMgdyiWPO0LyPHo0mrp3Os5JYURa3cNgIIa
 YUmyvBCWdj5Md5iddXNFYso6mGPz4nd383R341cwsgfeYzStD7Kb72k6UWvRkt61LRtDlGEXzm4
 R9aNZiPAbZKpKSxFhqWzAhWoag2u9p1g7NASz7kBlawKGrInLlxRnweRAKVm7Oer8AAmFpX5+uJ
 cfuHnYs6EvWixxAUpWk1RN94QGW7dfcfUzKGn/8eMimEwfhuqS2boLXC11fcAKs7513Y+eZwSrV
 8+hWUVGdFtPDK5EC0IXvONl+GOwkVSP5CrE/LvhBO7xK2KDaLm9V2spGK/EM4HW+19LenkiPm9D
 a0gHSyoeeRaGcqw==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

> commit 4fafd1165b33 replaced hardcoded values which determine marker
> array size, with new values that accelerate symbol-name lookups.
> These symbols are needed in user-space to generate the lookup tables,
> and in kernel to read the generated table.
> 
> To avoid 2-defns problem, they were added to a kernel header (with
> ifdef guards) and included by scripts/kallsyms.c.  But that creates
> packaging problems elsewhere, so just add the 2nd defns, with an
> explicit comment about the user-kernel coupling.
> 
> Fixes: 4fafd1165b33 ("kallsyms: increase marker density to 16:1 to accelerate lookups")
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---

FTR: Please keep trailers in a single trailer block, otherwise that will
probably break some common tooling (cp. e.g. git-interpret-trailers).

Is the commit ID correct?  In mm-nonmm-unstable I find
e2c2904abf71d0144f37844fde7dffe8b814a44f instead.

>  kernel/kallsyms_internal.h | 12 +++++-------
>  scripts/kallsyms.c         |  9 ++++++++-
>  2 files changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/kernel/kallsyms_internal.h b/kernel/kallsyms_internal.h
> index 6a781e4cc77f..8311cce21128 100644
> --- a/kernel/kallsyms_internal.h
> +++ b/kernel/kallsyms_internal.h
> @@ -2,18 +2,17 @@
>  #ifndef LINUX_KALLSYMS_INTERNAL_H_
>  #define LINUX_KALLSYMS_INTERNAL_H_
>  
> +#include <linux/types.h>
> +
>  /*
> - * Provide compile-constants for scripts/kallsyms.c
> - * so it can build the corresponding kallsyms_marker[] table.
> - * and wrap the rest in __KERNEL__
> + * These constants determine the size of the kallsyms_markers array
> + * written by scripts/kallsyms.c during the build.  The symbol values
> + * must be kept in sync.
>   */
>  #define KALLSYMS_MARKER_SHIFT 4
>  #define KALLSYMS_MARKER_SIZE  (1U << KALLSYMS_MARKER_SHIFT)
>  #define KALLSYMS_MARKER_MASK  (KALLSYMS_MARKER_SIZE - 1U)

Keeping these values in sync between kernel and kallsyms/user-space
might be simple by shifting these to some Kconfig symbols.  But that
could be done in a follow-up commit as well.

Nevertheless: fixes the report and prevent usage of in-tree header in
user-space tool; thanks!

Tested-by: Nicolas Schier <nsc@kernel.org>
Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

