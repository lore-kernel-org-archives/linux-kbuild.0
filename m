Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shutemov.name ([188.40.19.243]:34068 "EHLO shutemov.name"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755445Ab1KYNqS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Nov 2011 08:46:18 -0500
Date: Fri, 25 Nov 2011 15:46:17 +0200
From: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: -I option expansion and -Wmissing-include-dirs
Message-ID: <20111125134617.GA31133@shutemov.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

Currently, kbuild makes -I option expansion without any check if the
resulting include directory exists. It produce warnings if you try to build
with W=1 which enables -Wmissing-include-dirs. For example:

$ make W=1 O=~/var/tmp drivers/gpu/drm/drm_auth.o
  Using /home/space/kas/git/public/linux as source for kernel
  GEN     /home/space/kas/var/tmp1/Makefile
  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    /home/space/kas/git/public/linux/scripts/checksyscalls.sh
  CC [M]  drivers/gpu/drm/drm_auth.o
cc1: warning: include/drm: No such file or directory [enabled by default]

It would be nice to address the issue.

P.S. [enabled by default] is gcc bug. [-Wmissing-include-dirs] should be there.
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=51303

-- 
 Kirill A. Shutemov
