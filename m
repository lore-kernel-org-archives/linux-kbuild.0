Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792454622;
	b=ZgSZ13AkK5CzPU/0VqWh2BOrItpL3Bm3GcfJFp6PrWQfN1rOUyafkCdA18BqmG+p3EkJ
	 6GEzsIg3bCswD3S0e8mbJ9yb8mVub6XsIBMzv58i1jTxvPdP4JbH1ATF7jYafwyc4TkFB
	 SIix6j6j0LhiL1K4+oP0XLQf9/tJnrNyqHVQhmYEVoe6it7iIMCQSJ/x3Ktf9+d2XTV37
	 WbM+BbFZrtxV5ffuFuoWt95fig9aqlx4H1GmRPCj4zMb29BH41eNAel4Ayp+h0hTJWmlh
	 TJPLExT2qB6LTkX+Jglw1xtJX6trwubmJ5CCzByzGC2M3c3as7MJ3Y4dqZ18Yqy2d7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792454622;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6SsLYQjWIw+vK3TPQCCa6PglOGKXjO57kKJeDmoRvIM=;
	b=vLoIbCCdZVMrsOUBoeXnQun5U2rnlTAsLHxBXsASlUKHyoJGFsogWLcDGw4nwW5IaL3K
	 lzQRXdOYYw3olABSGJs/9bUtUtePYhEhTuCfEr0en2p2HaEG3CxOlzEbRp5zdBmrmw8MO
	 jRPcYSqLa7g+Ba0y7aeUfHFvzsw9X6ufWxs5qyAKQLrrPxMNJXstIt9zUe6tmGE8St5xK
	 Xyh1/+fv6yFY7918VTw9wyQGISRJfxijtd/ABsK9rsAOo6n3OxnUtRVKndQ5ILX+qKcv5
	 RBAm9mT6hYdCrwzLRPTXtso6V/ONZIz8HM6wvBFJS5y5UCLW/j20NT8DRkAdlvfpYkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z1bARU2B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191B4606A31A
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 00:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z1bARU2B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FCB1F000C4;
	Tue, 20 Oct 2026 00:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792454622;
	bh=6SsLYQjWIw+vK3TPQCCa6PglOGKXjO57kKJeDmoRvIM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z1bARU2BBOFaC71DayKj9ETWilvFrZXAPuVak9bUMiw12dFi0+oQ+rrgkIFTucGd9
	 1nVNHdACToeFBLSdK+2BwaE9UcyLvcVdlANDLLgJGGCJY+apCT6saAfkMT9shDfd4I
	 aCmnPsRZeWpqUmRzf7ViF5/3Ki1m96jDFH7KFMW8G26T6PBARQS/yuoWH1pn/E72fh
	 WwN2Rdn1CdnEK80tqVA3NWqJeyIdzF5zkLHW56l992L9JchYz7yTfoS3muWGR6hZtR
	 hqeXJyD46bw0cJ71KfcI/BrO+nlGr8JP0bmcmwZZYiraM+cqjQ19c9HSEmNjLRo99t
	 a5BqipZp30kVw==
Message-ID: <sashiko-outbox-178368@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] elf-parse: check that the section header table is
 inside the file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Leizhen Zhang" <lzsx618@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org, rostedt@goodmis.org, ljs@kernel.org
In-Reply-To: <20261019000218.3977398-3-lzsx618@gmail.com>
References: <20261019000218.3977398-1-lzsx618@gmail.com>
 <20261019000218.3977398-3-lzsx618@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 00:03:41 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] elf-parse: missing SHN_UNDEF and SHN_XINDEX bounds checks in elf=
_parse()
--

commit 8e951169d34059326033b08713c8c35ae69b423f
Author: Leizhen Zhang <lzsx618@gmail.com>

elf-parse: check that the section header table is inside the file

This commit passes the mapped file size to elf_parse() to validate that the
ELF header fits in the mapping, the section header table lies within the
mapping bounds, and the section name string table index is in range.

