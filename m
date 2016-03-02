Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:52090 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752131AbcCBOiO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Mar 2016 09:38:14 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 772002085C
	for <linux-kbuild@vger.kernel.org>; Wed,  2 Mar 2016 09:38:13 -0500 (EST)
Subject: Re: [PATCH] kbuild/mkspec: clean boot loader configuration on rpm
 removal
References: <cf947ffc2e633b0a2b75c21bd42c2061f3c5d418.1456925798.git.pabeni@redhat.com>
From: Hannes Frederic Sowa <hannes@stressinduktion.org>
Message-ID: <56D6FAD3.3000208@stressinduktion.org>
Date: Wed, 2 Mar 2016 15:38:11 +0100
MIME-Version: 1.0
In-Reply-To: <cf947ffc2e633b0a2b75c21bd42c2061f3c5d418.1456925798.git.pabeni@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>

On 02.03.2016 15:28, Paolo Abeni wrote:
> This patch add a rpm preuninstall scriptlet to cleanup the
> boot loader configuration on kernel package uninstall.
> The initrd for the to-be-removed kernel is deleted, too.
>
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> ---
>   scripts/package/mkspec | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index fe44d68..b6de63c 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -138,6 +138,11 @@ echo "/sbin/installkernel $KERNELRELEASE /boot/.vmlinuz-$KERNELRELEASE-rpm /boot
>   echo "rm -f /boot/.vmlinuz-$KERNELRELEASE-rpm /boot/.System.map-$KERNELRELEASE-rpm"
>   echo "fi"
>   echo ""
> +echo "%preun"
> +echo "if [ -x /sbin/new-kernel-pkg ]; then"
> +echo "new-kernel-pkg --remove $KERNELRELEASE --rminitrd --initrdfile=/boot/initramfs-$KERNELRELEASE.img"
> +echo "fi"
> +echo ""
>   echo "%files"
>   echo '%defattr (-, root, root)'
>   echo "/lib/modules/$KERNELRELEASE"
>

Maybe we should also switch to new-kernel-pkg for the postinstall call? 
How about switching to kernel-install?

Thanks,
Hannes

