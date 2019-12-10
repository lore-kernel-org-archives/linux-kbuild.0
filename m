Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:37705 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727345AbfLJOlJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Dec 2019 09:41:09 -0500
From: Alyssa Ross <hi@alyssa.is>
Subject: Bogus dependency for HW_RANDOM_VIRTIO with oldconfig
Date: Tue, 10 Dec 2019 14:41:04 +0000
Message-ID: <87wob4tf9b.fsf@alyssa.is>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-crypto@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org

I'm new here and not sure if I'm contacting the correct people/groups --
please point me in the right direction if not.  I don't know if the
culprit here is Kconfig, the virtio Kconfig file, the hw_random Kconfig
file, or some combination of those.

I believe I have discovered an issue with the order in which make
oldconfig asks for virtio-related options, and would appreciate some
advice on how to solve it:

HW_RANDOM_VIRTIO=y depends on VIRTIO=y.  In my kernel, VIRTIO=y is
selected by VIRITO_PCI=y, but when make oldconfig prompts for
HW_RANDOM_VIRTIO, VIRTIO_PCI has not been prompted for yet, and so
VIRTIO is still set to m.

This means that it's not possible for me to set HW_RANDOM_VIRTIO=y using
oldconfig without setting an VIRTIO-selecting option I don't need, but
that is prompted for _before_ HW_RANDOM_VIRTIO.  One such option that I
have identified so far is VOP.  It is prompted for before
HW_RANDOM_VIRTIO, and so if I set VOP=y it is now possible to set
HW_RANDOM_VIRTIO.

When using menuconfig on a config file generated with oldconfig, that
does not have HW_RANDOM_VIRTIO enabled, I am able to set HW_RANDOM=y and
HW_RANDOM_VIRTIO=y, and after saving I can confirm that no other changes
have been made to the configuration file.  This tells me that there's no
need for a dependency on e.g. VOP, except when using oldconfig.

So, I think there is an ordering issue here, and that oldconfig
should not prompt for HW_RANDOM_VIRTIO until after any option that might
select VIRTIO=y.

I would be happy to try to submit or test a patch to fix this, but I
don't know where to go from here.