> diff --git a/scripts/elf-parse.c b/scripts/elf-parse.c
> index 9e7d1a4f263fe..0e16a9cf67f45 100644
> --- a/scripts/elf-parse.c
> +++ b/scripts/elf-parse.c

[ ... ]

> @@ -168,6 +176,34 @@ static int elf_parse(const char *fname, void *addr, =
uint32_t types)
>  			ehdr->e32.e_ident[EI_CLASS], fname);
>  		return -1;
>  	}
> +
> +	/*
> +	 * Everything past here walks the section headers with offsets and
> +	 * indices taken from the file, so the table the ELF header describes
> +	 * has to be inside the mapping first. e_shnum =3D=3D 0 means the real
> +	 * count lives in section 0, which must then be present to be read.
> +	 */
> +	shoff =3D ehdr_shoff(ehdr);
> +	shentsize =3D ehdr_shentsize(ehdr);
> +	shnum =3D ehdr_shnum(ehdr);
> +	if (shnum =3D=3D SHN_UNDEF)
> +		shnum =3D 1;
> +	if (shoff > size || shentsize =3D=3D 0 ||
> +	    (size - shoff) / shentsize < shnum) {
> +		fprintf(stderr, "ELF section headers out of range: %s\n",
> +			fname);
> +		return -1;
> +	}
> +
> +	/* SHN_XINDEX defers the index to section 0; elf_open_ro() checks it. */
> +	shstrndx =3D ehdr_shstrndx(ehdr);
> +	if (shstrndx !=3D SHN_XINDEX && ehdr_shnum(ehdr) !=3D SHN_UNDEF &&
> +	    shstrndx >=3D ehdr_shnum(ehdr)) {
> +		fprintf(stderr, "ELF section name index out of range: %s\n",
> +			fname);
> +		return -1;
> +	}
> +
>  	return 0;
>  }

[Severity: Medium]
Can sorttable and tracepoint-update still read past the end of the mapping
when e_shnum is SHN_UNDEF or e_shstrndx is SHN_XINDEX?

The comment and commit message note that resolving the real section count f=
or
SHN_UNDEF and the section name index for SHN_XINDEX stays with elf_open_ro()
(which is updated in the follow-up commit "elf-parse: check the section
indices that elf_open_ro() takes from the file").

However, sorttable and tracepoint-update do not call elf_open_ro(). Instead,
they call elf_map() and resolve section 0's sh_link and sh_size directly
without bounds checks:

scripts/sorttable.c:do_sort() and
scripts/tracepoint-update.c:process_tracepoints():
	shstrndx =3D ehdr_shstrndx(ehdr);
	if (shstrndx =3D=3D SHN_XINDEX)
		shstrndx =3D shdr_link(shdr_start);
	string_sec =3D get_index(shdr_start, shentsize, shstrndx);
	secstrings =3D (const char *)ehdr + shdr_offset(string_sec);

	shnum =3D ehdr_shnum(ehdr);
	if (shnum =3D=3D SHN_UNDEF)
		shnum =3D shdr_size(shdr_start);

If e_shnum =3D=3D SHN_UNDEF and e_shstrndx is an out-of-range index (not eq=
ual to
SHN_XINDEX), elf_parse() skips the shstrndx check because ehdr_shnum(ehdr) =
=3D=3D
SHN_UNDEF, and both tools immediately index shdr_start out of bounds via
get_index(shdr_start, shentsize, shstrndx).

Similarly, if e_shnum =3D=3D SHN_UNDEF and section 0's sh_size exceeds the =
number
of section headers that fit in the mapping, or if e_shstrndx =3D=3D SHN_XIN=
DEX
and section 0's sh_link >=3D shnum, elf_parse() succeeds and both tools read
past the end of the mapping.

Since elf_parse() already verifies that section 0 lies within the mapping w=
hen
shnum > 0, should elf_parse() resolve shdr_size() and shdr_link() from
section 0 and validate the real shnum and shstrndx right here so that all
callers of elf_map() are protected as well?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019000218.3977=
398-1-lzsx618@gmail.com?part=3D2
