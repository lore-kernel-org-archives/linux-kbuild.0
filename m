Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:62254 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751887Ab1EQCOZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 May 2011 22:14:25 -0400
Message-Id: <20110517021027.390391519@goodmis.org>
Date: Mon, 16 May 2011 22:10:27 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: [RFC][PATCH 0/2] kbuild: create force-deps for fixdep for recordmcount
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

While doing a ktest patchcheck on several patches I've pulled,
an update to recordmcount caused ftrace to fail. This is because
ktest does a make mrproper for the first patch, but just uses the
dependencies for the patches after that. But one of the patches
modified both the way recordmcount worked, and what ftrace expected
in the kernel. Since modification of recordmcount does not force
updates to all object files, the expectation that ftrace had on
the object files was incorrect and caused ftrace to fail.

This is an RFC to modify fixdep to allow addition of files that would
be added as dependencies to all objects in the kernel.

Thoughts?

Steven Rostedt (2):
      kbuild: Add force-deps to fixdep
      ftrace/kbuild: Add recordmcount files to force full build

----
 scripts/Kbuild.include |    3 ++-
 scripts/Makefile.build |    6 ++++--
 scripts/basic/fixdep.c |   18 ++++++++++++++++--
 3 files changed, 22 insertions(+), 5 deletions(-)
