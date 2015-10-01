Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:36787 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750791AbbJAGps (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 Oct 2015 02:45:48 -0400
Received: by wicgb1 with SMTP id gb1so14102860wic.1
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Sep 2015 23:45:47 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] drm: Hack around CONFIG_AGP=m build failures
Date: Thu,  1 Oct 2015 08:48:39 +0200
Message-Id: <1443682119-17011-1-git-send-email-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Stephen Rothwell <sfr@canb.auug.org.au>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>

Surprisingly kbuild can't cope with tristates in the
<module>-$(CONFIG_FOO) pattern. This patch hacks up a solution.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index f458d6e33655..e814517513ce 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -21,6 +21,8 @@ drm-$(CONFIG_DRM_PANEL) += drm_panel.o
 drm-$(CONFIG_OF) += drm_of.o
 drm-$(CONFIG_AGP) += drm_agpsupport.o
 
+drm-y += $(drm-m)
+
 drm_kms_helper-y := drm_crtc_helper.o drm_dp_helper.o drm_probe_helper.o \
 		drm_plane_helper.o drm_dp_mst_topology.o drm_atomic_helper.o
 drm_kms_helper-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
-- 
2.5.1

