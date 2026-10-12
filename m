Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764A72931EE
	for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2026 13:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812530; cv=none; b=eTOk5aeHuCTHogVIvwfZpKlY4Ax7aP/NkNDo6ni3xj85dTFORYM/5TsECNJVWoz5JzgsKGr2g3uOKvA4c3eQaj66nOn55yAch0t0etd19T/Obiq774rMYi6LI9cBMBWLt6XGZ6syN4s3rI7krhCH9cw5fjjM2i4mnGJU+wcvHcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812530; c=relaxed/simple;
	bh=834HCsT+yG6FoiMCNmsSF0KuEbbYNjXGWtFDC+r4/lU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=hV2+Kl+Uj4oP04kObOWfhJ6frrl8GbDUcstxONqOKVq0+mAQJD6D1HfxhWuauRXxkmdIV9MiPmb082qm2kNxpE1xq+WbCG4Cc3wv1RznKFcyzao0d249kTKRL4e1Sk903efslWX0/Ihqr4GczN7AgUjO+lYEcXvktAK6wzpdMmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fz/W7yGE; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fz/W7yGE"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a01c621dc2so14244275e9.2
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2026 06:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791812526; x=1792417326; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PWBgbU9wWHlrfBumGJ2ey37GLEs4mFig313aUL/JPgY=;
        b=Fz/W7yGEXsBlppDtivPiKEoGKO2CberpbbAp5P1DDjbGF8BshorxXGEeH9cQnYZhMF
         3An3QgkMPX64zcP1Ak5OBvYmmHMipv92JsI9DvHu20MwG2z44gfb+TtsJS4xPNcwNUqt
         QrmAAkquVuTHZUjRizozcEmDjjb+qOswx2by413vyTncPlhuwFR/5OjttqJJmF09HYYk
         YPUIuzjpHtA4gn6hLIQUTQr+ajBrJeVZHIGZu5txS070+84WARo3ljEtoIDM456EpTZ7
         fIMcx2pNuk1O1UMLSyVPdliHqMpEYBZ2KGQljg8hAYeS43Grf+WFICzbPxLY/SpDa3Ny
         hLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812526; x=1792417326;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWBgbU9wWHlrfBumGJ2ey37GLEs4mFig313aUL/JPgY=;
        b=UFqrGHaoZJ/XknB+t487HzjWkRUKuhIzTEvUt+BEIwGipOnv3dO57BPVKmqQV/MklC
         R2O+cDChU9qwBLL1cbAHx5XkbCwXJv+c8gquObv/57KP50rURxJFiPIrt3bSq5WHYR5k
         qrd2bgU2Tmgl9ZF+5wtMNxE75dEdX4CHKyiT22xjkoNHcp6tVzG2i3IdnbM/9GxF61KS
         qGgKxzautUSjcIXxM5dtoWVDezfvt2JAlYnGpIKpQPPeRlLu8CeIA6IHTA9BhDTOmGFL
         7jjNJjhHPxUvhn8f4RG9E6vScSCNBzJcL0n31VZdoIgO4P5i9MpL0zUgL4yRE/2l/Y09
         JhHw==
X-Forwarded-Encrypted: i=1; AKwUvBxTCYfU2OFZBMAUnsrcxI726snytu6fBfvPuhGs14lmHQuCuw5He99b/j+kbT4YGs7vUUH4LIHN/qobt04=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1jUnyaE/nHrAH8WxwR04jD3VbPcDNT1WLdcgGookgRcEGi7TL
	rDtwFkgDO3U4cpUsc0sGooMkC95XQ58kJcJFx74dz6jrsJu8f7kx3bg5AfR5djUldDQ9qQpdl4Q
	mbA==
X-Received: from wmrp18.prod.google.com ([2002:a05:600c:8a92:b0:4a1:9311:9d1d])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8518:b0:49f:cbf3:551c
 with SMTP id 5b1f17b1804b1-4a18e4a8ca6mr166715615e9.12.1791812524523; Mon, 12
 Oct 2026 06:42:04 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:39:14 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261012134159.912183-1-elver@google.com>
Subject: [PATCH 1/2] kbuild: rust: enable KCSAN support
From: Marco Elver <elver@google.com>
To: elver@google.com, Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>
Cc: Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Rust supports ThreadSanitizer instrumentation via LLVM, which is what
KCSAN relies on; however, Rust code is not currently instrumented.

Pass -Zsanitizer=thread and the same TSan backend options used for C
code to rustc. Wire up KCSAN_SANITIZE in scripts/Makefile.lib for parity
with C (though rustc currently rejects linking crates with mismatched
instrumentation).

rustc only accepts -Zsanitizer=thread for targets that declare support
for it. Of the targets used by the kernel, this is only possible for the
generated x86_64 target specification, so restrict instrumentation of
Rust code to x86_64 for now via HAVE_KCSAN_RUSTC. On other architectures
Rust code remains uninstrumented as before.

All TSan options used are supported by the LLVM versions of the minimum
supported rustc, so no rustc-option checks are needed (they would also
fail, because x86_64-unknown-none used for option checks does not
support -Zsanitizer=thread).

