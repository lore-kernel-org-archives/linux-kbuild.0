Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82D04B4891;
	Wed,  7 Oct 2026 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791386561; cv=none; b=EbVKX9HxqSyBCU9LrEPdRdoKRH9w5sRibibP7j7RypLSXiaZ91/34WTwnqX0rH2qclS4nCfN9n65Mx/VPXe56DZXnhnyLoOJQLE5joNy8jkMiRCebsRaSkEbEyNUW4nsOP1Uh32SNJoQsVpquDwlQ7Ym5IjOs/WvcdzjsnbzGZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791386561; c=relaxed/simple;
	bh=hNtYjXgJAZZqdNWsMtQDEtK7G2NVN+EGSnFXD+xHiVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pht08AQWcrmw6/ZnaJmzZmFFN01fM1N8oOZ0T8DlF5R0M2PCwrBVtNrx0oK5kgJo1KMEZA7GaYKlptvdzWdTd/xyRKvEz0cHfdtSNsvq0GyShXVMG0WfALbl+c7un11fjhPtER2rgRglmboNxYIk1+eVGiNu1s/6CZ/2MpA8GZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXViOvM6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXViOvM6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBBB1F00898;
	Wed,  7 Oct 2026 15:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791386555;
	bh=TO1W31yn8Vaaq46mcQZhJ5cjF3/tHzrqD96+F//Af5E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EXViOvM668q0AmZY84oZy8EavbiixXbGL0+i04IQMqJKaalxQ6Zgk8ALGztvLeDG2
	 Jr4CVQP8FtcIjiUCDSL4VCy+FWh30XFmDD45vrgUZ4sIHzrQtrMhBLMbrjuq/PLYcW
	 BWRPD4eloM0qn//RdfFMmMYu09PoHREhJyadbympnzQ6OpYCaBGY20UTR8Z4BZptDv
	 kh8EmEL0ayqXhYSXPXjHdqdLwJeVSq2B+DjRR6CgE/tdFfgrAtt4QNk8Pyt9LGgdc+
	 81zaf/1v8EYOXyaxnKibvvCvAK73COFvExmRNkcblXy0mGgQ77XeoZ3Juc/v6HBJh+
	 GKi4SItMlJ3Rg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 07 Oct 2026 17:22:22 +0200
Subject: [PATCH 2/2] kconfig: Improve ergonomics around disabling warnings
 with cc-option
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-scripts-kconfig-toolchain-improvements-v1-2-1e524178da11@kernel.org>
References: <20261007-scripts-kconfig-toolchain-improvements-v1-0-1e524178da11@kernel.org>
In-Reply-To: <20261007-scripts-kconfig-toolchain-improvements-v1-0-1e524178da11@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Julian Braha <julianbraha@gmail.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3747; i=nathan@kernel.org;
 h=from:subject:message-id; bh=hNtYjXgJAZZqdNWsMtQDEtK7G2NVN+EGSnFXD+xHiVk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnHkrf4+zPFrQw7rPym1fOq6a/zXya0rlNikH33S+vUW
 775jxZv7yhlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQAT2XiVkWFjkJbAhjXfV31a
 wih7WMdV78FtzV1Wk8rW9ihpboiMz9/GyHDz9w0vpWOrK1R5F7jVJx+8vfFV2czTSpFvz3V2/7e
 eaccDAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

