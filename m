Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f194.google.com ([209.85.160.194]:46171 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728897AbfIKRf1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Sep 2019 13:35:27 -0400
Received: by mail-qt1-f194.google.com with SMTP id v11so26187544qto.13
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Sep 2019 10:35:27 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
Subject: [RFC PATCH] gpu: no need to compile drm/ if CONFIG_DRM=n
Date: Wed, 11 Sep 2019 13:34:53 -0400
Message-Id: <20190911173453.958-1-cai@lca.pw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: airlied@linux.ie, daniel@ffwll.ch
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run, yamada.masahiro@socionext.com, michal.lkml@markovi.net, emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Qian Cai <cai@lca.pw>

The commit c0e09200dc08 ("drm: reorganise drm tree to be more future
proof.") changed the behavior from only compiling drm/ if CONFIG_DRM=y
to always compiling drm/. This restores the behavior, so people don't
need to waste time compiling stuff they don't need.

Fixes: c0e09200dc08 ("drm: reorganise drm tree to be more future proof.")
---
 drivers/gpu/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
index f17d01f076c7..a793b9ace34b 100644
--- a/drivers/gpu/Makefile
+++ b/drivers/gpu/Makefile
@@ -3,5 +3,6 @@
 # taken to initialize them in the correct order. Link order is the only way
 # to ensure this currently.
 obj-$(CONFIG_TEGRA_HOST1X)	+= host1x/
-obj-y			+= drm/ vga/
+obj-$(CONFIG_DRM)		+= drm/
+obj-y				+= vga/
 obj-$(CONFIG_IMX_IPUV3_CORE)	+= ipu-v3/
-- 
2.20.1 (Apple Git-117)
