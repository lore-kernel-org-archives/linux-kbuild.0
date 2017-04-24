Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:35583 "EHLO
        mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936408AbdDXXGA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Apr 2017 19:06:00 -0400
From: frowand.list@gmail.com
Subject: [PATCH v2 0/2] of: Add unit tests for applying overlays
Date: Mon, 24 Apr 2017 16:05:17 -0700
Message-Id: <1493075119-32026-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh+dt@kernel.org>, stephen.boyd@linaro.org, Michal Marek <mmarek@suse.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Existing overlay unit tests examine individual pieces of the overlay
code.  The new tests target the entire process of applying an overlay.

Changes from v1:
  - Move overlay base dtb unflattening into unittest.c.  Call from fdt.c.
  - Clarify file and variable names, 'overlay_test_' instead of 'ot_'
  - Use proper naming convention for node names.
  - A few added comments.
  - Improve error messages in the new tests.

Frank Rowand (2):
  of: support dtc compiler flags for device tree overlays
  of: Add unit tests for applying overlays.

 drivers/of/fdt.c                                 |  14 +-
 drivers/of/of_private.h                          |  11 +
 drivers/of/unittest-data/Makefile                |  17 +-
 drivers/of/unittest-data/overlay.dts             |  53 ++++
 drivers/of/unittest-data/overlay_bad_phandle.dts |  20 ++
 drivers/of/unittest-data/overlay_base.dts        |  80 ++++++
 drivers/of/unittest.c                            | 318 +++++++++++++++++++++++
 scripts/Makefile.lib                             |   2 +
 8 files changed, 507 insertions(+), 8 deletions(-)
 create mode 100644 drivers/of/unittest-data/overlay.dts
 create mode 100644 drivers/of/unittest-data/overlay_bad_phandle.dts
 create mode 100644 drivers/of/unittest-data/overlay_base.dts

-- 
Frank Rowand <frank.rowand@sony.com>

