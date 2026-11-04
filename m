Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793757208;
	b=UN+/ktJFFPHdalvqL5C3HOEQ3/M1RHNeiA18u7PRK2/Eqs6Mp7tfp6cqPVS6y7J5BJ+v
	 28f1SDR8/cS9x064p/1yCrrcVVZYo+BF+YunsR5c/KipvSzljqbNtn05gV4bK9iJFFKZx
	 4vheYjyNJ+P8bosI0x3pX97bQZ5MdcfqZHuTKPDe8CfkNIJ3XsGzMXSHVOcO+RRqU94EQ
	 mq2RCpRPObQboqcX698jS6Wa7VRzMwN8to0ECis8tVyM92fo+VcfHJOnnlNIAmOe2xEM3
	 PQ1zvB3DUFsnDM2lakox2ym7PC56v8X3XqUBT4g4jwJN78D+FIwJAXm8mNBFFcWtKrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793757208;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GCR0JcBaw6EXCBL2jmrD+csRtGmyOL33aeP7MmzatSI=;
	b=0SerBU9cu2zqat00X2Hoeysy7e+P9ou0LssFhXt0/0sS7w5efEyzh0/9RfYsYPRIaWOQ
	 1l0m37uxYCwom1NhSlmwguX3c6HA8uthXmVoKuSwokGEi9ixVUG0lbHF6eam58zTYaYXY
	 HGBefGIRjoOwHIdIo+qLw8fyj8g62caIBt5Zc8+gV3RsTOzCC03H9HIVOZAgbgUsyuy0v
	 4AGaAst2Ry1Gn3wFY9quzFJpp4T1utWIibk6NSRTnTrSv1Ko9NUK0MUtbOVHiLC+odQbx
	 8xT8qTmqQ3wjTpShxjsMd94lbw2GQSaUfvt66E13F5V+2GQ3/G1EVjUzUaqGfkKltJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fXEaYR27;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D8E606A32D
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Nov 2026 01:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fXEaYR27
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22501F0093A;
	Wed,  4 Nov 2026 01:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793757207;
	bh=GCR0JcBaw6EXCBL2jmrD+csRtGmyOL33aeP7MmzatSI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fXEaYR27Iwf3GL2hIUwpU7pKafyp4GLKg5E0eOzMfborRLZZn1Kw2LzVGcURnNYQK
	 a584M1o4OPgeUPxDWUYNMoOdnK8EdEnyXP0/S0BC+5UfhPTk7ovn0OR0ycMup4N16q
	 FuGLGO+TMSbHr/XS6u9hhLl5JoHeArIcFFWyfV+1smV4Vo5lIzzXa3iW9+Qw6XshZy
	 FoR8EtoIK4ucCEyRYonQ5iYj7eErFpDOOMznK3IhDXB1eVRKzIQi0WRtD2sRLdWE9u
	 zMf3tVCTzPeZuYZtuk9wFH0NTNjlaFtBN3aEwjRypnH4ULaoO7cAOwfC57KUZ2b4yg
	 B2QLjpAsx5QCQ==
Message-ID: <sashiko-outbox-196404@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 14/20] coverage: add Clang's source-based code
 coverage
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: "Wentao Zhang" <wentaoz5@illinois.edu>, "Alexander Potapenko" <glider@google.com>, "Andrey
 Konovalov" <andreyknvl@gmail.com>, "Arnd Bergmann" <arnd@arndb.de>, "Bill
 Wendling" <morbo@google.com>, "Chuck Wolber" <chuck@wolber.net>, "Dmitry
 Vyukov" <dvyukov@google.com>, "Justin Stitt" <justinstitt@google.com>, kasan-dev@googlegroups.com, linux-kbuild@vger.kernel.org, "Marco
 Elver" <elver@google.com>, "Masami Hiramatsu" <mhiramat@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nick Desaulniers" <ndesaulniers@google.com>, "Nicolas
 Schier" <nsc@kernel.org>, "Peter Oberparleiter" <oberpar@linux.ibm.com>, "Peter
 Zijlstra" <peterz@infradead.org>, "Thomas Gleixner" <tglx@kernel.org>
In-Reply-To: <20261103015238.3780910-15-sashal@kernel.org>
References: <20261103015238.3780910-1-sashal@kernel.org>
 <20261103015238.3780910-15-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 01:53:26 +0000
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
- [Medium] coverage: LLVM_COV_DATA places non-alloc __llvm_cov* in kernel i=
mage
--

commit c6db5401d9d9ff31cd5421cd456c7917bf582166
Author: Sasha Levin <sashal@kernel.org>

coverage: add Clang's source-based code coverage

