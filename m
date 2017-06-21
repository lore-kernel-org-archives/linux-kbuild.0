Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:34540 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750876AbdFUGeg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jun 2017 02:34:36 -0400
Received: by mail-pg0-f67.google.com with SMTP id j186so25627605pge.1
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jun 2017 23:34:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] drm/i915: select CRC32
Date: Wed, 21 Jun 2017 16:34:20 +1000
Message-Id: <20170621063420.24913-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

kbuild test robot found a build failure when building with thin
archives:

http://marc.info/?l=linux-kbuild&m=149802285009737&w=2

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 drivers/gpu/drm/i915/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index a5cd5dacf055..e9e64e8e9765 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -21,6 +21,7 @@ config DRM_I915
 	select ACPI_BUTTON if ACPI
 	select SYNC_FILE
 	select IOSF_MBI
+	select CRC32
 	help
 	  Choose this option if you have a system that has "Intel Graphics
 	  Media Accelerator" or "HD Graphics" integrated graphics,
-- 
2.11.0

