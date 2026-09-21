Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75A551EDF9;
	Mon, 21 Sep 2026 22:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029905; cv=none; b=L0vZTHB3zPThgMLYXTUFgo+iJKay5TQhE+Tw/BHBMrAmp+1DH8wwMaLVrnCcP0tLErBZJR7Tb8Fi1Ummhpbt/CUqLdCjw1k0UmuzjzP1R/zyFZ+PjgFJxnIyHXygiQrAuJ+/v+tHkX1AhDlmhVTVbeJq7q9R/OpAsTPDZ8FVl4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029905; c=relaxed/simple;
	bh=bt1v2MFIkoOgk6d9X3H0GT2Ey/+Mnc+bGFMTMI0Ne7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BAfVZ4XqDiaPRE8U41DoOEFc9O22+xoLS0c7um0CIKTfPbuvWlr+0KFtKyjo3uE+lH4WI4CpUgOBtYaPUkKRPN11y4/Ru+E+6lFTzpGtLFCw9K+KD7XVI3aL0iZpMLZ1TiumqcI02cEqBDKMOBpDqDl6PTrYnhW4Ru7x5PTYKuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZxQE3iR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZxQE3iR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4DA1F000FF;
	Mon, 21 Sep 2026 22:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790029903;
	bh=tZ1V/qlOg64xwAZ89qAk5CU0xG1VN1VySNLZebqo06c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gZxQE3iRN38LZbOlS92UCYlNPEXy8G46wP7djIo9p3PSqHRXNS+zPXngRKs2lvGqN
	 qKmRBKEgKBddCUw+nW/+W1CEBtNGmEHRZQPOOaS/fGT7VHgLmLQp81t0I9v0haONRT
	 9DTkDitfY4sAer4Oz+vwvynLlULCVQQMbOuJ40zxSLHWt5AXDjGNVUU9A3w93WLb2G
	 W0A3BANTNLut9ssZ79PXZnPpwpK+ZfkrRzvhdL5Rn04ttFwKw5bPELIcRycl0rqggZ
	 OPAhu2uaCfX1EGcQwn+7rWG3VhJAyj2y9tCpF6sSMAnw7paIULbKrHe+zEUHN8bEzo
	 8ULAy+C13iTig==
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
Subject: [PATCH v3 13/28] rust: Annotate the intrinsic stubs as returnable
Date: Mon, 21 Sep 2026 15:31:14 -0700
Message-ID: <93cfd994e314357feb37f524c575a497f33213cc.1790028654.git.jpoimboe@kernel.org>
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

When building the Rust core library, the compiler emits calls to
compiler-rt builtins like __udivti3() for 128-bit arithmetic, which the
kernel doesn't want, so objcopy is used to redirect those calls to stubs
which just panic.

Problem is, their call sites still expect them to return, which confuses
objtool.

Objtool doesn't report any warnings today because the stubs are weak,
which noreturn detection currently ignores.  In preparation for removing
that restriction, annotate them as returnable.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 rust/Makefile                                  |  6 ++++++
 rust/compiler_builtins.rs                      | 12 ++++++++++++
 rust/kernel/.gitignore                         |  1 +
 rust/kernel/generated_ignore_noreturn_asm.rs.S |  7 +++++++
 4 files changed, 26 insertions(+)
 create mode 100644 rust/kernel/generated_ignore_noreturn_asm.rs.S

diff --git a/rust/Makefile b/rust/Makefile
index da1a7409d9845..02795bcd54d62 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -49,6 +49,8 @@ ifndef CONFIG_UML
 always-$(subst y,$(CONFIG_RUST),$(CONFIG_BUG)) += kernel/generated_arch_warn_asm.rs kernel/generated_arch_reachable_asm.rs
 endif
 
+always-$(subst y,$(CONFIG_RUST),$(CONFIG_OBJTOOL_DEFERRED)) += kernel/generated_ignore_noreturn_asm.rs
+
 # Avoids running `$(RUSTC)` when it may not be available.
 ifdef CONFIG_RUST
 
@@ -749,6 +751,10 @@ $(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
 $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
+ifdef CONFIG_OBJTOOL_DEFERRED
+$(obj)/compiler_builtins.o: $(obj)/kernel/generated_ignore_noreturn_asm.rs
+endif
+
 $(obj)/zerocopy.o: private skip_clippy = 1
 $(obj)/zerocopy.o: private skip_gendwarfksyms = 1
 $(obj)/zerocopy.o: private rustc_target_envs := $(zerocopy-envs)
diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
index fc6b54636dd54..2d8461c75ec59 100644
--- a/rust/compiler_builtins.rs
+++ b/rust/compiler_builtins.rs
@@ -33,6 +33,18 @@ macro_rules! define_panicking_intrinsics(
             pub extern "C" fn $ident() {
                 panic!($reason);
             }
+
+            // The redirected call sites were compiled against the real
+            // intrinsics, which return.  Tell objtool to ignore the noreturn
+            // status of the panicking intrinsics.
+            #[cfg(CONFIG_OBJTOOL_DEFERRED)]
+            ::core::arch::global_asm!(
+                include!(concat!(
+                    env!("OBJTREE"),
+                    "/rust/kernel/generated_ignore_noreturn_asm.rs"
+                )),
+                sym = sym $ident,
+            );
         )*
     }
 );
diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
index f636ad95aaf3d..a78a3e0e220a1 100644
--- a/rust/kernel/.gitignore
+++ b/rust/kernel/.gitignore
@@ -3,3 +3,4 @@
 /generated_arch_static_branch_asm.rs
 /generated_arch_warn_asm.rs
 /generated_arch_reachable_asm.rs
+/generated_ignore_noreturn_asm.rs
diff --git a/rust/kernel/generated_ignore_noreturn_asm.rs.S b/rust/kernel/generated_ignore_noreturn_asm.rs.S
new file mode 100644
index 0000000000000..e2a531cba8acd
--- /dev/null
+++ b/rust/kernel/generated_ignore_noreturn_asm.rs.S
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/annotate.h>
+
+// Cut here.
+
+ASM_ANNOTATE_LABEL({sym}, ANNOTYPE_IGNORE_NORETURN)
-- 
2.55.0

