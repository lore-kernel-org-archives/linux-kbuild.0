Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f176.google.com ([209.85.192.176]:34730 "EHLO
        mail-pf0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1953159AbdDYSbc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Apr 2017 14:31:32 -0400
From: frowand.list@gmail.com
Subject: [PATCH v3 0/2] of: Add unit tests for applying overlays
Date: Tue, 25 Apr 2017 11:30:54 -0700
Message-Id: <1493145056-16442-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh+dt@kernel.org>, stephen.boyd@linaro.org, mmarek@suse.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Existing overlay unit tests examine individual pieces of the overlay
code.  The new tests target the entire process of applying an overlay.

Changes from v2:
  - of_private.h: move __unflatten_device_tree() outside
    #ifdef CONFIG_OF_UNITTEST
  - unittest.c: move overlay declaration macros outside #ifdef CONFIG_OF_OVERLAY
  - unittest.c: make overlay_info overlays[] static
  - unittest.c: remove extra blank line

Changes from v1:
  - Move overlay base dtb unflattening into unittest.c.  Call from fdt.c.
  - Clarify file and variable names, 'overlay_test_' instead of 'ot_'
  - Use proper naming convention for node names.
  - A few added comments.
  - Improve error messages in the new tests.

Frank Rowand (2):
  of: support dtc compiler flags for overlays
  of: Add unit tests for applying overlays

 drivers/of/fdt.c                                 |  14 +-
 drivers/of/of_private.h                          |  12 +
 drivers/of/unittest-data/Makefile                |  17 +-
 drivers/of/unittest-data/overlay.dts             |  53 ++++
 drivers/of/unittest-data/overlay_bad_phandle.dts |  20 ++
 drivers/of/unittest-data/overlay_base.dts        |  80 ++++++
 drivers/of/unittest.c                            | 317 +++++++++++++++++++++++
 scripts/Makefile.lib                             |   2 +
 8 files changed, 507 insertions(+), 8 deletions(-)
 create mode 100644 drivers/of/unittest-data/overlay.dts
 create mode 100644 drivers/of/unittest-data/overlay_bad_phandle.dts
 create mode 100644 drivers/of/unittest-data/overlay_base.dts

-- 
Frank Rowand <frank.rowand@sony.com>

