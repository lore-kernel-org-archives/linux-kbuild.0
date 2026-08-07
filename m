Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7876F3BB9E1;
	Fri,  7 Aug 2026 22:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786140927; cv=none; b=ATWRHxZPmsBBw/pXE9uM7z4cfXId+ZbiVQC/GAEIwjH5CZ+o4vK2xmVhHllFWVuoxL6YfH12D9wzAOqumWbbkKNwouzPy8pQyOVUW2RKPOp4mDMtNibH3IFezYCB8bVeShJgubsZ7E3wOtqZliUDm9eCTpDVCOM6q6T6dXQht9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786140927; c=relaxed/simple;
	bh=ITezdCqb6UvqFxOKF3NruAAoh7/dgoHpTa2b82EUrVU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=SFeXy3dmmzTtTDK5CD0FjWqk7Dzg7q7b5BGM8ww+Dde6vNAPsr8p2zNpW6QNUw6VOsyt+W3HBpAPq3AcnM+xn3eKI1O22q3Pe+DMu+BzC7KcI8D2tOsbOd6H0QmT+dPqGckSzrzjvtbfBdGslSaArGam/IMU2Okvy6BHrz92NvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i4oGAhNa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4oGAhNa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 698841F000E9;
	Fri,  7 Aug 2026 22:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786140926;
	bh=S6ey6y9meEXizlCTmW28xycOLBI0cWx+kV2PGC66EDI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=i4oGAhNaLJv2bxpQJEj9RiZI8N36dtXw6zIG9Lkiq85+i/OcaYIaTU9neQOzx2Lts
	 2TTI80T2G/UKNmghANICRAXy4hCwns6ihim7obZf/YN7gSOWFD0XrgpPI0Zj0aPsEu
	 IGjs3c9oxBjKfwKl72Ftaesgk8AItO1bjy3AP4DAIhVljpopIbNDUCa2JbB13fqrdx
	 PUk8ZwUC/nYnKyH0T0L53yPQbomwwQNR0kBAcQ66TjEJ/KtAMEs4Wg6BLk+jLTO0O4
	 xyHTMZ02Cyzjp+eBDVTY5MsoRbfCerfVANTCUcb0MByFsCjf9vgTKBNtvoa1DtBQfG
	 iCTWmJ+Ql2otQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] kbuild: let the environment set HOSTPKG_CONFIG
From: Nathan Chancellor <nathan@kernel.org>
To: Trevor Woerner <twoerner@gmail.com>
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Gang Yan <yangang@kylinos.cn>, 
 David Disseldorp <ddiss@suse.de>, Miguel Ojeda <ojeda@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Luis Augenstein <luis.augenstein@tngtech.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Andrew Jones <andrew.jones@linux.dev>, linux-kbuild@vger.kernel.org
In-Reply-To: <20260805055438.3482019-1-twoerner@gmail.com>
References: <20260805055438.3482019-1-twoerner@gmail.com>
Date: Fri, 07 Aug 2026 15:15:17 -0700
Message-Id: <178614091702.32781.13796520858880316981.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3021; i=nathan@kernel.org;
 h=from:subject:message-id; bh=ITezdCqb6UvqFxOKF3NruAAoh7/dgoHpTa2b82EUrVU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFllEb/fNlWsC9TOcethPFHMaiH7bvruwJP7rl05ob28o
 Wm50XGvjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRM4WMDLfnVlq3WLzLC1p9
 YfrWCy8N+X02BOvazHouxnTWk/FJez3D/4S5r40uHjbflsHMq3xDN7CGQ2Nig6G4QsmXqRmZQX0
 C7AA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> HOSTPKG_CONFIG was added so that "tooling that builds the kernel" could
> choose which pkg-config the host tools ask about their dependencies, but
> it is assigned with '=', so only a make command line assignment takes
> effect. Exporting it does nothing, silently.

I found this paragraph a little hard to read and parse. I might write it
like:

  HOSTPKG_CONFIG was added so that builders could choose which
  pkg-config is used to query host dependencies. However, it does not
  respect values exported from the builder's environment because its
  assigment uses '=', requiring a make command line variable to override
  it.

> That is surprising, because the other inputs to host program builds do
> honour the environment: HOSTCFLAGS, HOSTCXXFLAGS, HOSTLDFLAGS and
> HOSTLDLIBS are all read from it and documented in kbuild.rst as such.

I am not sure HOSTPKG_CONFIG is entirely comparable to these variables,
which are purely for compiler flags. I would compare it more to HOSTCC,
HOSTCXX, and HOSTRUSTC, which all use '=' and do not honor an
environment value. I am not sure we want to deviate from that here but I
am open to opinions from the other Kbuild folks.

> It also matters. A cross development environment sets
> PKG_CONFIG_SYSROOT_DIR and PKG_CONFIG_PATH so that pkg-config answers
> for the target rather than the build machine. Those settings are correct
> for everything that will run on the target and wrong for a program that
> has to run on the build machine. objtool asks pkg-config where libelf is,
> gets the target's include directory, and compiles a host tool against
> the target's C library headers. Because the directory arrives as -I it
> is not treated as a system header directory, -Wno-system-headers no
> longer covers it, and the build stops on warnings that would otherwise
> be suppressed:
> 
>   usr/include/sys/cdefs.h:486: error: "__attribute_const__" redefined [-Werror]
>   tools/include/linux/compiler.h:123: note: previous definition
>   usr/include/stdio.h:449: error: redundant redeclaration of 'fscanf'
> 
> An environment that knows it is cross building can then say
> 
>   export HOSTPKG_CONFIG="env -u PKG_CONFIG_SYSROOT_DIR \
>                              -u PKG_CONFIG_PATH pkg-config"
> 
> once, in the shell it hands to the user, instead of every make command
> line growing an override. Build systems that already pass it on the
> command line are unaffected.

It would be nice if we could try and handle this situation directly
inside Kbuild somehow (like just unsetting these PKG_CONFIG variables)
but I guess that could mess with cross building tools/perf via the
tools/% Kbuild target... maybe that doesn't matter though. I am not sure
I find the argument of avoiding make command overrides convincing, as I
would expect a build wrapper to already need to support a unified set of
variables but maybe I am just naive. Another option would be passing
this value via MAKEFLAGS.

-- 
Cheers,
Nathan

