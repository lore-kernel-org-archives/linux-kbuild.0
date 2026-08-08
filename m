Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD386DCE1;
	Sat,  8 Aug 2026 05:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786168213; cv=none; b=Um8RJ386z0EBBm8U5RAjzz0ANWH/xvlVDOeOCXU4NT+rf1n5ea2RN7apC1HNqpkLX5NDT8Y18GeSHh5Otk4aa4UsaxCDetJgIRktgzVZbSm9s6Ki6W6HeX5dvyGLopFmhuFt4+OvMcoN3DHF5lnEYfXzMdAWwKZEmyCrQuu/y/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786168213; c=relaxed/simple;
	bh=yE9JytNoYGPtnWbWlO8L1vmDZy5Ky7DvLVAie5U/l/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HieVcAMuA/lLfptiTgIpT7w4rNv+QD/HwdoGG4JXDoYlrb26iSudFB+5DY04eQMTl/NhY7uEqcf5ZwboMQw7Y7pZk2k09S2yWobnRLsxgHVfm/bzMGvXJWM2lA7+6DxZl4R7vQnt8705KhJyBqu7UHKsAT8955IwJKKMrCCmKfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZA+GnI+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZA+GnI+"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 417EB1F000E9;
	Sat,  8 Aug 2026 05:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786168211;
	bh=BLQuC8sVLOXnQ7Yxqi2Qk8Xn9pnaDhDNAOKDGBqR57U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GZA+GnI+rUiEQpp+JK9lBgiDeSfstgKZXVgDSQohnva3MP1uvpTHhA2nW2WZPuGj1
	 c+Mfxj+2FycaIXwQsxi0Y8+LoX+3gGizEwvk5wpMcV8MpoiQUWylkK4jFamfH41/ml
	 zK1F+0ebgrNQ0fJeb+++1t/rCGUgCkxQxDePNL54lI41Gku9jJH4mVtlT+spYwVagE
	 M3BgCpqBohS5yJQV0Du2idEyr5DpW9Rp+iJ1Jg3w94OuYOKY6tNV1S3aYzgWulyICE
	 TZWKGR3qg5yC775dei5axXGL6eTw6xY+4Zvo1DKmx3mFLGqa8UhJmJCqtPf1lDSKHB
	 6JwWOerd1DJnA==
Date: Sat, 8 Aug 2026 07:31:17 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Trevor Woerner <twoerner@gmail.com>
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Gang Yan <yangang@kylinos.cn>, David Disseldorp <ddiss@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Luis Augenstein <luis.augenstein@tngtech.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Andrew Jones <andrew.jones@linux.dev>, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] kbuild: let the environment set HOSTPKG_CONFIG
Message-ID: <ana_JYJJY5Gqycj6@levanger>
Mail-Followup-To: Trevor Woerner <twoerner@gmail.com>,
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Gang Yan <yangang@kylinos.cn>, David Disseldorp <ddiss@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Luis Augenstein <luis.augenstein@tngtech.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Andrew Jones <andrew.jones@linux.dev>, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org
References: <20260805055438.3482019-1-twoerner@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805055438.3482019-1-twoerner@gmail.com>

[resending from 2026-08-05, as my mail client broke the reply recipient
 list]

On Wed, Aug 05, 2026 at 01:54:35AM -0400, Trevor Woerner wrote:
> HOSTPKG_CONFIG was added so that "tooling that builds the kernel" could
> choose which pkg-config the host tools ask about their dependencies, but
> it is assigned with '=', so only a make command line assignment takes
> effect. Exporting it does nothing, silently.
> 
> That is surprising, because the other inputs to host program builds do
> honour the environment: HOSTCFLAGS, HOSTCXXFLAGS, HOSTLDFLAGS and
> HOSTLDLIBS are all read from it and documented in kbuild.rst as such.
> 
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
> line growing an override.

Thank for the patch with the detailed description.  This sounds to be
consistent, but looking at the other variables that effectively can be
set via environment it looks differently to me:  Environment variables
are honoured especially for _flags_, while most variables for _tooling
paths_ (e.g. HOSTCC) are to be overriden via make command line (w/
exceptions e.g. CROSS_COMPILE, LLVM).  Right now, I am not aware of the
reason for this distinction, but before opening the gate for tooling
overrides via environment, we should think it through (aka Chesterton's
Fence).

Another simple way of not piling up overrides could be something like:

    cat <<-eof >Makefile.cross
    override HOSTPKG_CONFIG := env -u PKG_CONFIG_SYSROOT_DIR -u PKG_CONFIG_PATH pkg-config
    include Makefile
    eof

    make -f Makefile.cross

So, I suggest to wait a bit and see if further arguments come up.

Kind regards,
Nicolas
