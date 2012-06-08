Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smp.if.uj.edu.pl ([149.156.82.206]:54761 "EHLO smp.if.uj.edu.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758108Ab2FHIGh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Jun 2012 04:06:37 -0400
Date: Fri, 8 Jun 2012 10:01:30 +0200
From: Witold Baryluk <baryluk@smp.if.uj.edu.pl>
Subject: Please add arch/x86/Makefile_32.cpu to linux-headers when doing
 make deb-pkg on i386 Debian
Message-ID: <20120608080130.GJ5511@smp.if.uj.edu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Hi kbuild maintainers,

I discovered that make deb-pkg do not add Makefile_32.cpu from arch/x86
directory when doing i386 kernel build and package build.

This file is needed for example when doing dkms modules build,
because it is included by arch/x86/Makefile and contains cpu specific
options to the compiler which is crucial for correct compilation.

Normally dkms builds will fail with arch/x86/Makefile trying to include
not-existing Makefile_32.cpu file. Simply copying Makefile_32.cpu to
/usr/src/*header/arch/x86/ is fast but dirty workaround to make them
build.

Adding proper install/cp command to scripts/package/builddeb should be easy.

UML kernel is probably also affected.


Regards,
Witek

-- 
Witold Baryluk
