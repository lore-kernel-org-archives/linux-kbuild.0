Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:26092 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751475AbbCCLhn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 Mar 2015 06:37:43 -0500
From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/rockchip: Flip select/depends in Kconfig
In-Reply-To: <87mw3u48me.fsf@intel.com>
References: <1425376688-8374-1-git-send-email-daniel.vetter@ffwll.ch> <87mw3u48me.fsf@intel.com>
Date: Tue, 03 Mar 2015 13:38:53 +0200
Message-ID: <87k2yy48fm.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development <dri-devel@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>, linux-kbuild@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>, Russell King <rmk+kernel@arm.linux.org.uk>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Chen Gang S <gang.chen@sunrus.com.cn>


[fix address for linux-kbuild@vger.kernel.org, sorry for the noise]

On Tue, 03 Mar 2015, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Tue, 03 Mar 2015, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>> Otherwise Kconfig gets confused and somehow ends up creating a 2nd drm
>> submenu. I couldn't find i915 because of this any more at first.
>
> This is not it. I bisected it to
>
> commit db88c8f4e7e1d1c9e82bc5645a537782b8836cc0
> Author: Chen Gang S <gang.chen@sunrus.com.cn>
> Date:   Sun Feb 1 22:08:33 2015 +0800
>
>     drm: Kconfig: Let all DRM_GEM_CMA_HELPER related macros depend on HAVE_DMA_ATTRS
>
> and reverting fixes the issue.
>
> BR,
> Jani.
>
>
>>
>> Cc: Andy Yan <andy.yan@rock-chips.com>
>> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> Cc: linux-kbuild@vger.kernel.or
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> ---
>>  drivers/gpu/drm/rockchip/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
>> index cb21e3821244..959088695da4 100644
>> --- a/drivers/gpu/drm/rockchip/Kconfig
>> +++ b/drivers/gpu/drm/rockchip/Kconfig
>> @@ -17,8 +17,8 @@ config DRM_ROCKCHIP
>>  
>>  config ROCKCHIP_DW_HDMI
>>          tristate "Rockchip specific extensions for Synopsys DW HDMI"
>> -        depends on DRM_ROCKCHIP
>>          select DRM_DW_HDMI
>> +        depends on DRM_ROCKCHIP
>>          help
>>  	  This selects support for Rockchip SoC specific extensions
>>  	  for the Synopsys DesignWare HDMI driver. If you want to
>> -- 
>> 2.1.4
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> -- 
> Jani Nikula, Intel Open Source Technology Center

-- 
Jani Nikula, Intel Open Source Technology Center
