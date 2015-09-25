Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:54930 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933210AbbIYUqm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Sep 2015 16:46:42 -0400
Subject: Re: [RFC PATCH 1/2] scripts/kconfig/Makefile: Allow KBUILD_DEFCONFIG
 to be a target
References: <1442986835-13985-1-git-send-email-mpe@ellerman.id.au>
 <560275FC.60104@suse.com>
 <FE248B88-D584-4E66-A59F-B2A2C254000C@ellerman.id.au>
From: Michal Marek <mmarek@suse.com>
Message-ID: <5605B2AE.1080409@suse.com>
Date: Fri, 25 Sep 2015 22:46:38 +0200
MIME-Version: 1.0
In-Reply-To: <FE248B88-D584-4E66-A59F-B2A2C254000C@ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <michael@ellerman.id.au>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr

Dne 24.9.2015 v 00:16 Michael Ellerman napsal(a):
> 
> 
> On 23 September 2015 19:50:52 GMT+10:00, Michal Marek
> <mmarek@suse.com> wrote:
>> On 2015-09-23 07:40, Michael Ellerman wrote:
>>> +else ifneq ($(wildcard
>> arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
>>> @$(kecho) "*** Default configuration is based on
>> '$(KBUILD_DEFCONFIG)'"
>>> $(Q)$< $(silent)
>> --defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
>>> +else +	@$(kecho) "*** Default configuration is based on target
>> '$(KBUILD_DEFCONFIG)'"
>>> +	$(Q)$(MAKE) -f $(srctree)/Makefile $(KBUILD_DEFCONFIG) endif
>> 
>> What is the anticipated usage of this? The patch is not needed to
>> make
>> 
>> make ppc64le_defconfig
>> 
>> work with the second patch. If it was, this would create a loop
>> anyway.
> 
> The idea is to make 'make defconfig' work when KBUILD_DEFCONFIG is
> ppc64le_defconfig (which happens for us when uname returns ppc64le)
> and additionally when ppc64le_defconfig is not a real file.

Ah, that makes sense. You can add

Acked-by: Michal Marek <mmarek@suse.com>

if you want.

Michal
