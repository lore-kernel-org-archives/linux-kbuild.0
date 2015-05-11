Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:45283 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753769AbbEKOC1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 May 2015 10:02:27 -0400
From: Chris J Arges <chris.j.arges@canonical.com>
Subject: [PATCH RESEND 0/2] make deb-pkg build speed improvements
Date: Mon, 11 May 2015 09:02:24 -0500
Message-Id: <1431352946-6691-1-git-send-email-chris.j.arges@canonical.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: riku.voipio@linaro.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

These two patches should speed up the make deb-pkg build process by utilizing
the make jobserver properly, and using 'find | xargs' to parallelize debug
module installation.
I've tested with the resulting packages to ensure the symbols work as intended
by crash dumping a machine and using the dbg package symbols.

Using an Ubuntu distro conf + make olddefconfig on a 56-core machine, I can see
the following improvements (make clean && make deb-pkg -j`nproc`):

* Before

real    40m56.240s
user    182m17.292s
sys     140m18.812s

* After

real    36m22.633s
user    182m28.028s
sys     148m17.724s

Original submission: https://lkml.org/lkml/2015/4/24/617

Chris J Arges (2):
  package: Makefile: ensure $MAKE can use jobserver
  builddeb: parallelize debug module installation

 scripts/package/Makefile |  2 +-
 scripts/package/builddeb | 19 ++++++++++++-------
 2 files changed, 13 insertions(+), 8 deletions(-)

-- 
1.9.1

