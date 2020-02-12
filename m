Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f74.google.com ([209.85.128.74]:56877 "EHLO
        mail-wm1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728226AbgBLUVp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Feb 2020 15:21:45 -0500
Received: by mail-wm1-f74.google.com with SMTP id g26so1192126wmk.6
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Feb 2020 12:21:44 -0800 (PST)
Date: Wed, 12 Feb 2020 20:21:37 +0000
Message-Id: <20200212202140.138092-1-qperret@google.com>
Mime-Version: 1.0
Subject: [PATCH v4 0/3] kbuild: allow symbol whitelisting with TRIM_UNUSED_KSYM
From: Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: masahiroy@kernel.org, nico@fluxnic.net
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, maennich@google.com, kernel-team@android.com, jeyu@kernel.org, hch@infradead.org, qperret@google.com

The current norm on Android and many other systems is for vendors to
introduce significant changes to their downstream kernels, and to
contribute very little (if any) code back upstream. The Generic Kernel
Image (GKI) project in Android attempts to improve the status-quo by
having a unique kernel for all android devices of the same architecture,
regardless of the SoC vendor. The key idea is to make all interested
parties agree on a common solution, and contribute their code upstream
to make it available to use by the wider community.

The kernel-to-drivers ABI on Android devices varies significantly from
one vendor kernel to another today because of changes to exported
symbols, dependencies on vendor symbols, and surely other things. The
first step for GKI is to try and put some order into this by agreeing on
one version of the ABI that works for everybody.

For practical reasons, we need to reduce the ABI surface to a subset of
the exported symbols, simply to make the problem realistically solvable,
but there is currently no upstream support for this use-case.

As such, this series attempts to improve the situation by enabling users
to specify a symbol 'whitelist' at compile time. Any symbol specified in
this whitelist will be kept exported when CONFIG_TRIM_UNUSED_KSYMS is
set, even if it has no in-tree user. The whitelist is defined as a
simple text file, listing symbols, one per line.

v4:
 - removed [[]] bash-specific pattern from the scripts (Nicolas)
 - use $CONFIG_SHELL consistently in all patches (Masahiro)
 - added shortlog for initial generation of autoksyms.h (Masahiro)
 - added comment on how 'eval' expands the whitelist path (Masahiro)

v3:
 - added a cover letter to explain why this is in fact an attempt to
   help upstream in the long term (Christoph)
 - made path relative to the kernel source tree (Matthias)
 - made the Kconfig help text less confusing (Jessica)
 - added patch 02 and 03 to optimize build time when a whitelist is
   provided

v2:
 - make sure to quote the whitelist path properly (Nicolas)

Quentin Perret (3):
  kbuild: allow symbol whitelisting with TRIM_UNUSED_KSYMS
  kbuild: split adjust_autoksyms.sh in two parts
  kbuild: generate autoksyms.h early

 Makefile                    |  7 ++++--
 init/Kconfig                | 13 +++++++++++
 scripts/adjust_autoksyms.sh | 24 ++++----------------
 scripts/gen_autoksyms.sh    | 45 +++++++++++++++++++++++++++++++++++++
 4 files changed, 67 insertions(+), 22 deletions(-)
 create mode 100755 scripts/gen_autoksyms.sh

-- 
2.25.0.225.g125e21ebc7-goog
