Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relais.videotron.ca ([24.201.245.36]:21848 "EHLO
	relais.videotron.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750864AbcBJFIg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Feb 2016 00:08:36 -0500
Content-transfer-encoding: 7BIT
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v2 0/6] Trim unused exported kernel symbols
Date: Wed, 10 Feb 2016 00:08:22 -0500
Message-id: <1455080908-22272-1-git-send-email-nicolas.pitre@linaro.org>
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
 
