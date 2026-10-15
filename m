Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4F85372DB
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Oct 2026 14:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076256; cv=none; b=nfqctB6FoiR/hFXdWu345wh2o//26UyP24vpp7mqqUIg6JXccNf7WpVoVlBpY/GS4U0lKr/mRbD4hfoPL6WgTKiRu9XRYv0hVetgVaPkn6AIxN5CYJuz10RI6v4tQhH84VKD1tPjizwvpE2xIbDp745Ow0ZhoDvqKDR5uAHR40U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076256; c=relaxed/simple;
	bh=QAyeiaW7+aIN5evILupFJmKAY783tUHdvKx8n3lMW0Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JTUVs3MhI94RZusHSWjGeX8eFNT1c56XvYfHeK4oMu4z2GmYQ052TeobtbUw6ehPh/tlerbogJ4dg9kvEH9WSqRZ6Mtx5yxW//s6AXH8eG4SjN2Ug0tgLcFeYaALRrEsH8APDVa7YBepPSmkJOww9vnEg7QVE2C+PEg18sLfmLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sx+9/T30; arc=none smtp.client-ip=209.85.208.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sx+9/T30"
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6a9b7e63963so5873406a12.1
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Oct 2026 07:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792076251; x=1792681051; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQz4nxc0KCuE74ESb77Z4+pfRphjcREbEdzXeMwHKGc=;
        b=Sx+9/T30yySGGOy1Fxet0M5hABBMMMNpSbLMF4KJ98WHCM4L6ILL8szqq//s4zuapG
         QsTEWiYmZiwbQbTwSHb2r7A8pKipxA0HF46GKNYZWEiOaWJ+cHMBqHLQw82KxX2s+aM7
         cRD47wMfjkwSLg0h8A2+O/kWEll723WZw1Kkej05jDt++31f3ioZKb3rJeOlw98933Ec
         wJYcbRvSRO4JvxPZnomnQbU0JY7AxYXkY0pDTryki13fK6oofYTNOu/kBWuzjS+PmP6s
         5AIbiiuHJo/dpg3625mJNftqsFO+00URXpvNDwVmhurzslWc2eFFw3JxkwWJcRKLCTR4
         AAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076251; x=1792681051;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQz4nxc0KCuE74ESb77Z4+pfRphjcREbEdzXeMwHKGc=;
        b=U5C7W3XuDR3uu/z6+zDr+8ql+N2ohjvH5yvC5D8AiHMY/9E9l+M2Zdv8IqxK9Awf9c
         /gfqVjaH2CjME1hPw7DwfAk/lI5imXn2fBMveMYRFlil7BZe9kXEfaRteEf5RGe50bxm
         bFiq0QBvc9h4wFyV6bmqMhqdXQigaOVk2WYpI9NU90j6K04AAUu3+cl9/7IOXDoIZZj7
         ZmvdzjIAWZC7TiIAPNegEZt9Q+vu6XBu21z5H11eev6ShrY1UDHM0ski9JmoJwPTLxgB
         jSUKuEHsZcUixSDGnqwdYMBBornscQKwJbJElVJLlxB5KMIPi3U5eWeEc30Fsk6RVUsG
         R4OQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwmOoJJUty6yDCE/2TObNDRyscOGMeQQqIsBbxm1kwfydWYE+gMyR26SM0MpgghOynvbtJgZeNdYWCmWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIV3ode3BGTVgyjncIrItbTq3joBEmK00hiU7C4C/bgF8R0lfWM
	e8E7gVbxMWjVayCzMefpeyB5WacPDsOB6h8oN0tRWb2A+bGTaoQm859egcCztH1phvCyx1MCo5u
	DuA==
X-Received: from edev15-n2.prod.google.com ([2002:a05:6402:a2cf:20b0:6ae:1a0f:68be])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:c4d6:10b0:6ac:a1e1:3f88
 with SMTP id 4fb4d7f45d1cf-6b17c23e892mr11643306a12.14.1792076251124; Thu, 15
 Oct 2026 07:57:31 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:56:15 +0000
In-Reply-To: <20261015145714.3327543-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261015145714.3327543-2-elver@google.com>
Subject: [PATCH v2 2/2] rust: kcsan: add KUnit test for data race detection
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Add a minimal KUnit test that checks that KCSAN detects data races in
Rust code: two threads concurrently increment a shared counter without
synchronization, and a probe on the console tracepoint waits for the
KCSAN report (similar to kcsan_test.c):

