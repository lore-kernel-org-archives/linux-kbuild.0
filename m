Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:56892 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752441AbdJPNYs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Oct 2017 09:24:48 -0400
From: Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 0/4] Cleanup instrumentation avoidance
Date: Mon, 16 Oct 2017 14:24:36 +0100
Message-Id: <20171016132440.38098-1-mark.rutland@arm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, adech.fo@gmail.com, aryabinin@virtuozzo.com, catalin.marinas@arm.com, christoffer.dall@linaro.org, dvyukov@google.com, linux-kbuild@vger.kernel.org, mark.rutland@arm.com, mark.zyngier@arm.com, mmarek@suse.com, will.deacon@arm.com, yamada.masahiro@socionext.com

Recently we spotted that some code with special ABI requirements was
being instrumented by KCOV [1], and we need to avoid all instrumentation
in this case.

While it's possible to disable each instrumentation option manually,
this is tedious and error prone as new options are introduced.

This series adds a new CC_INSTRUMENT option which can be used to disable
all instrumentation of a given file or directory, and makes use of this
throught arm64.

There are other places where this could be used (e.g. the EFI stub), but
I've avoided altering those for now in the hope that this can be taken
via the arm64 tree.

Thanks,
Mark.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2017-September/533105.html

Mark Rutland (4):
  kbuild: allow global override of CC instrumentation
  arm64: prevent instrumentation of LL/SC atomics
  kvm/arm64: simplify CC instrumentation opt-out
  arm64: vdso: remove pointless gcov option

 arch/arm64/kernel/vdso/Makefile |  3 ---
 arch/arm64/kvm/hyp/Makefile     |  5 +----
 arch/arm64/lib/Makefile         |  1 +
 scripts/Makefile.lib            | 17 +++++++++++++----
 4 files changed, 15 insertions(+), 11 deletions(-)

-- 
2.11.0

