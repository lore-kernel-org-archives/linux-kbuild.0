Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:57162 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbfGEBTs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jul 2019 21:19:48 -0400
Subject: Re: mmotm 2019-07-04-15-01 uploaded (gpu/drm/i915/oa/)
References: <20190704220152.1bF4q6uyw%akpm@linux-foundation.org>
 <80bf2204-558a-6d3f-c493-bf17b891fc8a@infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <63db23ac-c642-3e0c-58a4-81df991ad637@infradead.org>
Date: Thu, 4 Jul 2019 18:19:43 -0700
MIME-Version: 1.0
In-Reply-To: <80bf2204-558a-6d3f-c493-bf17b891fc8a@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org, broonie@kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-next@vger.kernel.org, mhocko@suse.cz, mm-commits@vger.kernel.org, sfr@canb.auug.org.au, dri-devel <dri-devel@lists.freedesktop.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

On 7/4/19 6:09 PM, Randy Dunlap wrote:
> On 7/4/19 3:01 PM, akpm@linux-foundation.org wrote:
>> The mm-of-the-moment snapshot 2019-07-04-15-01 has been uploaded to
>>
>>    http://www.ozlabs.org/~akpm/mmotm/
>>
>> mmotm-readme.txt says
>>
>> README for mm-of-the-moment:
>>
>> http://www.ozlabs.org/~akpm/mmotm/
> 
> I get a lot of these but don't see/know what causes them:
> 
> ../scripts/Makefile.build:42: ../drivers/gpu/drm/i915/oa/Makefile: No such file or directory
> make[6]: *** No rule to make target '../drivers/gpu/drm/i915/oa/Makefile'.  Stop.
> ../scripts/Makefile.build:498: recipe for target 'drivers/gpu/drm/i915/oa' failed
> make[5]: *** [drivers/gpu/drm/i915/oa] Error 2
> ../scripts/Makefile.build:498: recipe for target 'drivers/gpu/drm/i915' failed
> 

[+ linux-kbuild]

It seems to have something to do with "modules.order".

But!!!
# CONFIG_DRM_I915 it not set

-- 
~Randy
