Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22A4382F15
	for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2026 20:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786565790; cv=none; b=J1oAyk/cT5lsRKkAPqT3BtJFOI09WbPoKkv1XMNU5XGoDzk1Nz7lEbc2enfLay34i77SBf6+fDY4CkQ5d6vf1QBiZDsdqpLnSXMcKk/R/Bi0HMFaaV4NgMpEPaLRfsPLrF8ARDwqY9XfiNA+2q2BPWdR8jGzrgFkAz2YrrUzZ2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786565790; c=relaxed/simple;
	bh=AiVQmdE36y6QXny0Mmw4Gw6HubeIeMk4S/c50LTZycs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Saj4CBJeo6Tt3+r7yb1h7CFv4DjU24cnncNW1NtfZJNr7C6ewF/rg76u5hvB6YAOWh5b6SyBEdk3Mq85Nbr97TX35uK5UgqSf9Il2w7nm+62tECZSjBBYN8mKVKOIHT945JgPapMaqSuKc7vc7cryeW6SQhJqs6Y3wR7oIKCdYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L78PHBzC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L78PHBzC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786565787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gbcpa277ERO4n9n/VE9xEGfG5jSz1Qxd5sN8vPZTwBk=;
	b=L78PHBzCKY2c5g6dhgCJ1ElH8xaXg+5yMNbbO4pSZQNfEzzIUF0O94UmSPVPGC9Zc9HFF+
	DEd0osmViBszpcvYNkeGM5qrbvd3YzAR69vJqIHJj2Xdb9J8C5OytA4MK5X+se7EYr9iE7
	nO4p2gDP3uZLeCIyWwoUGcqYX1aQ4Fo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-352-Rs2ig2MqOKyLS9wXj7Lc7A-1; Wed,
 12 Aug 2026 16:16:24 -0400
X-MC-Unique: Rs2ig2MqOKyLS9wXj7Lc7A-1
X-Mimecast-MFC-AGG-ID: Rs2ig2MqOKyLS9wXj7Lc7A_1786565780
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A9E0C19560B5;
	Wed, 12 Aug 2026 20:16:19 +0000 (UTC)
Received: from paumurph-thinkpadp1gen7.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4C6151800348;
	Wed, 12 Aug 2026 20:16:14 +0000 (UTC)
From: Paul Murphy <murp@redhat.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Luis Augenstein <luis.augenstein@tngtech.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Andrew Jones <andrew.jones@linux.dev>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2] rust: enable fentry support
Date: Wed, 12 Aug 2026 15:16:06 -0500
Message-ID: <20260812201613.1783592-1-murp@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Turn it on if CONFIG_HAVE_FENTRY=y and rustc supports a compatible
fentry option. Nightly rustc supports fentry, fentry-record, and
fentry-nop-record. These are equivalent gcc's -mfentry, -mfentry
-mrecord-mcount, and -mfentry -mnop-mcount -mrecord-mcount.

Rust 1.98 adds support for x86 and s390x targets for
-Zinstrument-mcount=fentry.

Rust nightly supports all three options on s390. x86 supports only
fentry (this is a limitation of the x86 llvm backend). The expanded
options should arrive with Rust 1.99.

Signed-off-by: Paul Murphy <murp@redhat.com>
Link: https://github.com/rust-lang/rust/pull/152122
Link: https://github.com/rust-lang/rust/pull/158036
Link: https://github.com/rust-lang/rust/pull/160184

---

Changes in v2:
- Refactor for consistency
- Export RUSTC_FLAGS_FTRACE
- When FTRACE_MCOUNT_USE_CC is set, use rust's extended fentry support
  if supported or not at all.
- Link to v1: https://lore.kernel.org/rust-for-linux/20260724170132.3783816-1-murp@redhat.com/
---
 Makefile                        | 20 +++++++++++++++++++-
 scripts/generate_rust_target.rs |  2 ++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index bfb47ad8cb9a..7ece5a327c53 100644
--- a/Makefile
+++ b/Makefile
@@ -832,9 +832,11 @@ endif # KBUILD_EXTMOD
 # Defaults to vmlinux, but the arch makefile usually adds further targets
 all: vmlinux
 
-# The arch Makefiles can override CC_FLAGS_FTRACE. We may also append it later.
+# The arch Makefiles can override CC_FLAGS_FTRACE or RUSTC_FLAGS_FTRACE.
+# We may also append them later.
 ifdef CONFIG_FUNCTION_TRACER
   CC_FLAGS_FTRACE := -pg
+  RUSTC_FLAGS_FTRACE :=
 endif
 
 ifdef CONFIG_TRACEPOINTS
@@ -1053,10 +1055,26 @@ ifdef CONFIG_HAVE_FENTRY
     CC_FLAGS_FTRACE	+= -mfentry
     CC_FLAGS_USING	+= -DCC_USING_FENTRY
   endif
+  ifdef CONFIG_FTRACE_MCOUNT_USE_CC
+    # Support for mcount record/nop is not gated by rustc version for all architectures.
+    ifdef CONFIG_HAVE_NOP_MCOUNT
+      ifeq ($(call rustc-option-yn, -Zinstrument-mcount=fentry-nop-record),y)
+        RUSTC_FLAGS_FTRACE += -Zinstrument-mcount=fentry-nop-record
+      endif
+    else
+      ifeq ($(call rustc-option-yn, -Zinstrument-mcount=fentry-record),y)
+        RUSTC_FLAGS_FTRACE += -Zinstrument-mcount=fentry-record
+      endif
+    endif
+  else
+      RUSTC_FLAGS_FTRACE += $(if $(call rustc-min-version,109800),-Zinstrument-mcount=fentry,)
+  endif
 endif
 export CC_FLAGS_FTRACE
+export RUSTC_FLAGS_FTRACE
 KBUILD_CFLAGS	+= $(CC_FLAGS_FTRACE) $(CC_FLAGS_USING)
 KBUILD_AFLAGS	+= $(CC_FLAGS_USING)
+KBUILD_RUSTFLAGS += $(RUSTC_FLAGS_FTRACE)
 endif
 
 # We trigger additional mismatches with less inlining
diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index 3bf296581a88..eb80a06d50d3 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -198,6 +198,7 @@ fn main() {
         ts.push("arch", "x86_64");
         if cfg.rustc_version_atleast(1, 98, 0) {
             ts.push("rustc-abi", "softfloat");
+            ts.push("supports-fentry", true);
         } else if cfg.rustc_version_atleast(1, 86, 0) {
             ts.push("rustc-abi", "x86-softfloat");
         }
@@ -240,6 +241,7 @@ fn main() {
         ts.push("arch", "x86");
         if cfg.rustc_version_atleast(1, 98, 0) {
             ts.push("rustc-abi", "softfloat");
+            ts.push("supports-fentry", true);
         } else if cfg.rustc_version_atleast(1, 86, 0) {
             ts.push("rustc-abi", "x86-softfloat");
         }

base-commit: 7059bdf4f04a3e14f4fafb3ac35fdca913e3e21a
-- 
2.55.0

