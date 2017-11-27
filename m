Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:14694 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751778AbdK0Vea (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 16:34:30 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: Link time optimization for LTO/x86
Date: Mon, 27 Nov 2017 13:34:02 -0800
Message-Id: <20171127213423.27218-1-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org

This is an updated version of my older LTO patchkit for gcc/x86
This version doesn't need special binutils, but requires gcc 5+.
It also is compatible with near all options (except MODVERSIONS)

This allows the compiler to optimize over source files and throw
away unnecessary functions.

It also found various problems in source files, these are
fixed in the first few patches.

There are still some minor issues, see the individual files.
Also it still does double/triple link for KALLSYMS, which increases
the build time

Available at

git://git.kernel.org/pub/scm/linux/kernel/git/ak/linux-misc lto-415-2

-Andi
