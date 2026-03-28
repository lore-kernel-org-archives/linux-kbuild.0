Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7845231B833
	for <linux-kbuild@vger.kernel.org>; Sat, 28 Mar 2026 01:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774660779; cv=none; b=qW1vvyq6JG+rh5T7c6Mr3sjI4igHgXk+O8qN7rpCfu9fqugXjyhlUt48fp70BISSrZyckwtAPwQ2GIj0VNJX1IetbJJqNiJwIwVvqczYSWr60uvx5o1jld1e/elRRmN9ckN7u57lHXqzU3Sy4MrtOOsvGpRS6PF6RcNhM0T6a0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774660779; c=relaxed/simple;
	bh=pLb70nUROcDCtC8MsDxGNVPoPBV2zge0oM7aB3yEADQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ueVhSni761QUWBF5ICZ0o6FFA6qhrmFRpftXfZDqrw2zAbiOa/5IkLaItd6HzteRUeg8hQUnUKQgwJ63PRcGkpNsZb9vLhTDwXjsdYZX9oMf9nOSPBbD7d4KaU8lNue2R0w1k/euwcPaCUyQ9UuJGauU2f2a7z34F3D/y+Tht5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H+XAHEi4; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H+XAHEi4"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-12a7755623cso922159c88.1
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Mar 2026 18:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774660773; x=1775265573; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=77Ac1GrJdreMNETx1ERKI8GGaFAhTfW3lT0AoWZDZpU=;
        b=H+XAHEi48nEBCGCZFocFTrqbnMlbvl4ky9TExpBw3+lKKVNQ+NEWCFEq50jBNOE+rQ
         G7GnwdoQLjMqwPoReBjGsKYXwadjLaWjxc9jwcWfXgKAElQ4ThNgXt4FyRkTEoPWGreQ
         JA3wYGYqygHRyVh8iwASj7jkQg2gQ8diQ5M8Va+dsEqeQ/i6+7tmOCE0+GCWKzxZps9t
         ZgvfJgMGwpcoaA4766MBJ6y5kNrXZZ7UOAEgCwrTVZLwdWSNl8HZSgxcFUBWk1b4l9tA
         E/SuLr74/du8oHPuFPj4Sd+NmkOkJVOtVveL9Zqc4blqFHtlvCsC/PeG6GIv/0cmzInO
         Ysug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774660773; x=1775265573;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77Ac1GrJdreMNETx1ERKI8GGaFAhTfW3lT0AoWZDZpU=;
        b=qsUhB6OOtBohVF8ZLxcQFchvyxWcDBbS9XaP65S18hVRU9JpzZTjysO+OJZ1ln55G4
         4/owN29gLxmGmK/128Tpa1zA11U7KBZeCGcwYdxaqLEBGKdF1e0dD1TVTP1ssflPckny
         Qy5q8X3YxvOuiV940EDam86xEO/6Hy6kb1pvsVpGDSBiv9u6gJE1HRBCw9pdZu6VoX6e
         h/RcEaoNVAtnb43fW03OZ70IWpEHA3nXG9nJhg5Iam354MJQ9oyiBouSbMsFYMAC3QUC
         FsAb6vsJr//gwxvJ0UrYRn92NA5akE2ZXexGx3QlAmbWSij0jYmOKpfshaRqahKPDOhJ
         DxrA==
X-Forwarded-Encrypted: i=1; AJvYcCXclpXo+Fxylw7oT+VZwhtO7tQs3g3lBjw3G0zbge2zBW6Z7JwAo1nEydZNqZWjL1+VdKfnAGBNC+orwpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRnyyq67zLmDOlctveR6Ie0mfouJxH4Qct+GkP9kk9Wu1wtG9W
	V9kV/so/Vxddu+gtWZuOW0HBjjee1KilUGoZQuIqAQStul9pWAViHEDJM7v0j6L4Gx2Z+w==
X-Received: from dleb17-n2.prod.google.com ([2002:a05:701b:4251:20b0:128:e734:a2bd])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b8a:b0:123:330b:3a0
 with SMTP id a92af1059eb24-12ab28617bamr2690906c88.14.1774660772475; Fri, 27
 Mar 2026 18:19:32 -0700 (PDT)
