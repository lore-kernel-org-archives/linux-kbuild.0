Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F6452CCC2;
	Thu,  1 Oct 2026 15:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869225; cv=none; b=pOJOYsp9dN9jqLQqkIUEFkvZH0AioaeKztm+ngZ2G7d476ihyV/yKsliPWLapE/m/VoKf9SvtFLULVm1Rp4twcZO7eOrUL4FyIJ1DpQFWbJpNh8gwDxhMHNxyOgppJhx6gtJbZ+BVN5+DZ/w39iHnE13BHXz31BkGsHOaOr7U9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869225; c=relaxed/simple;
	bh=QuoJax5A+PjEoV5CCOwWtFeDZ6PUE7N0i0r/KKPBHt0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hf8l9LExDhcSKRo2+nIXkGeTw8TXdnJkDlBo7ZArnIZZoZVYolpGXMo4biDxfTQANWuOxgmp3udv82KjwF/nYdPNhjQju/5kmYzeLOzjSVK/aeBxMAZrGbVGyfzeFCf/w4bxNAcR95UQ16fMBktmhmt1u/V/rEdvcvEdoFhXuZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JakBQBfp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JakBQBfp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E0E1F000FF;
	Thu,  1 Oct 2026 15:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790869222;
	bh=OgLQnoVapnhYGzvIwOI2fHQPN9V/E4aO85CkyM8PNCU=;
	h=Date:From:To:Cc:Subject;
	b=JakBQBfpJA+qpeD6aoi1UgJOBPB7HEawBod2lUuPKbgcnAW9y23sSqZ6379Y2L6JT
	 td+1OuFFCgF2olxjuthk7GzhzCFwK7q0Yu1HCK3tAGbD9Q4ewmrN23+NmGxh1cn0fB
	 9fEJoT6t4W547ZjPz7jvLaZicAXk1biRubyMk2pO0EttcT3yn3m0d9YtujCPx3ZF8f
	 Y6Dv2XNqgIpym8+Hak5MGddSIkZl0p1d3VTYbmCz+To4AcQGdA9eXM5YYRVOwPr5Wv
	 YPwc2Tu6YizRSozkkRJJBHVS/WTflJfuFr9DOkQOZtNLo1cXqr8DtWbG9aND7IzUXZ
	 XqmSJ0WUgzzcw==
Date: Thu, 1 Oct 2026 16:40:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Subject: linux-next: manual merge of the random tree with the kbuild tree
Message-ID: <ar5-4Yq3wtmXTWnD@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kNtu/F1wljpzNUVX"
Content-Disposition: inline


--kNtu/F1wljpzNUVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the random tree got a conflict in:

  init/Kconfig

