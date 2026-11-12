Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444760;
	b=biB6XL5cScLCqZlrhN8y3IgXB+s6i+WKlyelWOMVya865FvJEpxW6nETR/mi5npBBRAG
	 gfX5URJcVMx8NwmTVO0Sq47SspdBE9G7aZMj5rx7g38KWBYh8COj1lhmOoSrZir5sQmiR
	 nqybU8KygZqZAqII7AbvValI2XQX5SAOmRoYLOtwujvJUIJLb+v/mTykfnGNezFUa91hO
	 3dLW22mKZ+NIr59J7SK3x91N6n88PMFhvLhjLKZveFKOVNnQUKkpzgVS4lN9xOmeZHHTQ
	 //u5mT0JDoxqo1UsC4ZRdMF7sha+kRHbirA5CV/csnzaU/OUjjR/fOMfv21KCX8CoIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444760;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=4BSMRpEbllr633h3YHPf/BJdRv8QdczRDr1v5m5jd84=;
	b=z7hcVePZSw0hd21BP4KrCx3MF/Z0n6SN477sAuJPntXBjFCFVu6lQxQg+ZGVMzpeEfxJ
	 H6VxuJwITxW4L2dbZywaahTXzOF/rbCGPf8UQg9aRa8XndZ8VppEO9FamEHG1mGqZnQWg
	 4wL38NBFwnYIW/ptI064JhhVuwaTd39MXasql/hCOaeITw8v8MX2If9dn5Mmr7zIgZ4An
	 ziaBiz3k9H1m1e+CE7IZkFwZtdn8DQZ3NKSpMh3f0+MOLoQNZYwM1hTOyg1THoIRMOhKb
	 b9luMr1nozxYbj1ioIOxC5ZFw4B1Ru4ckxx7stbJA/VpbN/aMcQIuLjOn0IfI2KLJKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D+HehwYq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F25606A88B;
	Thu, 12 Nov 2026 00:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D+HehwYq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6721F00A05;
	Thu, 12 Nov 2026 00:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794444760;
	bh=4BSMRpEbllr633h3YHPf/BJdRv8QdczRDr1v5m5jd84=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=D+HehwYqV37ys70KV2IOOqld8TfPbSy6/k1PZuO0Uruo/ZWCM0DrnBmSkXFv299q7
	 JTKohItKTNiT2E9glqHXob7ClOdPaAHvmrtqZkg6tmIvDrei8JJ6WWgwyMj+rm8Gfz
	 qxIW58ql2vtpgzX/84BFqujNwR5lgXj2RH2K1rwLZqO5EoUYFjT0VkojTzLlIgGIJb
	 b+4eYCWIO3i6WS5Dt6lE75QtyjBPMPXGRMvZVCxL5mNkp4yVQQS2tYcvpWGPNIlVry
	 ZypBrBz/Hx9M9wolqw0un6oIR65Kh/C8pR3GFRhjbr4/q07DpBjdYnhPLh+i2QKL8s
	 UKb8qLQuLC+Mw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 11 Nov 2026 17:52:08 -0700
Subject: [PATCH v2 6/6] scripts/Kconfig.toolchain: Document minimum
 supported versions for dynamic checks
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
Message-Id: <20261111-kconfig-toolchain-updates-v2-6-b2d9415c1757@kernel.org>
References: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
In-Reply-To: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=9540; i=nathan@kernel.org;
 h=from:subject:message-id; bh=+0uS/tGpDEk6NS1ukd8kkwE3Ia+9BANh5nK6wxeXvY8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlfefefvuTxfTLTZRNHpfpn8msW5U06f8848l5uj2r5i
 sfLj+1q7ChlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATKdZl+CuyMOh58KRVC6t8
 PD6VRrIvaJ5w5eDLBRe3P059z3d6wnUNhj/8d8JWyfyfLtZmHVs3J0/85KVGQcGq0+q5Ihprp16
 62sIOAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

To make it easier to clean up unnecessary dynamic checks when the
minimum supported version of a toolchain component is updated, add
comments documenting when features were first supported. Request that
future additions document this as well.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Kconfig.toolchain | 64 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
index 9454ef5294d5..608da5023504 100644
--- a/scripts/Kconfig.toolchain
+++ b/scripts/Kconfig.toolchain
@@ -1,4 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
+# When adding a new dynamic check (such as {cc,ld}-option{,-str} or testing a
+# small program), please add a comment documenting the first version of the
+# tool that supported the feature being tested, ideally with a link to the tool
+# change as well. For cc-option{,-str}, note the "beware" comment below.
+
 config CC_VERSION_TEXT
 	string
 	default "$(CC_VERSION_TEXT)"
@@ -118,12 +123,16 @@ config GCC_ASM_GOTO_OUTPUT_BROKEN
 config CC_HAS_ASM_GOTO_OUTPUT
 	def_bool y
 	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