This is essentially a port of commit 550ccb178de2 ("Make 'cc-option'
work correctly for the -Wno-xyzzy pattern") to scripts/Kconfig.include,
which simplifies the definition of many of the newly added CC_OPT_WNO_
symbols in scripts/Kconfig.toolchain and matches cc-option's behavior in
Kbuild.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Kconfig.include   |  2 +-
 scripts/Kconfig.toolchain | 18 +++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 622d21e6953f..a7d9201acfcc 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -26,7 +26,7 @@ failure = $(if-success,$(1),n,y)
 # $(cc-probe,<flag>)
 # The command $(cc-option) and $(cc-option-str) test <flag> with. Not meant
 # to be called directly; use one of those two instead.
-cc-probe = trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(CC) -Werror $(CLANG_FLAGS) $(1) -c -x c /dev/null -o .tmp_$$/tmp.o
+cc-probe = trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(CC) -Werror $(CLANG_FLAGS) $(shell,echo $(1) | sed "s;^-Wno-;-W;") -c -x c /dev/null -o .tmp_$$/tmp.o
 
 # $(cc-option,<flag>)
 # Return y if the compiler supports <flag>, n otherwise
diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
index c9a1692e6149..254393d4f98a 100644
--- a/scripts/Kconfig.toolchain
+++ b/scripts/Kconfig.toolchain
@@ -180,19 +180,19 @@ config LD_OPT_NO_WARN_RWX_SEGMENTS
 	def_string "$(ld-option-str,--no-warn-rwx-segments)"
 
 config CC_OPT_WNO_ADDRESS_OF_PACKED_MEMBER
-	def_string "-Wno-address-of-packed-member" if $(cc-option,-Waddress-of-packed-member)
+	def_string "$(cc-option-str,-Wno-address-of-packed-member)"
 
 config CC_OPT_WNO_FORMAT_OVERFLOW_NON_KPRINTF
-	def_string "-Wno-format-overflow-non-kprintf" if $(cc-option,-Wformat-overflow-non-kprintf)
+	def_string "$(cc-option-str,-Wno-format-overflow-non-kprintf)"
 
 config CC_OPT_WNO_FORMAT_TRUNCATION_NON_KPRINTF
-	def_string "-Wno-format-truncation-non-kprintf" if $(cc-option,-Wformat-truncation-non-kprintf)
+	def_string "$(cc-option-str,-Wno-format-truncation-non-kprintf)"
 
 config CC_OPT_WNO_DEFAULT_CONST_INIT_UNSAFE
-	def_string "-Wno-default-const-init-unsafe" if $(cc-option,-Wdefault-const-init-unsafe)
+	def_string "$(cc-option-str,-Wno-default-const-init-unsafe)"
 
 config CC_OPT_WNO_DANGLING_POINTER
-	def_string "-Wno-dangling-pointer" if $(cc-option,-Wdangling-pointer)
+	def_string "$(cc-option-str,-Wno-dangling-pointer)"
 
 config CC_OPT_WVLA_LARGER_THAN
 	def_string "$(cc-option-str,-Wvla-larger-than=1)"
@@ -201,7 +201,7 @@ config CC_HAS_WSTRINGOP_OVERFLOW
 	def_bool $(cc-option,-Wstringop-overflow)
 
 config CC_OPT_WNO_UNTERMINATED_STRING_INITIALIZATION
-	def_string "-Wno-unterminated-string-initialization" if $(cc-option,-Wunterminated-string-initialization)
+	def_string "$(cc-option-str,-Wno-unterminated-string-initialization)"
 
 config CC_OPT_WERROR_DESIGNATED_INIT
 	def_string "$(cc-option-str,-Werror=designated-init)"
@@ -210,13 +210,13 @@ config CC_OPT_WENUM_CONVERSION
 	def_string "$(cc-option-str,-Wenum-conversion)"
 
 config CC_OPT_WNO_PACKED_NOT_ALIGNED
-	def_string "-Wno-packed-not-aligned" if $(cc-option,-Wpacked-not-aligned)
+	def_string "$(cc-option-str,-Wno-packed-not-aligned)"
 
 config CC_OPT_WNO_FORMAT_OVERFLOW
-	def_string "-Wno-format-overflow" if $(cc-option,-Wformat-overflow)
+	def_string "$(cc-option-str,-Wno-format-overflow)"
 
 config CC_OPT_WNO_STRINGOP_TRUNCATION
-	def_string "-Wno-stringop-truncation" if $(cc-option,-Wstringop-truncation)
+	def_string "$(cc-option-str,-Wno-stringop-truncation)"
 
 config CC_HAS_COUNTED_BY
 	bool

-- 
2.56.0

