Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60442 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755509AbbJ1NZ6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2015 09:25:58 -0400
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH 3/3] Revert "drm: Hack around CONFIG_AGP=m build failures"
Date: Wed, 28 Oct 2015 14:25:42 +0100
Message-Id: <1446038742-13482-3-git-send-email-mmarek@suse.cz>
In-Reply-To: <1446038742-13482-1-git-send-email-mmarek@suse.cz>
References: <1446038742-13482-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, daniel.vetter@ffwll.ch, Michal Marek <mmarek@suse.com>, dri-devel@lists.freedesktop.org

From: Michal Marek <mmarek@suse.com>

Kbuild now supports <modname>-m variables.

This reverts commit 8fa884dc355ffd0caa964a284a530bf747df5c77.

Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Michal Marek <mmarek@suse.cz>
---
 drivers/gpu/drm/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index e814517..f458d6e 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -21,8 +21,6 @@ drm-$(CONFIG_DRM_PANEL) += drm_panel.o
 drm-$(CONFIG_OF) += drm_of.o
 drm-$(CONFIG_AGP) += drm_agpsupport.o
 
-drm-y += $(drm-m)
-
 drm_kms_helper-y := drm_crtc_helper.o drm_dp_helper.o drm_probe_helper.o \
 		drm_plane_helper.o drm_dp_mst_topology.o drm_atomic_helper.o
 drm_kms_helper-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
-- 
1.9.2

