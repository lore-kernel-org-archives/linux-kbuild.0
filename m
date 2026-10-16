Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9D1517BB5
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Oct 2026 15:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165307; cv=pass; b=eZMshKh5u4F4JlcKarPjjbJHkJK0trastSqDIfosD5w6revbwZFQB1yGEeGE5fUw5XrA0HUK1cWscT3qYqbsq+ioMRofzAx4wAUZ59GZf/TOQDzPWarSXXltaLavilNoWToPdL4DafBKC0xVV8yy6Zi5DqOmzC5dyOA68B1ZTiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165307; c=relaxed/simple;
	bh=EdkSpCj7hNZcxLPGAmr5Svs9uzq/yo5MUONBoId45GE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sUbNY/q2CZPChC2Dq41mGBOSHDmOivA2JeQHaXR93NGd7ldIebBBxs6ZSRRmdFJ7BrVOZyeg2LIEwN+wiy1u+1zWaxvPvMiMQSdzM6i4FE1o1DSm/L9CKUbhbuPx5CKsT/gbKv/sJsR7JGnFbBOtv99RkTRN1PvDSNedGpXAaek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SpTnDsq8; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SpTnDsq8"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-533202fe429so367061cf.0
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Oct 2026 08:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792165304; cv=none;
        d=google.com; s=arc-20260327;
        b=rfnfgUM2dv7v3zD4FarzmwAMBtANYESMgS8xkby/eDcUxMAfrRgzq5KoJCffOkeRA8
         Nr59xvZde0oPKAI9EQKVmUdmnr8SVDjhwRa0jf6/B7bq+GxZDUw3O6T1mNZLEZcM1dYY
         vZxI0LkGQkv8d8Utkfh2ig69mUAYl399GM6DmX5ZCZYJ/amaECh/5vQa80K+X1ySwrCA
         JtMsjsR29LWh/r/LcmtxxP80xn4vgojXAa09rEbFL7b7QQE96+M2E/jlHMcL6W1nsmlG
         aGu4sx9bCQ3WXnHW67bDJaU2T1/NDInF6ZIfx7QX15bA7+ttloF+7BteLqjSmPYN4us0
         TzOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w/6QFU6AYA8TWsY/UeVE0scsevyNdyU2Km01Cay74S0=;
        fh=X8hltKXDNEznWWG3qzl8ZyyLGCSWarFDU8tspBlEtto=;
        b=QxTKiHAOxZwagQ3YUA4GZe0QR9qVk2HAqTZW6WuipdsUCCZNNMT3SfJB44MwGvp116
         MbS7A6zrhr2GEYr+Jixw6vwlVmcrA60fblYUGHbbSKsc3jyFQ9RGRA8VuBknZha4wSXX
         CazNM+60xKlF7p3HSRyGjbveAbyof6VP4eVobzicObKaa5fgVhw4ev6JvV/yNru/qitJ
         o2erO6PEEWdquLp16e67J+OP+BrVUz9gkHS7C7fewt+EVgIfEkGNYugXBJB3T12oxnVv
         xG5rS2e8OsodZyk0zByV06+jnhRBKhbfDFdICg4Y5TjzKmL7KEfOQMi1HRle1lGURjML
         IA4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792165304; x=1792770104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w/6QFU6AYA8TWsY/UeVE0scsevyNdyU2Km01Cay74S0=;
        b=SpTnDsq8X7VkO0CvYXgjhQ6CWiNrIPmallUfl+G+1LhHyQO+w1rT2xHWAKVKI0Hjk2
         IQsXjIrBm2FxqTIH/6e1HkBaQ+z2e7pbaGq+JAx+d1fnopP8mhjPXLko7ZEXNYypanIr
         CdB6/IMYo2R3P/DpFRQlqyD7TnbFO6IeWNM5cnRPknQw0GT87vT7PZZj1RuO/YBvZ8LT
         fM9uaifDgeCGk+sEOK/nm1Y9OBqGdGdCIHNqrLnulbhl+jR0/+g541TEVOXpoY/GVuaT
         n6UMZql600Bjy6WFAo0e7tEITVBlomFp2F7uzvUw+QdlCxx/Gxb+rIoT5N6lfSJ1/pnP
         psNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792165304; x=1792770104;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/6QFU6AYA8TWsY/UeVE0scsevyNdyU2Km01Cay74S0=;
        b=v1R9nym4qe04frcGrG1l4ipd6HHyXgdfDHay1TQIRbYwRAE+zjVLfACxwoCPrzrrvI
         muRtoDSTZeWF6MbLocVGcAGG8AWEbW/KWFfinjQIwQHE+PwcCRER+gI3uzHP0/4AQB/2
         SA3Msf9+fh9CFdCtep/hd5B8M+Cgu59kxTEoRaXtd4f+yEj5C9HyYHmXmb1iatosIelx
         5pcvfz3h/WHG8pF+uHRQjYFkpLIKTpDTT+xDTd5/cDBUDjIyPDsQcLPmZfYXfve7s30I
         lCcn2CZOdXBkoaLNYS4WhRVE2f7Bl0wQUpOgt4W4PyUdHTlqNU9H1gonO/cLTl0m3lWP
         7VEw==
