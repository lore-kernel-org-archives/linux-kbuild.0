Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3127A47FB03;
	Tue, 15 Sep 2026 10:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469032; cv=none; b=RHr2zgxJaikWFfqWcTBwwihOHYp+5m3hXeq9qQLA3qAi+9L7SRKGMoNOJOd8qT+FTRlt7U1AFnpI5DtEKr0FniJuDqQ5yiGj9eqgs+inRcH8+nrd0kwAxuLz1eGoVAY2dxvzrdTmEhQnOqMSCz6/ErGk4eq543s65V4mO+ylVBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469032; c=relaxed/simple;
	bh=RTO+ZRUSTSxYZptT6zYs9DP4cLEcTmRd2c9SBuISSEM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hjqKmLW6/xfGdYEMaEYV5slxM8RCbSWvxcr+L/j5qZ+ufuDTJDXrE13Lw9euektYKRayxg9uki1mOrzgYKyEx/UmC8kfVrdPNrqjMa0kG72/vFTgcxdsLGOtfx2ReAdyVZshKc/jJKMNF+qHah6NAg1z+nU3A1lN442rP7QbCjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aI8dP7rk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aI8dP7rk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789469030; x=1821005030;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RTO+ZRUSTSxYZptT6zYs9DP4cLEcTmRd2c9SBuISSEM=;
  b=aI8dP7rkA2N9IYnNSC4AchSxNfNJbt+OGs7gjzd/6qVIkslxQicrelKQ
   DXQvoGIQOqZl+xYgHyZe3qJjvRQdjUiowqFGC5aE5WYwg42/UVu4ekfwm
   7/0Td2d66Se8F+kWMu5Hg++vWzQZ0oRKKkUDzjWy93XyaebA8QmaG2Kpp
   wFi5E80E2MAVV/kQrGxgHhngTvh7mdfglIliYmYIU2A2wdb+nskWAbyB4
   VSMKzA7wL5f1SnwzLFKs2HSB6PDvirC4yIfKLddte9o7Rq4SfjAch6WhI
   YnowMVq7CEMN3lBeJ6WmNo/0ktm06fl5kJvc0OMqlHAEtUCTm8TNEycF+
   g==;
X-CSE-ConnectionGUID: BYp+Ez4tQ0yl4tKSWMDolQ==
X-CSE-MsgGUID: mjghpOHSReWMp+02pjlsSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100492062"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100492062"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:43:49 -0700
X-CSE-ConnectionGUID: FxPs6fUzRMGAG1+Pq6qU0Q==
X-CSE-MsgGUID: CUoVoLDcRtKXEMKhJq+u8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272942728"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.243])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:43:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: linux-kernel@vger.kernel.org
Cc: jani.nikula@intel.com,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] kbuild: add header check facility as a manually run static analyzer
Date: Tue, 15 Sep 2026 13:43:31 +0300
Message-ID: <20260915104331.255636-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit

There have been various attempts at adding a header test or check
mechanism in the kernel build system. The header check primarily
consists of ensuring headers are self-contained, have include guards,
and, in some cases, pass kernel-doc.

The main problems have been:

- The dependency tracking creates undesirable artefacts (infamously also
  known as disgusting turds) in the build directory.

- Gating the feature behind a kconfig option is complicated due to
  allyesconfig builds. It's possible, but requires a verbose and
  confusing negative proxy config option.

- Naming the dependency tracking files with a dot prefix or placing them
  in a dot prefixed subdirectory in the build directory to hide them has
  been exceedingly difficult to achieve. (In part due to some Makefiles
  building files in subdirectory hierarchies.)

- The debate which headers, if any, should really be self-contained is
  virtually open-ended.

Approach the problem from a slightly different angle. Add a top level
"headercheck" static analysis target which you have to explicitly run,
and where you have to explicitly state which headers to check:

$ make HEADER_CHECK="(headers|dirs)" headercheck

For example:

$ make HEADER_CHECK="include/drm drivers/gpu/drm/drm_draw_internal.h" headercheck

You can specify multiple path/to/header.h or path/to/dir, relative to
$(srctree), where path/to/dir is recursively scanned for any .h files.

Add a generic %.header-check rule in scripts/Makefile.build to support
this. Note that this rule should *not* be used in, say, driver or
subsystem makefile targets, precisely because of the problems listed
above.

While this still generates the .header-check dependency tracking
artefacts in the build directory, you will only get them as a result of
manually running 'make headercheck', not as part of the regular build.

