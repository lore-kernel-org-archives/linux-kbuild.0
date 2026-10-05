Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35E64772A4;
	Mon,  5 Oct 2026 10:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196283; cv=none; b=hLaS8zeqhPCvqQu96t6MjqmnztaJU043SGfNtqJAujCvlQ0G+LnmEENzwXOkJu9L0QIPGEbK53TjY2S/1TcPge3w56obvjncxwPTcmEH2GdPESqoQbbkLQ3ptycghUSaUZ2JctbYG1la0CmjLUsxWzgJwPifowOO/CwAcQT7GL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196283; c=relaxed/simple;
	bh=Z0CU3qmDRS82mdslwFhsmrPIbjGHUm9iRWYPiMuZtbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jl93/YiWB2sTp/oMfqLnay1z+SR9PA9XLVNk+KbmQ5Y4OuuFt4u5BaTaUgO+S/MGeUq9dU1dYjTNhqn8kVXWszdF4fNhCIsNVLvNHjkxu3HWel0KskJxfuIh/CE/ysXDSKHF9GvK+QwTaxYo6GpIiAylJyDBLVJD344rBje0kIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Il5XChVo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Il5XChVo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E6A1F000FF;
	Mon,  5 Oct 2026 10:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791196280;
	bh=ZPYmDxH8vabn7vg3wY8kNRqXiHMt5Bo2ZuR2kjLDJwQ=;
	h=Date:From:To:Cc:Subject;
	b=Il5XChVoDW2Lkxh+cv7h9+oe8clSpTJ6KEdfHUPx6Z5+ZZZ4qmsxluu2tuMHc6LVC
	 lJb0ffd5hXAHCQF+Ewl6yIKmXQM4W1dXLTOjMwpHh7t6FhAGW8cKOkukeoPiHGH9P7
	 scxTnOmkJl2ILytxHJ1tQHmegIZZLEudT4LU9J9byojdzvrDudkdI3bL4hcaWcuC/r
	 zIRpjhhw8070mVRIiKVQ893MeZkDMSdMiqLVufC68TZ5KGEGw5vS4G7QoL8sIf1E+Y
	 cKX/zA6Ho9z8Kr8eoBUWG46vZs2cfp0f64vjo/ZErF3WaRHcg66mGeBgfIvcili5Qi
	 8UdHpxQ6pWvTg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 47BF81AC57CE; Mon, 05 Oct 2026 11:31:18 +0100 (BST)
Date: Mon, 5 Oct 2026 12:31:18 +0200
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	Wilson Felipe Pereira <wfelipe@google.com>
Subject: linux-next: manual merge of the kbuild tree with the
 mm-nonmm-unstable tree
Message-ID: <asN8duP-cEdNqP5I@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2CB9Td9mf/BAd8Fs"
Content-Disposition: inline


--2CB9Td9mf/BAd8Fs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kbuild tree got a conflict in:

  init/Kconfig

