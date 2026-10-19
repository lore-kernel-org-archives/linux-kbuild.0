Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB143DEFFC;
	Mon, 19 Oct 2026 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414519; cv=none; b=c3rMxu2HDH4XAnBl7u8M0jx2TEkzDrug6caLi0d1zvPNyqxrxv2dEWvWlt1IspVGWM3nZ06Jm6DX+9u2fYcwVyWyln3JlhImqeQNZ9lm7UUsAkWA4tKB13Uf97/ypN2PTRnwpEimyVK2KQl46gy730hNE4AezsyU0YBXfQL2jT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414519; c=relaxed/simple;
	bh=qkOt+Esimk6WNRZVBvscwCpv/n6ElmaSUnHl4JNTP8M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EZ++LEuslH6rmMFtPvFtxQjX68sm2uZX1JogJr8p3JLGN0ZZ4MlusTdMP5ASUjPBwIhr+bK/NO9+SYZBX0CAuUQ/cLaAnmXnGYVW7aWF4FbpwLx3iPLF/WuEQLTMLnLUmKp6RXJTVjxlVRscuyLfK4OKCH5BldtyqarCECUi+NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b=5Kuutisn; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.b="5Kuutisn"
Received: from omf17.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id CA9F21A06FA;
	Mon, 19 Oct 2026 12:55:09 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id E93D117;
	Mon, 19 Oct 2026 12:55:07 +0000 (UTC)
Date: Mon, 19 Oct 2026 08:55:06 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Leizhen Zhang <lzsx618@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, ljs@kernel.org
Subject: Re: [PATCH 2/5] elf-parse: check that the section header table is
 inside the file
Message-ID: <20261019085506.6b64cda9@gandalf.local.home>
In-Reply-To: <20261019000218.3977398-3-lzsx618@gmail.com>
References: <20261019000218.3977398-1-lzsx618@gmail.com>
	<20261019000218.3977398-3-lzsx618@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Stat-Signature: w1zxazrehkawh5yuq7o49uzpn379zqdc
X-Rspamd-Queue-Id: E93D117
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19pjwiyxYkfhDjmev5bVfsnxBMenODLS8U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=RqN3KTCACOEa/7yZ97cOKw3sgtc2A3IBOWNJCppTObE=; b=5KuutisnnsqGLUIUsO8IrZZ+BFFdTDSDmG7WpujdZXQg+MHC7kbvF7spNR8Fg8Dn6KWG1PW35xNBGhUoOom09wh1CDTlvcEoqrRQyMUsLaizagh5Cfh9MxYP1N4DOVI301hjZljxkxoi1cnC3QXL32+CozIVMahO/fYEKlDZYTU=
X-HE-Tag: 1792414507-571839
X-HE-Meta: U2FsdGVkX1+PuVbEmZgHv4UWbUpQmg+nEM3kWoZWBynqvkH5f1Y6W2ukk/XnfURmty0K17zJOtkreAtznWda4cHYwa7O/vc9cDIwDIzG9Jpe47m394sLu38F9NLfKnBIVZSoYxzLxUbmVr2NEsZyzDkbtZgbTKxaLLmtQCi8S2Q0NrUbWZWLUMiKthFb308oJGqCM/TgC8C26WHkGtx+ReuuQ8lAO+ixnJTnVjjX28Q1Lf2S3jv5/Ex7s9lzSek6zNOI93hfCsEhDvvdDmetv2mdeD3B0zzRg/8/MFcYL2SUSGdNaI4fxgJrHzK0fv+i4Rof/H7YrX0hHP9jJ1DRLA39ip0PKDmV

On Sun, 18 Oct 2026 19:02:15 -0500
Leizhen Zhang <lzsx618@gmail.com> wrote:

> elf_parse() validates e_ehsize and e_shentsize, and nothing else. The
> section header table that every caller then walks is described entirely
> by unchecked file data, so a truncated or corrupted object makes the
> parser read outside the mapping:
> 
>  - a file shorter than one ELF header is read past its end, since e_type
>    at offset 16 and e_ehsize at 52/54 are read before any length check;
>  - e_shoff may point anywhere, including far past the end of the file;
>  - e_shnum may claim more sections than the file can hold;
>  - e_shstrndx may name a section that does not exist.
> 
> elf_map() hands the mapping to sorttable and tracepoint-update, which
> index the table directly, and elf_open_ro() does the same for kallsyms,
> so all three tools fault on the same inputs.
> 
> Found by fuzzing the host ELF tools with mutated object files under
> ASan/UBSan. Each reproducer below changes one field of an otherwise
> valid file; the sanitizer output is from host tools built with
> -fsanitize=address,undefined:
> 
>   e_shoff = filesize + 0x1000 (offset 0x28)
>     ./kallsyms --sysmap=/dev/null t.elf
>     ERROR: AddressSanitizer: unknown-crash on address 0x7f914e32cbdc
>       #0 in __get_unaligned_le32 tools/include/tools/le_byteshift.h:14
>          (reading sh_type of section 0)
>     ./sorttable t.elf   -- same
>   e_shnum = 0xffff (offset 0x3c)
>     ./sorttable t.elf
>     ERROR: AddressSanitizer: unknown-crash on address 0x7f64023b8000
>       #0 in __get_unaligned_le32 tools/include/tools/le_byteshift.h:14
>     ./tracepoint-update t.o
>     ERROR: AddressSanitizer: SEGV on unknown address 0x7f9fc264db28
>       #0 in strcmp
>   e_shstrndx = 0xfff0 (offset 0x3e)
>     ./tracepoint-update t.o
>     ERROR: AddressSanitizer: SEGV on unknown address 0x7f0f83b29544
>       #0 in __get_unaligned_le32 tools/include/tools/le_byteshift.h:14
> 
> Pass the mapped size down to elf_parse() and reject a file that cannot
> hold its own ELF header, a section header table that does not fit in the
> mapping, and a section name index outside the table. The division keeps
> the extent check free of overflow. A count of SHN_UNDEF means the real
> count lives in section 0, so one entry must still be present; resolving
> that count, and the SHN_XINDEX name index, stays with elf_open_ro().
> 
> The three tools keep accepting the objects they accepted before: a
> vmlinux, a shared object and a .o built from the same source are parsed
> unchanged, and the reproducers above now print one line and exit 1.
> 
> Fixes: b055f4c431e3 ("sorttable: Move ELF parsing into scripts/elf-parse.[ch]")

