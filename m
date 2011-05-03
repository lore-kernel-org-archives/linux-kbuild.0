Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from outmail004.snc4.facebook.com ([66.220.144.136]:53028 "EHLO
	mx-out.facebook.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754957Ab1ECVcK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 May 2011 17:32:10 -0400
Date: Tue, 3 May 2011 14:27:06 -0700
From: Arun Sharma <asharma@fb.com>
Subject: make rpm-pkg and version mismatch
Message-ID: <20110503212706.GA26044@dev1756.snc6.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org


make rpm-pkg produces files that look like: kernel-2.6.39rc5-2.x86_64.rpm
However, uname -r produces 2.6.39rc5 (-2 is missing).

This differs from how some of the distributors are packaging the kernel.
Their setup includes %{release} in uname -r.

One way to achive that is:

--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -170,4 +170,8 @@ else
        fi
 fi
 
+# Append the RPM release 
+release=`. ./scripts/mkversion`
+res="${res}-${release}"
+

But then, I have to go back and remove the %{release} in a number of
places:

--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -24,9 +24,12 @@ fi
 PROVIDES="$PROVIDES kernel-$KERNELRELEASE"
 __KERNELRELEASE=`echo $KERNELRELEASE | sed -e "s/-/_/g"`

+# Remove the -%{release} from __KERNELRELEASE
+__KERNELVERSION=`echo $__KERNELRELEASE | sed -e "s/-[^-]*$//"`
+
 echo "Name: kernel"
 echo "Summary: The Linux Kernel"
-echo "Version: $__KERNELRELEASE"
+echo "Version: $__KERNELVERSION"
 # we need to determine the NEXT version number so that uname and
 # rpm -q will agree
 echo "Release: `. $srctree/scripts/mkversion`"

Rinse and repeat in all other places that refer to KERNELRELEASE
but want KERNELVERSION.

Is there a simpler way to do this?

 -Arun
