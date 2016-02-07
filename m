Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35292 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754440AbcBGV3H (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 7 Feb 2016 16:29:07 -0500
Received: by mail-wm0-f67.google.com with SMTP id g62so12696297wme.2
        for <linux-kbuild@vger.kernel.org>; Sun, 07 Feb 2016 13:29:06 -0800 (PST)
Date: Sun, 7 Feb 2016 22:27:21 +0100
From: Emese Revfy <re.emese@gmail.com>
Subject: [PATCH 0/3] Introduce GCC plugin infrastructure
Message-Id: <20160207222721.e0087a07fa604b5dac79a109@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: pageexec@freemail.hu, spender@grsecurity.net, kernel-hardening@lists.openwall.com, mmarek@suse.com, keescook@chromium.org

This patch set introduce the GCC plugin infrastructure with examples for testing
and documentation.

GCC plugins are loadable modules that provide extra features to the compiler.
They are useful for runtime instrumentation and static analysis.

The infrastructure supports all gcc versions from 4.5 to 6.0, building
out-of-tree modules and building in a separate directory. Cross-compilation
is supported too but currently only the x86 architecture enables plugins.

This infrastructure was ported from grsecurity/PaX. It is a CII project
supported by the Linux Foundation.

Emese Revfy (3):
 GCC plugin infrastructure
 Add Cyclomatic complexity plugin
 Documentations of the GCC plugin infrastructre

---
 Documentation/dontdiff             |   1 +
 Documentation/example_gcc_plugin.c | 103 +++++
 Documentation/gcc-plugins.txt      |  76 ++++
 Makefile                           |  70 +++-
 arch/Kconfig                       |  26 ++
 arch/x86/Kconfig                   |   1 +
 init/Makefile                      |   3 +
 scripts/Makefile.build             |   2 +-
 scripts/Makefile.clean             |   3 +-
 scripts/Makefile.host              |  69 +++-
 scripts/gcc-plugin.sh              |  51 +++
 scripts/link-vmlinux.sh            |   2 +-
 scripts/package/builddeb           |   1 +
 tools/gcc/Makefile                 |  19 +
 tools/gcc/cyc_complexity_plugin.c  | 120 ++++++
 tools/gcc/gcc-common.h             | 794 +++++++++++++++++++++++++++++++++++++
 16 files changed, 1326 insertions(+), 15 deletions(-)
