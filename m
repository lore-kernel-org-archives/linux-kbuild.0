Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yk0-f178.google.com ([209.85.160.178]:34565 "EHLO
	mail-yk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932092AbbJMVCd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 13 Oct 2015 17:02:33 -0400
Received: by ykfy204 with SMTP id y204so6686236ykf.1
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2015 14:02:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20151002074708.CF4DC14076A@ozlabs.org>
References: <1442986835-13985-1-git-send-email-mpe@ellerman.id.au>
	<20151002074708.CF4DC14076A@ozlabs.org>
Date: Tue, 13 Oct 2015 14:02:32 -0700
Message-ID: <CAOesGMjDC99RFEenyUqc2uhpT9EhqhevrqxiO5Gd7AN_GWmrkg@mail.gmail.com>
Subject: Re: [RFC, 1/2] scripts/kconfig/Makefile: Allow KBUILD_DEFCONFIG to be
 a target
From: Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@ozlabs.org, mmarek@suse.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, yann.morin.1998@free.fr, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

On Fri, Oct 2, 2015 at 12:47 AM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> On Wed, 2015-23-09 at 05:40:34 UTC, Michael Ellerman wrote:
>> Arch Makefiles can set KBUILD_DEFCONFIG to tell kbuild the name of the
>> defconfig that should be built by default.
>>
>> However currently there is an assumption that KBUILD_DEFCONFIG points to
>> a file at arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG).
>>
>> We would like to use a target, using merge_config, as our defconfig, so
>> adapt the logic in scripts/kconfig/Makefile to allow that.
>>
>> To minimise the chance of breaking anything, we first check if
>> KBUILD_DEFCONFIG is a file, and if so we do the old logic. If it's not a
>> file, then we call the top-level Makefile with KBUILD_DEFCONFIG as the
>> target.
>>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> Acked-by: Michal Marek <mmarek@suse.com>
>
> Applied to powerpc next.
>
> https://git.kernel.org/powerpc/c/d2036f30cfe1daa19e63ce75

This breaks arm64 defconfig for me:

mkdir obj-tmp
make -f Makefile O=obj-tmp ARCH=arm64 defconfig
... watch loop of:
*** Default configuration is based on target 'defconfig'
  GEN     ./Makefile



-Olof
