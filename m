Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792454623;
	b=pbRf/7kCTamd0dXkUPH7ayCLqcK2YNifKrW6+EEgdPiHk3Z1LM79tUgX0U1uvft0St/V
	 Bi1kbplHGopb2A+jpTRDPrt1FejTs7/CFDQHrC9HVkYDoLxqSc06bM5idgBWcvrC6sCVE
	 HxXdP8y/t8+7caYO0w1hHHpwvKe51hGu9gPMRj/oW76nuqksOM063VaHTbSuW++9IbFTd
	 RysUvOQVamnd5FgbHTZlNuJXHZyw1XbDALk28EuxlITHyEaE9JiONIhsnq0/gtIv4s6bO
	 UESS9q7jK7RN9DXXtDqFtlZM7mV7eJbPjJm5U32mDSf18DtLzi88W6tqZtHHwqTpBZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792454623;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AZcpVGzOWf4Vc0WPwHqiLPMR0lAtiN+ODixxSSdeqbs=;
	b=DVF8k1M6QAg8e60WqdGjMoAcFFByn72IPSSoC00wYrGlqcnCjy/BI7UKxY7dPWAEau/i
	 1BZL+zQZW/7mDOpCIPA2pUOy1PjkyrKbzU4WqtgLJ/SqWa3BNzYLoThnLP+QszLvS3xSG
	 6EUKx1qKtt5EleSqmxwoBiXqonardE/rAWRo1hkOBDC4bT8aBtMcMwlWVD78x2VuVyhmf
	 qoaQw/qKn3ZmfpLySLwSTnXWPQWjmcYJITnth5greQUMruEmDbaZVg4ZABeE8izhW8Sgd
	 nqTWJcHNNemMG7npkNJ1PsNma7hrr2AjsD07Z6YDdW8DfemCnr2xlLaAHQ99r7jSfoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NqJXsMIk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034BB606A31A
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 00:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NqJXsMIk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798781F000C4;
	Tue, 20 Oct 2026 00:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792454622;
	bh=AZcpVGzOWf4Vc0WPwHqiLPMR0lAtiN+ODixxSSdeqbs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NqJXsMIkyYC9c1qcZdT5VzMuprgZZLziEFyRu7BHcH8Xhhb381ukPFtxy/WddWquk
	 ckxpKnmoQQmOHgfEo3SjMoaWzEfsGeZ8e3WcRrZ/UuWeSnxRpdNoHPC7EXXqLtrCQf
	 khg+y2rkP+9e8RG/dep/hGt9DLOzGBtLcNfD4edxHxly0OnqckcGwtkcFd5sRUmYsU
	 bctOwOMwwCnK8d7e1g5SLoXslXglb7k1jt1vfn7Q50RzOygoYLzDpuWiOHIXiDvEqW
	 s5AwmJwITSug6hrUc7JYlUpBeu0U61y4d3VBdDS5kuKmVDbLT/sO8Q2ZoiZfv4pyR8
	 VL+g+EcuZsHlg==
Message-ID: <sashiko-outbox-178371@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] elf-parse: bound symbol names by the string table
Reply-To: sashiko-reviews@lists.linux.dev
To: "Leizhen Zhang" <lzsx618@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org, rostedt@goodmis.org, ljs@kernel.org
In-Reply-To: <20261019000218.3977398-6-lzsx618@gmail.com>
References: <20261019000218.3977398-1-lzsx618@gmail.com>
 <20261019000218.3977398-6-lzsx618@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 00:03:42 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] elf-parse: pointer addition before bounds check in elf_open_ro()
- [Medium] elf-parse: unchecked shstrtab and sh_name in elf_section_name()
--

commit 33f3711117c58495bbc5517ccf237e3d77449cb0
Author: Leizhen Zhang <lzsx618@gmail.com>

elf-parse: bound symbol names by the string table

This commit validates that the ELF symbol string table lies within the file
mapping and ends in a NUL byte during elf_open_ro(). It also introduces
elf_symbol_name() to bounds-check symbol st_name offsets against the string
table size in elf_read_symbols().

> diff --git a/scripts/elf-parse.c b/scripts/elf-parse.c
> index 756843c433ee8..8083b9ec3477f 100644
> --- a/scripts/elf-parse.c
> +++ b/scripts/elf-parse.c

[ ... ]

