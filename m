Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:16731 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751085Ab3FDUM2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 4 Jun 2013 16:12:28 -0400
From: "Marciniszyn, Mike" <mike.marciniszyn@intel.com>
Subject: [RFC PATCH v3] kbuild: fix error when building from src rpm
Date: Tue, 4 Jun 2013 20:12:25 +0000
Message-ID: <32E1700B9017364D9B60AED9960492BC2114956E@FMSMSX107.amr.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Doug Ledford <dledford@redhat.com>

Sorry for the confusion with the patch.

The latest version I've changed to an RFC because of some testing issues I've encountered.

The /sbin/installkernel doesn't behave very nicely when INSTALL_PATH is modified on RH6.4.

I haven't tested SLES11SP2 yet.

The trace from installkernel called from "make install"  is:

+ INSTALL_PATH=/home/user/rpmbuild/BUILDROOT/kernel-3.10.0_rc1+-1.x86_64/boot
+ make -j8 KBUILD_SRC= install
sh /home/user/rpmbuild/BUILD/kernel-3.10.0_rc1+/arch/x86/boot/install.sh 3.10.0-rc1+ arch/x86/boot/bzImage \
                System.map "/home/user/rpmbuild/BUILDROOT/kernel-3.10.0_rc1+-1.x86_64/boot"
+ '[' -x /home/user/bin/installkernel ']'
+ '[' -x /sbin/installkernel ']'
+ exec sh -x /sbin/installkernel 3.10.0-rc1+ arch/x86/boot/bzImage System.map /home/user/rpmbuild/BUILDROOT/kernel-3.10.0_rc1+-1.x86_64/boot
+ cfgLoader=
+ '[' -z /home/user/rpmbuild/BUILDROOT/kernel-3.10.0_rc1+-1.x86_64/boot -o /home/user/rpmbuild/BUILDROOT/kernel-3.10.0_rc1+-1.x86_64/boot == /boot ']'
+ LINK_PATH=/boot
++ echo /home/user/rpmbuild/BUILDROOT/kernel-3.10.0_rc1+-1.x86_64/boot/
++ sed 's|^/boot/||'
+ RELATIVE_PATH=/home/user/rpmbuild/BUILDROOT/kernel-3.10.0_rc1+-1.x86_64/boot/
+ KERNEL_VERSION=3.10.0-rc1+
+ BOOTIMAGE=arch/x86/boot/bzImage
+ MAPFILE=System.map
++ uname -m
+ ARCH=x86_64
+ '[' x86_64 = ppc64 -o x86_64 = ppc ']'
+ KERNEL_NAME=vmlinuz
+ '[' -z 3.10.0-rc1+ -o -z arch/x86/boot/bzImage -o -z System.map ']'
+ '[' -f /home/user/rpmbuild/BUILDROOT/kernel-3.10.0_rc1+-1.x86_64/boot/vmlinuz-3.10.0-rc1+ ']'
+ '[' '!' -L /home/user/rpmbuild/BUILDROOT/kernel-3.10.0_rc1+-1.x86_64/boot/vmlinuz ']'
+ '[' -e /vmlinuz ']'
+ '[' -f /home/user/rpmbuild/BUILDROOT/kernel-3.10.0_rc1+-1.x86_64/boot/System.map-3.10.0-rc1+ ']'
+ '[' '!' -L /home/user/rpmbuild/BUILDROOT/kernel-3.10.0_rc1+-1.x86_64/boot/System.map ']'
+ '[' -e /System.map ']'
+ ln -sf /home/user/rpmbuild/BUILDROOT/kernel-3.10.0_rc1+-1.x86_64/boot//home/user/rpmbuild/BUILDROOT/kernel-3.10.0_rc1+-1.x86_64/boot/System.map-3.10.0-rc1+ /boot/System.map
ln: cannot remove `/boot/System.map': Permission denied
+ cat arch/x86/boot/bzImage
+ cp System.map /home/user/rpmbuild/BUILDROOT/kernel-3.10.0_rc1+-1.x86_64/boot/System.map-3.10.0-rc1+
+ ln -fs /home/user/rpmbuild/BUILDROOT/kernel-3.10.0_rc1+-1.x86_64/boot//home/user/rpmbuild/BUILDROOT/kernel-3.10.0_rc1+-1.x86_64/boot/vmlinuz-3.10.0-rc1+ /boot/vmlinuz
ln: cannot remove `/boot/vmlinuz': Permission denied
+ ln -fs /home/user/rpmbuild/BUILDROOT/kernel-3.10.0_rc1+-1.x86_64/boot//home/user/rpmbuild/BUILDROOT/kernel-3.10.0_rc1+-1.x86_64/boot/System.map-3.10.0-rc1+ /boot/System.map
ln: cannot remove `/boot/System.map': Permission denied
+ '[' -n '' -a -x /sbin/new-kernel-pkg ']'

Note the attempts to remove and symlink stuff.   I also think there is some inconsistent use of INSTALL_PATH and INSTALLPATH:
if [ ! -L $INSTALL_PATH/$KERNEL_NAME ]; then
    if [ -e $INSTALLPATH/$KERNEL_NAME ]; then
        mv $INSTALL_PATH/$KERNEL_NAME $INSTALL_PATH/$KERNEL_NAME.old
    fi
fi

I'm seeing when spec file tries to do its own install...

I'm open to suggestions for making this part of the spec file portable and the src RPM usable.

Mike