With this enabled we can detect data races in kernel Rust code and
between Rust and C code.

Signed-off-by: Marco Elver <elver@google.com>
---
 Documentation/dev-tools/kcsan.rst |  7 +++++++
 lib/Kconfig.kcsan                 |  7 +++++++
 scripts/Makefile.kcsan            | 13 +++++++++++++
 scripts/Makefile.lib              |  3 +++
 scripts/generate_rust_target.rs   |  2 +-
 5 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kcsan.rst b/Documentation/dev-tools/kcsan.rst
index 8575178aa87f..3bb8754f844b 100644
--- a/Documentation/dev-tools/kcsan.rst
+++ b/Documentation/dev-tools/kcsan.rst
@@ -14,6 +14,9 @@ Usage
 KCSAN is supported by both GCC and Clang. With GCC we require version 11 or
 later, and with Clang also require version 11 or later.
 
+Rust code is instrumented as well on architectures whose Rust target supports
+it (currently only x86_64; see ``CONFIG_HAVE_KCSAN_RUSTC``).
+
 To enable KCSAN configure the kernel with::
 
     CONFIG_KCSAN = y
@@ -121,6 +124,10 @@ the below options are available:
 
     KCSAN_SANITIZE := n
 
+  Note that ``rustc`` rejects linking crates built with and without KCSAN
+  instrumentation, so ``KCSAN_SANITIZE`` and ``KCSAN_SANITIZE_<target>.o``
+  cannot currently be used for Rust code.
+
 .. _"Marking Shared-Memory Accesses" in the LKMM: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/memory-model/Documentation/access-marking.txt
 
 Furthermore, it is possible to tell KCSAN to show or hide entire classes of
diff --git a/lib/Kconfig.kcsan b/lib/Kconfig.kcsan
index 4ce4b0c0109c..f0096e1c8b61 100644
--- a/lib/Kconfig.kcsan
+++ b/lib/Kconfig.kcsan
@@ -10,6 +10,13 @@ config HAVE_KCSAN_COMPILER
 	  For the list of compilers that support KCSAN, please see
 	  <file:Documentation/dev-tools/kcsan.rst>.
 
+config HAVE_KCSAN_RUSTC
+	def_bool RUST && X86_64
+	help
+	  rustc only accepts -Zsanitizer=thread for targets that declare
+	  support for it; of the kernel's Rust targets, only x86_64 does.
+	  Elsewhere, Rust code is not instrumented.
+
 menuconfig KCSAN
 	bool "KCSAN: dynamic data race detector"
 	depends on HAVE_ARCH_KCSAN && HAVE_KCSAN_COMPILER
diff --git a/scripts/Makefile.kcsan b/scripts/Makefile.kcsan
index 19f693b68a96..01af6fd71006 100644
--- a/scripts/Makefile.kcsan
+++ b/scripts/Makefile.kcsan
@@ -24,3 +24,16 @@ kcsan-cflags += $(call cc-option,$(call cc-param,tsan-instrument-func-entry-exit
 endif
 
 export CFLAGS_KCSAN := $(kcsan-cflags)
+
+ifdef CONFIG_HAVE_KCSAN_RUSTC
+# The minimum supported rustc's LLVM supports all of these options.
+rustc-param = -Cllvm-args=-$(1)
+kcsan-rustflags := -Zsanitizer=thread \
+	$(call rustc-param,tsan-compound-read-before-write=1) \
+	$(call rustc-param,tsan-distinguish-volatile=1)
+ifndef CONFIG_KCSAN_WEAK_MEMORY
+kcsan-rustflags += $(call rustc-param,tsan-instrument-func-entry-exit=0)
+endif
+endif
+
+export RUSTFLAGS_KCSAN := $(kcsan-rustflags)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0a4fdd8bd975..78f1c23e54be 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -98,6 +98,9 @@ ifeq ($(CONFIG_KCSAN),y)
 _c_flags += $(if $(patsubst n%,, \
 	$(KCSAN_SANITIZE_$(target-stem).o)$(KCSAN_SANITIZE)$(is-kernel-object)), \
 	$(CFLAGS_KCSAN))
+_rust_flags += $(if $(patsubst n%,, \
+	$(KCSAN_SANITIZE_$(target-stem).o)$(KCSAN_SANITIZE)$(is-kernel-object)), \
+	$(RUSTFLAGS_KCSAN))
 # Some uninstrumented files provide implied barriers required to avoid false
 # positives: set KCSAN_INSTRUMENT_BARRIERS for barrier instrumentation only.
 _c_flags += $(if $(patsubst n%,, \
diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index 7687b0dd5474..4b02bffa6b46 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -231,7 +231,7 @@ fn main() {
         }
         ts.push("features", features);
         ts.push("llvm-target", "x86_64-linux-gnu");
-        ts.push("supported-sanitizers", ["kcfi", "kernel-address"]);
+        ts.push("supported-sanitizers", ["kcfi", "kernel-address", "thread"]);
         if cfg.rustc_version_atleast(1, 91, 0) {
             ts.push("target-pointer-width", 64);
         } else {
-- 
2.56.0.385.gd3acb90ef8-goog

