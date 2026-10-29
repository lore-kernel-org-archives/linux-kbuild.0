Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291417;
	b=RDb0XEBE4wptpvQCw80DleUwwbRqFryTBYUCp0k285eP8NLpoXq3RmXW8RdxFXd+A4MM
	 F9EAL/PodwSMAZDu0Xj4tli24stZ40efRJrszrCAe4SukAinYMlkUNHHmCccFtAAYaLpb
	 DPkoW/biAqiFqU3zaQ0bSlm29QYgOErQT88EzQoSqS0JTybZHM/9ilfPrVQD+cIlskLRc
	 01FqyqkYcK+q1yKJnVNuE49AaE7G4d0ZWnsVxFJ8G1FOl2TGTW9WJVEmJ8X0XZ1BlhSRd
	 6mnB6sgktGFcl39hFXAbUKngs+vZkvP0Lx0bHqx4Y+4NH4KJ6OePmCNKP9iVrLlAnTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RTCYXgZDAP7kL0c73EPxbRM/Qq3+2h7CL6Elx37qtM4=;
	b=IEPuh1QEkkuZwTAyskiD+SI22Yjo6ildxkoxOcrhw4REungv+RjUmZ1gnCH88ama0bUE
	 DVaHB278VX/DRZOPUAv4hxSIncY02gf2L+JgRPi2DZFl/HEqaKMW2OC2TkCsZaUnTWm8v
	 8Qcl4NA0xzCK716sKxyEqdXiyKNdme/pMHZKtzFXG9+uR+oJX/4/H9HVMZqB+ap0iXaur
	 tow2lHZ8Tu4bELJp60n0hro3yBhhyxBsUMr7cGCXfShtikLdsf8K3QYA4jZLY4Aybe/Cb
	 TGJjVYV2x7vHgg25Rb6iQIQzlYVh/LtBWNsjaQmgt/1YSkU0gll/Q0UoHhX//xxpy+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Cz3zvFoG;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E7E60A381D
	for <linux-kbuild@vger.kernel.org>; Thu, 29 Oct 2026 16:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09E7E60A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Cz3zvFoG
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so4513514eec.1
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Oct 2026 09:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793291416; x=1793896216; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTCYXgZDAP7kL0c73EPxbRM/Qq3+2h7CL6Elx37qtM4=;
        b=Cz3zvFoGVxx+n4/1NGNRzbUOxTZxjZnueWzXnAt7fVTlP/+2Vyw+iRO5at6NM2LS4Z
         hpK36ZWQ5MEZPXaBNnRNZTuETMeQgL5BSdRv/b06Os2eNr29CWiUV3UZkOBxQc14vTt1
         9bYUgxKysN7hDzUb6U27ZKX5wdtk/wK3TO0Apv8WHYxnVYu4I/emkA7S7X0l50VOxtbe
         PhNeUfIBDf/0fRMY5Ogqy3O5pG4kl1YsVnnF1AcmsWflJ5oYOYSHY3BadTTgl59yUcPv
         Bx40bF5FE/TRE08DMXq6xjOAdKmJRLO1vww+6WohrtcHR2/ZelJT+VIrX9p/eDhqe46b
         pqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291416; x=1793896216;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RTCYXgZDAP7kL0c73EPxbRM/Qq3+2h7CL6Elx37qtM4=;
        b=2L2XPxsn0XYiPrYCJDdmfVBqqYFB9456coIjdzSDOWUT3Mpw6+IG0qdvSnIiGqEWQD
         KCiPgUAkxwQsnIEwR4cVYgLzpYlAvP+CaFlkltFrGo6X6TSL+GUlO/hdmn8gwTSXnm57
         WiJZy7jbPUCuNgh+u/5bNiVFk/xSOl4LzMvVwOeVxAm/MaNluRMAoI8wvubA7zgcEH7g
         NyGWwcRcGntW1MZLY0gU7YccvjQBBYp2umhX+0Mhmuh+WIEO+FYXPLaL69dy7R7B1LUh
         todAG6RO3wr42cCh0IF4PbzYO8p7jtbgRWo1ENqkJR7HhSbQoSTban7/iHA6AawZ1GoS
         G8uA==
X-Forwarded-Encrypted: i=1; AKwUvBwaAeX2QVJXjNEwN+ndEpIZGiATh2mP4K8APn6SNBJUvRdMIMvegfGyuy6ifZCWcyPyplvp7bE8bAiEDkM=@vger.kernel.org
X-Gm-Message-State: AFq9FYItlxXfsJaGxe1/lHCFps08UgYyu7u5LNoCJ5dXM6uweXmrzGDG
	9rlixkk1vkPEAj67gzETtIZKyCgA/hWHN0jLlWvvBugzsOoO19zqFvw7oKXqbVcC0e5NiaIOQw9
	R6fhsPsLNYg==
