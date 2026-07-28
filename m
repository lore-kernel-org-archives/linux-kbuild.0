Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB73730D405;
	Tue, 28 Jul 2026 16:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785255180; cv=none; b=U/c33r5/C9PNmiLhu6PmNmt8g3hJ/QrLI0mlNws6g8yU2fu1ALxWxuYuFYpvV1JEVZc+uWXORrNx24c9Qul2q2WJjfDYEhzhdO3XWBxnpKRzt3jHFap0yFgZJyhi9aD7Gsr9TJJuYwzsACo9nqLu9MjGoIYkm2auv/gpdLz/+cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785255180; c=relaxed/simple;
	bh=cSpsTArrUzdKo6lgjXa5SA4zESw++v68dqlCte8Y7zA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=H5pEK9RClaUBvUVxzICaMHBAc6O+1U7pB6+WytLTYq2KhlIajCJyazCevgLVSXcsvQEXxntxYvTFuSes5xCB0mZUi3cDtbnJ35Wwfd5gQlUKagTauO5NVFcneg2n0OGKY/3KtkNfhgfJMJO3RfdWZDi5FfylfvxbNYCT9Z6RwLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=sseMI+iH; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="sseMI+iH"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 66SG5bc32606012
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 28 Jul 2026 09:05:38 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 66SG5bc32606012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1785254739;
	bh=HRK60T+Wtw8FN+HR/sReC2H3XrbSD61nlM4UqigidL0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=sseMI+iHbalc9ZBH9lO3M0Mc2aVcen6eZKX/rppoQ3dcrSkUM+maPCoj9JE2h1znH
	 zXgeD4+g8jxddLSiRc/NVNuI23wzdgnZPWMyskZGLVdtgqwzNJcBp6Is5lDedpPymN
	 PTNzU+nJlhPzgKd7XYKkv1u2UKb2sFTk3NxLY+0sxx/NVeMp0cIhVTjvB/+0voi1g3
	 VXMDueZNGq9fq/Ng3YxejDvgKyCpx0njvXKHPH0pdgI5Cc+bXzT+ND+LXFM6D3jhmd
	 ZHLE/rEOkga7QYzun4vgJC9KMjYNWxsnnYq5s2V7olR3fD8AiLxhe3lgw+ZCnTGyXY
	 oVZXpg0GhVOCg==
Date: Tue, 28 Jul 2026 09:05:32 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Mingcong Bai <jeffbai@aosc.io>, linux-kernel@vger.kernel.org
CC: Kexy Biscuit <kexybiscuit@aosc.io>, Xi Ruoyao <xry111@xry111.site>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>,
        Ard Biesheuvel <ardb@kernel.org>, Jan Stancek <jstancek@redhat.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        =?ISO-8859-1?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
        Simon Glass <sjg@chromium.org>, Marco Elver <elver@google.com>,
        linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH] x86/boot: use zstd -19 if building for 32-bit
User-Agent: K-9 Mail for Android
In-Reply-To: <20260728143141.2870515-1-jeffbai@aosc.io>
References: <20260728143141.2870515-1-jeffbai@aosc.io>
Message-ID: <A7B9C461-C3EE-45FB-83E0-FFABB65F09B3@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On July 28, 2026 7:31:35 AM PDT, Mingcong Bai <jeffbai@aosc=2Eio> wrote:
>When using native build environments (that is, 32-bit x86 chroot/containe=
r
>as build environment for 32-bit x86 binaries), `zstd -22' requests more
>virtual memory than that could be allowed on 32-bit hosts=2E
>
>Introduce `cmd_zstd_with_size' for CONFIG_X86_32 builds=2E
>
>This is quite possibly just stupid=2E=2E=2E But there doesn't seem to be =
a way
>to detect the host environment=2E So I'm sending this patch as a means to
>ask for your opinions=2E
>
>Any help would be greated appreciated=2E
>
>Signed-off-by: Mingcong Bai <jeffbai@aosc=2Eio>
>---
> arch/x86/boot/compressed/Makefile | 5 +++++
> scripts/Makefile=2Elib              | 3 +++
> 2 files changed, 8 insertions(+)
>
>diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed=
/Makefile
>index 07e0e64b9a98=2E=2E2261fb0d4d1d 100644
>--- a/arch/x86/boot/compressed/Makefile
>+++ b/arch/x86/boot/compressed/Makefile
>@@ -143,8 +143,13 @@ $(obj)/vmlinux=2Ebin=2Elzo: $(vmlinux=2Ebin=2Eall-y)=
 FORCE
> 	$(call if_changed,lzo_with_size)
> $(obj)/vmlinux=2Ebin=2Elz4: $(vmlinux=2Ebin=2Eall-y) FORCE
> 	$(call if_changed,lz4_with_size)
>+ifdef CONFIG_X86_32
>+$(obj)/vmlinux=2Ebin=2Ezst: $(vmlinux=2Ebin=2Eall-y) FORCE
>+	$(call if_changed,zstd_with_size)
>+else
> $(obj)/vmlinux=2Ebin=2Ezst: $(vmlinux=2Ebin=2Eall-y) FORCE
> 	$(call if_changed,zstd22_with_size)
>+endif
>=20
> suffix-$(CONFIG_KERNEL_GZIP)	:=3D gz
> suffix-$(CONFIG_KERNEL_BZIP2)	:=3D bz2
>diff --git a/scripts/Makefile=2Elib b/scripts/Makefile=2Elib
>index 0718e39cedda=2E=2E09910dc57af3 100644
>--- a/scripts/Makefile=2Elib
>+++ b/scripts/Makefile=2Elib
>@@ -464,6 +464,9 @@ quiet_cmd_xzmisc =3D XZMISC  $@
> quiet_cmd_zstd =3D ZSTD    $@
>       cmd_zstd =3D cat $(real-prereqs) | $(ZSTD) -19 > $@
>=20
>+quiet_cmd_zstd =3D ZSTD    $@
>+      cmd_zstd_with_size =3D { cat $(real-prereqs) | $(ZSTD) -19; $(size=
_append); } > $@
>+
> quiet_cmd_zstd22 =3D ZSTD22  $@
>       cmd_zstd22 =3D cat $(real-prereqs) | $(ZSTD) -22 --ultra > $@
>=20

This is really just stupid=2E Basing it on the config setting is just plai=
n wrong=2E
