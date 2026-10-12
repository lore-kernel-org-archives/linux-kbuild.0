Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52CA4BF92A
	for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2026 22:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791842845; cv=pass; b=sAov/MBnSpip3Ro+VVvOKSFATy4GaVaS2ZBBd6xsI8BeSJRFJYV6p7I5N01jHdTSa98+UdAVISiPF0Krrqszn1Q1W+B/E/Lftn/X4k0c/NMTKmJBxsCwoMCdkLrhmtVEZ9dncGWX2maSyTii1v012kZGO02YJtuhMDhPDv22Jtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791842845; c=relaxed/simple;
	bh=9Hy/4qi1pvOId1S+omXSYSIW36PU+S8k2ljSvieLxAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D75PeqPGMVVxkSozysj1asZP0zYrPv72n2VOEBRZQNkUYqdFe+WFdS5csQhRZPTO75zZicusLHkbWOBkdauIzpuIYgrn1PG/B/DGu4ZOYpweKHsBlSbRCrMMD3ShwFAlZ0e3nGI1r/wW3a7P3zE7sJWjSYY6268fBnCxK+zvmAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TpnRnLml; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TpnRnLml"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53584e7c349so567981cf.1
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2026 15:07:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791842842; cv=none;
        d=google.com; s=arc-20260327;
        b=mTk4iKaqxetK/LBfNSbs2lykMTL0KvIKZhomEeXR9UGhBwhi6sA+uxvTvY292kM1T9
         KM8NJYd7nR1d2IU+xb+PSALsTFFn3W795+vKewphNRkLevRmr4RG8Jq4X6+0a0DlBjc6
         f0lXLEFtNLkE+EnUF9/yc/kJJEA6mVYkXUGZtRo/kGg1m4HX26H32ScXBr7+14wjxA15
         qkqiabbx79b1xAqOuOsnX9QRZzvYNlBIV6KnIuJojyORAT0/ir1B3AB4YWxsEOoWLclf
         gVS+dJ4esn7fknNjQRa0u5hIGtKlrpvWCzTTbnPEu3UH1hyQhYGgUUI/+UVlTKc7A6Gc
         7BBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xfJFs2TCZcZgagXkA7e7DWhX7aMQF/GsCS0/iiphVRw=;
        fh=uxIl1hd+Xr/oO+7KQ/dsU3emD03201Rl4DUXodJtYDs=;
        b=R8SssMpiMsSMxxaLVSAoFZVHdm23NbELluwTXuZOJN4rQ6UL3qLTYV0Dtku17Rxf+7
         lRBeK8Jk4PcOS3CRZTXNTSdkvQQnBYVuXvZm8y+Ng/O/PJ8TSOtoaxUTTtM7j00dLuSF
         fYnCwl8buvBh8+oPKnMdhqJ5y4JKWb5P25nVYQouuNCHhTP0qbjoR49ug9mUksxd9IGx
         +tPeah8YG15RyaqSrr1dVf+OPeTztVXSBRq8CaogV52za3Vv4fffYOAqzTkhFJv0C/ry
         a5w4r21nfVlXbLe7/VjlamF4Q7+NHS/GCz4pXBUbtr2LaReqCYl49IN2jMi4jWeKJ98Z
         G+cQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791842842; x=1792447642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xfJFs2TCZcZgagXkA7e7DWhX7aMQF/GsCS0/iiphVRw=;
        b=TpnRnLmlqhaKUZfz/GJ5a3rcKXygjgsimL0KpuQx+kvhImdHv4P+dCGDftDL2pXICa
         8pDlQpusJQ2YIU3J85m+n77r4cOHi8mcBhRR1axttPYPCtzTcteWlBJo7+reJKvfyo/o
         dgcvRS7dofofLjh4b0uisNkDLKjHafw9faWY1LE5CNRmHiHO8q04MPuDFV8REG/Pj2I+
         oTku59Fcq1bXvneNZq107dmU1eQfpy+f7iAFZcit7kj5xx7MG2GSXl6qX29WZyjZQH5k
         nDY6V8+BLhG7C8EwoDpebfViwsZyvZRRLcwI1v89islnsumQ11dKn1AiA/lG8Adm9byP
         Yv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791842842; x=1792447642;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xfJFs2TCZcZgagXkA7e7DWhX7aMQF/GsCS0/iiphVRw=;
        b=esw8/sRGfz2kgZIuSQkmDF3dF0GGiu4LwUdpLXpL17VMQEj5WTuAnGd5IgHCkwUVWu
         NKI3JIRS46LQ4wgYRmK2syIrq9+qxk+bSnmpUhV2COT5v/viiFr73e7Coi1jVEUYbVMb
         8mExJkstqk4ENwAC48rS/e2LHSa7E+HtRrSTMiHFwIWqAY0fFTWqNTfpJAfQyIis40YX
         RKxMZbVW9DqBpYWwS4XEtFHJAV/ib/EWOxeaGEyNZVITR4I34uKXjI37HKAfs21Dcy5P
         MnvQ2dalr3Ljo7wtzs4wDKIAX5BBNw0vNmzKAwLzm1UzuB6gwapI8zNtEjv506oI2DeR
         l31A==