X-Received: from dldyr26-n2.prod.google.com ([2002:a05:701b:451a:20b0:195:cde8:ab41])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ed0a:b0:168:3243:c907
 with SMTP id a92af1059eb24-1a6ced8f68emr7862817c88.24.1793291415705; Thu, 29
 Oct 2026 09:30:15 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:29:58 -0700
In-Reply-To: <20261029162958.3224280-1-irogers@google.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029162958.3224280-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261029162958.3224280-4-irogers@google.com>
Subject: [RFC PATCH v1 3/3] bpftool: Prefer zlib-rs over zlib when available
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Quentin Monnet <qmo@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add zlib-rs and zlib to FEATURE_TESTS and FEATURE_DISPLAY in
tools/bpf/bpftool/Makefile and use feature_rust_lib to configure
ZLIB_CFLAGS and ZLIB_LIBS when zlib-rs is detected, falling back to -lz.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/bpf/bpftool/.gitignore |  1 +
 tools/bpf/bpftool/Makefile   | 56 ++++++++++++++++++++++++++++++++----
 2 files changed, 51 insertions(+), 6 deletions(-)

diff --git a/tools/bpf/bpftool/.gitignore b/tools/bpf/bpftool/.gitignore
index a736f64dc5dc..ea2222373634 100644
--- a/tools/bpf/bpftool/.gitignore
+++ b/tools/bpf/bpftool/.gitignore
@@ -6,5 +6,6 @@ bpftool*.8
 FEATURE-DUMP.bpftool
 feature
 libbpf
