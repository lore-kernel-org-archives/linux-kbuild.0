Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33688 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751673AbdHRWV3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Aug 2017 18:21:29 -0400
Received: by mail-wm0-f66.google.com with SMTP id q189so5583585wmd.0
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Aug 2017 15:21:28 -0700 (PDT)
From: Nicolas Porcel <nicolasporcel06@gmail.com>
Subject: [PATCH 0/2] Improve KCONFIG_CONFIG use in kconfig
Date: Sat, 19 Aug 2017 00:20:50 +0200
Message-Id: <20170818222052.22375-1-nicolasporcel06@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicolas Porcel <nicolasporcel06@gmail.com>

This patch series will improve the use of KCONFIG_CONFIG in order to perform
out of tree kernel configuration. This is useful when the kernel source is not
on a writable directory.

Nicolas Porcel (2):
  kconfig: Use KCONFIG_CONFIG in buildtar
  kconfig: support out of tree KCONFIG_CONFIG

 scripts/kconfig/confdata.c | 35 ++++++++++++++++++++---------------
 scripts/package/buildtar   |  4 ++--
 2 files changed, 22 insertions(+), 17 deletions(-)

-- 
2.14.1

