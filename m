Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530745;
	b=cVMmYSx8edoBrYDdC/19/7w1dNGDzfTwg2xs80d5DaUgLXb5qcNKvH47CaI+fSiZ67+R
	 VD0EV5qsY/ZMn+ZVJg6pAclwm+gW9ijaIttk8qso3gmzzJQVc6xhVtAmsE+jdhyQBKxUT
	 bywV9BdcihIikkGYTS4am+Fg/lQp7owCa8cJE1BHTl9upFqe2eDqcr333/uwYakW9ulfF
	 rwDeDlszfGitWHK+OABqZi5NbakOx6ADLynhIohNarZ8aQKc8NGI3o4jqhdeF7+LW1M71
	 t7T6UDIYLGIL2n85OOeLd7MS2QoJb0600zh+MjyHqzWs/6DSDpL1o5+4y+DtagqQCdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530745;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=KY5kDp14poeFBGtqNIrB31vAeISG/NjBxcQdpcZh9x0=;
	b=OoEJzH1DFJNrUA8WSB8jnANjVouG60Do5yWX2pBd9z/GW/aeL46IBSP/OiKV57Lr85Fi
	 HDu2dOZnDHZmZ27HmRrdN52MGRptJHYd2opDLfZFEfmyO5iuhu5HLNatZES8PNrZjBsnF
	 HJy32LsMJKpC3kdBDPD9+Dy0hlIN513d/rSzDUPD9euMc7qkPpPqf8g/oAXPdZ510qG+q
	 2I6B/YERx7bzom3XgJIrxX+jBZqC3g2270kJEIRhapAOceXGMgylYfPJ1aZbkasqwgCwG
	 TsLIsZjlyHg/W5uQK0PXXj/xmzb+nFoGoifdG8OCa2u75XiT6ahcPg/dAuKsm/LSXzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f8QF2j8p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0961C606A32D;
	Fri, 13 Nov 2026 00:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f8QF2j8p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066F61F000C5;
	Fri, 13 Nov 2026 00:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794530744;
	bh=KY5kDp14poeFBGtqNIrB31vAeISG/NjBxcQdpcZh9x0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=f8QF2j8ptBripY6sRS8V+ZDSMpZao5SU6Jd1+fgbGc9Wb/1tDDW9ZvcE5k2X1zMb0
	 Ohvvw+RyHlu4hGxcU/ssY1JrjBKZ/kEUcWgxHd/iV5R7oHStWbnbZotAB3qXugl9ru
	 k5fXe9YcYGa5eEGnWsGOFEVzyQA9yxsGdDPxNrGsuR5HTsgkcHzzWruzza320RGfUH
	 pLMB51eWD2z96wQ6gBONlBLkKa1IJv2vSgkrS5NotyrOsBz3mHK54Mx9UyKZQKHbwW
	 3vpkMbvULwjSdbm/HbFT3VQ10YyDVsRHE55lnRunS/Lsjyv1ahe/WeTZH7BP7E+pQd
	 IZJv1OaJ+/GnQ==
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
Subject: Re: [PATCH v2 16/20] coverage: add MC/DC measurement
From: Nathan Chancellor <nathan@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, Wentao Zhang <wentaoz5@illinois.edu>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Bill Wendling <morbo@google.com>, 
 Chuck Wolber <chuck@wolber.net>, Dmitry Vyukov <dvyukov@google.com>, 
 Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
 Marco Elver <elver@google.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nsc@kernel.org>, 
 Peter Oberparleiter <oberpar@linux.ibm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>
In-Reply-To: <20261103015238.3780910-17-sashal@kernel.org>
References: <20261103015238.3780910-1-sashal@kernel.org>
 <20261103015238.3780910-17-sashal@kernel.org>
Date: Thu, 12 Nov 2026 17:45:18 -0700
Message-Id: <179453071828.814257.2587871795236228245.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1391; i=nathan@kernel.org;
 h=from:subject:message-id; bh=75CuO+xG+V9JVao6G3ZBK2tMjQkp1WF0lq+KgCZ1jhg=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnfYpdqxAUecH/Nf5j5QMji0kylx1Xz9B5ff3Y8Y1JdN
 Q/n9u99HaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiizkY/llEabAu2y9ukqtr
 k/Ox4Pd2e6E3jdeXFMhtLZmulbhknS7DPwOWPOH6FxZNha/cTRaqzfp2Xf9kDofkQ53skMA/bkc
 uMQMA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> [ ... 63 lines skipped ... ]
> +config COVERAGE_MCDC
> +	bool "Measure modified condition/decision coverage (MC/DC)"
> +	depends on LLVM_COV_KERNEL
> +	depends on CLANG_VERSION >= 220000 || !WERROR

I don't have a super strong opinion here but I think I would rather see
this just hard depend on Clang >= 22.1.0 rather than let these warnings
pollute the build without -Werror. Maybe something for the future if we
get too many reports.

> [ ... 49 lines skipped ... ]
> +ifdef CONFIG_COVERAGE_MCDC
> +CFLAGS_COVERAGE	+= -fcoverage-mcdc \
> +		   -Xclang -fmcdc-max-conditions=$(CONFIG_LLVM_COV_MCDC_MAX_CONDITIONS)
> +# Decisions that MC/DC leaves out are nothing to fix in the code. Disable the
> +# warnings here rather than in CFLAGS_COVERAGE, so that KCFLAGS=-Wpgo-coverage
> +# can list them. Clang only allows this since version 22.
> +KBUILD_CFLAGS	+= $(call cc-disable-warning, pgo-coverage)

Please make this:

  KBUILD_CFLAGS += $(call cc-option,-Wno-pgo-coverage)

This might even want to be in scripts/Kconfig.toolchain as

  config CC_OPT_WNO_PGO_COVERAGE
    # clang-22: https://github.com/llvm/llvm-project/commit/80887c7de9d82c809555f52948af1a5d7484e28
    # gcc: not supported
    def_string "$(cc-option-str,-Wno-pgo-coverage)"

so that it will be easy to clean this up when we use clang-22 as a
minimum version.

-- 
Cheers,
Nathan

