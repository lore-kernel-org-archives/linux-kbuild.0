Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793921023;
	b=jFxLh3ixiWw1G3zdGD+7/8cd5Q6pqdL9TDQeZOV5zcJcD7obllGEspErof7bWEqwKgox
	 wvb3N1dlzmUidaaE81zMrJ1j8fKuzyCxXHU3JpxRhQbjYwuP+FbH9KgK3Uo8Y0MkIGj2l
	 neJ/673E1feFIX/mkMxNk1i5EmchoyD+57QOsqyc4ylS1FNPQFtn/iDQBvSiOP6HmiDnh
	 6cpQE79B9TW+CtplhFDMlCzYeAAWQM0jI0T7CceNAZ8D/rhhH3GmF1jhJambsdIIPhJpE
	 cjIwahKc8XQq5ngvwJ/rSNR/KqftyXUOTa6Tjov30acnEXN/CtAU/xuWsSnV/A7WZTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793921023;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=NVaw+qpxOfDasZ4nqHW2uJIWOPJ1Cl5tWrnzF6OEJaM=;
	b=ct362R8iYqPRobduZuvlhH1pLG0PDa87o4AlaYJxPw2SVBfYT/7ZQnsASc/YiD8X0eeQ
	 HNk2QurWF+jr1MT1PWVTd+vaaGwxK4BxarXZwFxKl5ZdO4Ow/cO31gHdcpItd773jqD96
	 b0JWkrKpSTE4SoyDIDZaxlux988nyJDpwhtWbdqGzq9GCg7Dc0wDIiJrz6/u5X6NtYZX4
	 t90JzZIgrmziQ0dnz1LdU4slcKMwVQzeE/qF5GQD17vkY06q2VNP0ZJDlQUqvliSCzl2z
	 xaiOlIffuyIgNIXjwjpY/KfJtjcy8waxmvDey6aPjU9FeK+JgnI3h/05/epKcoHhn/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mlzNQaAz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B42606D802;
	Thu,  5 Nov 2026 23:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mlzNQaAz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1001F00903;
	Thu,  5 Nov 2026 23:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793921022;
	bh=NVaw+qpxOfDasZ4nqHW2uJIWOPJ1Cl5tWrnzF6OEJaM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=mlzNQaAzZ+WZurZeJwpvclEisw7jvaIDA6qhNAg3uPh12a/XPo8s+jlMTYkIKftkZ
	 fn5QC3kkppqofx24gbzy82JErCq6NTnJkV/oAsRhKERIM+1TQmnVgveBcCroe8jf04
	 xP96tMjOBpW7HnS/EOPf2zOZQVyB7TXe1nIhHE3aZXtgf+5KrjSSX2l+PkDQO54Tj2
	 lhrjAV/UTZ5cXpbSoG+suBTIwN8gK9SOy1SrtBMdagW3igZIilVD8qyqFG7uo6ab+W
	 cU9OEG+RZen5jS2zs1H2NA8eYZBpnrB9uwbYZ6pWr6PnAADifVWa6N9vWkFz/A7aJy
	 unz2G2TDWl8yA==
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] elf-parse: avoid an undefined shift when checking
 the ELF type
From: Nathan Chancellor <nathan@kernel.org>
To: Leizhen Zhang <lzsx618@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, rostedt@goodmis.org, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261025004440.432272-1-lzsx618@gmail.com>
References: <20261019084749.03c4386b@gandalf.local.home>
 <20261025004440.432272-1-lzsx618@gmail.com>
Date: Thu, 05 Nov 2026 16:23:33 -0700
Message-Id: <179392101319.309869.17963818817587956632.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2280; i=nathan@kernel.org;
 h=from:subject:message-id; bh=n9RbVwsPt9Jqu2qoy4g6UM0Rz4hjdyI/sunJ0CGsSRU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlv+X9Kifeyb42rvDvVeWPif+7Eqg9b19pEqLys/pW++
 Tv3Rc3ajlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCR/a4M/53t3TlK9s5Xljt9
 tfECzzRVlYJnX/MPzpkSblQ4Mzx18kpGhmM2y99c5gy7aqo7b/rB1ey/OxwORFxJWb0pcLa8Jef
 KhSwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> elf_parse() takes a bitmap of permitted ELF types and tests it with
> 
> 	type = elf_parser.r2(&ehdr->e32.e_type);
> 	if (!((1 << type) & types)) {
> 
> e_type is a 16-bit field read straight out of the file, so a type of 32
> or more shifts by at least the width of int and the result is undefined;
> 31 shifts into the sign bit. All three users of the parser -- kallsyms,
> sorttable and tracepoint-update -- reach this with e_type unvalidated.
> 
> Found by fuzzing the host ELF tools with mutated object files under
> ASan/UBSan. Reproducer, on any vmlinux (or any ET_REL object for
> tracepoint-update), setting only e_type:
> 
>   $ python3 -c 'import struct
>   d = bytearray(open("vmlinux","rb").read())
>   struct.pack_into("<H", d, 0x10, 40)
>   open("t.elf","wb").write(bytes(d))'
> 
>   $ ./kallsyms --sysmap=/dev/null t.elf
>   scripts/elf-parse.c:94:11: runtime error: shift exponent 40 is too
>   large for 32-bit type 'int'
>       #0 in elf_parse scripts/elf-parse.c:94
> 
> (host tools built with -fsanitize=address,undefined)
> 
> This does not need a corrupt file. include/uapi/linux/elf.h itself
> declares legitimate types above 32:
> 
> 	#define ET_LOPROC 0xff00
> 	#define ET_HIPROC 0xffff
> 
> so any processor-specific object -- and the 0xfe00..0xfeff OS-specific
> range the ELF spec reserves alongside it -- shifts out of range here
> while being a perfectly well-formed file. The tools would reject such an
> object either way; the point is that they currently reach that decision
> through undefined behaviour.
> 
> Reject a type that cannot be in the bitmap, and shift an unsigned 1 so
> that a type of 31 stays defined. No valid object changes behaviour: every
> ET_* value the callers put in the bitmap is far below 32, and a file with
> a larger e_type already took the error path -- it just took it through
> undefined behaviour.
> 
> Fixes: b055f4c431e3 ("sorttable: Move ELF parsing into scripts/elf-parse.[ch]")
> Assisted-by: LLM ASan UBSan
> Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>

While I am not the biggest fan of these "handle unlikely invalid input",
this seems like reasonable enough hardening.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan

