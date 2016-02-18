Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relais.videotron.ca ([24.201.245.36]:24212 "EHLO
	relais.videotron.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1423897AbcBRUHH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 18 Feb 2016 15:07:07 -0500
Content-transfer-encoding: 7BIT
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v3 0/7] Trim unused exported kernel symbols
Date: Thu, 18 Feb 2016 15:06:56 -0500
Message-id: <1455826023-2134-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Rusty Russell <rusty@rustcorp.com.au>

This patch series provides the option to omit exported symbols from
the kernel and modules that are never referenced by any of the selected
modules in the current kernel configuration.

The original cover letter with lots of test results can be found here:

        https://lkml.org/lkml/2016/2/8/813

A git branch with those patches is also available here:

        http://git.linaro.org/people/nicolas.pitre/linux.git autoksyms

Please consider for merging.

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