X-Forwarded-Encrypted: i=1; AKwUvBy6PqeVR+eJfHd4AoWZaorNf28vPr2SPYHvPaSfNu3zj7h+1JcONV36r2KStfv46goDjPJTwrlFtRdrIFQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMhCy2craeYbaxZ1J2l3YJsVEw1hLwIuiqiUdwWHXdOOoVRzmS
	PPAjOS1hng4dOY/fZoyWu9+DMkvtxcI1mXTQ6I+d+Bkxq54HXu0YbnjytIPOq/pLl685dmH3ttq
	3w/hcBrSFdxwWlyLq0Tc6MuPYDAZoAqDfe0C3HKHK
X-Gm-Gg: AYBFou1eX+dDqX/yurJfG79AEOC6Bc3o6FkWtZ1IE/iWHiilkEYfGl0qGQLLmxDvYBc
	eaTOseq4VY6OoUAH+LRMiw9BuH5xEgE7nOIfUd2ct38THxDyaOiz1EIXz1LvookAHuk/QblxSQU
	2NZmEozJuLP9pdMXwAwZvqwCe4MSKWVbQCrdRucgAoZQKk4VuzdFulsDfQSjTFzHNIHTOqGiJnX
	qtv4hJjwh7aYlVqvwkkUxcj/DgjRYaODOju1RNveopGa4YNlBRj67FyuNpdn4krrssoTDu7IlRy
	d130DXlPXyYZjH8y1RFaRN2bd/ORQjbN68JGKBn+W6KTL8WOBzp7yRYH+zmPGtkuurWHt2O89sh
	LwobgpxVRIsk=
X-Received: by 2002:a05:622a:4886:b0:533:9731:f0f1 with SMTP id
 d75a77b69052e-5362b3e7881mr20460851cf.10.1792165302889; Fri, 16 Oct 2026
 08:41:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016143143.3613501-1-sashal@kernel.org> <20261016143143.3613501-4-sashal@kernel.org>
In-Reply-To: <20261016143143.3613501-4-sashal@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Fri, 16 Oct 2026 08:41:29 -0700
X-Gm-Features: AclHuK9Nw6uxiW7Jt1G3pjd76v05weMuSMdw0gbbOHi_Cx8XoClXGbI2Vr90vjg
Message-ID: <CAP-5=fV_A+k-_g683q7n897YMudBwwvQPkS_cKRSdOxkEYFa0Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/7] perf build: Add MINIMAL=1 to build without
 optional features
