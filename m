Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:2847 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726948AbfEPTsl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 May 2019 15:48:41 -0400
From: Jani Nikula <jani.nikula@intel.com>
Subject: [RFC 2/3] drm/i915: ensure headers remain self-contained
Date: Thu, 16 May 2019 22:48:17 +0300
Message-Id: <20190516194818.29230-2-jani.nikula@intel.com>
In-Reply-To: <20190516194818.29230-1-jani.nikula@intel.com>
References: <20190516194818.29230-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, jani.nikula@intel.com, Chris Wilson <chris@chris-wilson.co.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>

Use the new header test facility.

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 1787e1299b1b..05d01a3830d0 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -204,3 +204,6 @@ i915-y += intel_lpe_audio.o
 
 obj-$(CONFIG_DRM_I915) += i915.o
 obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
+
+header-test-y := \
+	i915_drv.h
-- 
2.20.1
