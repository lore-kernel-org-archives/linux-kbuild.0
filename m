Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:38732 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751901Ab3FXOia (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 24 Jun 2013 10:38:30 -0400
Subject: [PATCH 2/3] kbuilld: install firmware files in kernel relative
 directory
From: Mike Marciniszyn <mike.marciniszyn@intel.com>
Date: Mon, 24 Jun 2013 10:38:28 -0400
Message-ID: <20130624143828.10761.20718.stgit@phlsvslse11.ph.intel.com>
In-Reply-To: <20130624143658.10761.3787.stgit@phlsvslse11.ph.intel.com>
References: <20130624143658.10761.3787.stgit@phlsvslse11.ph.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: Doug Ledford <dledford@redhat.com>, linux-kbuild@vger.kernel.org, mmarcini@yahoo.com

Prior to this patch, firmware files were being installed
in /lib/firmware with a potential conflict with already
installed kernels.

firmware files are now installed in /lib/firmware/<release>
and packaged with the rest of the modules.

Signed-off-by: Mike Marciniszyn <mike.marciniszyn@intel.com>
---
 scripts/package/mkspec |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index 0aa6a24..514aeb2 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -77,13 +77,14 @@ echo "%install"
 echo 'KBUILD_IMAGE=$(make image_name)'
 echo "%ifarch ia64"
 echo 'mkdir -p $RPM_BUILD_ROOT/boot/efi $RPM_BUILD_ROOT/lib/modules'
-echo 'mkdir -p $RPM_BUILD_ROOT/lib/firmware'
 echo "%else"
 echo 'mkdir -p $RPM_BUILD_ROOT/boot $RPM_BUILD_ROOT/lib/modules'
-echo 'mkdir -p $RPM_BUILD_ROOT/lib/firmware'
 echo "%endif"
+echo 'mkdir -p $RPM_BUILD_ROOT'"/lib/firmware/$KERNELRELEASE"
 
-echo 'INSTALL_MOD_PATH=$RPM_BUILD_ROOT make %{?_smp_mflags} KBUILD_SRC= modules_install'
+echo 'INSTALL_MOD_PATH=$RPM_BUILD_ROOT make %{?_smp_mflags} KBUILD_SRC= mod-fw= modules_install'
+echo 'INSTALL_FW_PATH=$RPM_BUILD_ROOT'"/lib/firmware/$KERNELRELEASE"
+echo 'make INSTALL_FW_PATH=$INSTALL_FW_PATH' firmware_install
 echo "%ifarch ia64"
 echo 'cp $KBUILD_IMAGE $RPM_BUILD_ROOT'"/boot/efi/vmlinuz-$KERNELRELEASE"
 echo 'ln -s '"efi/vmlinuz-$KERNELRELEASE" '$RPM_BUILD_ROOT'"/boot/"
@@ -125,7 +126,7 @@ echo "%files"
 echo '%defattr (-, root, root)'
 echo "%dir /lib/modules"
 echo "/lib/modules/$KERNELRELEASE"
-echo "/lib/firmware"
+echo "/lib/firmware/$KERNELRELEASE"
 echo "/boot/*"
 echo ""
 echo "%files headers"

