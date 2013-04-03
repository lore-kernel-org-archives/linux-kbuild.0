Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:32983 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761971Ab3DCXep (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Apr 2013 19:34:45 -0400
Received: by mail-pd0-f178.google.com with SMTP id w11so1114242pde.37
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Apr 2013 16:34:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1365031688.24496.19.camel@smoke>
References: <1365031688.24496.19.camel@smoke>
Date: Wed, 3 Apr 2013 16:34:45 -0700
Message-ID: <CAEDV+gJog=7dyq=uMf69dAchbdP2boaqXs9ydWmiq-XN+yJ66Q@mail.gmail.com>
Subject: Re: kbuild not creating output dirs
From: Christoffer Dall <cdall@cs.columbia.edu>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geoff Levand <geoff@infradead.org>
Cc: Michal Marek <mmarek@suse.cz>, kvmarm@lists.cs.columbia.edu, linux-kbuild@vger.kernel.org

there was a similar problem with the kvm 32-bit makefile at some
point, the fix looks ok to me.

-Christoffer

On Wed, Apr 3, 2013 at 4:28 PM, Geoff Levand <geoff@infradead.org> wrote:
> Hi Michal,
>
> I was building Marc's kvm development kernel outside of the
> sources (make O=), and I got the following build error:
>
>   arch/arm64/kvm/../../../arch/arm/kvm/mmio.c: fatal error: opening dependency file arch/arm64/kvm/../../../arch/arm/kvm/.mmio.o.d: No such file or directory
>
> The cause was that kbuild did not create the output directory
> arch/arm64/kvm/../../../arch/arm/kvm, and so gcc failed.
>
> Here is what was in his makefile:
>
>   obj-$(CONFIG_KVM_ARM_HOST) += $(addprefix ../../../virt/kvm/, kvm_main.o coalesced_mmio.o)
>
> I changed this to build a composite and kbuild then created
> the output directories:
>
>   obj-$(CONFIG_KVM_ARM_HOST) += kvm.o
>   kvm-$(CONFIG_KVM_ARM_HOST) += $(addprefix ../../../virt/kvm/, kvm_main.o coalesced_mmio.o)
>
> I guess kbuild used some other rules and saw the dependency on
> the output directory.
>
> So, my questions are:
>
> Is it expected that the original rule should fail?
> Is my fix the correct way?
> Can I use some other way to get those output directories created?
>
> Just FYI, the original source is here:
>
>   https://git.kernel.org/cgit/linux/kernel/git/maz/arm-platforms.git/tree/arch/arm64/kvm/Makefile?h=kvm-arm64/kvm-for-next
>
> Thanks for your help.
>
> -Geoff
>
>
>
> _______________________________________________
> kvmarm mailing list
> kvmarm@lists.cs.columbia.edu
> https://lists.cs.columbia.edu/cucslists/listinfo/kvmarm
