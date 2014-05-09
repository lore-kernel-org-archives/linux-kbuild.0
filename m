Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:43997 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750887AbaEIMwg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 9 May 2014 08:52:36 -0400
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH v2 0/5] kbuild: Use relative paths if possible
Date: Fri,  9 May 2014 14:52:19 +0200
Message-Id: <1399639944-20551-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

Hi,

This series changes the Makefile to use relative paths for $(objtree),
always setting it to '.', and for $(srctree) setting either to '.' or
'..', when building in the source tree or a subdirectory thereof,
respectively. The goal is to make compiler messages and Oopses more
readable by avoiding the full path to the source/object directory.

Patch 2/5 is just an unrelated cleanup.

v1->v2: Fix the 'build' and 'source' symlinks in /lib/modules

Michal Marek (5):
  firmware: Simplify directory creation
  firmware: Use $(quote) in the Makefile
  kbuild: Use relative path for $(objtree)
  kbuild: Use relative path when building in the source tree
  kbuild: Use relative path when building in a subdir of the source tree

 Makefile                | 18 ++++++++++++++----
 firmware/Makefile       | 34 +++++++---------------------------
 scripts/Makefile.fwinst | 24 +++++++++++-------------
 3 files changed, 32 insertions(+), 44 deletions(-)

-- 
1.8.4.5

