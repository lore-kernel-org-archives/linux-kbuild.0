Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C0751E43E;
	Mon, 21 Sep 2026 22:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029899; cv=none; b=mE2OxnAM9cMrn9nOCfLiapomuZzps1ZRULFnt+EKfAxdXp1KRmq828fKk/RkQeNNAaqGtyBp5BOldkWN/SR9XeksDSLn6cc4Awk3FjxbB9KuRxezdIfLa3w34xfjv3Dj0xpqo6ITr41+V9Ih3/hlk2IetEuuTKk3qljIgdgzdnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029899; c=relaxed/simple;
	bh=I3cUPEoJDwNZGAbTCXbq7O0NgC68s7dJu3xEODW1JNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sl8VL/I+2QR+okv74uhVO4p8bnpmzgkW3zpJwpaQC0LzhIxHZc6HV/NlAcnjrXDFoHBsYqWlM8o5+OGzEnYWRoJjkKdquuQGMJJacrg3Y4wVP4FdG7zoLzvs2rXj0cePVSrMTppeRFAwlF8fKh0CHzLRAJiB5SA2kVgAPoYRsZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4gUeOLG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4gUeOLG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFCFA1F00893;
	Mon, 21 Sep 2026 22:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029898;
	bh=U0yU5rw0NziWIOJnMbl/NvSbyXFcGJvjYEnN57Vp/0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W4gUeOLGFAjpF9c00FQ0CZ6EJ5FIL/eS83IOKEq0aHfRZQWLG7HcrpgIZ7HGChPd3
	 XoilUwlvqhcC26zu6CJfZYr7pce7FLCdAGOMgpC/mE4UeC9H28QAKiob9U0AHAZWlg
	 N1+FSLMVUdrz2ijP48i1Fk0rOlyXhDrjieywQRg1tlGtldRbbOAK7YZMKz2w9arko/
	 L5WOXoWC6csAxvfEUvUh30wUHbGoGPUGvZd8N5R3GbS+3Lcybavl7VI5yO7mSU2Dag
	 d/XAy2aWBqtjAgYMYHzUcszn1WP6PNevR/oebzglrjWKq9vy7WK+4TtXeOsKu3UV9g
	 HGSgmgl6PfECQ==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Gary Guo <gary@garyguo.net>,
	rust-for-linux@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH v3 03/28] kbuild: Add CONFIG_OBJTOOL_CONTROL_FLOW
Date: Mon, 21 Sep 2026 15:31:04 -0700
Message-ID: <a80f670beb8272e9d78700530fd064fd839493db.1790028654.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790028654.git.jpoimboe@kernel.org>
References: <cover.1790028654.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a config option for when objtool reverse engineers the control flow
graph of every function.

No functional change.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 lib/Kconfig.debug | 6 ++++++
 lib/Kconfig.ubsan | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 55732323dc16e..798a10ded19fd 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -577,6 +577,12 @@ config OBJTOOL_DEFERRED
 	depends on OBJTOOL
 	depends on LTO_CLANG || X86_KERNEL_IBT || KLP_BUILD
 
+# Objtool reverse-engineers the control flow graph
+config OBJTOOL_CONTROL_FLOW
+	def_bool y
+	depends on OBJTOOL
+	depends on UNWINDER_ORC || STACK_VALIDATION || HAVE_UACCESS_VALIDATION
+
 config STACK_VALIDATION
 	bool "Compile-time stack metadata validation"
 	depends on HAVE_STACK_VALIDATION && UNWINDER_FRAME_POINTER
diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index 1ecaae7064d2a..61e8c86ef63be 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -110,7 +110,7 @@ config UBSAN_UNREACHABLE
 	bool "Perform checking for unreachable code"
 	# objtool already handles unreachable checking and gets angry about
 	# seeing UBSan instrumentation located in unreachable places.
-	depends on !(OBJTOOL && (STACK_VALIDATION || UNWINDER_ORC || HAVE_UACCESS_VALIDATION))
+	depends on !OBJTOOL_CONTROL_FLOW
 	depends on $(cc-option,-fsanitize=unreachable)
 	help
 	  This option enables -fsanitize=unreachable which checks for control
-- 
2.55.0

