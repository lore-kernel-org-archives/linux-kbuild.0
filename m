Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:33967 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754980AbdCKX7H (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Mar 2017 18:59:07 -0500
From: Tom Rini <trini@konsulko.com>
Subject: [PATCH] kbuild/mkspec: Fix architectures where KBUILD_IMAGE isn't a full path
Date: Sat, 11 Mar 2017 23:59:22 +0000
Message-Id: <1489276762-22280-1-git-send-email-trini@konsulko.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>

On some architectures, such as arm64, KBUILD_IMAGE is not a full path
but instead just the build target.  The builddeb script handles this
case correctly today and will try arch/$ARCH/boot/$KBUILD_IMAGE so we
can just borrow that logic and adapt it slightly for spec file syntax.

Cc: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
It is currently a mixed-bag on if architectures will use a build target
(arm, arm64, arc are certainly by inspection and a few others 'may') or
a full path (x86, blackfin, s390).  Given that builddeb gets this case
correct, I think changing mkspec is the right way to go here.
---
 scripts/package/mkspec | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index bb43f153fd8e..aa5f3db43f12 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -101,7 +101,11 @@ echo "%ifarch ppc64"
 echo "cp vmlinux arch/powerpc/boot"
 echo "cp arch/powerpc/boot/"'$KBUILD_IMAGE $RPM_BUILD_ROOT'"/boot/vmlinuz-$KERNELRELEASE"
 echo "%else"
-echo 'cp $KBUILD_IMAGE $RPM_BUILD_ROOT'"/boot/vmlinuz-$KERNELRELEASE"
+echo "if [ -e $KBUILD_IMAGE ]; then"
+echo '  cp $KBUILD_IMAGE $RPM_BUILD_ROOT'"/boot/vmlinuz-$KERNELRELEASE"
+echo "else"
+echo '  cp arch/$ARCH/boot/$KBUILD_IMAGE $RPM_BUILD_ROOT'"/boot/vmlinuz-$KERNELRELEASE"
+echo "fi"
 echo "%endif"
 echo "%endif"
 
-- 
2.7.4