between commit:

  f85147b291e35 ("kbuild: move the toolchain checks into scripts/Kconfig.to=
olchain")

=66rom the kbuild tree and commit:

  56ff95ee85715 ("random: vDSO: avoid call to memset() when zeroing reserve=
d parameter")

=66rom the random tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc init/Kconfig
index ecd71b38fc560,98d8d7fa64c5c..0000000000000
--- a/init/Kconfig
+++ b/init/Kconfig
@@@ -1,7 -1,207 +1,5 @@@
  # SPDX-License-Identifier: GPL-2.0-only
 -config CC_VERSION_TEXT
 -	string
 -	default "$(CC_VERSION_TEXT)"
 -	help
 -	  This is used in unclear ways:
 -
 -	  - Re-run Kconfig when the compiler is updated
 -	    The 'default' property references the environment variable,
 -	    CC_VERSION_TEXT so it is recorded in include/config/auto.conf.cmd.
 -	    When the compiler is updated, Kconfig will be invoked.
 -
 -	  - Ensure full rebuild when the compiler is updated
 -	    include/linux/compiler-version.h contains this option in the comment
 -	    line so fixdep adds include/config/CC_VERSION_TEXT into the
 -	    auto-generated dependency. When the compiler is updated, syncconfig
 -	    will touch it and then every file will be rebuilt.
 -
 -config CC_IS_GCC
 -	def_bool $(success,test "$(cc-name)" =3D GCC)
 -
 -config GCC_VERSION
 -	int
 -	default $(cc-version) if CC_IS_GCC
 -	default 0
 -
 -config CC_IS_CLANG
 -	def_bool $(success,test "$(cc-name)" =3D Clang)
 -
 -config CLANG_VERSION
 -	int
 -	default $(cc-version) if CC_IS_CLANG
 -	default 0
 -
 -config AS_IS_GNU
 -	def_bool $(success,test "$(as-name)" =3D GNU)
 -
 -config AS_IS_LLVM
 -	def_bool $(success,test "$(as-name)" =3D LLVM)
 -
 -config AS_VERSION
 -	int
 -	# Use clang version if this is the integrated assembler
 -	default CLANG_VERSION if AS_IS_LLVM
 -	default $(as-version)
 -
 -config LD_IS_BFD
 -	def_bool $(success,test "$(ld-name)" =3D BFD)
 -
 -config LD_VERSION
 -	int
 -	default $(ld-version) if LD_IS_BFD
 -	default 0
 -
 -config LD_IS_LLD
 -	def_bool $(success,test "$(ld-name)" =3D LLD)
 -
 -config LLD_VERSION
 -	int
 -	default $(ld-version) if LD_IS_LLD
 -	default 0
 -
 -config RUSTC_VERSION
 -	int
 -	default $(rustc-version)
 -	help
 -	  It does not depend on `RUST` since that one may need to use the version
 -	  in a `depends on`.
 -
 -config RUST_IS_AVAILABLE
 -	def_bool $(success,$(srctree)/scripts/rust_is_available.sh)
 -	help
 -	  This shows whether a suitable Rust toolchain is available (found).
 -
 -	  Please see Documentation/rust/quick-start.rst for instructions on how
 -	  to satisfy the build requirements of Rust support.
 -
 -	  In particular, the Makefile target 'rustavailable' is useful to check
 -	  why the Rust toolchain is not being detected.
 -
 -config RUSTC_LLVM_VERSION
 -	int
 -	default $(rustc-llvm-version)
 -
 -config RUSTC_LLVM_MAJOR_VERSION
 -	int
 -	default $(shell,expr $(rustc-llvm-version) / 10000)
 -
 -config RUSTC_CLANG_LLVM_COMPATIBLE
 -	bool
 -	default y if CC_IS_CLANG && RUSTC_LLVM_MAJOR_VERSION =3D $(shell,expr $(=
cc-version) / 10000)
 -	help
 -	  This indicates whether Rust and Clang use LLVM of the same major
 -	  version.
 -
 -	  Operations involving handling LLVM IR or bitcode (e.g. cross-language
 -	  LTO) require the same LLVM major version to work properly. For best
 -	  compatibility it is recommended that the exact same LLVM is used.
 -
 -config ARCH_HAS_CC_CAN_LINK
 -	bool
 -
 -config CC_CAN_LINK
 -	bool
 -	default ARCH_CC_CAN_LINK if ARCH_HAS_CC_CAN_LINK
 -	default $(cc_can_link_user,$(m64-flag)) if 64BIT
 -	default $(cc_can_link_user,$(m32-flag))
 -
 -# Fixed in GCC 14, 13.3, 12.4 and 11.5
 -# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D113921
 -config GCC_ASM_GOTO_OUTPUT_BROKEN
 -	bool
 -	depends on CC_IS_GCC
 -	default y if GCC_VERSION < 110500
 -	default y if GCC_VERSION >=3D 120000 && GCC_VERSION < 120400
 -	default y if GCC_VERSION >=3D 130000 && GCC_VERSION < 130300
 -
 -config CC_HAS_ASM_GOTO_OUTPUT
 -	def_bool y
 -	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
 -	depends on $(success,echo 'int foo(int x) { asm goto ("": "=3Dr"(x) ::: =
bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
 -
 -config CC_HAS_ASM_GOTO_TIED_OUTPUT
 -	depends on CC_HAS_ASM_GOTO_OUTPUT
 -	# Detect buggy gcc and clang, fixed in gcc-11 clang-14.
 -	def_bool $(success,echo 'int foo(int *x) { asm goto (".long (%l[bar]) - =
=2E": "+m"(*x) ::: bar); return *x; bar: return 0; }' | $CC -x c - -c -o /d=
ev/null)
 -
 -config TOOLS_SUPPORT_RELR
 -	def_bool $(success,env "CC=3D$(CC)" "LD=3D$(LD)" "NM=3D$(NM)" "OBJCOPY=
=3D$(OBJCOPY)" $(srctree)/scripts/tools-support-relr.sh)
 -
 -config CC_HAS_ASM_INLINE
 -	def_bool $(success,echo 'void foo(void) { asm inline (""); }' | $(CC) -x=
 c - -c -o /dev/null)
 -
 -config CC_HAS_ASSUME
 -	bool
 -	# clang needs to be at least 19.1.0 since the meaning of the assume
 -	# attribute changed:
 -	# https://github.com/llvm/llvm-project/commit/c44fa3e8a9a44c2e9a575768a3=
c185354b9f6c17
 -	default y if CC_IS_CLANG && CLANG_VERSION >=3D 190100
 -	# supported since gcc 13.1.0
 -	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106654
 -	default y if CC_IS_GCC && GCC_VERSION >=3D 130100
 -
 -config CC_HAS_NO_PROFILE_FN_ATTR
 -	def_bool $(success,echo '__attribute__((no_profile_instrument_function))=
 int x();' | $(CC) -x c - -c -o /dev/null -Werror)
 -
 -config CC_HAS_COUNTED_BY
 -	bool
 -	# clang needs to be at least 20.1.0 to avoid potential crashes
 -	# when building structures that contain __counted_by
 -	# https://github.com/ClangBuiltLinux/linux/issues/2114
 -	# https://github.com/llvm/llvm-project/commit/160fb1121cdf703c3ef5e61fb2=
6c5659eb581489
 -	default y if CC_IS_CLANG && CLANG_VERSION >=3D 200100
 -	# supported since gcc 15.1.0
 -	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108896
 -	default y if CC_IS_GCC && GCC_VERSION >=3D 150100
 -
 -config CC_HAS_COUNTED_BY_PTR
 -	bool
 -	# supported since clang 22
 -	default y if CC_IS_CLANG && CLANG_VERSION >=3D 220100
 -	# supported since gcc 16.0.0
 -	default y if CC_IS_GCC && GCC_VERSION >=3D 160000
 -
 -config CC_HAS_BROKEN_COUNTED_BY_REF
 -	bool
 -	# https://github.com/llvm/llvm-project/issues/182575
 -	default y if CC_IS_CLANG && CLANG_VERSION < 220100
 -
 -config CC_HAS_ALLOC_TOKEN
 -	def_bool $(cc-option,-falloc-token-max=3D123)
 -
 -config CC_HAS_MULTIDIMENSIONAL_NONSTRING
 -	def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring__)) =
=3D { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
 -
 -config CC_OPT_INLINE_MEMSET
 -	string
 -	default "-finline-stringops=3Dmemset" if $(cc-option,-finline-stringops=
=3Dmemset)
 -	default "-mllvm -max-store-memset=3D4294967295" if $(cc-option,-mllvm -m=
ax-store-memset=3D4294967295)
 -
 -config LD_CAN_USE_KEEP_IN_OVERLAY
 -	# ld.lld prior to 21.0.0 did not support KEEP within an overlay descript=
ion
 -	# https://github.com/llvm/llvm-project/pull/130661
 -	def_bool LD_IS_BFD || LLD_VERSION >=3D 210000
 -
 -config RUSTC_HAS_SPAN_FILE
 -	def_bool RUSTC_VERSION >=3D 108800
 -
 -config RUSTC_HAS_UNNECESSARY_TRANSMUTES
 -	def_bool RUSTC_VERSION >=3D 108800
 -
 -config RUSTC_HAS_FILE_WITH_NUL
 -	def_bool RUSTC_VERSION >=3D 108900
 -
 -config RUSTC_HAS_FILE_AS_C_STR
 -	def_bool RUSTC_VERSION >=3D 109100
 -
 -config RUSTC_HAS_SUSPICIOUS_RUNTIME_SYMBOL_DEFINITIONS
 -	def_bool RUSTC_VERSION >=3D 109800
 -
 -config PAHOLE_VERSION
 -	int
 -	default "$(PAHOLE_VERSION)"
 =20
- source "scripts/Kconfig.toolchain"
-=20
  config CONSTRUCTORS
  	bool
 =20
diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
index d708a175fe486..28bf11fe7bee7 100644
--- a/scripts/Kconfig.toolchain
+++ b/scripts/Kconfig.toolchain
@@ -166,6 +166,11 @@ config CC_OPT_ALLOW_STORE_DATA_RACES_PARAM
 config CC_OPT_NO_ALLOW_STORE_DATA_RACES
 	def_string "$(cc-option-str,-fno-allow-store-data-races)" if CC_IS_GCC
=20
+config CC_OPT_INLINE_MEMSET
+        string
+        default "-finline-stringops=3Dmemset" if $(cc-option,-finline-stri=
ngops=3Dmemset)
+        default "-mllvm -max-store-memset=3D4294967295" if $(cc-option,-ml=
lvm -max-store-memset=3D4294967295)
+
 config CC_HAS_MNOP_MCOUNT
 	def_bool $(cc-option,-mnop-mcount)
=20

--kNtu/F1wljpzNUVX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq+fuAACgkQJNaLcl1U
h9Bihgf9GTO/qvB7zqn81YPYeZJxUI53yetsRsydR4xeGJGKMoULeNijJU5r809E
Lc9jcPy3XUmerKls/jFdZ1aP5aL4TQkIOYVmNynrBon1X4QSBINhLtphx4gAoLNx
s7pybBgRcWRrRAclAqT5fwQSUWLXHZ/lq9hSZUtah7VOuXnO666mgo2ZQHkOh9FB
r3dOCvIPs+W9M8HGWIge31ZaV5Jp75aHKtqK3W03rZWzNGFnFXb04UXtfPpS7KuF
OpmW0cYo1Wlmgqq0SzNiZoy2Nz3rCBX/V2m967vH2OvflejEBhYqFKHE9I6yG+KU
VMrl9U6qAbChjd98bowf3OXrWZu+Hw==
=LGGE
-----END PGP SIGNATURE-----

--kNtu/F1wljpzNUVX--