X-Forwarded-Encrypted: i=1; AKwUvBxd5bBK6IqUhUrD4l3whzmSvFRzEKNB9f88WSfZron3DDStCamm4x5+qW7VYCv8ZnC3CWeO+1V/ePEw+m0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLh0qnci+NCkJ/ve2nWmRU7O/CGnv1zQUVEmjKmSRhcQ0BaOp9T
	yimy6ymQ4wx9HRBbGvW4NIRT2BOszrMlWddRRTj6he+CWzCPmdQhxzUdkNK4B4mSxuX72JjFFr2
	VnKrhCAwHu0UED2OqgQ+6g9Oggj8/T66xxfsG88Dv
X-Gm-Gg: AYBFou38dTKNV+jXXVTssXnF/+HyD9IiE/fJWe5N7ZnsnTMjTUYB6rlmBEx/2A4Y+N/
	NBJxmsZy8UdckpWB7GK+TqgmobXoBDFuCE4apKuMKQfAHPdzEKkSHMCNXgnL9mvrGWMOQ1LE0Oi
	voke3q52m9wsUR6b1WRSV4h228LJsZ4qpQknuvLTqEmQkUj7T3GzMZUTHE/EWvemnrjtOtA1LcO
	qWHd7osu9XhcfZr3E34ah1EzI+dHT9FBD+pU9s2Qlkt2XhYwozvQ4J4fZxUOGO8aqXNTszZ+k8c
	KLseaLhq1S9FKzs1ijz5oDqy9rFd1FkLqvt4kCJYggmordYEyiTNZEWVdjRDzZOH37QAxUlMOuc
	C+8z+eUu34A==
X-Received: by 2002:a05:622a:581a:b0:530:2f98:cebb with SMTP id
 d75a77b69052e-535b4f31acfmr40093421cf.11.1791842841851; Mon, 12 Oct 2026
 15:07:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011233647.2454648-1-sashal@kernel.org> <20261011233647.2454648-4-sashal@kernel.org>