between commits:

  d514d23689356 ("init/Kconfig: make config INIT_ENV_ARG_LIMIT user-configu=
rable")
  9998f5eea1407 ("init, arch: make CONFIG_COMMAND_LINE_SIZE globally config=
urable")

=66rom the mm-nonmm-unstable tree and commit:

  f85147b291e35 ("kbuild: move the toolchain checks into scripts/Kconfig.to=
olchain")

=66rom the kbuild tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating

diff --combined init/Kconfig
index 914c4c3ed7ee4,352601b44b5ca..0000000000000
--- a/init/Kconfig
+++ b/init/Kconfig
@@@ -1,203 -1,6 +1,6 @@@
  # SPDX-License-Identifier: GPL-2.0-only
- config CC_VERSION_TEXT
- 	string
- 	default "$(CC_VERSION_TEXT)"
- 	help
- 	  This is used in unclear ways:
 =20
- 	  - Re-run Kconfig when the compiler is updated
- 	    The 'default' property references the environment variable,
- 	    CC_VERSION_TEXT so it is recorded in include/config/auto.conf.cmd.
- 	    When the compiler is updated, Kconfig will be invoked.
-=20
- 	  - Ensure full rebuild when the compiler is updated
- 	    include/linux/compiler-version.h contains this option in the comment
- 	    line so fixdep adds include/config/CC_VERSION_TEXT into the
- 	    auto-generated dependency. When the compiler is updated, syncconfig
- 	    will touch it and then every file will be rebuilt.
-=20
- config CC_IS_GCC
- 	def_bool $(success,test "$(cc-name)" =3D GCC)
-=20
- config GCC_VERSION
- 	int
- 	default $(cc-version) if CC_IS_GCC
- 	default 0
-=20
- config CC_IS_CLANG
- 	def_bool $(success,test "$(cc-name)" =3D Clang)
-=20
- config CLANG_VERSION
- 	int
- 	default $(cc-version) if CC_IS_CLANG
- 	default 0
-=20
- config AS_IS_GNU
- 	def_bool $(success,test "$(as-name)" =3D GNU)
-=20
- config AS_IS_LLVM
- 	def_bool $(success,test "$(as-name)" =3D LLVM)
-=20
- config AS_VERSION
- 	int
- 	# Use clang version if this is the integrated assembler
- 	default CLANG_VERSION if AS_IS_LLVM
- 	default $(as-version)
-=20
- config LD_IS_BFD
- 	def_bool $(success,test "$(ld-name)" =3D BFD)
-=20
- config LD_VERSION
- 	int
- 	default $(ld-version) if LD_IS_BFD
- 	default 0
-=20
- config LD_IS_LLD
- 	def_bool $(success,test "$(ld-name)" =3D LLD)
-=20
- config LLD_VERSION
- 	int
- 	default $(ld-version) if LD_IS_LLD
- 	default 0
-=20
- config RUSTC_VERSION
- 	int
- 	default $(rustc-version)
- 	help
- 	  It does not depend on `RUST` since that one may need to use the version
- 	  in a `depends on`.
-=20
- config RUST_IS_AVAILABLE
- 	def_bool $(success,$(srctree)/scripts/rust_is_available.sh)
- 	help
- 	  This shows whether a suitable Rust toolchain is available (found).
-=20
- 	  Please see Documentation/rust/quick-start.rst for instructions on how
- 	  to satisfy the build requirements of Rust support.
-=20
- 	  In particular, the Makefile target 'rustavailable' is useful to check
- 	  why the Rust toolchain is not being detected.
-=20
- config RUSTC_LLVM_VERSION
- 	int
- 	default $(rustc-llvm-version)
-=20
- config RUSTC_LLVM_MAJOR_VERSION
- 	int
- 	default $(shell,expr $(rustc-llvm-version) / 10000)
-=20
- config RUSTC_CLANG_LLVM_COMPATIBLE
- 	bool
- 	default y if CC_IS_CLANG && RUSTC_LLVM_MAJOR_VERSION =3D $(shell,expr $(=
cc-version) / 10000)
- 	help
- 	  This indicates whether Rust and Clang use LLVM of the same major
- 	  version.
-=20
- 	  Operations involving handling LLVM IR or bitcode (e.g. cross-language
- 	  LTO) require the same LLVM major version to work properly. For best
- 	  compatibility it is recommended that the exact same LLVM is used.
-=20
- config ARCH_HAS_CC_CAN_LINK
- 	bool
-=20
- config CC_CAN_LINK
- 	bool
- 	default ARCH_CC_CAN_LINK if ARCH_HAS_CC_CAN_LINK
- 	default $(cc_can_link_user,$(m64-flag)) if 64BIT
- 	default $(cc_can_link_user,$(m32-flag))
-=20
- # Fixed in GCC 14, 13.3, 12.4 and 11.5
- # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D113921
- config GCC_ASM_GOTO_OUTPUT_BROKEN
- 	bool
- 	depends on CC_IS_GCC
- 	default y if GCC_VERSION < 110500
- 	default y if GCC_VERSION >=3D 120000 && GCC_VERSION < 120400
- 	default y if GCC_VERSION >=3D 130000 && GCC_VERSION < 130300
-=20
- config CC_HAS_ASM_GOTO_OUTPUT
- 	def_bool y
- 	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
- 	depends on $(success,echo 'int foo(int x) { asm goto ("": "=3Dr"(x) ::: =
bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
-=20
- config CC_HAS_ASM_GOTO_TIED_OUTPUT
- 	depends on CC_HAS_ASM_GOTO_OUTPUT
- 	# Detect buggy gcc and clang, fixed in gcc-11 clang-14.
- 	def_bool $(success,echo 'int foo(int *x) { asm goto (".long (%l[bar]) - =
=2E": "+m"(*x) ::: bar); return *x; bar: return 0; }' | $CC -x c - -c -o /d=
ev/null)
-=20
- config TOOLS_SUPPORT_RELR
- 	def_bool $(success,env "CC=3D$(CC)" "LD=3D$(LD)" "NM=3D$(NM)" "OBJCOPY=
=3D$(OBJCOPY)" $(srctree)/scripts/tools-support-relr.sh)
-=20
- config CC_HAS_ASM_INLINE
- 	def_bool $(success,echo 'void foo(void) { asm inline (""); }' | $(CC) -x=
 c - -c -o /dev/null)
-=20
- config CC_HAS_ASSUME
- 	bool
- 	# clang needs to be at least 19.1.0 since the meaning of the assume
- 	# attribute changed:
- 	# https://github.com/llvm/llvm-project/commit/c44fa3e8a9a44c2e9a575768a3=
c185354b9f6c17
- 	default y if CC_IS_CLANG && CLANG_VERSION >=3D 190100
- 	# supported since gcc 13.1.0
- 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106654
- 	default y if CC_IS_GCC && GCC_VERSION >=3D 130100
-=20
- config CC_HAS_NO_PROFILE_FN_ATTR
- 	def_bool $(success,echo '__attribute__((no_profile_instrument_function))=
 int x();' | $(CC) -x c - -c -o /dev/null -Werror)
-=20
- config CC_HAS_COUNTED_BY
- 	bool
- 	# clang needs to be at least 20.1.0 to avoid potential crashes
- 	# when building structures that contain __counted_by
- 	# https://github.com/ClangBuiltLinux/linux/issues/2114
- 	# https://github.com/llvm/llvm-project/commit/160fb1121cdf703c3ef5e61fb2=
6c5659eb581489
- 	default y if CC_IS_CLANG && CLANG_VERSION >=3D 200100
- 	# supported since gcc 15.1.0
- 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108896
- 	default y if CC_IS_GCC && GCC_VERSION >=3D 150100
-=20
- config CC_HAS_COUNTED_BY_PTR
- 	bool
- 	# supported since clang 22
- 	default y if CC_IS_CLANG && CLANG_VERSION >=3D 220100
- 	# supported since gcc 16.0.0
- 	default y if CC_IS_GCC && GCC_VERSION >=3D 160000
-=20
- config CC_HAS_BROKEN_COUNTED_BY_REF
- 	bool
- 	# https://github.com/llvm/llvm-project/issues/182575
- 	default y if CC_IS_CLANG && CLANG_VERSION < 220100
-=20
- config CC_HAS_ALLOC_TOKEN
- 	def_bool $(cc-option,-falloc-token-max=3D123)
-=20
- config CC_HAS_MULTIDIMENSIONAL_NONSTRING
- 	def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring__)) =
=3D { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
-=20
- config CC_OPT_INLINE_MEMSET
- 	string
- 	default "-finline-stringops=3Dmemset" if $(cc-option,-finline-stringops=
=3Dmemset)
- 	default "-mllvm -max-store-memset=3D4294967294" if $(cc-option,-mllvm -m=
ax-store-memset=3D4294967294)
-=20
- config LD_CAN_USE_KEEP_IN_OVERLAY
- 	# ld.lld prior to 21.0.0 did not support KEEP within an overlay descript=
ion
- 	# https://github.com/llvm/llvm-project/pull/130661
- 	def_bool LD_IS_BFD || LLD_VERSION >=3D 210000
-=20
- config RUSTC_HAS_UNNECESSARY_TRANSMUTES
- 	def_bool RUSTC_VERSION >=3D 108800
-=20
- config RUSTC_HAS_FILE_WITH_NUL
- 	def_bool RUSTC_VERSION >=3D 108900
-=20
- config RUSTC_HAS_FILE_AS_C_STR
- 	def_bool RUSTC_VERSION >=3D 109100
-=20
- config RUSTC_HAS_SUSPICIOUS_RUNTIME_SYMBOL_DEFINITIONS
- 	def_bool RUSTC_VERSION >=3D 109800
-=20
- config PAHOLE_VERSION
- 	int
- 	default "$(PAHOLE_VERSION)"
+ source "scripts/Kconfig.toolchain"
 =20
  config CONSTRUCTORS
  	bool
@@@ -233,10 -36,9 +36,10 @@@ config BROKEN_ON_SM
  	default y
 =20
  config INIT_ENV_ARG_LIMIT
 -	int
 +	int "Maximum number of kernel command line arguments"
  	default 32 if !UML
  	default 128 if UML
 +	range 32 4096
  	help
  	  Maximum of each of the number of arguments and environment
  	  variables passed to init from the kernel command line.
@@@ -1617,22 -1419,6 +1420,22 @@@ config CMDLINE_FROM_BOOTCONFI
 =20
  	  If unsure, say N.
 =20
 +config COMMAND_LINE_SIZE
 +	int "Maximum size of kernel command line"
 +	default 4096 if S390 || LOONGARCH || MIPS || UML
 +	default 2048 if X86 || ARM64 || PPC || SPARC64 || RISCV
 +	default 1024 if ARM || PARISC
 +	default 256 if ALPHA || ARC || M68K || MICROBLAZE || SPARC32 || XTENSA
 +	default 512
 +	range 896 1048576 if S390
 +	range 256 2048 if ARM || M68K || NIOS2 || PPC
 +	range 256 3840 if SUPERH
 +	range 256 256 if ALPHA
 +	range 256 4096
 +	help
 +	  This allows you to specify the maximum length of the kernel command
 +	  line.
 +
  config CMDLINE_LOG_WRAP_IDEAL_LEN
  	int "Length to try to wrap the cmdline when logged at boot"
  	default 1021
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.


--2CB9Td9mf/BAd8Fs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasN8awAKCRAv73Ows9A4
iQivAQCMg+lVQmDZQRlztTpYUYF2fb5zPaf/n0+OAfzRjeZhrgD/Sd298RMmwamU
lxoOLeizgFARBxKHY7aQ7sSPxdM8ZAM=
=JgQJ
-----END PGP SIGNATURE-----

--2CB9Td9mf/BAd8Fs--
