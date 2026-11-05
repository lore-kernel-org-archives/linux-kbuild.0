Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901484;
	b=hJshruonssk222AKTtxlZ1y4hcTQoa9l6ySIK+mj48kONNhI4gZGo47uOeOuLjhwJHvo
	 Q39LiBjSmxxJuMHYZeww6CFwhx228/kkM6mvb5kQISeojpzApBp/AOjZpeZI8199mS5mr
	 gplqiF2ANKlMvGG7G9JWDiyW1OKZswF365C19YSjylztDcvGtZSITlFuOSdqZtPeFCGz6
	 jAyznHY5bYbJZDFDYUiQQyzBklHz7SArBM0cS8p41icgMy8rdEEPQrVCOFeevScWn/6Sk
	 /yUcDt11sVz/Trqoc8dajIRiNtQ/MHiFur/nhqBspguGgpoZk/cb9pC6Ayp9iVWsXDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901484;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=jt/ZC4ffziQ7HvruyvzDkrQAXNr+AY6nKD92MbqZCIk=;
	b=H8ytMD3pYM6TWAY3JlQOb4mA+BJztEqpN9TgPc9NfkJRmVpeSMOm8XDYeoiPjVuskI8e
	 qTIfbQDPrFEr/DZ+tT+p+gSZFhIN4JFDpHYp2gzyvYS8/FrtAUvJASepoRIAq/t61KXzI
	 DyJTfptivW0ZQP42zmdZcis96A5q5E4IcE0Qe5n7Hd7UaeDzgHuRxWDkhJPLhy2lqtoLu
	 nJ2HlmxWn/I1jcu2mk0qVJXsGS53LAzQOdKzhI2EF+dsA0gyPbG/ZH9/llBgHvglRNakE
	 4Ddj0uTZOYHysJrbzLMhrIQ80+YbcR4svi4KCk4u1r82zDOLTpJo65VPq/rrU03Hyxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AgAKc8wg;
	arc=none smtp.remote-ip=95.215.58.182
Received: from mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990CD606A329
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 17:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 990CD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AgAKc8wg
X-Envelope-To: linux-kbuild@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=t/uW8VN3ksFEgU2O3uKnkH6tZzjG+ETFuBB6/SpxnVs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793901481; v=1; x=1794506281;
 b=AgAKc8wgFWLMex2cNUdFjuEf2C6u0ObZqSX0huen+CbkVNeZbCIfBEieWWXUZL5OohEZ80Qa
 TZ464/+4niDatN8XLS08scBUgMzaBp7Xpfhf/o3h2ZMbj+Q0GIZu/Fs/uBTnbbA1oPZI6SWi+8s
 eG+lDm5q9ychMP+YyHCeAtgU=
X-Envelope-To: linux-kbuild@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ff7274c36764d8fc;
	Thu, 05 Nov 2026 17:58:01 +0000
X-Mizu-Trace-ID: ff7274c36764d8fc
X-Migadu-Flow: FLOW_OUT
From: Vineet Gupta <vineet.gupta@linux.dev>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Vineet Gupta <vineet.gupta@linux.dev>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Jakub Jelinek <jakub@redhat.com>,
	Julian Braha <julianbraha@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2] kbuild: move gcc's -Wconstant-logical-operand to W=2
Date: Thu,  5 Nov 2026 09:57:45 -0800
Message-ID: <20261105175748.3057520-1-vineet.gupta@linux.dev>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC 17 adds -Wconstant-logical-operand to -Wall. It warns when an operand
of && or || folds to a constant other than 0 or 1. Unlike clang's version,
it also checks constant left operands and operators that come from a
macro expansion. With CONFIG_WERROR=y, an x86 defconfig build fails in
prepare0:

  arch/x86/include/asm/cpufeature.h:72:36: error: use of logical '&&' with constant operand '4194304' [-Werror=constant-logical-operand]

The warning is meant to catch && written for &. Kernel history has no
such catch. Of the 13 earlier kernel fixes for clang's version, only
commit dd7fe5d9fd6a ("rtc: max31335: Fix comparison in
max31335_volatile_reg()") fixed a bug that the warning found. Commit
394b52462020 ("drm/i915/gem: fix bitwise and logical AND mixup") fixed a
& written for &&, which the warning cannot see. The other fixes rewrote
correct code. In GCC's own tree, the warning found two sites since it
was added, and both were false positives.

Disable the warning for GCC unless W=2 is given. Keep clang's version,
which skips macros and constant left operands.

Suggested-by: Borislav Petkov <bp@alien8.de>
Link: https://lore.kernel.org/all/20261104160722.1637541-1-vineet.gupta@linux.dev/
Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
---
v1 -> v2:
 - Replace the four per-site fixes with this one change (Borislav, Peter)
 - Link to v1: https://lore.kernel.org/all/20261104160722.1637541-1-vineet.gupta@linux.dev/

 scripts/Kconfig.toolchain | 3 +++
 scripts/Makefile.warn     | 1 +
 2 files changed, 4 insertions(+)

diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
index 2acbd40a38f1..1d68075f0469 100644
--- a/scripts/Kconfig.toolchain
+++ b/scripts/Kconfig.toolchain
@@ -233,6 +233,9 @@ config CC_OPT_WNO_FORMAT_OVERFLOW
 config CC_OPT_WNO_STRINGOP_TRUNCATION
 	def_string "$(cc-option-str,-Wno-stringop-truncation)"
 
+config CC_OPT_WNO_CONSTANT_LOGICAL_OPERAND
+	def_string "$(cc-option-str,-Wno-constant-logical-operand)"
+
 config CC_HAS_COUNTED_BY
 	bool
 	# clang needs to be at least 20.1.0 to avoid potential crashes
diff --git a/scripts/Makefile.warn b/scripts/Makefile.warn
index 556fa249ca07..03b677bdbb0a 100644
--- a/scripts/Makefile.warn
+++ b/scripts/Makefile.warn
@@ -167,6 +167,7 @@ endif
 
 ifdef CONFIG_CC_IS_GCC
 KBUILD_CFLAGS += -Wno-maybe-uninitialized
+KBUILD_CFLAGS += $(CONFIG_CC_OPT_WNO_CONSTANT_LOGICAL_OPERAND)
 endif
 
 endif
-- 
2.53.0-Meta

