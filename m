Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relais.videotron.ca ([24.201.245.36]:26877 "EHLO
	relais.videotron.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753918AbcB2DsV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 28 Feb 2016 22:48:21 -0500
Content-transfer-encoding: 7BIT
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v4 0/8] [PULL REQUEST] Trim unused exported kernel symbols
Date: Sun, 28 Feb 2016 22:48:03 -0500
Message-id: <1456717691-28298-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

This patch series provides the option to omit exported symbols from
the kernel and modules that are never referenced by any of the selected
modules in the current kernel configuration. this allows for optimizing
the compiled code and reducing final binaries' size. When using LTO the
binary size reduction is even more effective. It could also be argued
that this could bring some security advantages.

The original cover letter with lots of test results can be found here:

	https://lkml.org/lkml/2016/2/8/813

Please consider for merging into your tree. Alternately, the following
branch can be merged:

	http://git.linaro.org/people/nicolas.pitre/linux.git autoksyms

Thanks.

Changes from v3:

- Shell portability changes to adjust_autoksyms.sh, partly from
  suggestions by Zev Weiss.

- Fix sample modules by building them before adjust_autoksyms.sh is run.

Changes from v2:

- Generating the build dependencies by parsing the source with fixdep
  turned out to be unreliable due to all the EXPORT_SYMBOL() variants,
  and especially their use within macros where the actual symbol name
  is known only after running the preprocessor. This list of symbol names
  is now obtained from the preprocessor directly, fixing allmodconfig
  builds.

Changes from v1:

- Replaced "exp" that doesn't convey the right meaning as noted by
  Sam Ravnborg. The "ksym" identifier is actually what the kernel
  already uses for this. Therefore:
  - CONFIG_TRIM_UNUSED_EXPSYMS --> CONFIG_TRIM_UNUSED_KSYMS
  - include/generated/expsyms.h --> include/generated/autoksyms.h
  - #define __EXPSYM_* --> #define __KSYM_*

- Some sed regexp improvements as suggested by Al Viro.

- Renamed vmlinux_recursive target to autoksyms_recursive.

- Accept EXPORT_SYMBOL variants with a prefix, e.g. ACPI_EXPORT_SYMBOL.

- Minor commit log clarifications.

- Added Rusty's ACK.

diffstat:

 Makefile                    | 23 +++++++--
 include/linux/export.h      | 34 ++++++++++++-
 init/Kconfig                | 16 ++++++
 scripts/Kbuild.include      | 33 ++++++++++++-
 scripts/Makefile.build      | 22 +++++----
 scripts/adjust_autoksyms.sh | 97 +++++++++++++++++++++++++++++++++++++
 scripts/basic/fixdep.c      | 61 +++++++++++++++++------
 7 files changed, 256 insertions(+), 30 deletions(-)



