Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aserp2130.oracle.com ([141.146.126.79]:38366 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388097AbfDRPxp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Apr 2019 11:53:45 -0400
Subject: Re: [PATCH V1 0/3] kbuild: optimize modules_install
References: <1554992415-292288-1-git-send-email-steven.sistare@oracle.com>
From: Steven Sistare <steven.sistare@oracle.com>
Message-ID: <5e903102-b0ee-8fbb-0743-4e1a79828b5c@oracle.com>
Date: Thu, 18 Apr 2019 11:53:26 -0400
MIME-Version: 1.0
In-Reply-To: <1554992415-292288-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org

Comments or acks, anyone? - Steve

On 4/11/2019 10:20 AM, Steve Sistare wrote:
> Perform module install actions only if the object area module is newer than
> install area module, and only announce the updated modules.  To do this, the
> <moddir>/kernel directory must be preserved across invocations of make, so
> it must be checked for stale modules, which can occur after changing config
> options.  Hence, remove modules from this directory that are not present
> in modules.order.
> 
> These changes save 10's of seconds for a single CPU build, save a few
> seconds for a parallel build, and reduce output clutter for an incremental
> build.  Example:
> 
>   % touch drivers/virtio/virtio_ring.c
>   % make modules modules_install
>   DESCEND  objtool
>   CALL    scripts/atomic/check-atomics.sh
>   CALL    scripts/checksyscalls.sh
>   CC [M]  drivers/virtio/virtio_ring.o
>   Building modules, stage 2.
>   MODPOST 2592 modules
>   LD [M]  drivers/virtio/virtio_ring.ko
>   INSTALL drivers/virtio/virtio_ring.ko
>   DEPMOD  5.1.0-rc3
> 
> Patch 1 fixes a legacy race bug in parallel make.
> Patch 2 installs only modified modules.
> Patch 3 removes stale modules.
> 
> Steve Sistare (3):
>   kbuild: serialize modules and modules_install
>   kbuild: optimize modules_install target
>   kbuild: remove stale modules from install area
> 
>  Makefile                 | 26 +++++++++++++++++++++-----
>  scripts/Makefile.modinst | 30 +++++++++++++++++++++++-------
>  2 files changed, 44 insertions(+), 12 deletions(-)
> 