+	# gcc-11: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=e3b3b59683c1e7d31a9d313dd97394abebf644be
+	# clang-11: https://github.com/llvm/llvm-project/commit/50cac248773c3a023e8f6ceb9938bdd5e9f15da2
 	depends on $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
 
 config TOOLS_SUPPORT_RELR
 	def_bool $(success,env "CC=$(CC)" "LD=$(LD)" "NM=$(NM)" "OBJCOPY=$(OBJCOPY)" $(srctree)/scripts/tools-support-relr.sh)
 
 config CC_HAS_ASM_INLINE
+	# gcc-9: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=5b76e75f760f3e4787851366359d5d50f989877c
+	# clang-11: https://github.com/llvm/llvm-project/commit/246398ece7115b57a02dbe7876d86ae8e72406ef
 	def_bool $(success,echo 'void foo(void) { asm inline (""); }' | $(CC) -x c - -c -o /dev/null)
 
 config CC_HAS_ASSUME
@@ -156,6 +165,8 @@ config CC_HAS_ASSUME
 #    pitfall.
 
 config CC_OPT_ZERO_INIT_PADDING_BITS
+	# gcc-15: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=0547dbb725b6d8e878a79e28a2e171eafcfbc1aa
+	# clang-20 does this by default without a flag: https://github.com/llvm/llvm-project/commit/7a086e1b2dc05f54afae3591614feede727601fa
 	def_string "$(cc-option-str,-fzero-init-padding-bits=all)"
 
 config CC_OPT_NO_ADDRSIG
@@ -163,64 +174,109 @@ config CC_OPT_NO_ADDRSIG
 	def_string "-fno-addrsig" if CC_IS_CLANG
 
 config CC_OPT_DIAGNOSTICS_SHOW_CONTEXT
+	# gcc-16: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=6faa3cfe60ff9769d1bebfffdd2c7325217d7389
+	# clang: not supported
 	def_string "$(cc-option-str,-fdiagnostics-show-context=2)"
 
 config CC_OPT_DIAGNOSTICS_SHOW_INLINING_CHAIN
+	# clang-23: https://github.com/llvm/llvm-project/commit/f9ad232421e37e4168f6937abdd0a1665a590f12
+	# gcc: not needed, it does this by default
 	def_string "$(cc-option-str,-fdiagnostics-show-inlining-chain)"
 
 config CC_OPT_STRICT_FLEX_ARRAYS
+	# gcc-13: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=1879e48f3d8595bc9e7f583bbd12df3c6f5c42dc
+	# clang-16: https://github.com/llvm/llvm-project/commit/7f93ae808634e33e4dc9bce753c909aa5f9a6eb4
 	def_string "$(cc-option-str,-fstrict-flex-arrays=3)"
 
 config CC_OPT_NO_ALLOW_STORE_DATA_RACES
-	# gcc-10 renamed --param=allow-store-data-races=0 to -fno-allow-store-data-races
+	# gcc-10 renamed --param=allow-store-data-races=0 to -fno-allow-store-data-races:
+	#   https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=e622a32db78300821fc1327637ec6413febc2c66
+	# clang: not needed
 	def_string "$(cc-option-str,-fno-allow-store-data-races,--param=allow-store-data-races=0)" if CC_IS_GCC
 
 config CC_HAS_MNOP_MCOUNT
+	# s390 support
+	#   gcc-9: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=79c2f6d7de59d5580d224b491d5600d20e3101fe
+	#   clang-10: https://github.com/llvm/llvm-project/commit/93767143147b7d765c6ce8123a4226d449228649
+	# x86 support
+	#   gcc-5: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=ecc81e33123d7ac9c11742161e128858d844b99d
+	#   clang-24: https://github.com/llvm/llvm-project/commit/f514b16972f785fdd3fad1d19195aad5c9324fb5
 	def_bool $(cc-option,-mnop-mcount)
 
 config LD_OPT_FORCE_GROUP_ALLOCATION
+	# GNU ld 2.29: https://sourceware.org/git/gitweb.cgi?h=7bdf4127c38081c7764c0bf1db55d0b2e56391dc&p=binutils-gdb.git
+	# ld.lld 19: https://github.com/llvm/llvm-project/commit/4d9020ca0b125a936d5e26b48f07fcfa4bd78004
 	def_string "$(ld-option-str,--force-group-allocation)"
 
 config LD_OPT_NO_WARN_RWX_SEGMENTS
+	# GNU ld 2.39: https://sourceware.org/git/gitweb.cgi?h=ba951afb99912da01a6e8434126b8fac7aa75107&p=binutils-gdb.git
+	# ld.lld: not supported
 	def_string "$(ld-option-str,--no-warn-rwx-segments)"
 
 config CC_OPT_WNO_ADDRESS_OF_PACKED_MEMBER
+	# gcc-9: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=da77eace90fd99b38cd89ce281033d86ebfda434
+	# clang-4: https://github.com/llvm/llvm-project/commit/585ea9ddce50f3c3d3fd6dae0f9f148c074bcc2b
 	def_string "$(cc-option-str,-Wno-address-of-packed-member)"
 
 config CC_OPT_WNO_FORMAT_OVERFLOW_NON_KPRINTF
+	# clang-18: https://github.com/llvm/llvm-project/commit/56c3b8e997d065b568964f71715ecbbd28c2e4a4
+	# gcc: not needed, it has this behavior by default
 	def_string "$(cc-option-str,-Wno-format-overflow-non-kprintf)"
 
 config CC_OPT_WNO_FORMAT_TRUNCATION_NON_KPRINTF