To: Sasha Levin <sashal@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 7:31=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Turning off every optional feature takes a long list of NO_* variables,
> and the list has to follow features as they are added and renamed. The
> one in tests/make for make_minimal has fallen behind: it leaves
> libtraceevent, jevents, slang, AIO, LZMA, zlib, libLLVM and Rust to be
> detected, so a make_minimal build still needs libtraceevent and python.
>
> Add MINIMAL=3D1, which turns off every optional feature, the BPF skeleton=
s
> and the shellcheck run. perf then builds, natively or cross, with no
> library beyond the C library and without python, pkg-config, clang or
> rustc, and the result does not depend on what is installed on the build
> machine.
>
> A MINIMAL=3D1 build also leaves out the notices that post unwind and
> python support are disabled, which it asked for, and the one about the
> pkg-config search path for cross builds, as pkg-config is not needed
> then.
>
> It is handled in Makefile.perf rather than Makefile.config, as
> Makefile.config is included after the pkg-config and shellcheck setup.
>
> Use it for make_minimal in tests/make.
>
> Suggested-by: Ian Rogers <irogers@google.com>
> Link: https://lore.kernel.org/r/CAP-5=3DfWFY-tpJz2vcBZvurwdZY5gwd8cuTemE9=
q1rtZ0Vi0dng@mail.gmail.com
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  tools/perf/Makefile.config |  8 ++++++--
>  tools/perf/Makefile.perf   | 40 ++++++++++++++++++++++++++++++++++++--
>  tools/perf/tests/make      |  8 +-------
>  3 files changed, 45 insertions(+), 11 deletions(-)
>
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index 4d5993da9f945..137c9e120670b 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -742,7 +742,9 @@ dwarf-post-unwind-text :=3D BUG
>  # setup DWARF post unwinder
>  ifdef NO_LIBUNWIND
>    ifdef NO_LIBDW
> -    $(warning Disabling post unwind, no support found.)
> +    ifneq ($(MINIMAL),1)
> +      $(warning Disabling post unwind, no support found.)
> +    endif
>      dwarf-post-unwind :=3D 0
>    else
>      dwarf-post-unwind-text :=3D libdw
> @@ -828,7 +830,9 @@ endef
>
>  PYTHON_EXTENSION_SUFFIX :=3D '.so'
>  ifdef NO_LIBPYTHON
> -  $(call disable-python,Python support disabled by user)
> +  ifneq ($(MINIMAL),1)
> +    $(call disable-python,Python support disabled by user)
> +  endif

Thanks for the clean up!

In perf-tools-next/linux-next both LIBPYTHON and LIBPERL are gone
(context in https://lore.kernel.org/linux-perf-users/20260926062029.800743-=
47-irogers@google.com/#t
).

>  else
>
>    ifndef PYTHON
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 29cfd44c427f3..c770077e7d392 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -129,6 +129,9 @@ include ../scripts/utilities.mak
>  # Define GEN_VMLINUX_H to generate vmlinux.h from the BTF.
>  #
>  # Define NO_SHELLCHECK if you do not want to run shellcheck during build
> +#
> +# Define MINIMAL=3D1 to build without any optional feature, needing only=
 a C