Date: Sat, 28 Mar 2026 01:19:25 +0000
In-Reply-To: <20260328011927.3569802-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260328011927.3569802-1-xur@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260328011927.3569802-2-xur@google.com>
Subject: [PATCH v7 1/3] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
From: xur@google.com
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Rong Xu <xur@google.com>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Teresa Johnson <tejohnson@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

From: Masahiro Yamada <masahiroy@kernel.org>

Move the build rule for vmlinux.a to a separate file in preparation
for supporting distributed builds with Clang ThinLTO.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Tested-by: Rong Xu <xur@google.com>
Signed-off-by: Rong Xu <xur@google.com>
---
 Makefile                   | 16 +++++--------
 scripts/Makefile.vmlinux_a | 46 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 10 deletions(-)
 create mode 100644 scripts/Makefile.vmlinux_a

diff --git a/Makefile b/Makefile
index a8d8ed711f9b..69ccf9b8507d 100644
--- a/Makefile
+++ b/Makefile
@@ -1264,7 +1264,7 @@ export ARCH_DRIVERS	:= $(drivers-y) $(drivers-m)
 KBUILD_VMLINUX_OBJS := built-in.a $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
 KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
 
-export KBUILD_VMLINUX_LIBS
+export KBUILD_VMLINUX_OBJS KBUILD_VMLINUX_LIBS
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 
 ifdef CONFIG_TRIM_UNUSED_KSYMS
@@ -1273,16 +1273,12 @@ ifdef CONFIG_TRIM_UNUSED_KSYMS
 KBUILD_MODULES := y
 endif
 
-# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <= 14
-quiet_cmd_ar_vmlinux.a = AR      $@
-      cmd_ar_vmlinux.a = \
-	rm -f $@; \
-	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
-	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
+PHONY += vmlinux_a
+vmlinux_a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux_a
 
-targets += vmlinux.a
-vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
-	$(call if_changed,ar_vmlinux.a)
+vmlinux.a: vmlinux_a
+	@:
 
 PHONY += vmlinux_o
 vmlinux_o: vmlinux.a $(KBUILD_VMLINUX_LIBS)
diff --git a/scripts/Makefile.vmlinux_a b/scripts/Makefile.vmlinux_a
new file mode 100644
index 000000000000..9774f02b43b2
--- /dev/null
+++ b/scripts/Makefile.vmlinux_a
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+PHONY := __default
+__default: vmlinux.a
+
+include include/config/auto.conf
+include $(srctree)/scripts/Kbuild.include
+include $(srctree)/scripts/Makefile.lib
+
+# Link of built-in-fixup.a
+# ---------------------------------------------------------------------------
+
+# '$(AR) mPi' needs --thin to workaround the bug of llvm-ar <= 14
+quiet_cmd_ar_builtin_fixup = AR      $@
+      cmd_ar_builtin_fixup = \
+	rm -f $@; \
+	$(AR) cDPrS --thin $@ $(KBUILD_VMLINUX_OBJS); \
+	$(AR) mPi --thin $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
+
+targets += built-in-fixup.a
+built-in-fixup.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
+	$(call if_changed,ar_builtin_fixup)
+
+# vmlinux.a
+# ---------------------------------------------------------------------------
+
+targets += vmlinux.a
+vmlinux.a: built-in-fixup.a FORCE
+	$(call if_changed,copy)
+
+# Add FORCE to the prerequisites of a target to force it to be always rebuilt.
+# ---------------------------------------------------------------------------
+
+PHONY += FORCE
+FORCE:
+
+# Read all saved command lines and dependencies for the $(targets) we
+# may be building above, using $(if_changed{,_dep}). As an
+# optimization, we don't need to read them if the target does not
+# exist, we will rebuild anyway in that case.
+
+existing-targets := $(wildcard $(sort $(targets)))
+
+-include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
+
+.PHONY: $(PHONY)
-- 
2.53.0.1018.g2bb0e51243-goog

