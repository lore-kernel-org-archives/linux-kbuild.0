Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510664;
	b=uMtzfl0CFMcN3FsOA1EHDgmC02eKHjS81DbTI+GeK9GwvJIxpsqJhLM9K3B60gNCPkAB
	 MWtQs7wv9/9AjCXrCeRJHUvBRdZP7tCZ7NTyOlU5uLR+3P27qHlxeaCLFVtM+9rBV4vAL
	 MpCJfIK0/l0M8rVB+frnDcbXOVOdoBWFsHTEhN2oESlCj7KqQXirfCcXp+ieSsqMotEAe
	 ICrHq+/sPqpMSBVMkOjGq8iz+oXzpgY9rKdikiWUPbup2JMPofY6lhZ/BLOWCzvwp8jI0
	 Jo2R5HyYuEzYAgLwmCuKaX6FLGduvfHtJGaNMKVj60dpqxnbOPekW9IYg3FiL27CXdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gf3+S05VHu9WM8VhO/IFJLzS95PZV+LAb8RqT/X+Ms4=;
	b=hTYM/OoMRDEH1KEHpTxFxHhVdBZ/ljSAJp99jF+euXNpE1AIVJvjOsoxnDSC28HVmCqC
	 OCf2pTTsHZQKHxSKMLSsL/SPvrXEuBpObe1xL1IYF5AYoHbT1D4q49EZVrLXksDKUuR2d
	 EOmrXRBkdK5HULmHrrI0AY/iEmuKDjaXPUFD6fc1Ci1yQAmp2s3X9jQTQ5un1/pg6gU62
	 clxyYGVxUp+zatH0+WCBmh+rrlpKWW5wexK4ItnO2oFJANPBWg3maPzwsIbZ3Wjqr7y+Y
	 fUXVnqVTo5V1B3ih7d8daGxommCaUR+n/epGDWe7fd25bNWWJj4JcHE+bf+Jfr9LX6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mhIuMtK1;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CF460A262D
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 15:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21CF460A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mhIuMtK1
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35943f55c06so1226546eec.0
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 08:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510663; x=1793115463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gf3+S05VHu9WM8VhO/IFJLzS95PZV+LAb8RqT/X+Ms4=;
        b=mhIuMtK1hVAjB0ZdSQ6nJXnf2JPyMVRO8RoMTKyv0WpHKMyWUP15K52usdHJilrDaL
         yStr2wh3ht/MSAPYDrTx0dcekeJlVdCUX8sCkbgbiVYYqIVusUlNPzWbYv0/1PNuY/Ku
         jBSMPyptSS5JlMFagKWeBy0JHIspxxjn0vTiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510663; x=1793115463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gf3+S05VHu9WM8VhO/IFJLzS95PZV+LAb8RqT/X+Ms4=;
        b=G9NYY2hlu6x7NgPBaFoJEfMIpM0iI0iX05N6zbkNpEZSprvYeAtU/lPx5ur7vqL890
         Tb+FTXHlUtK1TNN7XZmOZlWLyrvAPyueDzpdxhsGnwK9PKogEAAwqtDxgRovmTltbeEy
         /9QGJXvHuUJ855iq/DYF6xJgIqW6/54TVmrchWw97AEOIUn8htGlz2hn9g2rrCTnjsg0
         /823mbZAREGQrEDgWqtwty6akcu7lxiGZ1hlJSlmOUyPvbHn8PNK4Dlc5aA8zdp70X2V
         GqoM23rrYLNXBMD8dL4tWt0wDhiPShgHsRaSq4KLzYfhOsWBAtw5ohNgHEaqWnkmd42O
         cwbQ==
X-Gm-Message-State: AFq9FYI+gp1zxm7yLEpHhHmgU0/O2Vxp3ebH7bQlrqxA3WrAnB1fQLJm
	uvYfH39T3MpeS34Ynlt1oTr1Qd9ckAjZDG1DnJsKXpu0AuvrLpUVfsstrv2ZcYvlMw==
X-Gm-Gg: AYBFou0qm5kW5aZhcJYdciCSyUpFOEBLc3t97dqZiDEWGCoLm0+VK3ocAkHT8yivUTs
	uLRjkFLUGNdkhC+CqRQX0wPUz9/62N1Coi+K/xhzAkO8UjUGN/hzeI04VHGcF7k4lxbwK9+AOZn
	99Jzj3WU3u+oyZuv2iC4l3rj8R4DQEGcf9blwsZbumf+p/U73iA6Kr01lM+fKnydK8nBLd6qoJ2
	g8yNrFSUvG0t5mBJeGSf6+JuA29z13IvZ0nkuxEl8BlsWbJP+G2QE4kThC/o5dgXm+zTyP9orhQ
	Hn+VHGPWqpd/X31/xq8He9PxgcZTaOTLLs7hSbVGZBBC72uZiIMSDdAow7m2KewxCaI5H7X1ORE
	bnFk8Oy3v+pWionF7YEmmyMgcA1MTm+3osVbEL/IXUfSA9eA73FzGPBBWWs1mYDPbNumP10hm6J
	HqI86qOm3YHVPc1TyqN7GqJN838lvGqzfDjhmqnZPobh39mMtIGfizismT+reUwg5qWACXzi6mG
	n0f6ss5sBMxj5zKPYbSvs64S8sC5KEVAe9WzEu4k+TmS/TmCtBH6bc1y7AyZs8cS9Br4JEZRBW2
	SKZDl+91R9ecNzEV26MtXYvi+Z8i8OEgzeT0vbyn