> @@ -355,8 +356,22 @@ int elf_open_ro(char const *fname, uint32_t types, s=
truct elf_file *elf)
>  		elf_close(elf);
>  		return -1;
>  	}
> -	elf->strtab =3D (const char *)elf->base +
> -		      shdr_offset(elf_section(elf, shdr_link(elf->symtab)));
> +	strtab =3D elf_section(elf, shdr_link(elf->symtab));
> +	stroff =3D shdr_offset(strtab);
> +	elf->strtab_size =3D shdr_size(strtab);
> +	elf->strtab =3D (const char *)elf->base + stroff;
> +	/*
> +	 * Symbol names are read by offset into this table, so it has to be
> +	 * inside the mapping and has to end in a NUL for a name that starts
> +	 * inside it to end inside it as well.
> +	 */
> +	if (stroff > elf->size || elf->size - stroff < elf->strtab_size ||
> +	    !elf->strtab_size || elf->strtab[elf->strtab_size - 1]) {

[Severity: Medium]
Can computing elf->strtab before checking stroff trigger a pointer overflow?

In elf_open_ro(), (const char *)elf->base + stroff is evaluated with the
unvalidated file-controlled stroff (such as 0xffffffffffffffff) before the
stroff > elf->size check runs. Under UBSan, this triggers a pointer-overflow
failure on malformed ELF inputs before the bounds check can return an error.

Should elf->strtab be assigned after validating that stroff and
elf->strtab_size fit within elf->size, with elf->strtab[elf->strtab_size - =
1]
checked after that assignment?

> +		fprintf(stderr, "%s: symbol string table out of range\n",
> +			fname);
> +		elf_close(elf);
> +		return -1;
> +	}
>  	elf->nr_syms =3D shdr_size(elf->symtab) / shdr_entsize(elf->symtab);
> =20
>  	return 0;

[ ... ]

> diff --git a/scripts/kallsyms-sysmap.c b/scripts/kallsyms-sysmap.c
> index a482968eba511..efca13ab9dc3d 100644
> --- a/scripts/kallsyms-sysmap.c
> +++ b/scripts/kallsyms-sysmap.c
> @@ -198,10 +198,10 @@ static struct sysmap_symbol *elf_read_symbols(const=
 struct elf_file *elf,
> =20
>  	for (i =3D 1; i < elf->nr_syms; i++) {
>  		Elf_Sym *sym =3D elf_symbol(elf, i);
> -		const char *name =3D elf->strtab + sym_name(sym);
> +		const char *name =3D elf_symbol_name(elf, sym);
>  		char type =3D elf_symbol_type(elf, sym);
> =20
> -		if (!type || sysmap_omits(name, type))
> +		if (!name || !type || sysmap_omits(name, type))
>  			continue;
> =20
>  		syms[n].addr =3D sym_value(sym);

[Severity: Medium]
Does elf_read_symbols() -> elf_symbol_type() have the same out-of-bounds
read issue via elf->shstrtab and shdr_name(shdr)?

In scripts/elf-parse.c:elf_open_ro(), elf->shstrtab is set without verifying
that the section header string table fits within elf->size or ends in a NUL
byte:

	elf->shstrtab =3D (const char *)elf->base +
			shdr_offset(elf_section(elf, shstrndx));

Then in scripts/kallsyms-sysmap.c:elf_read_symbols(), elf_symbol_type() is
called on every symbol (even before checking !name). When a symbol referenc=
es
a section index shndx < elf->shnum whose section has neither SHF_EXECINSTR
nor SHF_ALLOC set, elf_symbol_type() calls:

	} else if (shndx < elf->shnum) {
		shdr =3D elf_section(elf, shndx);
		c =3D section_symbol_type(shdr, elf_section_name(elf, shdr));
	}

where scripts/elf-parse.h:elf_section_name() adds the unchecked 32-bit
shdr_name(shdr) directly to elf->shstrtab:

	static inline const char *elf_section_name(const struct elf_file *elf,
						   Elf_Shdr *shdr)
	{
		return elf->shstrtab + shdr_name(shdr);
	}

and section_symbol_type() passes that pointer to string_starts_with() ->
strncmp(). Should elf->shstrtab and elf_section_name() also be bounds-check=
ed
against the section header string table size?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019000218.3977=
398-1-lzsx618@gmail.com?part=3D5
