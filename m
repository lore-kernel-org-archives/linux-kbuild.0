Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=89.208.246.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525367;
	b=GVwZiKzwfQ10m/0dtet85U+8ouj9yCZX6oTr3+Hbm8RUOh5H7Px1/vEg9fcSoGbFMzSt
	 rv6wcUZsQb72T7fI1HXPP9d8Gdtj36QcxExLIMEgH9VglDOzpetT8HL4UHa4uZwRpISpx
	 EukvgHamYMkk/m38CwIILyCHOyi2wYifT36EBdcqGoj+u1NOZl++0TSK4s+ws/IgrU3Pz
	 4cLVySw4Ws4L+6MR7pSMCzYaPxglHBTz7x4OvZ1dTmXoHDv3tLHsQ33AS0YJV2zrsJCJr
	 jMuCHzIhucRJtYoesteLbWzD17QeZtATNEKmWkBNYJC3VWdxscDOQ8DojHeDieWtXMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525367;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=e7umvq3b2Qjy6OI4P5AfLqfekqPHHMBAinW/wTd6ikg=;
	b=O0jgQfoEpNmdGvthRdaGvG+ErAAw5Fn8eqjEpjghY4Ky0mx8M02xXU0TLPLkG8H5VOCp
	 eAebhxZSQw8cPR1P/nXXK5K90zvc5ObyUfrLspbDSr6OkyBLsMoGo0r/+GeIool4wf+wA
	 hPz1URseEQqpd5WcYHK0RjbuHzrhyIemd3xEd2teQhN6iQOJ+IA58Q/QmeojDcgt0UiFB
	 hIijvTWjMlLcfdzJdxOQxNIMkXHoGFOxcEma1oVFrgKrDGrpQKWObw90QfDzjBqqapF9u
	 qU6HKK2ehA3DLjPnGn1uBgam1xbvKCaPoE2nETxVKalPRETZ8bitLgYZQxCh/TyJlmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xry111.site;
	spf=pass smtp.mailfrom=xry111.site;
	dkim=pass header.d=xry111.site header.i=@xry111.site header.a=rsa-sha256 header.s=default header.b="WTJzaO/Y";
	arc=none smtp.remote-ip=89.208.246.23
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C982606A321
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2026 13:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C982606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xry111.site header.i=@xry111.site header.a=rsa-sha256 header.s=default header.b=WTJzaO/Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1795525359;
	bh=e7umvq3b2Qjy6OI4P5AfLqfekqPHHMBAinW/wTd6ikg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WTJzaO/Yml+FImT9nkd5vU/rhpD5MScZLTqBe9h2H2KF/kEbGMb2snKLIcuQAlk46
	 zYINEDApkRBq3QIrXE5VuLFFCjgLpMDPgqN6uIxu1rh7r4vpLuaw8zMrwoNEce0/CJ
	 gdKRKZJP/88mKPLaiAPcgKG93NE+MVrb0tMpbOyo=
Received: from [127.0.0.1] (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com [IPv6:2607:8700:5500:e873::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 3E28F65EC3;
	Tue, 24 Nov 2026 08:02:37 -0500 (EST)
Message-ID: <84a64a3f632f9e1e3208c0ceac55cedf0f266e9d.camel@xry111.site>
Subject: Re: [RFC PATCH v2] kbuild: modinst: drop orphaned local labels from
 stripped modules
From: Xi Ruoyao <xry111@xry111.site>
To: Wentao Guan <guanwentao@uniontech.com>, nathan@kernel.org, 
	mengqinggang@loongson.cn
Cc: chenhuacai@kernel.org, linux-kbuild@vger.kernel.org, 
	loongarch@lists.linux.dev, charlie@rivosinc.com, masahiroy@kernel.org
Date: Tue, 24 Nov 2026 21:02:34 +0800
In-Reply-To: <6E960C21EF6F6A78+20261124105408.3119771-2-guanwentao@uniontech.com>
References: <20261124035942.GB2738970@ax162>
	 <6E960C21EF6F6A78+20261124105408.3119771-2-guanwentao@uniontech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-24 at 18:54 +0800, Wentao Guan wrote:
> INSTALL_MOD_STRIP=3D1 maps to "strip --strip-debug", which is a section
> operation: it removes .debug_* and .rela.debug_* but leaves the symbol
> table alone.=C2=A0 When the assembler has to name gcc's -g labels in the
> relocations it emits for debug data, those labels stay in .symtab and
> survive the strip as orphans.=C2=A0 Whether that happens is a property of=
 the
> target's assembler, not of the kernel: the x86-64 and arm64 assemblers
> resolve the DWARF references against the section symbol with an addend,

Qinggang has recently improved ld.bfd to handle relocations against
section + addend in relaxation, thus I guess the assembler can be
modified to use section + addend like x86-64 and arm64 for DWARF now
(maybe opt-in with a switch to keep compatibility with old linkers).

--=20
Xi Ruoyao <xry111@xry111.site>