X-Received: by 2002:a05:7301:619b:10b0:361:2a55:b94e with SMTP id 5a478bee46e88-365fb17e9d4mr2922006eec.15.1792510663086;
        Tue, 20 Oct 2026 08:37:43 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:41 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Devicetree@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Marco Elver <elver@google.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Rong Xu <xur@google.com>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support using fdtfactor
Date: Tue, 20 Oct 2026 08:35:23 -0700
Message-ID: <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
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

Add opt-in support for factoring the DTBs inside a compiled FIT image
into shared base DTBs and per-board overlays using `fdtfactor` when
`FIT_FACTOR_DTBS=1` is passed to make:

- When `FIT_FACTOR_DTBS` is set, pass `-@ -L` to `dtc` for the DTBs
  included in the FIT image so they retain `/__symbols__` and
  `/__local_fixups__` metadata needed for factoring.
- Run `$(FDTFACTOR) $(FDTFACTOR_ARGS) -f $@` (with `FDTFACTOR_ARGS`
  defaulting to `--strip-local-fixups`) at the end of `cmd_fit` and
  `cmd_fit_its` when `FIT_FACTOR_DTBS` is set.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
You can see the fdtfactor post at:
 http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.org

This patch obviously could only land if some form of that series
lands. Presumably we'd also want to import fdtfactor into the local
kernel copy of the devicetree compiler before this patch.

If people hate this patch, we could certainly just run `fdtfactor`
after the kernel build finishes.

 scripts/Makefile.dtbs |  8 ++++++++
 scripts/Makefile.lib  | 18 ++++++++++++------
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
index 1bc42b30cc52..4b8d7039e45d 100644
--- a/scripts/Makefile.dtbs
+++ b/scripts/Makefile.dtbs
@@ -137,6 +137,14 @@ DTC_FLAGS += -Wnode_name_chars_strict \
              -Wunique_unit_address
 endif
 
+# When FIT_FACTOR_DTBS is set, pass -@ -L to dtc so the built DTBs retain the
+# /__symbols__ and /__local_fixups__ nodes required by fdtfactor.
+ifneq ($(FIT_FACTOR_DTBS),)
+ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
+DTC_FLAGS += -@ -L
+endif
+endif
+
 DTC_FLAGS += $(DTC_FLAGS_$(target-stem))
 
 # Set -@ if the target is a base DTB that overlay is applied onto
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 91880648fe21..bcb2b0e749a3 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -425,6 +425,8 @@ quiet_cmd_uimage = UIMAGE  $@
 # ---------------------------------------------------------------------------
 
 MAKE_FIT := $(srctree)/scripts/make_fit.py
+FDTFACTOR ?= fdtfactor
+FDTFACTOR_ARGS ?= --strip-local-fixups
 
 # Use this to override the compression algorithm
 FIT_COMPRESSION ?= gzip
@@ -434,7 +436,9 @@ quiet_cmd_fit = FIT     $@
 		--name '$(UIMAGE_NAME)' $(FIT_EXTRA_ARGS) \
 		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
 		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
-		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
+		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^) \
+		$(if $(FIT_FACTOR_DTBS),&& $(FDTFACTOR) $(FDTFACTOR_ARGS) \
+			$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) -f $@)
 
 # If FIT_ITS is specified on the command line (either relative to $(srctree)
 # or relative to arch/$(SRCARCH)/boot/dts/), locate that .its script and
@@ -465,10 +469,10 @@ $(obj)/image.fit: $(FIT_ITS_IMAGES) $(FIT_ITS_DTBS) $(FIT_ITS_FILE)
 endif
 endif
 
-# Build the FIT image from the .its script with mkimage and populate any
-# missing 'compatible' property on /configurations/conf-* nodes from the
-# corresponding uncompressed .dtb's root '/compatible' property using
-# fdtget/fdtput.
+# Build the FIT image from the .its script with mkimage, populate any missing
+# 'compatible' property on /configurations/conf-* nodes from the corresponding
+# uncompressed .dtb's root '/compatible' property using fdtget/fdtput, and
+# optionally factor the DTBs with fdtfactor when FIT_FACTOR_DTBS is set.
 quiet_cmd_fit_its = FIT     $@
       cmd_fit_its = \
 		PATH="$(abspath $(objtree))/scripts/dtc:$(PATH)"; \
@@ -486,7 +490,9 @@ quiet_cmd_fit_its = FIT     $@
 			dtb="$(objtree)/$${inc%.dtb*}.dtb"; \
 			compat=$$(fdtget -ts "$$dtb" / compatible); \
 			fdtput -ts $@ $$conf compatible $$compat; \
-		done
+		done \
+		$(if $(FIT_FACTOR_DTBS),; $(FDTFACTOR) $(FDTFACTOR_ARGS) \
+			$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) -f $@)
 
 # XZ
 # ---------------------------------------------------------------------------
-- 
2.56.0.212.g129ede20d9-goog

