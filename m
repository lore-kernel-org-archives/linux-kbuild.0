Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBB436DA00;
	Wed,  7 Oct 2026 15:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791386559; cv=none; b=rFRPEPyipT0rSJt8x3bncLkdjEVbCTqnRvXPwAGMaS940bwZJ2HBi9MkC86+jAGzdgPQh07tVTARQKdvX+H8Kx+lfqbnpmJx+hOw4lodHAfUCVFOYdne36J02iCcVS/iG/VKb8BVXpj31MOEd0+FwnIUuFyC4jGmW3k3+3Q1AyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791386559; c=relaxed/simple;
	bh=qmPn2JEiSVkOXWZ6j0MwdNN7A94tBlZRvww/DTUhbEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WuHpPWMVtAwclp5XIDFxUeMlGJ+1pEAPpWrJZen+pHs0O1On6Pukmi4/cljqyKDAjGmwlInaiTxAoeXME1//Pcy7G9T4rjgQRiI3nSCmeDQWHhL73baOuPLzzvaznUNY/q7YTTbopLn+sKpY/ZWNmyaa/73h9mAUfLFsTpA+f40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLo+kLs7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLo+kLs7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6501F00893;
	Wed,  7 Oct 2026 15:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791386554;
	bh=y/cLKF7aCIfI9pkvpi2kVxTKSevxkLdbDRk3yxWlFeo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BLo+kLs7YHOfoR/w9rCUi7iUPKkJLrI7YPOkaN0ierYAae5oJXReAbiyBuBtpif7L
	 8v2cKF4s1XQ5m16BvNMg9omuyipVwOcTJLQP4XFyyT8Y2xzeyxM0pADXNeIRvUnekH
	 NTH86YroLi+LFqXLsS7XN8qe24BwTBiJos68mdQraiPUT88jjEe+6bGC7onhWHDfvK
	 +a7l7cVab2GSoN5XFMDe8Z+8DK8VcEZTn4WsoYCdE126IjqMs7+tItUCL/06eqxi44
	 UiOLgMEndrvw08/QIlLoTfj96B8U3nNfEFgoPYYa986Wvy/Kdhm0ZEy9uCTGgXnDjp
	 lQUh61DyWlqOg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 07 Oct 2026 17:22:21 +0200
Subject: [PATCH 1/2] scripts/Kconfig.toolchain: Drop compiler symbols from
 dependencies
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-scripts-kconfig-toolchain-improvements-v1-1-1e524178da11@kernel.org>
References: <20261007-scripts-kconfig-toolchain-improvements-v1-0-1e524178da11@kernel.org>
In-Reply-To: <20261007-scripts-kconfig-toolchain-improvements-v1-0-1e524178da11@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Julian Braha <julianbraha@gmail.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2716; i=nathan@kernel.org;
 h=from:subject:message-id; bh=qmPn2JEiSVkOXWZ6j0MwdNN7A94tBlZRvww/DTUhbEY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnHkjcnHph9kflKhHWh9pmTLK/v/vm2s/cR3watO43iR
 725FOsrOkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBELjYy/PfYNFfg963K06Z1
 DfWpHyO8T9xdZjSDj/sK88N5GWdf7TzH8JuNycPX4M8hZRGZ+rs5dwXWyv4+pjqbw1kmd59c+0b
 uPmYA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Commit 454e00cf8ee5 ("kbuild: avoid re-running compiler and linker
probes") moved many cc-option calls from the main Makefile into Kconfig.
In the process, code such as

  ifdef CONFIG_CC_IS_GCC
  KBUILD_CFLAGS += $(call cc-option,-foo)
  endif

was converted into Kconfig as

  config CC_OPT_FOO
      def_string "$(cc-option-str,-foo)" if CC_IS_GCC

The 'if CC_IS_GCC' is generally unnecessary because it does not prevent
the cc-option-str call from running (which is the primary reason the
ifdef guards exists in the Makefile), as cc-option-str and the like are
run before Kconfig even parses the dependency. It only impacts the
symbol's visibility, which does not really matter in the general case,
so remove these dependencies.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Kconfig.toolchain | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
index d708a175fe48..c9a1692e6149 100644
--- a/scripts/Kconfig.toolchain
+++ b/scripts/Kconfig.toolchain
@@ -161,10 +161,10 @@ config CC_OPT_STRICT_FLEX_ARRAYS
 
 # gcc-10 renamed --param=allow-store-data-races=0 to -fno-allow-store-data-races
 config CC_OPT_ALLOW_STORE_DATA_RACES_PARAM
-	def_string "$(cc-option-str,--param=allow-store-data-races=0)" if CC_IS_GCC
+	def_string "$(cc-option-str,--param=allow-store-data-races=0)"
 
 config CC_OPT_NO_ALLOW_STORE_DATA_RACES
-	def_string "$(cc-option-str,-fno-allow-store-data-races)" if CC_IS_GCC
+	def_string "$(cc-option-str,-fno-allow-store-data-races)"
 
 config CC_HAS_MNOP_MCOUNT
 	def_bool $(cc-option,-mnop-mcount)
@@ -183,13 +183,13 @@ config CC_OPT_WNO_ADDRESS_OF_PACKED_MEMBER
 	def_string "-Wno-address-of-packed-member" if $(cc-option,-Waddress-of-packed-member)
 
 config CC_OPT_WNO_FORMAT_OVERFLOW_NON_KPRINTF
-	def_string "-Wno-format-overflow-non-kprintf" if CC_IS_CLANG && $(cc-option,-Wformat-overflow-non-kprintf)
+	def_string "-Wno-format-overflow-non-kprintf" if $(cc-option,-Wformat-overflow-non-kprintf)
 
 config CC_OPT_WNO_FORMAT_TRUNCATION_NON_KPRINTF
-	def_string "-Wno-format-truncation-non-kprintf" if CC_IS_CLANG && $(cc-option,-Wformat-truncation-non-kprintf)
+	def_string "-Wno-format-truncation-non-kprintf" if $(cc-option,-Wformat-truncation-non-kprintf)
 
 config CC_OPT_WNO_DEFAULT_CONST_INIT_UNSAFE
-	def_string "-Wno-default-const-init-unsafe" if CC_IS_CLANG && $(cc-option,-Wdefault-const-init-unsafe)
+	def_string "-Wno-default-const-init-unsafe" if $(cc-option,-Wdefault-const-init-unsafe)
 
 config CC_OPT_WNO_DANGLING_POINTER
 	def_string "-Wno-dangling-pointer" if $(cc-option,-Wdangling-pointer)

-- 
2.56.0