| BUG: KCSAN: data-race in _RNvNtNtCskctMpSfuwL9_6kernel10kcsan_test5tests8racy_inc / _RNvNtNtCskctMpSfuwL9_6kernel10kcsan_test5tests8racy_inc
|
| read-write to 0xffffffffb751ae28 of 8 bytes by task 116 on cpu 5:
|  _RNvNtNtCskctMpSfuwL9_6kernel10kcsan_test5tests8racy_inc+0x1c/0x30
|  _RNvNtNtCskctMpSfuwL9_6kernel10kcsan_test5tests28kunit_rust_wrapper_data_race+0x28c/0x850
|  kunit_try_run_case+0xdf/0x2a0
|  kunit_generic_run_threadfn_adapter+0x48/0x80
|  kthread+0x234/0x280
|  ret_from_fork+0xf8/0x280
|  ret_from_fork_asm+0x1a/0x30
|
| read-write to 0xffffffffb751ae28 of 8 bytes by task 12 on cpu 3:
|  _RNvNtNtCskctMpSfuwL9_6kernel10kcsan_test5tests8racy_inc+0x1c/0x30
|  _RNvXsb_NtCskctMpSfuwL9_6kernel9workqueueINtNtCs1G77UTwpz6o_4core3pin3PinINtNtNtB7_5alloc4kbox3BoxINtB5_11ClosureWorkNCNvNtNtB7_10kcsan_test5tests9data_races_0ENtNtB1d_9allocator7KmallocEEINtB5_15WorkItemPointerKy0_E3runB7_+0x55/0x120
|  process_scheduled_works+0x4cd/0x970
|  worker_thread+0x4de/0x6e0
|  kthread+0x234/0x280
|  ret_from_fork+0xf8/0x280
|  ret_from_fork_asm+0x1a/0x30
|
| value changed: 0x000000000000022b -> 0x00000000000005a2
| [...]

The test is intentionally kept minimal; comprehensive tests of KCSAN's
runtime behaviour are in kernel/kcsan/kcsan_test.c.

Assisted-by: Antigravity
Acked-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Marco Elver <elver@google.com>
---
v2:
* Fix formatting.
---
 MAINTAINERS                     |   1 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/Kconfig.test        |  11 +++
 rust/kernel/kcsan_test.rs       | 137 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 5 files changed, 152 insertions(+)
 create mode 100644 rust/kernel/kcsan_test.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b..3fbbfbb31f5d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14089,6 +14089,7 @@ F:	Documentation/dev-tools/kcsan.rst
 F:	include/linux/kcsan*.h
 F:	kernel/kcsan/
 F:	lib/Kconfig.kcsan
+F:	rust/kernel/kcsan_test.rs
 F:	scripts/Makefile.kcsan
 
 KDUMP
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 4b31aa7f432f..b06d5142d6e1 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -97,6 +97,7 @@
 #include <linux/xarray.h>
 #include <net/genetlink.h>
 #include <net/netlink.h>
