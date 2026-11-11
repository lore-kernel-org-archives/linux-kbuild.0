Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355275;
	b=j5IAdM6cBs09Obe0y1ZOOc5Uwkw9sHdxu0oBiLUunHxMmhaxhwMOMYuU/nr3JELJgKr/
	 HHLBlhoQYbPeWVQa9050c97qAksPObIXouNMmrIDovBc2KU+F7ez7lYoVEpw1E4jS7uvD
	 +Ox6PY/q9YZfunfthr/s+betWiH/sCt7UPknW/VOv1ig5Jm7M4tj1E++BmEagZyc5tTm0
	 XSRjiM3HRZYAONqLwDDbtY4KBTKlupTMPY1oJUj+SSxE+dBdqBKnjt4ygBmdKEBWrIj4s
	 xWtPe0Vli1zDadCYkr4CeZWaI8NdJi8QK9Pb/TfLkp0vNhbx7GdadxE5zq2B0xlXjLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355275;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4EQhYPyXvgCmzyOp93TmW0Sui1/AxR4wHC7lOiswods=;
	b=GW9FmbHOGYyiHp+YkCeHV0osLfLy0RdTgatw7gP7ZbdcsvnVtciFtKj+ENeXkU8mjfmp
	 LtOUxYlyXKs6neZvl14yxYJjeKmIT4WJGU0eZAT2qhAIGz/+vJStKslCbroBre2kRyuL/
	 /0H+tCQTvCzzywQFbPd1nDIyQB7tZmaozaVGD+f+SKCkftwKyG8g+EXL1f89dhqpYKLgF
	 X0qGmqgk2cGuxlufygfJKaXCZ37dfyCjrKYlucT1GvLsgAsFBnE2JUEhWH42OIydM8yfm
	 +drQnBwhMnUD4fvxZv+0BZ0MRe+nofAB4GDz5zQnvjjUZ16Bzt0uVgzTTQTZcwBSYCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JUvENXyL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53400606A31C
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2026 00:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JUvENXyL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E3F1F0089F;
	Wed, 11 Nov 2026 00:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794355275;
	bh=4EQhYPyXvgCmzyOp93TmW0Sui1/AxR4wHC7lOiswods=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JUvENXyLfOP6HrdvS24fQILhiulc3PzH5MoPEsq3xJTgBgel+x7L+MI/EVA1Bp0Cc
	 JRIF6VXrnFBNDRXLoM73O2S9t+oUb32K/y85qFdWVKzalS2FxRC9zEjC7OB66GKApc
	 Cqn4/N1SQ45cPbZF+V3JIvk44RUzLtjV3w4UA70zYkCDLuqnGSM2ZV9DCsIm1tXHRQ
	 VzyAlU5FD/jhX0nRU6p9JmrjpjgdrU6x9wPy766ccvc1/oSRGbvf1YtCt9VdimkF4C
	 T4loq82k3db2WP2H8jFK/pF6y8eHzF9AQgm75rnck6Bag+QvJP/bxoXp7Ke/e79Ehd
	 wSBXHHzSnH2og==
Message-ID: <sashiko-outbox-207990@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/6] genksyms: fix infinite loop on declarations with
 parameter lists
Reply-To: sashiko-reviews@lists.linux.dev
To: "Leizhen Zhang" <lzsx618@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: masahiroy@kernel.org, ardb@kernel.org, rostedt@goodmis.org, hpa@zytor.com, linux-kbuild@vger.kernel.org
In-Reply-To: <20261110000003.1719966-2-lzsx618@gmail.com>
References: <20261110000003.1719966-1-lzsx618@gmail.com>
 <20261110000003.1719966-2-lzsx618@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 00:01:14 +0000
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
- [Low] genksyms: unresolvable ambiguous 12-char SHA in Fixes trailer
--

commit e896d8ddfccae8b5749722baf42845ecf75f09be
Author: Leizhen Zhang <lzsx618@gmail.com>

> genksyms: fix infinite loop on declarations with parameter lists
>
> decl_specifier_seq updates the global decl_spec, which is used by the ','
> action of init_declarator_list to give each further declarator the
> specifiers of the declaration. However, decl_specifier_seq is also used
> for parameter declarations, so for a declaration such as
>
>   int a, f(int);
>
> decl_spec is clobbered by the specifiers of the parameter "int" by the
> time the ',' action runs. The action then links the parameter's own token
> node back into its chain, creating a cycle, and copy_list_range() loops
> forever while allocating memory:
>
>   $ printf 'int a, f(int);\n' | scripts/genksyms/genksyms
>   (hangs)
>
> Before commit 45c9c4101d3d ("genksyms: fix memory leak when the same
> symbol is added from source") the same corruption did not hang but
> silently recorded a wrong type for subsequent declarators (e.g. for
> "int f(long), a;" the type of "a" was recorded as "int f ( long a").
>
> Only set decl_spec in decl_specifier_seq_opt, which is used at the
> declaration level, and let decl_specifier_seq just return the last
> specifier. Struct and union member declarations use a new
> member_decl_specifier_seq_opt that does not touch decl_spec, so a
> struct body nested in a parameter list cannot clobber it either.
>
> The generated symtypes and CRCs for 149 preprocessed kernel source files
> (1128 exported symbols) are unchanged, and no new bison conflicts are
> introduced.
>
> Found by fuzzing genksyms with ASan/UBSan.
>
> The problem was found with ASan and UBSan, and the analysis and fix were
> prepared with the help of an AI coding assistant; I reviewed and
> tested the result.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>

[Severity: Low]
In the kernel repository, the 12-character prefix 1da177e4c3f4 is ambiguous
because it matches both 1da177e4c3f41 ("Linux-2.6.12-rc2") and
1da177e4c3f47 ("docs: git SHA prefixes are for humans"), so git cannot
resolve the Fixes tag.  Should this use at least 13 characters, or
reference 45c9c4101d3d ("genksyms: fix memory leak when the same symbol is
added from source") which introduced the copy_list_range() call that loops
forever?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110000003.1719=
966-1-lzsx618@gmail.com?part=3D1