> +# compiler and library, flex and bison
>
>  # As per kernel Makefile, avoid funny character set dependencies
>  unexport LC_ALL
> @@ -174,6 +177,37 @@ endef
>
>  LD +=3D $(EXTRA_LDFLAGS)
>
> +# MINIMAL=3D1 is handled here rather than in Makefile.config, which is i=
ncluded
> +# after the pkg-config and shellcheck setup below
> +ifeq ($(MINIMAL),1)
> +  NO_LIBELF :=3D 1
> +  NO_LIBDW :=3D 1
> +  NO_LIBTRACEEVENT :=3D 1
> +  NO_JEVENTS :=3D 1
> +  NO_LIBPYTHON :=3D 1
> +  NO_LIBBPF :=3D 1
> +  BUILD_BPF_SKEL :=3D 0
> +  NO_SLANG :=3D 1
> +  NO_DEMANGLE :=3D 1
> +  NO_BACKTRACE :=3D 1
> +  NO_AIO :=3D 1
> +  NO_ZLIB :=3D 1
> +  NO_LZMA :=3D 1
> +  NO_LIBZSTD :=3D 1
> +  NO_LIBNUMA :=3D 1
> +  NO_LIBLLVM :=3D 1
> +  NO_CAPSTONE :=3D 1
> +  NO_LIBPFM4 :=3D 1
> +  NO_LIBDEBUGINFOD :=3D 1
> +  NO_BABELTRACE2 :=3D 1
> +  NO_SDT :=3D 1
> +  NO_JVMTI :=3D 1
> +  NO_RUST :=3D 1
> +  NO_PERF_READ_VDSO32 :=3D 1
> +  NO_PERF_READ_VDSOX32 :=3D 1
> +  NO_SHELLCHECK :=3D 1

We should expand this with NO_MYPY and NO_PYLINT for the
perf-tools-next version.

Thanks,
Ian

> +endif
> +
>  # Some distros provide the command $(CROSS_COMPILE)pkg-config for
>  # searching packges installed with Multiarch. Use it for cross
>  # compilation if it is existed.
> @@ -195,8 +229,10 @@ else
>        PKG_CONFIG_LIBDIR :=3D $(PKG_CONFIG_LIBDIR):/usr/local/share/pkgco=
nfig/
>        PKG_CONFIG_LIBDIR :=3D $(PKG_CONFIG_LIBDIR):/usr/share/pkgconfig/
>        export PKG_CONFIG_LIBDIR
> -      $(warning Missing PKG_CONFIG_LIBDIR, PKG_CONFIG_PATH and PKG_CONFI=
G_SYSROOT_DIR for cross compilation,)
> -      $(warning set PKG_CONFIG_LIBDIR for using Multiarch libs.)
> +      ifneq ($(MINIMAL),1)
> +        $(warning Missing PKG_CONFIG_LIBDIR, PKG_CONFIG_PATH and PKG_CON=
FIG_SYSROOT_DIR for cross compilation,)
> +        $(warning set PKG_CONFIG_LIBDIR for using Multiarch libs.)
> +      endif
>      endif
>    endif
>  endif
> diff --git a/tools/perf/tests/make b/tools/perf/tests/make
> index d2c2f526e1db0..dbbc971a144b2 100644
> --- a/tools/perf/tests/make
> +++ b/tools/perf/tests/make
> @@ -115,13 +115,7 @@ make_install_prefix       :=3D install prefix=3D/tmp=
/krava
>  make_install_prefix_slash :=3D install prefix=3D/tmp/krava/
>  make_static         :=3D LDFLAGS=3D-static NO_PERF_READ_VDSO32=3D1 NO_PE=
RF_READ_VDSOX32=3D1 NO_JVMTI=3D1 NO_LIBTRACEEVENT=3D1 NO_LIBELF=3D1
>
> -# all the NO_* variable combined
> -make_minimal        :=3D NO_LIBPYTHON=3D1
> -make_minimal        +=3D NO_DEMANGLE=3D1 NO_LIBELF=3D1 NO_BACKTRACE=3D1
> -make_minimal        +=3D NO_LIBNUMA=3D1 NO_LIBBIONIC=3D1 NO_LIBDW=3D1
> -make_minimal        +=3D NO_LIBBPF=3D1
> -make_minimal        +=3D NO_SDT=3D1 NO_JVMTI=3D1 NO_LIBZSTD=3D1
> -make_minimal        +=3D NO_CAPSTONE=3D1
> +make_minimal        :=3D MINIMAL=3D1
>
>  # binutils 2_42 and newer have bfd_thread_init()
>  new_libbfd :=3D $(shell echo '#include <bfd.h>' | $(CC) -E -x c - | grep=
 bfd_thread_init)
> --
> 2.53.0
>
