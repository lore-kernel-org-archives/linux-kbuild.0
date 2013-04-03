Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:41085 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760953Ab3DCX2L (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Apr 2013 19:28:11 -0400
Message-ID: <1365031688.24496.19.camel@smoke>
Subject: kbuild not creating output dirs
From: Geoff Levand <geoff@infradead.org>
Date: Wed, 03 Apr 2013 16:28:08 -0700
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, kvmarm@lists.cs.columbia.edu

Hi Michal,

I was building Marc's kvm development kernel outside of the
sources (make O=), and I got the following build error:

  arch/arm64/kvm/../../../arch/arm/kvm/mmio.c: fatal error: opening dependency file arch/arm64/kvm/../../../arch/arm/kvm/.mmio.o.d: No such file or directory

The cause was that kbuild did not create the output directory
arch/arm64/kvm/../../../arch/arm/kvm, and so gcc failed.

Here is what was in his makefile:

  obj-$(CONFIG_KVM_ARM_HOST) += $(addprefix ../../../virt/kvm/, kvm_main.o coalesced_mmio.o)

I changed this to build a composite and kbuild then created
the output directories:

  obj-$(CONFIG_KVM_ARM_HOST) += kvm.o
  kvm-$(CONFIG_KVM_ARM_HOST) += $(addprefix ../../../virt/kvm/, kvm_main.o coalesced_mmio.o)

I guess kbuild used some other rules and saw the dependency on
the output directory.

So, my questions are:

Is it expected that the original rule should fail?
Is my fix the correct way?
Can I use some other way to get those output directories created?

Just FYI, the original source is here:

  https://git.kernel.org/cgit/linux/kernel/git/maz/arm-platforms.git/tree/arch/arm64/kvm/Makefile?h=kvm-arm64/kvm-for-next

Thanks for your help.

-Geoff



