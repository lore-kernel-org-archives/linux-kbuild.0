Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35112 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751093AbdFUJNq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jun 2017 05:13:46 -0400
Received: by mail-lf0-f66.google.com with SMTP id n136so8175528lfn.2
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Jun 2017 02:13:45 -0700 (PDT)
Date: Wed, 21 Jun 2017 11:13:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/i915: select CRC32
Message-ID: <20170621091341.spvazz22dodqwfzv@phenom.ffwll.local>
References: <20170621063420.24913-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170621063420.24913-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>, linux-kbuild@vger.kernel.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Daniel Vetter <daniel.vetter@intel.com>

On Wed, Jun 21, 2017 at 04:34:20PM +1000, Nicholas Piggin wrote:
> kbuild test robot found a build failure when building with thin
> archives:
> 
> http://marc.info/?l=linux-kbuild&m=149802285009737&w=2
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Pushed to drm-intel for 4.14, thanks.
-Daniel

> ---
>  drivers/gpu/drm/i915/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index a5cd5dacf055..e9e64e8e9765 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -21,6 +21,7 @@ config DRM_I915
>  	select ACPI_BUTTON if ACPI
>  	select SYNC_FILE
>  	select IOSF_MBI
> +	select CRC32
>  	help
>  	  Choose this option if you have a system that has "Intel Graphics
>  	  Media Accelerator" or "HD Graphics" integrated graphics,
> -- 
> 2.11.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