This commit adds support for Clang's Source-based Code Coverage under
CONFIG_LLVM_COV_KERNEL, exporting raw profile data of the kernel image via
/sys/kernel/debug/coverage/llvm/profraw and defining the LLVM_COV_DATA
linker script macro for the associated compiler-emitted sections.

Link: https://clang.llvm.org/docs/SourceBasedCodeCoverage.html [1]
Link: https://lore.kernel.org/lkml/20210407211704.367039-1-morbo@google.com=
/ [2]

> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmli=
nux.lds.h
> index 3eb732942d699..840899b604336 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -359,6 +359,42 @@
>  #define THERMAL_TABLE(name)
>  #endif
> =20
> +#ifdef CONFIG_LLVM_COV_KERNEL
> +#define LLVM_COV_DATA							\
> +	__llvm_prf_data : AT(ADDR(__llvm_prf_data) - LOAD_OFFSET) {	\
> +		BOUNDED_SECTION_POST_LABEL(__llvm_prf_data,		\
> +					   __llvm_prf_data,		\
> +					   _start, _end)		\
> +	}								\
> +	__llvm_prf_cnts : AT(ADDR(__llvm_prf_cnts) - LOAD_OFFSET) {	\
> +		BOUNDED_SECTION_POST_LABEL(__llvm_prf_cnts,		\
> +					   __llvm_prf_cnts,		\
> +					   _start, _end)		\
> +	}								\
> +	__llvm_prf_names : AT(ADDR(__llvm_prf_names) - LOAD_OFFSET) {	\
> +		BOUNDED_SECTION_POST_LABEL(__llvm_prf_names,		\
> +					   __llvm_prf_names,		\
> +					   _start, _end)		\
> +	}								\
> +	__llvm_prf_bits : AT(ADDR(__llvm_prf_bits) - LOAD_OFFSET) {	\
> +		BOUNDED_SECTION_POST_LABEL(__llvm_prf_bits,		\
> +					   __llvm_prf_bits,		\
> +					   _start, _end)		\
> +	}								\
> +	__llvm_covfun : AT(ADDR(__llvm_covfun) - LOAD_OFFSET) {		\
> +		BOUNDED_SECTION_POST_LABEL(__llvm_covfun,		\
> +					   __llvm_covfun,		\
> +					   _start, _end)		\
> +	}								\
> +	__llvm_covmap : AT(ADDR(__llvm_covmap) - LOAD_OFFSET) {		\
> +		BOUNDED_SECTION_POST_LABEL(__llvm_covmap,		\
> +					   __llvm_covmap,		\
> +					   _start, _end)		\
> +	}

[Severity: Medium]
Should __llvm_covfun and __llvm_covmap in LLVM_COV_DATA be placed outside
the loaded kernel image after _end with a 0 VMA (similar to DWARF_DEBUG,
ELF_DETAILS, or MODINFO) instead of alongside the runtime __llvm_prf_*
sections?

Unlike __llvm_prf_data, __llvm_prf_cnts, __llvm_prf_names, and
__llvm_prf_bits (which are emitted with SHF_ALLOC and accessed at runtime
by llvm_cov_serialize_raw_profile() and llvm_cov_reset()), Clang emits
__llvm_covfun and __llvm_covmap as SHT_PROGBITS sections without SHF_ALLOC
for offline consumption by the host llvm-cov tool, as noted in
scripts/mod/modpost.c:

    static const char *const section_white_list[] =3D
    {
        ...
        "__llvm_covfun",
        "__llvm_covmap",
        ...
    };

When CONFIG_LLVM_COV_KERNEL=3Dy is linked with GNU ld.bfd (since
CONFIG_LLVM_COV_KERNEL only depends on CC_IS_CLANG, not LD_IS_LLD), placing
__llvm_covfun and __llvm_covmap inside the kernel image without a 0 VMA
causes the linker to advance the location counter "." across the offline
coverage mapping data. This shifts all subsequent kernel sections, inflates
the reserved kernel virtual address range up to _end by tens of megabytes
on CONFIG_COVERAGE_PROFILE_ALL=3Dy builds (risking exceeding the
KERNEL_IMAGE_SIZE link-time assertion on x86_64 when !CONFIG_COMPILE_TEST),
and creates a zero-filled gap in vmlinux.bin.

When linking with ld.lld, ADDR() of these non-SHF_ALLOC sections evaluates
to 0, so AT(ADDR(...) - LOAD_OFFSET) assigns a bogus LMA of -LOAD_OFFSET,
and BOUNDED_SECTION_POST_LABEL() also emits unused __llvm_covfun_start/end
and __llvm_covmap_start/end symbols.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103015238.3780=
910-1-sashal@kernel.org?part=3D14
