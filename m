Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:63787 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbfLLFbQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Dec 2019 00:31:16 -0500
MIME-Version: 1.0
References: <87wob4tf9b.fsf@alyssa.is>
In-Reply-To: <87wob4tf9b.fsf@alyssa.is>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 12 Dec 2019 14:30:18 +0900
Message-ID: <CAK7LNAQ2+=jCO5SUpB-C8NZHODLVXs3SJ2qyYR9J+OiU_+1iAg@mail.gmail.com>
Subject: Re: Bogus dependency for HW_RANDOM_VIRTIO with oldconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alyssa Ross <hi@alyssa.is>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-crypto@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org

On Tue, Dec 10, 2019 at 11:41 PM Alyssa Ross <hi@alyssa.is> wrote:
>
> I'm new here and not sure if I'm contacting the correct people/groups --
> please point me in the right direction if not.  I don't know if the
> culprit here is Kconfig, the virtio Kconfig file, the hw_random Kconfig
> file, or some combination of those.
>
> I believe I have discovered an issue with the order in which make
> oldconfig asks for virtio-related options, and would appreciate some
> advice on how to solve it:
>
> HW_RANDOM_VIRTIO=y depends on VIRTIO=y.  In my kernel, VIRTIO=y is
> selected by VIRITO_PCI=y, but when make oldconfig prompts for
> HW_RANDOM_VIRTIO, VIRTIO_PCI has not been prompted for yet, and so
> VIRTIO is still set to m.
>
> This means that it's not possible for me to set HW_RANDOM_VIRTIO=y using
> oldconfig without setting an VIRTIO-selecting option I don't need, but
> that is prompted for _before_ HW_RANDOM_VIRTIO.  One such option that I
> have identified so far is VOP.  It is prompted for before
> HW_RANDOM_VIRTIO, and so if I set VOP=y it is now possible to set
> HW_RANDOM_VIRTIO.
>
> When using menuconfig on a config file generated with oldconfig, that
> does not have HW_RANDOM_VIRTIO enabled, I am able to set HW_RANDOM=y and
> HW_RANDOM_VIRTIO=y, and after saving I can confirm that no other changes
> have been made to the configuration file.  This tells me that there's no
> need for a dependency on e.g. VOP, except when using oldconfig.

OK, you are right.

Actually, the oldconfig restarts when it finds a newly-visible option.
For example, when VIRTIO is changed from n to y,
oldconfig restarts the menu and shows a prompt for HW_RANDOM_VIRTIO.

But, this does not happen when VIRTIO is changed from m to y.

> So, I think there is an ordering issue here, and that oldconfig
> should not prompt for HW_RANDOM_VIRTIO until after any option that might
> select VIRTIO=y.
>
> I would be happy to try to submit or test a patch to fix this, but I
> don't know where to go from here.

Perhaps check_conf() could be fixed, though I have not looked into it yet.


-- 
Best Regards
Masahiro Yamada
