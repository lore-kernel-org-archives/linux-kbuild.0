Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794375786;
	b=u17yiPIIM/LbsCRCXgBlIqerBnRTVCyagIIVEpwGWIuHzKqIune1vICMlr6H9zp9WpSd
	 TWxuh+WPHQz+hDLl1F1tK2SmQ7N9ZSxmg1A0UxK7BuFDQBFmxy4ogSNhGjZqzIMONg8TR
	 qv7iAXw+mxCcqjvKxWJnX1WpW2AToTix7rxToO+By6nnICxrx5dMSQXsbmmGnWjlLl2aa
	 VaS85Knpl0t/f90gYt2jLpEZPG1BzVdj+fBL4JJgTqYl5XQ910Q4Iiuz5YbGfrNt0FsMx
	 37U1Z1orv81UbCINiz067I06rDxxG660ZJo+06KuiLZlEHk4xrlzxgbM6vO4Uh9Ivvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794375786;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=xa/16d/jfQnbs0ojkbX/+AQz824buAN9ip8tfhcooko=;
	b=gmqAMZuU0vxlNipI4jVqmE2a2r2qKonwedg9zciqQMmw2xe5EtwanBkBKalvmZswsTso
	 w0DuvelR6/soCApjWKK3/JKS97OHSdtOkQykxTawMflCRtoaudAVIuCgINNyWqwlt62cs
	 OWVhbzUXxZzBd4HCgpVd3TWyo3lnrAO1YgjBIMLF8XEYNpTBWCVuWfWys1Fov4SUuumyF
	 EK2Rasf/EseZVYZEuri6uoi7AVx4jOKl0Go2KigT1hOn+gZiqgB2Kp850T93+vmhWx2Kx
	 StxwvjEtZdJ1S088kYMOPwBtB4R8u2dBL+egvP5mifRdXUuqXvP0Uyc1PpzE3A4T/MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ona0g6BI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19995606A333;
	Wed, 11 Nov 2026 05:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ona0g6BI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DFE1F00A05;
	Wed, 11 Nov 2026 05:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794375785;
	bh=xa/16d/jfQnbs0ojkbX/+AQz824buAN9ip8tfhcooko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ona0g6BIoEUCV3c84vdebstigq7LP2nRANrzxlOJh4VfBWoOhGz9p8NT3FuiIwrny
	 qfZ615pFDpkRZKjEI7X2PO/WQecC0iI3tcgDPwwdQ7wL68tW5h3Sc6K4FGKVJmHYl1
	 YQUA2wPnaOkHkCm+s45ZW+cpRsUIUIwN9G9tPD9nUqjUExmtZBcD9nSWVK5Sc2HXtN
	 ckdjACgZ9S0oxANMlE0lPO9PlU7mAfTQSnHaVi8Nk+C5lQ1cLHO0OkFtWn2/fscGDs
	 yp9IiZSaPk7IDfTh/fmQC6MT9fW9jRiRm70301LxfkEL+zAUVBfjEB9LltclIsOdgk
	 lt0HSWZxXMtUw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 10 Nov 2026 23:42:43 -0600
Subject: [PATCH 4/4] scripts/Kconfig.toolchain: Document minimum supported
 versions for dynamic checks
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
Message-Id: <20261110-kconfig-toolchain-updates-v1-4-6d4fb636290e@kernel.org>
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>
In-Reply-To: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6113; i=nathan@kernel.org;
 h=from:subject:message-id; bh=74itlIf6McGA4G94CM2+0kZdNffDAEDFTUcRSjw2i5k=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlfGCJeHJ12iM3f5VK2ygbPBwFyUT1XK9lkuLuOrJGeq
 XMugmVaRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZiIqwcjw68D6YeVrlntXMr0
 UDlZNFWotPty/oqnAUfZ1GQDbrY9sGb471nL7/M5cXri6hg1jeBGQd+dxXpGFh9umlYWr/n1dXc
 ZGwA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

To make it easier to clean up unnecessary dynamic checks when the
minimum supported version of a toolchain component is updated, add
comments documenting when features were first supported. Request that
future additions document this as well.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Kconfig.toolchain | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
index 26a62b15e9ab..3a9eb8317d59 100644
--- a/scripts/Kconfig.toolchain
+++ b/scripts/Kconfig.toolchain
@@ -1,4 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
+# When adding a new dynamic check (such as {cc,ld}-option{,-str} or testing a
+# small program), please add a comment documenting the first version of the
+# tool that supported the feature being tested. For cc-option{,-str}, note the
+# "beware" comment below.
+
 config CC_VERSION_TEXT
 	string
 	default "$(CC_VERSION_TEXT)"
@@ -118,6 +123,7 @@ config GCC_ASM_GOTO_OUTPUT_BROKEN
 config CC_HAS_ASM_GOTO_OUTPUT
 	def_bool y
 	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
+	# supported since clang-10 and gcc-11
 	depends on $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
 
 config CC_HAS_ASM_GOTO_TIED_OUTPUT
@@ -129,6 +135,7 @@ config TOOLS_SUPPORT_RELR
 	def_bool $(success,env "CC=$(CC)" "LD=$(LD)" "NM=$(NM)" "OBJCOPY=$(OBJCOPY)" $(srctree)/scripts/tools-support-relr.sh)
 
 config CC_HAS_ASM_INLINE
+	# supported since clang-11 and gcc-9
 	def_bool $(success,echo 'void foo(void) { asm inline (""); }' | $(CC) -x c - -c -o /dev/null)
 
 config CC_HAS_ASSUME
@@ -161,6 +168,8 @@ config CC_HAS_ASSUME
 #    pitfall.
 
 config CC_OPT_ZERO_INIT_PADDING_BITS
