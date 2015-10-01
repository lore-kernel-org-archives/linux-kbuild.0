Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:59143 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754815AbbJAHTK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 Oct 2015 03:19:10 -0400
Date: Thu, 1 Oct 2015 10:19:05 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm: Hack around CONFIG_AGP=m build failures
Message-ID: <20151001071905.GX26517@intel.com>
References: <1443682119-17011-1-git-send-email-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1443682119-17011-1-git-send-email-daniel.vetter@ffwll.ch>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>

On Thu, Oct 01, 2015 at 08:48:39AM +0200, Daniel Vetter wrote:
> Surprisingly kbuild can't cope with tristates in the
> <module>-$(CONFIG_FOO) pattern. This patch hacks up a solution.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Michal Marek <mmarek@suse.com>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Tested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

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
> +
>  drm_kms_helper-y := drm_crtc_helper.o drm_dp_helper.o drm_probe_helper.o \
>  		drm_plane_helper.o drm_dp_mst_topology.o drm_atomic_helper.o
>  drm_kms_helper-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
> -- 
> 2.5.1

-- 
Ville Syrjälä
Intel OTC
