Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from jessie.kos.to ([212.47.231.226]:46285 "EHLO pilvi.kos.to"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750973AbbFWFk4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Jun 2015 01:40:56 -0400
Received: from localhost (91-157-196-38.elisa-laajakaista.fi [91.157.196.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pilvi.kos.to (Postfix) with ESMTPSA id 88F7D2C0022
	for <linux-kbuild@vger.kernel.org>; Tue, 23 Jun 2015 05:33:31 +0000 (UTC)
From: Riku Voipio <riku.voipio@iki.fi>
Subject: collection of make deb-pkg improvements
Date: Tue, 23 Jun 2015 08:33:30 +0300
MIME-Version: 1.0
Message-ID: <a3a3c255-c1ac-400b-bf7d-233a90446f2c@iki.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

Since a lot of patches for deb-pkg seem to be floating around, I've decided 
to gather all the ones I use for general availability[1].

The branch deb-pkg-4.1 is all the deb-pkg patches on top of 4.1. It 
includes the patches already in kbuild#misc + a bunch of patches needed for 
source package generation.

The branch perf-pkg-4.1 adds on top of that patches to create a perf source 
package. This is still more WiP, and I'm not sure if it's really useful for 
anyone but me. At least the previous patch got no comments...

[1] https://github.com/suihkulokki/linux/commits/perf-pkg-4.1

And the list of changes included:

----------------------------------------------------------------
Andrey Skvortsov (1):
      builddeb: fix stripped module signatures if CONFIG_DEBUG_INFO and 
CONFIG_MODULE_SIG_ALL are set

Arnaud Patard (1):
      deb-pkg: Add device tree blobs to the package

Ben Hutchings (1):
      deb-pkg: Add automatic support for armhf architecture

Riku Voipio (6):
      deb-pkg: move setting debarch for a separate function
      deb-pkg: simplify directory creation
      deb-pkg: add source package
      package Makefile: fix perf-tar targets when outdir is set
      tools/lib: improve clean target
      make: add perf-deb-src-pkg target to build perf debian source package

 scripts/package/Makefile      |  32 +++++++++++++++++++-----
 scripts/package/builddeb      | 103 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------
 scripts/package/buildperfdsc  | 128 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 tools/lib/api/Makefile        |   2 +-
 tools/lib/traceevent/Makefile |   2 +-
 5 files changed, 235 insertions(+), 32 deletions(-)
 create mode 100755 scripts/package/buildperfdsc
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
