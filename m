Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:46249 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756689AbcCCJJz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Mar 2016 04:09:55 -0500
Message-ID: <1456996191.4882.17.camel@redhat.com>
Subject: Re: [PATCH] kbuild/mkspec: clean boot loader configuration on rpm
 removal
From: Paolo Abeni <pabeni@redhat.com>
Date: Thu, 03 Mar 2016 10:09:51 +0100
In-Reply-To: <CA+5PVA6hxOA89gTiz-t4oK7qB4ug63R1DkGVXZ0FcD8ArPqkrg@mail.gmail.com>
References: <cf947ffc2e633b0a2b75c21bd42c2061f3c5d418.1456925798.git.pabeni@redhat.com>
	 <56D6FAD3.3000208@stressinduktion.org>
	 <CA+5PVA6hxOA89gTiz-t4oK7qB4ug63R1DkGVXZ0FcD8ArPqkrg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Boyer <jwboyer@fedoraproject.org>
Cc: Hannes Frederic Sowa <hannes@stressinduktion.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>

On Wed, 2016-03-02 at 10:09 -0500, Josh Boyer wrote:
> On Wed, Mar 2, 2016 at 9:38 AM, Hannes Frederic Sowa
> <hannes@stressinduktion.org> wrote:
> > On 02.03.2016 15:28, Paolo Abeni wrote:
> >>
> >> This patch add a rpm preuninstall scriptlet to cleanup the
> >> boot loader configuration on kernel package uninstall.
> >> The initrd for the to-be-removed kernel is deleted, too.
> >>
> >> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> >> ---
> >>   scripts/package/mkspec | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >>
> >> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> >> index fe44d68..b6de63c 100755
> >> --- a/scripts/package/mkspec
> >> +++ b/scripts/package/mkspec
> >> @@ -138,6 +138,11 @@ echo "/sbin/installkernel $KERNELRELEASE
> >> /boot/.vmlinuz-$KERNELRELEASE-rpm /boot
> >>   echo "rm -f /boot/.vmlinuz-$KERNELRELEASE-rpm
> >> /boot/.System.map-$KERNELRELEASE-rpm"
> >>   echo "fi"
> >>   echo ""
> >> +echo "%preun"
> >> +echo "if [ -x /sbin/new-kernel-pkg ]; then"
> >> +echo "new-kernel-pkg --remove $KERNELRELEASE --rminitrd
> >> --initrdfile=/boot/initramfs-$KERNELRELEASE.img"
> >> +echo "fi"
> >> +echo ""
> >>   echo "%files"
> >>   echo '%defattr (-, root, root)'
> >>   echo "/lib/modules/$KERNELRELEASE"
> >>
> >
> > Maybe we should also switch to new-kernel-pkg for the postinstall call? How
> > about switching to kernel-install?
> 
> new-kernel-pkg probably shouldn't be used here either.  The
> installkernel binary is the distro agnostic kernel installation tool
> and the various distros provide that as either the tool they use or as
> a wrapper.  Switching to new-kernel-pkg implies this would only be
> viable on grubby based distros, and using kernel-install would require
> systemd.

I'm sorry, I try to dig a bit, but I did not find any distro agnostic
kernel removal tools. Can you please point out some ?

Elsewhere can we stuck with new-kernel-pkg, plus eventual fall-back to
other options, i.e. kernel-install?

Thank you,

Paolo

