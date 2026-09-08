Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723BD3ACEFE;
	Tue,  8 Sep 2026 20:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899670; cv=none; b=iWwWeBsk3qSzIO/1TqqbHkq+/KuATRpaFgLOIKv2RZZUh+GW+tqjVlBebJV5L0VKWbCMZi0qWCuBGRs+v1eO+Vy2qC1IgkHGjv9trMOocQ1Vo/CW6VG3NYKIWLDLUEcHGJ6u8+2zoewSOlCOrfcw+2/LOHN1Rr1ORMpgZDuORzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899670; c=relaxed/simple;
	bh=O81HT+mIgDJAy1cCfMpx/ONioPq0zYP6UdtfLQYnxJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A94LeCCIx54UzS+cmzvAISSzL9Fa1EEztgqEAB/+r5kPErOKPNZilvXvAs9F/VY1igYUJ7hU24aDvNzM2JFQCBOpm+gvYlks1erVcg6yXzHM3lmHU6S7GJRk1b1GU7smib3AmRMAyw8dIIAqdNlQKkpOdiZ5sIJR6ay7vzfSfzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCBRIfwB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCBRIfwB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C791F00ACA;
	Tue,  8 Sep 2026 20:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788899669;
	bh=EuXYCJ5Ykpyd3OA9AF2y2pP9oytdW5lrjb6VD5F01hI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WCBRIfwB9M33/7sZHZpIkdthFzxILhaHoSFRcohAwMd6AmSGgKrBmnEvrpNWoO84W
	 5a3xL9foLyIT4enTGlTKCEvZwye3v2D2CjKE3GFq6wuMsUn5B0v3KJdNBwTZ952gf8
	 AAyyi0JuECMZYo7g1huV0OnJxSENwm6YjjCHqsVG7Zltbs43SwkvVKqM8hggsXiYvR
	 L/fT3XkSOuEWxa5UswMLP6YaW6uAda4hBE+JZ/LxcWUSeMB6VPN0X1zSdl5WDE4qX5
	 OcQaZssND3EI7AwjpVJQxF5YlN/D22p57TgsAr4HCebU+s20rY84y5gCmzydsmL877
	 EsOgWEt8ld8Hg==
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
Subject: [PATCH v2 03/27] kbuild: Add CONFIG_OBJTOOL_CONTROL_FLOW
Date: Tue,  8 Sep 2026 13:33:15 -0700
Message-ID: <311f4e2f9aa6b2274e5a0758d5b8712874a86371.1788899473.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788899473.git.jpoimboe@kernel.org>
References: <cover.1788899473.git.jpoimboe@kernel.org>
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
index 566e5be4c3f57..5e58671be8fbd 100644
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