+	# supported since gcc-15. not needed for clang, as it does this by default since clang-20
+	# https://github.com/llvm/llvm-project/commit/7a086e1b2dc05f54afae3591614feede727601fa
 	def_string "$(cc-option-str,-fzero-init-padding-bits=all)"
 
 config CC_OPT_NO_ADDRSIG
@@ -168,12 +177,15 @@ config CC_OPT_NO_ADDRSIG
 	def_string "-fno-addrsig" if CC_IS_CLANG
 
 config CC_OPT_DIAGNOSTICS_SHOW_CONTEXT
+	# supported since gcc-16, not supported by clang
 	def_string "$(cc-option-str,-fdiagnostics-show-context=2)"
 
 config CC_OPT_DIAGNOSTICS_SHOW_INLINING_CHAIN
+	# supported since clang-23. not needed for gcc, as it does this by default
 	def_string "$(cc-option-str,-fdiagnostics-show-inlining-chain)"
 
 config CC_OPT_STRICT_FLEX_ARRAYS
+	# supported since clang-16 and gcc-13
 	def_string "$(cc-option-str,-fstrict-flex-arrays=3)"
 
 config CC_OPT_NO_ALLOW_STORE_DATA_RACES
@@ -181,51 +193,67 @@ config CC_OPT_NO_ALLOW_STORE_DATA_RACES
 	def_string "$(cc-option-str,-fno-allow-store-data-races,--param=allow-store-data-races=0)" if CC_IS_GCC
 
 config CC_HAS_MNOP_MCOUNT
+	# supported since clang-10 and gcc-9 but option is architecture specific
 	def_bool $(cc-option,-mnop-mcount)
 
 config LD_OPT_FORCE_GROUP_ALLOCATION
+	# supported since ld.lld 19 and GNU ld 2.29
 	def_string "$(ld-option-str,--force-group-allocation)"
 
 config LD_OPT_NO_WARN_RWX_SEGMENTS
+	# supported since GNU ld 2.39, not supported by ld.lld
 	def_string "$(ld-option-str,--no-warn-rwx-segments)"
 
 config CC_OPT_WNO_ADDRESS_OF_PACKED_MEMBER
+	# supported since clang-4 and gcc-9
 	def_string "$(cc-option-str,-Wno-address-of-packed-member)"
 
 config CC_OPT_WNO_FORMAT_OVERFLOW_NON_KPRINTF
+	# supported since clang-18, not needed for gcc
 	def_string "$(cc-option-str,-Wno-format-overflow-non-kprintf)"
 
 config CC_OPT_WNO_FORMAT_TRUNCATION_NON_KPRINTF
+	# supported since clang-18, not needed for gcc
 	def_string "$(cc-option-str,-Wno-format-truncation-non-kprintf)"
 
 config CC_OPT_WNO_DEFAULT_CONST_INIT_UNSAFE
+	# supported since clang-21, not needed for gcc
 	def_string "$(cc-option-str,-Wno-default-const-init-unsafe)"
 
 config CC_OPT_WNO_DANGLING_POINTER
+	# supported since gcc-12, not needed for clang
 	def_string "$(cc-option-str,-Wno-dangling-pointer)"
 
 config CC_OPT_WVLA_LARGER_THAN
+	# supported since gcc-7, not supported by clang
 	def_string "$(cc-option-str,-Wvla-larger-than=1)"
 
 config CC_HAS_WSTRINGOP_OVERFLOW
+	# supported since gcc-7, not supported by clang
 	def_bool $(cc-option,-Wstringop-overflow)
 
 config CC_OPT_WNO_UNTERMINATED_STRING_INITIALIZATION
+	# supported since gcc-15 and clang-21
 	def_string "$(cc-option-str,-Wno-unterminated-string-initialization)"
 
 config CC_OPT_WERROR_DESIGNATED_INIT
+	# supported since gcc-5, not supported by clang
 	def_string "$(cc-option-str,-Werror=designated-init)"
 
 config CC_OPT_WENUM_CONVERSION
+	# supported since clang-3.2 and gcc-10
 	def_string "$(cc-option-str,-Wenum-conversion)"
 
 config CC_OPT_WNO_PACKED_NOT_ALIGNED
+	# supported since gcc-8, not supported by clang
 	def_string "$(cc-option-str,-Wno-packed-not-aligned)"
 
 config CC_OPT_WNO_FORMAT_OVERFLOW
+	# supported since gcc-7 and clang-18
 	def_string "$(cc-option-str,-Wno-format-overflow)"
 
 config CC_OPT_WNO_STRINGOP_TRUNCATION
+	# supported since gcc-8, not supported by clang
 	def_string "$(cc-option-str,-Wno-stringop-truncation)"
 
 config CC_HAS_COUNTED_BY
@@ -252,14 +280,18 @@ config CC_HAS_BROKEN_COUNTED_BY_REF
 	default y if CC_IS_CLANG && CLANG_VERSION < 220100
 
 config CC_HAS_ALLOC_TOKEN
+	# supported since clang-22, not supported by gcc
 	def_bool $(cc-option,-falloc-token-max=123)
 
 config CC_HAS_MULTIDIMENSIONAL_NONSTRING
+	# supported since gcc-15 and clang-21
 	def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring__)) = { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
 
 config CC_OPT_INLINE_MEMSET
 	string
+	# supported since gcc-14
 	default "-finline-stringops=memset" if $(cc-option,-finline-stringops=memset)
+	# supported since clang-22
 	default "-mllvm -max-store-memset=4294967294" if $(cc-option,-mllvm -max-store-memset=4294967294)
 
 config LD_CAN_USE_KEEP_IN_OVERLAY

-- 
2.56.0

