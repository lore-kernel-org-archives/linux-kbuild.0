Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23CB3B95F8;
	Tue, 21 Jul 2026 14:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644276; cv=none; b=qCPSH8f0fwk+HOHtMmFdhHjQaDtVjrfVq9yTaIHUQAEWmul53DFl2O9JDn8VUaDPkFtPkIyU2u4TF7FJREwEE0v0ufo1ow8XW1cQ1fM/3A7vH0Ja34UFnNtjV8Df0bgZsfnGAMo2i7C0+OLBmosFc9eHGaVGcCeGlnaczu2+Cpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644276; c=relaxed/simple;
	bh=GgNWJM+QX1gkG6F9U89ENw4S7T+Ez5qjq7eTyxjfyDs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=fPAuZ60VryFdNZnI8wDoCEbInQsJUiAHdk7xUAvfzTSwEzWkHI9rRA3PA/MX1JexFrSWe66mv1V3nI2BHEkRrKUUhuEwuaDg96bT9qama/cd/hMqNmSm5YNtmLNM0LVT2L+s7yqavLPG4trd8BqN4bJQlzG5HMVlG9rm4CQXElw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cf8b7Zr4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cf8b7Zr4"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E1B4A1F000E9;
	Tue, 21 Jul 2026 14:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784644274;
	bh=q5/4mDLHZy6Ng9WdKv6x2iGXryRuPVjKWHwAzomXcPE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Cf8b7Zr4mC941VQch4gY0N81BuB/0s1qvlizvoE+SLI0gNV8xdkhNHRyB1ghAW0d0
	 w1IB6upAJ0ElilPOXqqZBkO3iaVZyh6PmaRxgLFnfWtbrd9z/m4A6z8r8BkaX0pDXt
	 izX9sCyUlxQfSbAMW66SlgRG65MzIqPbkmXFMUIOCEgHUbp5E/FxrKjGZI1MjONEN+
	 LSs3+NaqCsnHz8eg/1Ufx3LXtNAeWcuIQle4l43r/6ChQeLaLsMpuokrc5epx22Cwq
	 h7wwEN6C3+h3jwH+gbWOHNrj1opwj6HMVtg378UyBjXrJk1KXhbsyssDOmYtbkKQJu
	 MWSh4K0B/+Wkw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] scripts: headers_install.sh: Normalize __ASSEMBLY__ to
 __ASSEMBLER__
From: Nicolas Schier <nsc@kernel.org>
To: Thomas Huth <thuth@redhat.com>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Nick Huang <sef1548@gmail.com>, linux-kbuild@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
In-Reply-To: <20260720101025.355623-1-thuth@redhat.com>
References: <20260720101025.355623-1-thuth@redhat.com>
Date: Tue, 21 Jul 2026 13:14:55 +0200
Message-Id: <178463249517.1439086.5460375188993284761.b4-review@b4>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=2077; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=GgNWJM+QX1gkG6F9U89ENw4S7T+Ez5qjq7eTyxjfyDs=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqX1S0yRL22ja/jq+oNNmhC95e+lwZNnMy0GhiP
 JNJkUuLVf6JAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCal9UtAAKCRAHUgpwFiYS
 abM5EACxuTUSFS+DB62zJcQ68wVHTLikcs6DFIddlEOL9upSTuuxDYG+Nms87G6ETxHyAXa1AWE
 jHcR2Hr+motlA87SoWAd3YqPeW0m5LvdC1PsvArKj/u2DvM4p0LYi38A55rrkXVTxBua6ThoqMG
 AG4zYHRb3R0AMjILW9RjSS40xj6JE22eC9DF/YVEmqgkqPzsH1cSIfKXLLN36Jmg9BdeG4u45I9
 eSG+mdmVU81Kf48T1iT9dIqxw7eI9CVpzCQ8lVYyHq2F0c3hpcrsBAJeExNL3ER7oU2mW3PaGvh
 0LZeJfcaaEyCw3uKPYqk/rb9PomqA4/RTfZx/F4DNFQxNr5hSXuNYb5sGZcp/TkM6iT6EyX6gOO
 uagF8TB3cVtx6MIYwRRnK9W1q8I5lrp+qivkbDGk7CB3ril1NFinlN2J71toYyBtWs6TCiYqPff
 YxSE//41c1rwlCU0gFSwXLfPjQtg13164FHHF/vENHM9Ixxn4X/2+HGaoiZwwMwPtGpwvcoGMBM
 iqTAot8TSgmm4/ayQhWV+T1LfINZ99eMOi9Q/7CINf/XSyzmnCqZMtxEfGZhv58X7d3t5ciFoGD
 5TDf4LUbX6K2VkF/myLVTkwadinxpCWQ1M7jGRTLpJKXehPuGUGaJ4ptYRujkena3xcXppWEraq
 CNMg9TL/Ok51Dbg==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

> A previous patch to headers_install.sh normalized the usage of
> __ASSEMBLER__ to __ASSEMBLY__ in the UAPI headers due to the
> assumption that older versions of GCC might not define __ASSEMBLER__
> automatically and thus using __ASSEMBLER__ in the UAPI headers might
> break compilation with very old versions of GCC. However, as we now
> reassured, even GCC 2.95 still defines __ASSEMBLER__ automatically
> (and even older versions are hopefully not in use with the current
> Linux UAPI headers anymore).
> __ASSEMBLER__ is also set automatically by other C compilers like PCC
> (see https://github.com/IanHarvey/pcc/blob/cvs2git/2018.09.20/cc/cc/cc.1#L405)
> and Tiny-C (see https://repo.or.cz/tinycc.git/commitdiff/a25325e9be13e52a),
> so using __ASSEMBLER__ in UAPI header files should really be fine.
> 
> Thus let's head forwards and standardize on __ASSEMBLER__ instead
> of __ASSEMBLY__ in the UAPI header files now.
> 
> Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
> Link: https://lore.kernel.org/all/2030a963-33bc-43fe-9a2b-9c626d7d8360@redhat.com/
> Signed-off-by: Thomas Huth <thuth@redhat.com>
>
> diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
> index 83e447596878..2f1d1767ca26 100755
> --- a/scripts/headers_install.sh
> +++ b/scripts/headers_install.sh
> @@ -36,7 +36,7 @@ sed -E -e '
>  	s/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g
>  	s/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\3/g
>  	s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
> -	s/__ASSEMBLER__/__ASSEMBLY__/g
> +	s/__ASSEMBLY__/__ASSEMBLER__/g
>  ' $INFILE > $TMPFILE || exit 1
>  
>  scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TMPFILE > $OUTFILE

Thanks!

Reviewed-by: Nicolas Schier <n.schier@fritz.com>
Tested-by: Nicolas Schier <n.schier@fritz.com>


Even though squashing both commits sounds good to me on the first hand,
I don't want to do that right now, to simplify a possible revert in case
of reported regressions.

-- 
Nicolas