+libz_rs
 /*.skel.h
 /vmlinux.h
diff --git a/tools/bpf/bpftool/Makefile b/tools/bpf/bpftool/Makefile
index b0f7168e7943..a193cf89a034 100644
--- a/tools/bpf/bpftool/Makefile
+++ b/tools/bpf/bpftool/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 include ../../scripts/Makefile.include
+include ../../scripts/Makefile.arch
 
 ifeq ($(srctree),)
 srctree := $(patsubst %/,%,$(dir $(CURDIR)))
@@ -16,6 +17,8 @@ else
 endif
 BOOTSTRAP_OUTPUT := $(_OUTPUT)bootstrap/
 
+LIBZ_RS_OUTPUT := $(_OUTPUT)libz_rs/
+
 LIBBPF_OUTPUT := $(_OUTPUT)libbpf/
 LIBBPF_DESTDIR := $(LIBBPF_OUTPUT)
 LIBBPF_INCLUDE := $(LIBBPF_DESTDIR)include
@@ -38,7 +41,9 @@ $(LIBBPF_OUTPUT) $(BOOTSTRAP_OUTPUT) $(LIBBPF_BOOTSTRAP_OUTPUT) $(LIBBPF_HDRS_DI
 
 $(LIBBPF): $(wildcard $(BPF_DIR)/*.[ch] $(BPF_DIR)/Makefile) | $(LIBBPF_OUTPUT)
 	$(Q)$(MAKE) -C $(BPF_DIR) OUTPUT=$(LIBBPF_OUTPUT) \
-		DESTDIR=$(LIBBPF_DESTDIR:/=) prefix= $(LIBBPF) install_headers
+		DESTDIR=$(LIBBPF_DESTDIR:/=) prefix= \
+		$(if $(ZLIB_CFLAGS),EXTRA_CFLAGS="$(or $(EXTRA_CFLAGS),-g -O2) $(ZLIB_CFLAGS)") \
+		$(LIBBPF) install_headers
 
 $(LIBBPF_INTERNAL_HDRS): $(LIBBPF_HDRS_DIR)/%.h: $(BPF_DIR)/%.h | $(LIBBPF_HDRS_DIR)
 	$(call QUIET_INSTALL, $@)
@@ -115,8 +120,20 @@ ifneq ($(SKIP_CRYPTO),1)
   CRYPTO_LIBS := -lcrypto
 endif
 
+ifneq ($(CROSS_COMPILE),)
+  ifneq ($(MAKECMDGOALS),bootstrap)
+    ifneq ($(RUST_TARGET_FLAGS_$(ARCH)),)
+      RUST_FLAGS += --target=$(RUST_TARGET_FLAGS_$(ARCH))
+    else
+      NO_ZLIB_RS := 1
+    endif
+  else
+    NO_ZLIB_RS := 1
+  endif
+endif
+
 ifeq ($(MAKECMDGOALS),bootstrap)
-FEATURE_TESTS := libelf-zstd
+FEATURE_TESTS := libelf-zstd $(if $(NO_ZLIB_RS),,zlib-rs) zlib
 FEATURE_DISPLAY :=
 else
 FEATURE_TESTS := clang-bpf-co-re
@@ -128,6 +145,10 @@ FEATURE_TESTS += libbfd-liberty-z
 FEATURE_TESTS += disassembler-four-args
 FEATURE_TESTS += disassembler-init-styled
 FEATURE_TESTS += libelf-zstd
+ifeq ($(NO_ZLIB_RS),)
+FEATURE_TESTS += zlib-rs
+endif
+FEATURE_TESTS += zlib
 
 FEATURE_DISPLAY := clang-bpf-co-re
 FEATURE_DISPLAY += llvm
@@ -135,6 +156,10 @@ FEATURE_DISPLAY += libcap
 FEATURE_DISPLAY += libbfd
 FEATURE_DISPLAY += libbfd-liberty
 FEATURE_DISPLAY += libbfd-liberty-z
+ifeq ($(NO_ZLIB_RS),)
+FEATURE_DISPLAY += zlib-rs
+endif
+FEATURE_DISPLAY += zlib
 endif
 
 check_feat := 1
@@ -153,8 +178,27 @@ include $(FEATURES_DUMP)
 endif
 endif
 
-LIBS = $(LIBBPF) -lelf $(CRYPTO_LIBS) -lz
-LIBS_BOOTSTRAP = $(LIBBPF_BOOTSTRAP) -lelf $(CRYPTO_LIBS) -lz
+# Prefer zlib-rs over C zlib when detected. When cross-compiling, the host
+# bootstrap bpftool still links against the host's -lz.
+ifeq ($(feature-zlib-rs),1)
+  $(call feature_rust_lib,zlib-rs)
+  ZLIB_CFLAGS := $(FEATURE_CFLAGS-zlib-rs)
+  ZLIB_LIBS := $(FEATURE_LIBS-zlib-rs)
+  CFLAGS += $(ZLIB_CFLAGS)
+  ifeq ($(CROSS_COMPILE),)
+    HOST_CFLAGS += $(ZLIB_CFLAGS)
+    LIBBPF_BOOTSTRAP_CFLAGS += $(ZLIB_CFLAGS)
+    ZLIB_BOOTSTRAP_LIBS := $(ZLIB_LIBS)
+  else
+    ZLIB_BOOTSTRAP_LIBS := -lz
+  endif
+else
+  ZLIB_LIBS := -lz
+  ZLIB_BOOTSTRAP_LIBS := -lz
+endif
+
+LIBS = $(LIBBPF) -lelf $(CRYPTO_LIBS) $(ZLIB_LIBS)
+LIBS_BOOTSTRAP = $(LIBBPF_BOOTSTRAP) -lelf $(CRYPTO_LIBS) $(ZLIB_BOOTSTRAP_LIBS)
 
 ifeq ($(feature-libelf-zstd),1)
 LIBS += -lzstd
@@ -200,7 +244,7 @@ else
   else ifeq ($(feature-libbfd-liberty),1)
     LIBS += -lbfd -ldl -lopcodes -liberty
   else ifeq ($(feature-libbfd-liberty-z),1)
-    LIBS += -lbfd -ldl -lopcodes -liberty -lz
+    LIBS += -lbfd -ldl -lopcodes -liberty $(ZLIB_LIBS)
   endif
 
   # If one of the above feature combinations is set, we support libbfd
@@ -304,7 +348,7 @@ clean: $(LIBBPF)-clean $(LIBBPF_BOOTSTRAP)-clean feature-detect-clean
 	$(call QUIET_CLEAN, bpftool)
 	$(Q)$(RM) -- $(OUTPUT)bpftool $(OUTPUT)*.o $(OUTPUT)*.d
 	$(Q)$(RM) -- $(OUTPUT)*.skel.h $(OUTPUT)vmlinux.h
-	$(Q)$(RM) -r -- $(LIBBPF_OUTPUT) $(BOOTSTRAP_OUTPUT)
+	$(Q)$(RM) -r -- $(LIBBPF_OUTPUT) $(BOOTSTRAP_OUTPUT) $(LIBZ_RS_OUTPUT)
 	$(call QUIET_CLEAN, core-gen)
 	$(Q)$(RM) -- $(OUTPUT)FEATURE-DUMP.bpftool
 	$(Q)$(RM) -r -- $(OUTPUT)feature/
-- 
2.56.0.313.g2479322e68-goog