+#include <trace/events/printk.h>
 #include <trace/events/rust_sample.h>
 
 /*
diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
index e6a5c7a795f0..caf98a23de76 100644
--- a/rust/kernel/Kconfig.test
+++ b/rust/kernel/Kconfig.test
@@ -83,4 +83,15 @@ config RUST_BITFIELD_KUNIT_TEST
 
 	  If unsure, say N.
 
+config RUST_KCSAN_KUNIT_TEST
+	bool "KUnit test for KCSAN instrumentation of Rust code" if !KUNIT_ALL_TESTS
+	depends on KCSAN && HAVE_KCSAN_RUSTC && TRACEPOINTS
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables a KUnit test checking that KCSAN detects data
+	  races in Rust code. The test needs at least 2 CPUs to reliably
+	  observe a data race.
+
+	  If unsure, say N.
+
 endif
diff --git a/rust/kernel/kcsan_test.rs b/rust/kernel/kcsan_test.rs
new file mode 100644
index 000000000000..24810cf2970a
--- /dev/null
+++ b/rust/kernel/kcsan_test.rs
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! KUnit test checking that KCSAN detects data races in Rust code.
+
+#[macros::kunit_tests(rust_kcsan)]
+mod tests {
+    use crate::{
+        bindings,
+        error::to_result,
+        ffi::{
+            c_char,
+            c_void, //
+        },
+        prelude::*,
+        sync::{
+            atomic::{
+                Atomic,
+                Relaxed, //
+            },
+            Arc,
+            Completion, //
+        },
+        time::{
+            Delta,
+            Instant,
+            Monotonic, //
+        },
+        types::ScopeGuard,
+        workqueue, //
+    };
+    use core::{
+        cell::UnsafeCell,
+        ptr,
+        slice, //
+    };
+
+    struct Racy(UnsafeCell<u64>);
+
+    // SAFETY: Not actually safe: unsynchronized concurrent access is the point of this test.
+    unsafe impl Sync for Racy {}
+
+    static RACY: Racy = Racy(UnsafeCell::new(0));
+
+    /// Set by [`probe_console`] once KCSAN reported a data race in [`racy_inc`].
+    static OBSERVED: Atomic<bool> = Atomic::new(false);
+
+    #[inline(never)]
+    fn racy_inc() {
+        let p = RACY.0.get();
+        // SAFETY: `p` is valid; the data race is intentional. `wrapping_add()` keeps the load and
+        // store in one basic block, so that the access is instrumented as a compound access (plain
+        // writes may be assumed atomic with `CONFIG_KCSAN_ASSUME_PLAIN_WRITES_ATOMIC=y`).
+        unsafe {
+            *p = (*p).wrapping_add(1);
+        }
+    }
+
+    fn contains(haystack: &[u8], needle: &[u8]) -> bool {
+        haystack.windows(needle.len()).any(|w| w == needle)
+    }
+
+    /// Probe for the `console` tracepoint.
+    ///
+    /// # Safety
+    ///
+    /// `buf` must be non-null and valid for reads of `len` bytes.
+    unsafe extern "C" fn probe_console(_data: *mut c_void, buf: *const c_char, len: usize) {
+        // SAFETY: By the safety requirements of this function.
+        let line = unsafe { slice::from_raw_parts(buf.cast::<u8>(), len) };
+
+        if contains(line, b"BUG: KCSAN: data-race in ") && contains(line, b"racy_inc") {
+            OBSERVED.store(true, Relaxed);
+        }
+    }
+
+    #[pin_data]
+    struct Ctx {
+        stop: Atomic<bool>,
+        #[pin]
+        done: Completion,
+    }
+
+    #[test]
+    fn data_race() -> Result {
+        // Do not pass on a report from a previous run of this suite.
+        OBSERVED.store(false, Relaxed);
+
+        let ctx = Arc::pin_init(
+            pin_init!(Ctx {
+                stop: Atomic::new(false),
+                done <- Completion::new(),
+            }),
+            GFP_KERNEL,
+        )?;
+
+        // SAFETY: `probe_console` has the signature expected by the `console` tracepoint. Being
+        // part of the kernel image, it and `OBSERVED` outlive the registration, so there is no
+        // need to synchronize with in-flight probes after unregistering.
+        to_result(unsafe {
+            bindings::tracepoint_probe_register(
+                &raw mut bindings::__tracepoint_console,
+                probe_console as *mut c_void,
+                ptr::null_mut(),
+            )
+        })?;
+        let _unregister = ScopeGuard::new(|| {
+            // SAFETY: The probe was registered above.
+            unsafe {
+                bindings::tracepoint_probe_unregister(
+                    &raw mut bindings::__tracepoint_console,
+                    probe_console as *mut c_void,
+                    ptr::null_mut(),
+                );
+            }
+        });
+
+        let worker = ctx.clone();
+        workqueue::system_unbound().try_spawn(GFP_KERNEL, move || {
+            while !worker.stop.load(Relaxed) {
+                racy_inc();
+            }
+            worker.done.complete_all();
+        })?;
+
+        let start = Instant::<Monotonic>::now();
+        while !OBSERVED.load(Relaxed) && start.elapsed() < Delta::from_secs(10) {
+            racy_inc();
+        }
+
+        ctx.stop.store(true, Relaxed);
+        ctx.done.wait_for_completion();
+        drop(_unregister);
+
+        assert!(OBSERVED.load(Relaxed));
+        Ok(())
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 4d5c96ddc49c..009efda9e7a4 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -94,6 +94,8 @@
 pub mod iov;
 pub mod irq;
 pub mod jump_label;
+#[cfg(CONFIG_RUST_KCSAN_KUNIT_TEST)]
+mod kcsan_test;
 #[cfg(CONFIG_KUNIT)]
 pub mod kunit;
 pub mod list;
-- 
2.56.0.385.gd3acb90ef8-goog

