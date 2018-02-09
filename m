Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751151AbeBIQMt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Feb 2018 11:12:49 -0500
From: James Hogan <jhogan@kernel.org>
Subject: [PATCH 0/3] MIPS: Generic defconfig Makefile improvements
Date: Fri,  9 Feb 2018 16:11:55 +0000
Message-Id: <cover.e6abe4a455cad25b6663ceb7da02aee67a3be269.1518192692.git-series.jhogan@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-mips@linux-mips.org
Cc: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Paul Burton <paul.burton@mips.com>, Matt Redfearn <matt.redfearn@mips.com>, linux-kbuild@vger.kernel.org

This series adds the following MIPS Makefile targets and improves the
MIPS "make help" text to list these things too:
 - list_generic_defconfigs - list specific generic defconfig names
 - list_generic_boards     - list boards that can be passed to BOARDS
 - list_legacy_defconfigs  - list legacy defconfigs

This will be helpful for CI builders to be able to automatically pick up
generic defconfigs that aren't directly represented as files in
arch/mips/configs/.

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Paul Burton <paul.burton@mips.com>
Cc: Matt Redfearn <matt.redfearn@mips.com>
Cc: linux-mips@linux-mips.org
Cc: linux-kbuild@vger.kernel.org

James Hogan (3):
  MIPS: Refactor legacy defconfigs
  MIPS: Add generic list_* Makefile targets
  MIPS: Expand help text to list generic defconfigs

 Makefile           |  2 +-
 arch/mips/Makefile | 89 ++++++++++++++++++++++++++++++++---------------
 2 files changed, 63 insertions(+), 28 deletions(-)

base-commit: 791412dafbbfd860e78983d45cf71db603a82f67
-- 
git-series 0.9.1
