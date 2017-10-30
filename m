Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:40745 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751900AbdJ3Pf5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Oct 2017 11:35:57 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/3] .gitignore / kbuild: of: ignore and clean *.dtb and *.dtb.S globally
Date: Tue, 31 Oct 2017 00:33:44 +0900
Message-Id: <1509377627-11362-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Matthias Kaehlcke <mka@chromium.org>, Behan Webster <behanw@converseincode.com>, Michael Ellerman <mpe@ellerman.id.au>, Tobias Klauser <tklauser@distanz.ch>, Ley Foon Tan <ley.foon.tan@intel.com>, =?UTF-8?q?Vin=C3=ADcius=20Tinti?= <viniciustinti@gmail.com>, Josh Poimboeuf <jpoimboe@redhat.com>


Recently, overlay test data were added to of/unittest-data,
but I notice they are not ignored or cleaned.  Actually, we
often forget .gitignore / clean-files at the first commit.

We have DT things in various places in the kernel tree,
so I think it is OK to move them to the top-level.

Is this OK from the DT point of view?



Masahiro Yamada (3):
  .gitignore: sort normal pattern rules alphabetically
  .gitignore: move *.dtb and *.dtb.S patterns to the top-level
    .gitignore
  kbuild: clean up *.dtb and *.dtb.S patterns from top-level Makefile

 .gitignore                          | 44 +++++++++++++++++++------------------
 Makefile                            |  2 +-
 arch/arc/boot/.gitignore            |  1 -
 arch/arm/boot/.gitignore            |  1 -
 arch/arm64/boot/dts/.gitignore      |  1 -
 arch/metag/boot/.gitignore          |  1 -
 arch/microblaze/boot/.gitignore     |  1 -
 arch/mips/boot/.gitignore           |  1 -
 arch/nios2/boot/.gitignore          |  1 -
 arch/powerpc/boot/.gitignore        |  1 -
 arch/xtensa/boot/.gitignore         |  1 -
 drivers/of/unittest-data/.gitignore |  2 --
 12 files changed, 24 insertions(+), 33 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/.gitignore
 delete mode 100644 drivers/of/unittest-data/.gitignore

-- 
2.7.4

