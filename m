Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301543B992C
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Oct 2026 21:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792184529; cv=none; b=a9wHcaKq2c2za9mo2ZJAapzrX4igafNrq5EiSUvxRbDrdAkY7DoAaQjA9n0gYr0eHyqfOJ6c7qlgcuTLUjT1fR04jhgdukuEqNCpu0MZ1da9rJxIgpnpPjy3SBmPr/WLJ0jHXgU2ugUVy3R7ztBopN5W5dGLf6dfd1Hd4Sk1IBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792184529; c=relaxed/simple;
	bh=CFv1fOvs73bJAa5jvExEQgbyce4qAcvdUEtcjy0TJGU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=HxXDoeOKvg7IWwgwqvu8g3ut+QZIP/48cPqpDEEfpZOaCYrSNUTe+STNWLzJr4MJmdGXPf79Mbm3PlEpynPgjYvLyKMKv1tXoYCkKy4pcZuR8CfpjgruSp6rK7KnscWhjWYVLQKd6w1heOPcbSk8MKBu0K4fbqMwe1k6jH4g1ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lohISLeK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lohISLeK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6821F000C4;
	Fri, 16 Oct 2026 21:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792184527;
	bh=WFK7QM5TqP4mZ2Xhrf50mgSxbTKVOiDYXORxf1wahtE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lohISLeKFAEcA6YHlFvwce/gop7rcQCBMSaWurhSr1tj42zTtWQF2mj3J9XiYMSr0
	 RDTNwc84Fiin5h7OIoCRmA1FNBF8p9jjDcUB2s7U4t6i12aXxok43OWDGTWVH5bg8J
	 YsKamAIK1xfgZi/yDxZWxZW1DEskf7R8pzQUeEOSwHvR/eOtEAinWtgTLJy52duEVr
	 cu7mEEUPfQhZwgUotk6BPAFGCDRDSLgBOfKSr/Sm21q0mda8roWc9iBDZxTBRRRht3
	 aQjUmmMhPHDH/9IRhTQ35Ow4yLT6TgPQIfaDpXF8h0/D47tIOtoh7zgcgwzVNiuU/E
	 7YgVdbNbIrOlw==
Message-ID: <sashiko-outbox-174936@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] kbuild: Makefile.lib: fix offsets generation with
 debug info
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Kandybka" <d.kandybka@gmail.com>, "Nathan Chancellor" <nathan@kernel.org>
Cc: "Nicolas Schier" <nsc@kernel.org>, linux-kbuild@vger.kernel.org
In-Reply-To: <20261015210149.78470-1-d.kandybka@gmail.com>
References: <20260928105330.25427-1-d.kandybka@gmail.com>
 <20261015210149.78470-1-d.kandybka@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 21:02:07 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] kbuild: unanchored sed substitutions in sed-offsets can break build
--

commit 48672ceb9d59753178f125f7c16956dd57252dcd
Author: Dmitry Kandybka <d.kandybka@gmail.com>

kbuild: Makefile.lib: fix offsets generation with debug info

This commit fixes offset generation when debug information is enabled by
making the sed pattern matching stricter and adding a BLANK() macro for
readability. It prevents debug metadata from leaking into generated header
files and breaking the build.

> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 19e96b30a122f..173bc3aa4247f 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -493,9 +493,9 @@ quiet_cmd_zstd22_with_size =3D ZSTD22  $@
>  # the .ascii directive whereas GCC keeps the <space> as-is.
>  define sed-offsets
>  	's:^[[:space:]]*\.ascii[[:space:]]*"\(.*\)".*:\1:; \
> -	/^->/{s:->#\(.*\):/* \1 */:; \
> -	s:^->\([^ ]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:; \
> -	s:->::; p;}'
> +	/^->/{s:->#\(.*\):/* \1 */:p; \
> +	s:^->\([[:alnum:]_]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:p=
; \
> +	s:->BLANK()::p;}'

[Severity: Low]
Could this unanchored sed substitution break the build under certain
conditions?

If the kernel is built with debug info (e.g., -ggdb3), the compiler may emit
.ascii directives containing debug strings from source code. If a string
literal from an included header starts with -> and contains -># or ->BLANK()
mid-string (for example, ->foo ->BLANK()), the unanchored sed substitution
will match mid-string.

Because of the :p flag, wouldn't it print the partially modified pattern sp=
ace
(e.g., ->foo ), resulting in invalid C code being written to
include/generated/asm-offsets.h?

Should the pattern be anchored (e.g., s:^->BLANK()$::p;) to ensure it only
matches the intended kbuild macros?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015210149.7847=
0-1-d.kandybka@gmail.com?part=3D1