You can remove the above, because this doesn't "fix" anything. If the
object files are corrupted when getting here, there's much bigger issues
than this code breaking. The object files will be loaded in the vmlinux
file, and that would be a much bigger concern about corrected object files.

> Assisted-by: LLM ASan UBSan
> Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
> ---
>  scripts/elf-parse.c | 44 ++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/elf-parse.c b/scripts/elf-parse.c
> index 9e7d1a4f263f..0e16a9cf67f4 100644
> --- a/scripts/elf-parse.c
> +++ b/scripts/elf-parse.c
> @@ -58,10 +58,17 @@ static void *map_file(char const *fname, size_t *size, bool writable)
>  	return addr;
>  }
>  
> -static int elf_parse(const char *fname, void *addr, uint32_t types)
> +static int elf_parse(const char *fname, void *addr, size_t size, uint32_t types)
>  {
>  	Elf_Ehdr *ehdr = addr;
> -	uint16_t type;
> +	size_t shoff, shentsize, shnum;
> +	uint16_t type, shstrndx;
> +
> +	/* Every field read below lives in the smaller of the two headers. */
> +	if (size < sizeof(Elf32_Ehdr)) {
> +		fprintf(stderr, "ELF file too short: %s\n", fname);
> +		return -1;
> +	}
>  
>  	if (memcmp(ELFMAG, ehdr->e32.e_ident, SELFMAG) != 0 ||
>  	    ehdr->e32.e_ident[EI_VERSION] != EV_CURRENT) {
> @@ -153,7 +160,8 @@ static int elf_parse(const char *fname, void *addr, uint32_t types)
>  		elf_parser.rela_addend		= rela64_addend;
>  		elf_parser.rela_write_addend	= rela64_write_addend;
>  
> -		if (elf_parser.r2(&ehdr->e64.e_ehsize) != sizeof(Elf64_Ehdr) ||
> +		if (size < sizeof(Elf64_Ehdr) ||
> +		    elf_parser.r2(&ehdr->e64.e_ehsize) != sizeof(Elf64_Ehdr) ||
>  		    elf_parser.r2(&ehdr->e64.e_shentsize) != sizeof(Elf64_Shdr)) {
>  			fprintf(stderr,
>  				"unrecognized ET_EXEC/ET_DYN file: %s\n",
> @@ -168,6 +176,34 @@ static int elf_parse(const char *fname, void *addr, uint32_t types)
>  			ehdr->e32.e_ident[EI_CLASS], fname);
>  		return -1;
>  	}
> +
> +	/*
> +	 * Everything past here walks the section headers with offsets and
> +	 * indices taken from the file, so the table the ELF header describes
> +	 * has to be inside the mapping first. e_shnum == 0 means the real
> +	 * count lives in section 0, which must then be present to be read.
> +	 */
> +	shoff = ehdr_shoff(ehdr);
> +	shentsize = ehdr_shentsize(ehdr);
> +	shnum = ehdr_shnum(ehdr);
> +	if (shnum == SHN_UNDEF)
> +		shnum = 1;
> +	if (shoff > size || shentsize == 0 ||
> +	    (size - shoff) / shentsize < shnum) {
> +		fprintf(stderr, "ELF section headers out of range: %s\n",
> +			fname);
> +		return -1;
> +	}
> +
> +	/* SHN_XINDEX defers the index to section 0; elf_open_ro() checks it. */
> +	shstrndx = ehdr_shstrndx(ehdr);
> +	if (shstrndx != SHN_XINDEX && ehdr_shnum(ehdr) != SHN_UNDEF &&
> +	    shstrndx >= ehdr_shnum(ehdr)) {
> +		fprintf(stderr, "ELF section name index out of range: %s\n",
> +			fname);
> +		return -1;
> +	}

I really see this as overboard. As I said, if the object files are
corrupted, you'll likely see errors everywhere. Why is this code the one to
detect it?

I think this is adding more complexity than needed.

-- Steve


> +
>  	return 0;
>  }
>  
> @@ -195,7 +231,7 @@ static void *__elf_map(char const *fname, size_t *size, uint32_t types,
>  	if (!addr)
>  		return NULL;
>  
> -	ret = elf_parse(fname, addr, types);
> +	ret = elf_parse(fname, addr, *size, types);
>  	if (ret < 0) {
>  		elf_unmap(addr, *size);
>  		return NULL;