In-Reply-To: <20261011233647.2454648-4-sashal@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 12 Oct 2026 15:07:10 -0700
X-Gm-Features: AclHuK8mlJBdkDo_qjZnD8vvswEhWWRcu7xDXqAmSuD53qO6NxMidI4YTyg40zw
Message-ID: <CAP-5=fWFY-tpJz2vcBZvurwdZY5gwd8cuTemE9q1rtZ0Vi0dng@mail.gmail.com>
Subject: Re: [RFC PATCH 3/6] tools: build perf in tools_build
To: Sasha Levin <sashal@kernel.org>, linux-perf-users@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 4:36=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Add CONFIG_TOOLS_BUILD_PERF. perf is built as it is built standalone,
> with optional features enabled when their libraries are installed, and
> with -Werror following CONFIG_WERROR. The feature table is left out of
> the kernel build log.
>
> CONFIG_TOOLS_BUILD_PERF_MINIMAL turns every optional feature off
> instead, so the result does not depend on the build machine. allmodconfig
> and allyesconfig turn it on.
>
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  tools/Kconfig         | 15 +++++++++++++++
>  tools/Makefile.kbuild | 19 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/tools/Kconfig b/tools/Kconfig
> index bf0643b39b86e..488f439592150 100644
> --- a/tools/Kconfig
> +++ b/tools/Kconfig
> @@ -59,6 +59,21 @@ config TOOLS_BUILD_IIO
>         help
>           Build tools/iio (lsiio, iio_event_monitor, iio_generic_buffer).
>
> +config TOOLS_BUILD_PERF
> +       bool "perf"
> +       help
> +         Build tools/perf. As in a standalone perf build, optional
> +         features are enabled when the libraries they need are installed=
.
> +
> +config TOOLS_BUILD_PERF_MINIMAL
> +       bool "Build perf with all optional features disabled"
> +       depends on TOOLS_BUILD_PERF
> +       help
> +         Turn off every optional perf feature, so that the result does
> +         not depend on which libraries the build machine has installed.
> +         allmodconfig and allyesconfig turn this on, which keeps their
> +         builds the same on every machine.
> +
>  config TOOLS_BUILD_SPI
>         bool "SPI tools"
>         help
> diff --git a/tools/Makefile.kbuild b/tools/Makefile.kbuild
> index 820a2d9a3893b..62fd494253eca 100644
> --- a/tools/Makefile.kbuild
> +++ b/tools/Makefile.kbuild
> @@ -73,6 +73,25 @@ PHONY +=3D $(tool-targets)
>  $(tool-targets): tool-%: FORCE
>         $(call build,$(outdir)/$*,-C $(toolsdir)/$* O=3D$(outdir)/$* CC=
=3D'$(call escsq,$(tools-cc))',,TOOLS_BUILD_$(shell echo $* | tr a-z A-Z))
>
> +# perf, without the feature table in the kernel build log
> +perf-flags :=3D CC=3D'$(call escsq,$(tools-cc))' FEATURE_DISPLAY=3D WERR=
OR=3D$(if $(CONFIG_WERROR),1,0)
> +
> +# Every optional feature off, so the result does not depend on which
> +# libraries are installed
> +perf-flags-$(CONFIG_TOOLS_BUILD_PERF_MINIMAL) +=3D \
> +       NO_LIBELF=3D1 NO_LIBTRACEEVENT=3D1 NO_JEVENTS=3D1 NO_LIBPYTHON=3D=
1 NO_LIBDW=3D1 \
> +       NO_LIBBPF=3D1 BUILD_BPF_SKEL=3D0 NO_SLANG=3D1 NO_GTK2=3D1 NO_AIO=
=3D1 \
> +       NO_BACKTRACE=3D1 NO_DEMANGLE=3D1 NO_LZMA=3D1 NO_LIBZSTD=3D1 NO_ZL=
IB=3D1 \
> +       NO_LIBNUMA=3D1 NO_LIBUNWIND=3D1 NO_LIBLLVM=3D1 NO_CAPSTONE=3D1 NO=
_LIBPFM4=3D1 \
> +       NO_SDT=3D1 NO_JVMTI=3D1 NO_LIBDEBUGINFOD=3D1 NO_BABELTRACE2=3D1 N=
O_RUST=3D1 \
> +       NO_SHELLCHECK=3D1 NO_PERF_READ_VDSO32=3D1 NO_PERF_READ_VDSOX32=3D=
1

It seems unfortunate to maintain this list here, we also have a
minimal target as a build test here:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/tests/make?h=3Dperf-tools-next#n123
I wonder we should just add support for a MINIMAL=3D1 variable in
tools/perf/Makefile.config and have that set these other variables.

Thanks,
Ian

> +
> +__tools_build: $(if $(CONFIG_TOOLS_BUILD_PERF),perf)
> +
> +PHONY +=3D perf
> +perf: FORCE
> +       $(call build,$(outdir)/perf,-C $(toolsdir)/perf -f Makefile.perf =
O=3D$(outdir)/perf $(perf-flags) $(perf-flags-y),,TOOLS_BUILD_PERF)
> +
>  PHONY +=3D FORCE
>  FORCE:
>
> --
> 2.53.0
>
