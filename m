Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from inca-roads.misterjones.org ([213.251.177.50]:47793 "EHLO
	inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758007Ab3DDLXz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 4 Apr 2013 07:23:55 -0400
Subject: Re: kbuild not creating output dirs
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Date: Thu, 04 Apr 2013 13:05:13 +0200
From: Marc Zyngier <marc.zyngier@arm.com>
In-Reply-To: <CAEDV+gJog=7dyq=uMf69dAchbdP2boaqXs9ydWmiq-XN+yJ66Q@mail.gmail.com>
References: <1365031688.24496.19.camel@smoke> <CAEDV+gJog=7dyq=uMf69dAchbdP2boaqXs9ydWmiq-XN+yJ66Q@mail.gmail.com>
Message-ID: <7122dbf190b8fbc7b734ac0956a9df89@localhost>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Geoff Levand <geoff@infradead.org>
Cc: Michal Marek <mmarek@suse.cz>, kvmarm@lists.cs.columbia.edu, linux-kbuild@vger.kernel.org

On Wed, 3 Apr 2013 16:34:45 -0700, Christoffer Dall
<cdall@cs.columbia.edu>
wrote:
> there was a similar problem with the kvm 32-bit makefile at some
> point, the fix looks ok to me.
> 
> -Christoffer
> 
> On Wed, Apr 3, 2013 at 4:28 PM, Geoff Levand <geoff@infradead.org>
wrote:
>> Hi Michal,
>>
>> I was building Marc's kvm development kernel outside of the
>> sources (make O=), and I got the following build error:
>>
>>   arch/arm64/kvm/../../../arch/arm/kvm/mmio.c: fatal error: opening
>>   dependency file arch/arm64/kvm/../../../arch/arm/kvm/.mmio.o.d: No
such
>>   file or directory
>>
>> The cause was that kbuild did not create the output directory
>> arch/arm64/kvm/../../../arch/arm/kvm, and so gcc failed.
>>
>> Here is what was in his makefile:
>>
>>   obj-$(CONFIG_KVM_ARM_HOST) += $(addprefix ../../../virt/kvm/,
>>   kvm_main.o coalesced_mmio.o)
>>
>> I changed this to build a composite and kbuild then created
>> the output directories:
>>
>>   obj-$(CONFIG_KVM_ARM_HOST) += kvm.o
>>   kvm-$(CONFIG_KVM_ARM_HOST) += $(addprefix ../../../virt/kvm/,
>>   kvm_main.o coalesced_mmio.o)
>>
>> I guess kbuild used some other rules and saw the dependency on
>> the output directory.
>>
>> So, my questions are:
>>
>> Is it expected that the original rule should fail?
>> Is my fix the correct way?
>> Can I use some other way to get those output directories created?

Yeah, this looks like the thing to do. I'll fix the KVM/arm64 makefile.

Thanks for investigating.

        M.
-- 
Fast, cheap, reliable. Pick two.
