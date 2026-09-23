Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B1D4921B7
	for <linux-kbuild@vger.kernel.org>; Wed, 23 Sep 2026 12:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167185; cv=none; b=ijGdx1VMOwNz98IH5ukhjHbjFznELocCrTpgR9+k9GxKctkOZ1PdxbrcC/8QYi7lpA6r2x7YqVQl6SjP3wTidAq56NnjjQUR3CYC5+xV5akP5MVgMQLJMK2XYMAOoAn1aGpouGt/EpdeYQ/WbpktWYdmSJeIdFlZUr7MnZQ20Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167185; c=relaxed/simple;
	bh=YidEQowooWHa3mm+kpWQyPIQRH2lWXzKIXAARyNbJ44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LejDV725/Walqmyy268Z2HBdxTBX4CSPX4i0PEmlotpdhd1VT7aXehZ0bJTbOzT8C82x2nu6xTafiqMPDGeMuwGwuwkK0ywp2eJK8kWl9Ldl5QBYDQMVl2qnZv2pR56mDXzF6U0cQbYN02x44kUC+LdCaUCu3bQ2/k4L6DtrpU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grsecurity.net; spf=pass smtp.mailfrom=opensrcsec.com; dkim=pass (2048-bit key) header.d=grsecurity.net header.i=@grsecurity.net header.b=lzWNw41D; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grsecurity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensrcsec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grsecurity.net header.i=@grsecurity.net header.b="lzWNw41D"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so4550355e9.3
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Sep 2026 05:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grsecurity.net; s=grsec; t=1790167181; x=1790771981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yMau+1eDaLmwPgFmVMPFBVSRhhy4HyZpMjQg3C90W5Q=;
        b=lzWNw41D08BtcV3JpjQs2OgVaF8eRPqeML1Vb0qhE5tzVdjRHLL0Bdf8HiIo/6xjfD
         yXqul1x6NP04kTRZjP6DFGxImRSUvzbSmoNnOOzs3JY0Gn7ZPnyZIMtMi/GJYP7rxuS/
         uXgJR2wtsSTxMFSkhNq7Ej71qIsoVoevPGUgMxZewg4c4su5fg3kJwYm5kQGTyH9CYfX
         +m6+4bRbk7pKBeEQuc94Wrk43Gd0+cpdjlo6U/qo96nrLeK8Onxj1ilV2lmTk43dDYoG
         O0A9ZUjKKioN24NQHkJvfO8GH90WIzn+PfngbeMseq8Lepwo4ZD0gAFINZ7QfK2j3yt9
         sApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167181; x=1790771981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMau+1eDaLmwPgFmVMPFBVSRhhy4HyZpMjQg3C90W5Q=;
        b=SII+HP9tRJ44+TosFJ/RNkAZ0AJL4Ps8dCsDEljlhR67ZwDSaBRgchnv4+Cith+GD1
         WxeQbIwv75A3NKkrLaefT7kibpz86FoiTiVSU9LxgwvPM+XyMnSZA5lDjf3r7N8O+v/4
         hyYqw/UJ9Jm9U1wv5A9DYWq3Iv160eS6Vn92LSYmjcOOjS554XdnSrYsKTVVa2o01EBj
         nAkohytP7W+xVH0mi7UYrev+HsLL7RZWipeX5nTddh0msuhtlPZXJ/tNfVH1LAQiK/zy
         czYkmtlyk2KBnnl5rxqmp0XI9oVCHA92s+mPXyQP3NbYtsMspc4UhZp2pqaFaaw4E4b/
         HW8g==
X-Forwarded-Encrypted: i=1; AKwUvBy6dmn3QtK/V6t9hVWHc333aj+Z3Z+0gentd2mfFLhpET1nej1WkoQI7ksh9NqC+9q0R/njLnBXy6SWGxI=@vger.kernel.org
X-Gm-Message-State: AFuF++kDg46pLErYKxF0frHrWc4DJ8DqKtTxVtJgHWtq8PXHDELAB5PZ
	nwnAQzEzwh2935S+gbLpllhWVxYgF9LfBfBjkQkn6mg2/zNynOJLecFZMcGKhaIgR2U=
X-Gm-Gg: AYBFou3zqXiCO80Dz11oIgXNNTDz1VJrHHsO2dE1f/IHRBM7IHy3Lpl8Romd2y+tRCy
	BEvQ63CLbnu99k9xh0DzpM4Y1gJ/hwt+T67VtUEDjvs/SATeM0DPdLpFJKk3FfqluHqMV5lZRe0
	M+T//l3egyM8+11rQTCS/B7mRsX0SfzCZkjuOT4cT/dfewSPQbu525WjE4oH6dcrjcjOuboecuI
	33v3sKEjoU3RGrE0KevmzgOWzmb15Ffg6KWPHFgk5G9uFEknHkiM9biT8kOUqY/8ZJwFUXznm3X
	jyLHJTge9+Z12WCL8Kxsk+hrIRaPJ00a2dNncIvOIbKTX81GStsu+wzHcRKeFYn2SXqF4A/I6q6
	XcEeNYTWe2JEciHTYJYFb4kLAGQF6B9pUCdUSUIIYAomPm55U0FgSR5E6D3Q1LDIhw/qQAZ8FRv
	hX9t5bkXmmbxZFSjdSQ7PSKOfxWE8t3IlL3Vdy141u0Feml8Nvkj84NKDc1YCeTsjfs7kinuDFy
	1YAn59uLxo8OX5AP7InB7NFThiJNtXmYR/WWGqHKucTUHKfpxqFgyFzslvM4v1UrGB+
