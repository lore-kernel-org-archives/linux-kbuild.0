Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from david.siemens.de ([192.35.17.14]:51796 "EHLO david.siemens.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750978AbcEJICc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 May 2016 04:02:32 -0400
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 00/18] scripts/gdb: Updates for 4.7
Date: Tue, 10 May 2016 09:39:25 +0200
Message-Id: <cover.1462865983.git.jan.kiszka@siemens.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Dom Cote <buzdelabuz2+git@gmail.com>, Jeff Mahoney <jeffm@suse.com>, Jonathan Corbet <corbet@lwn.net>, Kieran Bingham <kieran.bingham@linaro.org>, Kieran Bingham <kieran@ksquared.org.uk>, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.com

Hi Andrew,

please include the following enhancements and fixed for the gdb scripts
in your queue.

This adds a number of new commands and helper functions, contributed by
Kieran, and fixes lx-dmesg for Python 3 as well as corrects the output
of lx-lsmod.

Kieran stepped up to support me significantly with the maintenance of
the script. Andrew, it may very well be that you will receive the next
merge request from him already.

Jan

CC: Dom Cote <buzdelabuz2+git@gmail.com>
CC: Jeff Mahoney <jeffm@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>
CC: Kieran Bingham <kieran.bingham@linaro.org>
CC: Kieran Bingham <kieran@bingham.xyz>
Cc: linux-doc@vger.kernel.org
CC: linux-kbuild@vger.kernel.org
CC: mmarek@suse.com

Dom Cote (2):
  scripts/gdb: Improve types abstraction for gdb python scripts
  scripts/gdb: Fix issue with dmesg.py and python 3.X

Jan Kiszka (2):
  scripts/gdb: Adjust module reference counter reported by lx-lsmod
  scripts/gdb: Cast CPU numbers to integer

Kieran Bingham (14):
  scripts/gdb: Provide linux constants
  scripts/gdb: Provide kernel list item generators
  scripts/gdb: Convert modules usage to lists functions
  scripts/gdb: Provide exception catching parser
  scripts/gdb: Support !CONFIG_MODULES gracefully
  scripts/gdb: Provide a dentry_name VFS path helper
  scripts/gdb: Add io resource readers
  scripts/gdb: Add mount point list command
  scripts/gdb: Add cpu iterators
  scripts/gdb: Add a Radix Tree Parser
  scripts/gdb: Add documentation example for radix tree
  scripts/gdb: Add lx_thread_info_by_pid helper
  scripts/gdb: decode bytestream on dmesg for Python3
  MAINTAINERS: Add co-maintainer for scripts/gdb

 Documentation/gdb-kernel-debugging.txt |  21 +++++
 Kbuild                                 |  10 +++
 MAINTAINERS                            |   1 +
 scripts/gdb/linux/Makefile             |  12 ++-
 scripts/gdb/linux/constants.py.in      |  59 +++++++++++++
 scripts/gdb/linux/cpus.py              |  38 ++++++++
 scripts/gdb/linux/dmesg.py             |  11 +--
 scripts/gdb/linux/lists.py             |  21 +++++
 scripts/gdb/linux/modules.py           |  24 +++--
 scripts/gdb/linux/proc.py              | 156 +++++++++++++++++++++++++++++++++
 scripts/gdb/linux/radixtree.py         |  97 ++++++++++++++++++++
 scripts/gdb/linux/tasks.py             |  19 ++++
 scripts/gdb/linux/utils.py             |  32 ++++++-
 scripts/gdb/vmlinux-gdb.py             |   2 +
 14 files changed, 482 insertions(+), 21 deletions(-)
 create mode 100644 scripts/gdb/linux/constants.py.in
 create mode 100644 scripts/gdb/linux/radixtree.py

-- 
2.1.4