+	# clang-18: https://github.com/llvm/llvm-project/commit/56c3b8e997d065b568964f71715ecbbd28c2e4a4
+	# gcc: not needed, it has this behavior by default
 	def_string "$(cc-option-str,-Wno-format-truncation-non-kprintf)"
 
 config CC_OPT_WNO_DEFAULT_CONST_INIT_UNSAFE
+	# clang-21: https://github.com/llvm/llvm-project/commit/00f9ef282c7482754a0fea497417604d1deca9fa
+	# gcc: not supported
 	def_string "$(cc-option-str,-Wno-default-const-init-unsafe)"
 
 config CC_OPT_WNO_DANGLING_POINTER
+	# gcc-12: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=9d6a0f388eb048f8d87f47af78f07b5ce513bfe6
+	# clang: not supported
 	def_string "$(cc-option-str,-Wno-dangling-pointer)"
 
 config CC_OPT_WVLA_LARGER_THAN
+	# gcc-7 for -Wvla-larger-than=: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=adc577c558a4b2e3b604511927cce17039d57c11
+	# gcc-9 for -Wvla-larger-than=0: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=00abf86c47606f8220d6508654ef52ef11d76e3d
+	# clang: not supported
 	def_string "$(cc-option-str,-Wvla-larger-than=1)"
 
 config CC_HAS_WSTRINGOP_OVERFLOW
+	# gcc-7: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=ee92e7bafb52d267f52e4c48edada5f279bcf591
+	# clang: not supported
 	def_bool $(cc-option,-Wstringop-overflow)
 
 config CC_OPT_WNO_UNTERMINATED_STRING_INITIALIZATION
+	# gcc-15: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=44c9403ed1833ae71a59e84f9e37af3182be0df5
+	# clang-21: https://github.com/llvm/llvm-project/commit/e8ae77947154e10dbc05cbb95ec9e10d3b0be13e
 	def_string "$(cc-option-str,-Wno-unterminated-string-initialization)"
 
 config CC_OPT_WERROR_DESIGNATED_INIT
+	# gcc-5: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=976d5a222fc23279e239ad926472c7810869e494
+	# clang: not supported
 	def_string "$(cc-option-str,-Werror=designated-init)"
 
 config CC_OPT_WENUM_CONVERSION
+	# gcc-10: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=68e2c1996ec6bde27363ce0db15233ac8cae1c4d
+	# clang-3.2: https://github.com/llvm/llvm-project/commit/68e2c7bee3ab337cc3134ff99fdd1ce2ddb33c2f
 	def_string "$(cc-option-str,-Wenum-conversion)"
 
 config CC_OPT_WNO_PACKED_NOT_ALIGNED
+	# gcc-8: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=00aa1fa221744dc57f6c6cea8baa669b732d1101
+	# clang: not supported
 	def_string "$(cc-option-str,-Wno-packed-not-aligned)"
 
 config CC_OPT_WNO_FORMAT_OVERFLOW
+	# gcc-7: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=bce6f76013fd5f2e88a235231231c7879597220c
+	# clang-18: https://github.com/llvm/llvm-project/commit/56c3b8e997d065b568964f71715ecbbd28c2e4a4
 	def_string "$(cc-option-str,-Wno-format-overflow)"
 
 config CC_OPT_WNO_STRINGOP_TRUNCATION
+	# gcc-8: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=025d57f037ad13eb479818b677ef4be4d97b639c
+	# clang: not supported
 	def_string "$(cc-option-str,-Wno-stringop-truncation)"
 
 config CC_HAS_COUNTED_BY
@@ -247,14 +303,20 @@ config CC_HAS_BROKEN_COUNTED_BY_REF
 	default y if CC_IS_CLANG && CLANG_VERSION < 220100
 
 config CC_HAS_ALLOC_TOKEN
+	# clang-22: https://github.com/llvm/llvm-project/commit/774ffe5cce7392e6b4e29c83e725337727c2c994
+	# gcc: not supported
 	def_bool $(cc-option,-falloc-token-max=123)
 
 config CC_HAS_MULTIDIMENSIONAL_NONSTRING
+	# gcc-15: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=ab714e60870d1bb98039652b760918b5e680ac10
+	# clang-21: https://github.com/llvm/llvm-project/commit/3d4f979e271d2a1fe0906f4d1b16db108838f98f
 	def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring__)) = { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
 
 config CC_OPT_INLINE_MEMSET
 	string
+	# gcc-14: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=1ff6d9f7428b0668cd8ab0b3e3ab94f1d733124d
 	default "-finline-stringops=memset" if $(cc-option,-finline-stringops=memset)
+	# clang-22: https://github.com/llvm/llvm-project/commit/b28eeb28bea39148738dc375e8a97072a1907e64
 	default "-mllvm -max-store-memset=4294967294" if $(cc-option,-mllvm -max-store-memset=4294967294)
 
 config LD_CAN_USE_KEEP_IN_OVERLAY

-- 
2.56.0

