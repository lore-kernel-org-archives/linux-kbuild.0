Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60601 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753314AbbIWWQp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Sep 2015 18:16:45 -0400
In-Reply-To: <560275FC.60104@suse.com>
References: <1442986835-13985-1-git-send-email-mpe@ellerman.id.au> <560275FC.60104@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8
Subject: Re: [RFC PATCH 1/2] scripts/kconfig/Makefile: Allow KBUILD_DEFCONFIG to be a target
From: Michael Ellerman <michael@ellerman.id.au>
Date: Thu, 24 Sep 2015 08:16:37 +1000
Message-ID: <FE248B88-D584-4E66-A59F-B2A2C254000C@ellerman.id.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr



On 23 September 2015 19:50:52 GMT+10:00, Michal Marek <mmarek@suse.com> wrote:
>On 2015-09-23 07:40, Michael Ellerman wrote:
>> +else ifneq ($(wildcard
>arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
>>  	@$(kecho) "*** Default configuration is based on
>'$(KBUILD_DEFCONFIG)'"
>>  	$(Q)$< $(silent)
>--defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
>> +else
>> +	@$(kecho) "*** Default configuration is based on target
>'$(KBUILD_DEFCONFIG)'"
>> +	$(Q)$(MAKE) -f $(srctree)/Makefile $(KBUILD_DEFCONFIG)
>>  endif
>
>What is the anticipated usage of this? The patch is not needed to make
>
>  make ppc64le_defconfig
>
>work with the second patch. If it was, this would create a loop anyway.

The idea is to make 'make defconfig' work when KBUILD_DEFCONFIG is ppc64le_defconfig (which happens for us when uname returns ppc64le) and additionally when ppc64le_defconfig is not a real file.

It doesn't work currently, but does with these two patches applied.

cheers

-- 
Sent from my Android phone with K-9 Mail. Please excuse my brevity.
