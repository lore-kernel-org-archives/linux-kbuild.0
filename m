Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:43177 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754222AbZIDBZi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Sep 2009 21:25:38 -0400
Date: Thu, 3 Sep 2009 21:25:27 -0400
From: Amerigo Wang <amwang@redhat.com>
Message-Id: <20090904012755.3749.69645.sendpatchset@localhost.localdomain>
Subject: [RFC Patch 0/5] gcov: integrate gcov into kbuild
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>, akpm@linux-foundation.org, linux-kbuild@vger.kernel.org, Amerigo Wang <amwang@redhat.com>, Sam Ravnborg <sam@ravnborg.org>


This patchset is mainly to integrate gcov into kbuild system, so that
we can use "make foo/bar.c.gcov" to get the gcov files.
Also moves the useful scripts in gcov.txt into tools/gcov/ direcotry.

Cc: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: WANG Cong <amwang@redhat.com>

---
 .gitignore                    |    1 
 Documentation/gcov.txt        |   66 +++---------------------------------------
 Makefile                      |    8 +++--
 scripts/Makefile.build        |    7 ++++
 scripts/gen_gcov.sh           |   49 +++++++++++++++++++++++++++++++
 tools/gcov/gather_on_build.sh |   24 +++++++++++++++
 tools/gcov/gather_on_test.sh  |   20 ++++++++++++
 7 files changed, 113 insertions(+), 62 deletions(-)
