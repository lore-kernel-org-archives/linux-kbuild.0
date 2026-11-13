Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530740;
	b=M3IXdfIjFUfz2DWJbLSGlGJQa/Ad91ZAA47ZU2jvr2hnWlw9j53l0K3nnjskTM2vZCk4
	 zTAglS/+8DnNf4eF9fN7G5DmLY0cWD4w7EwPsusg5N+q+QlfzefPO3JMsih64dE4EsVOK
	 UeAvegwMhmXGSoHBzLe2Xp8ZC8PDTctEaTUGMzHFZgZS58oLTCEYn4ri2sf1h5ZbFNUf1
	 jBcDj2ZcMKNeKRCYM8VNR/U9kcGrQ8WmTy+jmVBIu9Boa7s2wL1pIRCajfBLyf/4lgRts
	 rF9wY0pnCXO+DE61G/0cDBmniM84EON/we+bBRbRh4r7UOPr+dzsQ6bZsxU4Eyp7dSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530740;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Ew+mFBtkvyHaX4L3mOy9ZGheiU3yA4UH3r5Gz26alrc=;
	b=i5roRZj1ywaJp6S4NhGGgN6Gvj00bYNcWkfxwv1F/tLNKeVGqS3M4ZScFygxPaOuc50h
	 CwkV02wRhDlyAnlDI4qj4S5Fa8YwgUPm9l+9tiR2BqdUexcLTQVGNT6tn9gCFuxlJV0za
	 5/xfcbD2AqqIB+ayxXUfv7b1htth8eIVkzLB8/cqmdeVWcwbCnV5WlZktfCr3Wh8x04G4
	 BIUg7aB+IaUDLBYQlI12sBZsyh6KcFNM3SEA6aMzBr3GKrnoYlQ3cbWXZ0TSW8Hiz4i/E
	 fQ33nlPFc4gXwhmhRk+BxfkZ5mUhwWxeFF4kxvFCcAc+v0MOKIKeewYnKUM7n91VZlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OCYOcQ+V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B61606A31C;
	Fri, 13 Nov 2026 00:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OCYOcQ+V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F651F000C5;
	Fri, 13 Nov 2026 00:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794530740;
	bh=Ew+mFBtkvyHaX4L3mOy9ZGheiU3yA4UH3r5Gz26alrc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=OCYOcQ+VJQ0nWkSSupczoGkT7Yef/ZfSiq9KKKyQnIDexKNJgpi8PmAoDrQpXwvgF
	 6qalZHJqwbKu+eGep31ztL/IzaojTLv/BIGJh4UwGZqZAXHAqjUdujcwQiXFreIXfg
	 mfpu2DJ+QT4B3Yz/4frgZfIkF81uSMb2m837Omy5cSRdcsI5YGLNwMNiOvVI1IPCQA
	 ZudpZRRzGsWqSWFirrUD5fY21eMIxh00ELa+CqWgg0Mfiy5vtEF9gUmv/G9NO30mTT
	 SsdTGagxzuZAqp/fu+KDtPTOGoYg6X1NSyOsboDl63tflr/TjxDzShQTooGNUXWfhw
	 f5Sug0462K5Xw==
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
Subject: Re: [PATCH v2 02/20] kbuild: unify static coverage instrumentation
 as COVERAGE_PROFILE
From: Nathan Chancellor <nathan@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Chuck Wolber <chuck@wolber.net>, 
 Dmitry Vyukov <dvyukov@google.com>, Jonathan Corbet <corbet@lwn.net>, 
 kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Marco Elver <elver@google.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Peter Oberparleiter <oberpar@linux.ibm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
 workflows@vger.kernel.org, Konstantin Khorenko <khorenko@virtuozzo.com>
In-Reply-To: <20261103015238.3780910-3-sashal@kernel.org>
References: <20261103015238.3780910-1-sashal@kernel.org>
 <20261103015238.3780910-3-sashal@kernel.org>
Date: Thu, 12 Nov 2026 17:45:18 -0700
Message-Id: <179453071828.814257.7183190179491150551.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2607; i=nathan@kernel.org;
 h=from:subject:message-id; bh=sUhiWgHmxEGxdGgWqPkGj9bsJrQRKZaRFqCuUxknUv4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnfYpcmTbrfpm2V/6p3o29g7nazz+1FYskLUvXEjzwJf
 D+d9fivjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRF2EM/6tDA6fL97xlNg33
 8/Xj/X3j8GPn/JIl/3Zf1p/nmLjLYz0jw45ZG02E12t/XXF515q0tLg189g/uXvPs3ys4ZY/s6L
 EkxEA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> The gcov plumbing is written for a single coverage implementation: the
> per-object and per-directory knobs are called GCOV_PROFILE, the flags
> are CFLAGS_GCOV, and every dependency on "coverage instrumentation is
> present" spells it as GCOV_KERNEL. Make this generic so that further
> coverage implementations can share it instead of growing parallel
> copies:
> 
>  - The coverage implementation becomes a choice ("Code coverage
>    measurement"), with gcov as its only member besides "None" for now.
>    COVERAGE_KERNEL is set whenever one is selected. allyesconfig and
>    allmodconfig keep selecting gcov through a COMPILE_TEST default.
> 
>  - GCOV_PROFILE_ALL becomes COVERAGE_PROFILE_ALL. The old symbol is
>    kept as a transitional one so that existing configurations keep
>    profiling the entire kernel.
> 
>  - GCOV_PROFILE[_obj.o] becomes COVERAGE_PROFILE[_obj.o] tree-wide,
>    with unchanged precedence (object, then directory, then
>    COVERAGE_PROFILE_ALL). Out-of-tree modules that use GCOV_PROFILE
>    need the same rename.
> 
>  - scripts/Makefile.gcov sets CFLAGS_COVERAGE instead of CFLAGS_GCOV.
> 
>  - The per-subsystem opt-ins GCOV_PROFILE_{NETFILTER,IPSET,IPVS,RDS,
>    AMDGPU,URING,FTRACE} become COVERAGE_PROFILE_*, again with the old
>    names kept as transitional symbols. The rds selftest is updated.
> 
>  - Dependencies that are about instrumented code rather than about
>    gcov (LTO, the KCFI integer normalization workaround, the longest
>    symbol KUnit test, the per-subsystem opt-ins and objtool's
>    --no-unreachable) now use COVERAGE_KERNEL.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Sashiko's comment around tools/testing/selftests/net/rds/config.sh seems
relevant though.

> [ ... 622 lines skipped ... ]
> +config COVERAGE_PROFILE_ALL
> +	bool "Profile entire kernel"
> +	depends on !COMPILE_TEST
> +	depends on GCOV_KERNEL && ARCH_HAS_GCOV_PROFILE_ALL
> +	default GCOV_PROFILE_ALL
> +	help
> +	  This option activates coverage instrumentation for the entire kernel.
> +
> +	  If unsure, say N.
> +
> +	  Note that a kernel compiled with profiling flags will be significantly
> +	  larger and run slower. Also be sure to exclude files from profiling
> +	  which are not linked to the kernel image to prevent linker errors.

Can you remove this sentence either in this change or a prerequisite
one? It is not needed after commit 9c2d1328f88a ("kbuild: provide
reasonable defaults for tool coverage").

-- 
Cheers,
Nathan