X-Received: by 2002:a05:600c:4ecd:b0:49c:fc6c:be00 with SMTP id 5b1f17b1804b1-49fdf1454admr31393695e9.23.1790167181460;
        Wed, 23 Sep 2026 05:39:41 -0700 (PDT)
Received: from bell.fritz.box (p200300faaf11b90088550f04e79781cf.dip0.t-ipconnect.de. [2003:fa:af11:b900:8855:f04:e797:81cf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1e045dsm80011925e9.11.2026.09.23.05.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:39:41 -0700 (PDT)
From: Mathias Krause <minipli@grsecurity.net>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mathias Krause <minipli@grsecurity.net>
Subject: [PATCH] kbuild: prevent building single targets twice
Date: Wed, 23 Sep 2026 14:39:36 +0200
Message-ID: <20260923123936.2227924-1-minipli@grsecurity.net>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building individual targets via 'make path/to/target.o', target.o
may be build multiple times concurrently, leading to build errors like
below:

$ make O=~/O/vanilla-7.1/ -j$(nproc) arch/x86/pci/intel_mid.o
make[1]: Entering directory '/scratch/minipli/obj/vanilla-7.1'
  DESCEND objtool
  DESCEND bpf/resolve_btfids
  CC      arch/x86/pci/intel_mid.o
  CC      arch/x86/pci/intel_mid.o
fixdep: error opening file: arch/x86/pci/.intel_mid.o.d: No such file or directory
make[4]: *** [/scratch/minipli/src/linux/scripts/Makefile.build:290: arch/x86/pci/intel_mid.o] Error 2
make[4]: *** Deleting file 'arch/x86/pci/intel_mid.o'
make[3]: *** [/scratch/minipli/src/linux/scripts/Makefile.build:551: arch/x86] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/scratch/minipli/src/linux/Makefile:2229: .] Error 2
make[1]: *** [/scratch/minipli/src/linux/Makefile:248: __sub-make] Error 2
make[1]: Leaving directory '/scratch/minipli/obj/vanilla-7.1'
make: *** [Makefile:248: __sub-make] Error 2

Please note that arch/x86/pci/intel_mid.o gets output twice and, in
fact, tried to get built twice, causing the two parallel builds to
interfere with each other.

The reason for the double build attempt is that the target can be
reached twice, via arch/x86/'s Makefile and via arch/x86/pci/'s which
both end up in '$(single-subdirs)' as both fit the prefix match.

Only the latter should be used as it contains a cflags override for
CONFIG_PCI_DEBUG=y which would be skipped when using arch/x86/Makefile
to build arch/x86/pci/intel_mid.o.

Fix the multi-match issue by using only the deepest match instead of all
possible ones, which requires two changes:
1. Limiting 'single-subdirs' to a single match per target and
2. filtering out deeper targets in the recursive make invocation.

Also de-duplicate the list of target subdirectories to simplify the
use of '$(single-subdirs)' in filter expressions for multiple targets in
the same directory.

Fixes: cc306abd19e8 ("kbuild: fix and refactor single target build")
Assisted-by: LLM
Signed-off-by: Mathias Krause <minipli@grsecurity.net>
---
I ran into this quite a few times in the past and only now gave the LLM
a try to dig into it. The bug only affects certain targets and only when
mentioned on the command line, so regular 'make -j$(nproc)' isn't
affected.

 scripts/Makefile.build | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 0f4fdc119e58..d5f58513d02a 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -534,7 +534,10 @@ endif
 # Single targets
 # ---------------------------------------------------------------------------
 
-single-subdirs := $(foreach d, $(subdir-ym), $(if $(filter $d/%, $(MAKECMDGOALS)), $d))
+# A single target may match nested entries in subdir-ym.  Descend through only
+# the deepest match so that two recursive makes do not build the same target.
+single-subdir = $(lastword $(sort $(foreach d, $(subdir-ym), $(if $(filter $d/%, $(1)), $d))))
+single-subdirs := $(sort $(foreach g, $(MAKECMDGOALS), $(call single-subdir, $g)))
 single-subdir-goals := $(filter $(addsuffix /%, $(single-subdirs)), $(MAKECMDGOALS))
 
 $(single-subdir-goals): $(single-subdirs)
@@ -548,7 +551,8 @@ $(subdir-ym):
 	$(Q)$(MAKE) $(build)=$@ \
 	need-builtin=$(if $(filter $@/built-in.a, $(subdir-builtin)),1) \
 	need-modorder=$(if $(filter $@/modules.order, $(subdir-modorder)),1) \
-	$(filter $@/%, $(single-subdir-goals))
+	$(filter-out $(addsuffix /%, $(filter $@/%, $(single-subdirs))), \
+		$(filter $@/%, $(single-subdir-goals)))
 
 # Add FORCE to the prerequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
-- 
2.47.3

