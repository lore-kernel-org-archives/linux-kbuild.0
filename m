Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:36545 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1046087AbdDXFoD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Apr 2017 01:44:03 -0400
From: frowand.list@gmail.com
Subject: [PATCH 0/2] of: Add unit tests for applying overlays
Date: Sun, 23 Apr 2017 22:43:13 -0700
Message-Id: <1493012595-696-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh+dt@kernel.org>, stephen.boyd@linaro.org, Michal Marek <mmarek@suse.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Existing overlay unit tests examine individual pieces of the overlay
code.  The new tests target the entire process of applying an overlay.

Frank Rowand (2):
  of: add support of dtc compiler flags for device tree overlays
  of: Add unit tests for applying overlays.

 drivers/of/fdt.c                            |  45 +++++
 drivers/of/of_private.h                     |   2 +
 drivers/of/unittest-data/Makefile           |  17 +-
 drivers/of/unittest-data/ot.dts             |  53 ++++++
 drivers/of/unittest-data/ot_bad_phandle.dts |  20 +++
 drivers/of/unittest-data/ot_base.dts        |  71 ++++++++
 drivers/of/unittest.c                       | 264 ++++++++++++++++++++++++++++
 scripts/Makefile.lib                        |   2 +
 8 files changed, 471 insertions(+), 3 deletions(-)
 create mode 100644 drivers/of/unittest-data/ot.dts
 create mode 100644 drivers/of/unittest-data/ot_bad_phandle.dts
 create mode 100644 drivers/of/unittest-data/ot_base.dts

-- 
Frank Rowand <frank.rowand@sony.com>