This approach also allows anyone to check any headers in the tree, with
no makefile modification or kconfig changes required. What you do with
the results is up to you, and the header check facility does not enforce
anything like it would as part of the regular build.

Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .gitignore             |  1 +
 Makefile               | 25 ++++++++++++++++++++++++-
 scripts/Makefile.build | 21 +++++++++++++++++++++
 3 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 9875120ea7bd..948c760b2704 100644
--- a/.gitignore
+++ b/.gitignore
@@ -28,6 +28,7 @@
 *.gcno
 *.gcda
 *.gz
+*.header-check
 *.i
 *.ko
 *.lex.c
diff --git a/Makefile b/Makefile
index 0f1b80100b47..4851a4407149 100644
--- a/Makefile
+++ b/Makefile
@@ -301,7 +301,7 @@ no-dot-config-targets := $(clean-targets) \
 			 run-command
 no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
 			  image_name
-single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %/
+single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %.header-check %/
 
 config-build	:=
 mixed-build	:=
@@ -1540,6 +1540,26 @@ PHONY += scripts_gen_packed_field_checks
 scripts_gen_packed_field_checks: scripts_basic
 	$(Q)$(MAKE) $(build)=scripts scripts/gen_packed_field_checks
 
+# ---------------------------------------------------------------------------
+# Header check
+
+# Check the headers in HEADER_CHECK=(headers|dirs)
+PHONY += headercheck
+
+ifneq ($(HEADER_CHECK),)
+
+header-check-dirs := $(filter-out %.h,$(HEADER_CHECK))
+header-check-files := $(filter %.h,$(HEADER_CHECK)) $(if $(header-check-dirs),$(shell cd $(srctree) && find $(header-check-dirs) -name '*.h' 2>/dev/null))
+header-check-targets := $(patsubst %.h,%.header-check,$(sort $(header-check-files)))
+
+headercheck:
+	$(if $(header-check-targets),,$(error $@ found no headers in HEADER_CHECK="$(HEADER_CHECK)"))
+	$(Q)$(MAKE) $(header-check-targets)
+else
+headercheck:
+	$(error $@ requires HEADER_CHECK=(headers|dirs))
+endif
+
 # ---------------------------------------------------------------------------
 # Install
 
@@ -1886,6 +1906,8 @@ help:
 	@echo  '  versioncheck      - Sanity check on version.h usage'
 	@echo  '  includecheck      - Check for duplicate included header files'
 	@echo  '  headerdep         - Detect inclusion cycles in headers'
+	@echo  '  headercheck       - Check headers in HEADER_CHECK=(headers|dirs) are'
+	@echo  '                      self-contained, have header guards, and pass kernel-doc.'
 	@echo  '  coccicheck        - Check with Coccinelle'
 	@echo  '  kconfig-sym-check - Check for dangling Kconfig symbol references'
 	@echo  '  clang-analyzer    - Check with clang static analyzer'
@@ -2251,6 +2273,7 @@ clean: $(clean-dirs)
 		-o -name '*.ll' \
 		-o -name '*.gcno' \
 		-o -name '*.long-type-*.txt' \
+		-o -name '*.header-check' \
 		\) -type f -print \
 		-o -name '.tmp_*' -print \
 		| xargs rm -rf
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 4349108e75e1..6127feb970c6 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -306,6 +306,27 @@ quiet_cmd_cc_lst_c = MKLST   $@
 $(obj)/%.lst: $(obj)/%.c FORCE
 	$(call if_changed_dep,cc_lst_c)
 
+# Compile C headers (.h) for header check
+# ---------------------------------------------------------------------------
+
+# Check a header is self-contained, has header guards, and passes kernel-doc.
+#
+# This is for 'make HEADER_CHECK=(headers|dirs) headercheck'. Not to be confused
+# with CONFIG_UAPI_HEADER_TEST.
+#
+# Please do *not* plug %.header-check into any configurable targets, unless you
+# also figure out a way to completely hide the %.header-check artefacts.
+
+quiet_cmd_header_check = HDRCHK  $(patsubst %.header-check,%.h,$@)
+      cmd_header_check = \
+		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
+		PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none $(KDOCFLAGS) \
+			$(if $(findstring e, $(KBUILD_EXTRA_WARN))$(CONFIG_WERROR),-Werror) $<; \
+		touch $@
+
+$(obj)/%.header-check: $(obj)/%.h FORCE
+	$(call if_changed_dep,header_check)
+
 # Compile Rust sources (.rs)
 # ---------------------------------------------------------------------------
 
-- 
2.47.3

