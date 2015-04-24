Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:50370 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965559AbbDXSZw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 24 Apr 2015 14:25:52 -0400
From: Chris J Arges <chris.j.arges@canonical.com>
Subject: [PATCH 0/2] make deb-pkg build speed improvements
Date: Fri, 24 Apr 2015 13:25:38 -0500
Message-Id: <1429899940-32366-1-git-send-email-chris.j.arges@canonical.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, mmarek@suse.cz
Cc: linux-kernel@vger.kernel.org, Chris J Arges <chris.j.arges@canonical.com>

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

Chris J Arges (2):
  package: Makefile: ensure $MAKE can use jobserver
  builddeb: parallelize debug module installation

 scripts/package/Makefile |  2 +-
 scripts/package/builddeb | 15 ++++++++-------
 2 files changed, 9 insertions(+), 8 deletions(-)

-- 
1.9.1

