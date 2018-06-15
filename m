Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:27013 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964924AbeFOBU3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jun 2018 21:20:29 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 0/3] mtd: rawnand: denali: add new clocks and improve setup_data_interface
Date: Fri, 15 Jun 2018 10:18:49 +0900
Message-Id: <1529025532-22087-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kbuild@vger.kernel.org, Richard Weinberger <richard@nod.at>, Masahiro Yamada <yamada.masahiro@socionext.com>, devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>


The ->setup_data_interface() hook needs to know the clock frequency.
In fact, this IP needs three clocks, bus "which clock?" is really
confusing.  (It is not described in the DT-binding at all.)

This series adds more clocks.  In the new binding, three clocks
are required: core clock, bus interface clock, ECC engine clock.

This series also takes care of the backward compatibility by
providing hardcoded values in case the new clocks are missing.
So, existing DT should work.


Changes in v3:
  - Change the patch order so that the bug-fix one comes the first

Changes in v2:
  - Split patches into sensible chunks
  - Split patches into sensible chunks

Masahiro Yamada (3):
  mtd: rawnand: denali_dt: add more clocks based on IP datasheet
  mtd: rawnand: denali_dt: use dev as a shorthand of &pdev->dev
  mtd: rawnand: denali: optimize timing parameters for data interface

 .../devicetree/bindings/mtd/denali-nand.txt        |  5 ++
 drivers/mtd/nand/raw/denali.c                      | 49 ++++++++--------
 drivers/mtd/nand/raw/denali.h                      |  1 +
 drivers/mtd/nand/raw/denali_dt.c                   | 66 ++++++++++++++++++----
 drivers/mtd/nand/raw/denali_pci.c                  |  1 +
 5 files changed, 86 insertions(+), 36 deletions(-)

-- 
2.7.4

