Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:49569 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750829AbdF1Its (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Jun 2017 04:49:48 -0400
From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/i915: select CRC32
In-Reply-To: <20170621192636.6fdba5cf@roar.ozlabs.ibm.com>
References: <20170621063420.24913-1-npiggin@gmail.com> <20170621091341.spvazz22dodqwfzv@phenom.ffwll.local> <149803655698.29716.6121575885807792619@mail.alporthouse.com> <20170621192636.6fdba5cf@roar.ozlabs.ibm.com>
Date: Wed, 28 Jun 2017 11:53:02 +0300
Message-ID: <87a84scx3l.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: linux-kbuild@vger.kernel.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Daniel Vetter <daniel.vetter@intel.com>

On Wed, 21 Jun 2017, Nicholas Piggin <npiggin@gmail.com> wrote:
> On Wed, 21 Jun 2017 10:15:56 +0100
> Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
>> Quoting Daniel Vetter (2017-06-21 10:13:41)
>> > On Wed, Jun 21, 2017 at 04:34:20PM +1000, Nicholas Piggin wrote:  
>> > > kbuild test robot found a build failure when building with thin
>> > > archives:
>> > > 
>> > > http://marc.info/?l=linux-kbuild&m=149802285009737&w=2
>> > > 
>> > > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>  
>> > 
>> > Pushed to drm-intel for 4.14, thanks.  
>> 
>> Probably deserves to be in fixes if we identify what introduced the CRC
>> dep. mst-dp? pipe crc?
>
> Looks like
>
> 579cea5f3 ("drm/i915/gvt: golden virtual HW state management")

Thus the select should've been under DRM_I915_GVT.

BR,
Jani.


>
> Thanks,
> Nick
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Jani Nikula, Intel Open Source Technology Center
