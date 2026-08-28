Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95D93BE146;
	Fri, 28 Aug 2026 04:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787892722; cv=none; b=tYhxTxBYqs38Whj5t7tdG2CFz4CFDWHq2oPEdLyG0WUXBp2vWcqeCITmYj3U7oKymPeTlU2uYHa9bzdVXNhCFuSUZosHtt7EBu0sPsVtYV5TX6KXzSUmVjxScORnrA8oJ81hwCWke+ZJTtsFi8sPu5ZVD01J1hjgTP1bIwk6Yfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787892722; c=relaxed/simple;
	bh=kMaAzVzqldZi3L+NBU5zmzD1vKq84nBQFgu+Kg0BAok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dQdb1eL7iC8QXY7TgrZfkl9MNq7kOusFC3mYvgkLI12IeNOHL0TaboRPv5UEOt/J87shdE5o+xHD73dL1sc6HozYe4UAyuaVQITSgKpFx39xj+4V/mpJTHsHjPNwkz45qavFt4HE9A4xzTpKZHy2v8GCJx0fCalf7AFi9ob4Arg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OYfI/Ntm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OYfI/Ntm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFE21F00A3D;
	Fri, 28 Aug 2026 04:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787892720;
	bh=ZotmoIRC9zGDTZDpYLopDHQLH75rqAHtU3SWvffOJ24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OYfI/NtmCwpsvB8npeWu/vkAaEhBtGTQbFOph5ZecWWwgkfmthbJ1OB5/0BwCdsK/
	 bbhg60DUZIIYFpS9W5px3UGL3sPUErFdQvnkrfRZupUEZZ5Z3voCQ2GLQTBFJWgO6v
	 fmDjewtMxgOm3etQSHAm63EtXmHW6DOHv+R11WX8mA3H7XrmnPLTfViMglKRN34coE
	 2xYaldd0IHh6NY8yr5KqyxMQJYXHM6GB7x8He062WDGx/9gcweeSa1fStRQMe+M27p
	 LLmUq9jdQlTG16zI7Zl3SG2/3SK23lLW0EONOn1kQo4tclZLSA985QHh6LH/r9ZX8L
	 83C9bcnJnvepw==
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
Subject: [PATCH 03/27] kbuild: Add CONFIG_OBJTOOL_CONTROL_FLOW
Date: Thu, 27 Aug 2026 21:51:32 -0700
Message-ID: <3582f93053165d01099c576f756c31df8e8bf50d.1787890035.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787890035.git.jpoimboe@kernel.org>
References: <cover.1787890035.git.jpoimboe@kernel.org>
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
 lib/Kconfig.debug | 10 ++++++++--
 lib/Kconfig.ubsan |  2 +-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 9ca9b2519d604..0ea5ad31969ce 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -588,8 +588,14 @@ config NOINSTR_VALIDATION
 	select OBJTOOL
 	default y
 
-# For when objtool defers its work to the linked image (vmlinux.o or module.o)
-# rather than running on individual translation units.
+# Objtool reverse-engineers the control flow graph
+config OBJTOOL_CONTROL_FLOW
+	def_bool y
+	depends on OBJTOOL
+	depends on UNWINDER_ORC || STACK_VALIDATION || HAVE_UACCESS_VALIDATION
+
+# Objtool defers its work to the linked image (vmlinux.o or module.o) rather
+# than running on individual translation units.
 config OBJTOOL_DEFERRED
 	def_bool y
 	depends on OBJTOOL
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

