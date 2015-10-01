Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:49619 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752115AbbJAIPq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 Oct 2015 04:15:46 -0400
From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm: Hack around CONFIG_AGP=m build failures
In-Reply-To: <1443682119-17011-1-git-send-email-daniel.vetter@ffwll.ch>
References: <1443682119-17011-1-git-send-email-daniel.vetter@ffwll.ch>
Date: Thu, 01 Oct 2015 11:19:05 +0300
Message-ID: <8737xvc87a.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development <dri-devel@lists.freedesktop.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, Daniel Vetter <daniel.vetter@intel.com>

On Thu, 01 Oct 2015, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> Surprisingly kbuild can't cope with tristates in the
> <module>-$(CONFIG_FOO) pattern. This patch hacks up a solution.

Given that it's two distinct Makefile variables (foo-y and foo-m) being
assigned to, I don't really find this surprising. Maybe this could be
made to work as a convenience, but there might be other, more surpising
consequences.

> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Michal Marek <mmarek@suse.com>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index f458d6e33655..e814517513ce 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -21,6 +21,8 @@ drm-$(CONFIG_DRM_PANEL) += drm_panel.o
>  drm-$(CONFIG_OF) += drm_of.o
>  drm-$(CONFIG_AGP) += drm_agpsupport.o
>  
> +drm-y += $(drm-m)

I know what you're doing here, but somehow this looks wrong to me. A bit
of git grep also doesn't find convincing arguments to back this up.

I'd solve this with a bit of fairly straightforward indirection in the
Kconfig to keep the Makefile itself neat. I think it also better
documents the intention here.

Patch follows.

BR,
Jani.


From efbc9fb6f6284e81a4b9e7599b3233b656cec452 Mon Sep 17 00:00:00 2001
From: Jani Nikula <jani.nikula@intel.com>
Date: Thu, 1 Oct 2015 10:53:22 +0300
Subject: [PATCH] drm: fix CONFIG_AGP=m build failures
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Jani Nikula <jani.nikula@intel.com>

If CONFIG_AGP is enabled as a module, drm_agpsupport.o is not linked
into drm, causing:

ERROR: "drm_agp_unbind_ioctl" [drivers/gpu/drm/drm.ko] undefined!
ERROR: "drm_agp_init" [drivers/gpu/drm/drm.ko] undefined!
ERROR: "drm_agp_alloc_ioctl" [drivers/gpu/drm/drm.ko] undefined!
ERROR: "drm_agp_clear" [drivers/gpu/drm/drm.ko] undefined!
ERROR: "drm_agp_info_ioctl" [drivers/gpu/drm/drm.ko] undefined!
ERROR: "drm_agp_enable_ioctl" [drivers/gpu/drm/drm.ko] undefined!
ERROR: "drm_agp_release_ioctl" [drivers/gpu/drm/drm.ko] undefined!
ERROR: "drm_agp_bind_ioctl" [drivers/gpu/drm/drm.ko] undefined!
ERROR: "drm_agp_acquire_ioctl" [drivers/gpu/drm/drm.ko] undefined!
ERROR: "drm_agp_free_ioctl" [drivers/gpu/drm/drm.ko] undefined!

Regression from
commit a7fb8a23c1afa607ec8ce9f61df645f37c529434
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed Sep 9 16:45:52 2015 +0200

    drm: Remove __OS_HAS_AGP

Add an intermediate bool CONFIG_DRM_AGP, selected if CONFIG_AGP is
enabled either as module or built-in.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org
Cc: Daniel Vetter <daniel.vetter@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/Kconfig  | 4 ++++
 drivers/gpu/drm/Makefile | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 1a0a8df2eed8..aecbec030aa4 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -7,6 +7,7 @@
 menuconfig DRM
 	tristate "Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)"
 	depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && MMU && HAS_DMA
+	select DRM_AGP if AGP
 	select HDMI
 	select FB_CMDLINE
 	select I2C
@@ -21,6 +22,9 @@ menuconfig DRM
 	  details.  You should also select and configure AGP
 	  (/dev/agpgart) support if it is available for your platform.
 
+config DRM_AGP
+	bool
+
 config DRM_MIPI_DSI
 	bool
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index f458d6e33655..c04d5a33fcac 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -19,7 +19,7 @@ drm-$(CONFIG_DRM_GEM_CMA_HELPER) += drm_gem_cma_helper.o
 drm-$(CONFIG_PCI) += ati_pcigart.o
 drm-$(CONFIG_DRM_PANEL) += drm_panel.o
 drm-$(CONFIG_OF) += drm_of.o
-drm-$(CONFIG_AGP) += drm_agpsupport.o
+drm-$(CONFIG_DRM_AGP) += drm_agpsupport.o
 
 drm_kms_helper-y := drm_crtc_helper.o drm_dp_helper.o drm_probe_helper.o \
 		drm_plane_helper.o drm_dp_mst_topology.o drm_atomic_helper.o
-- 
2.1.4

