Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f45.google.com ([74.125.83.45]:35929 "EHLO
        mail-pg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752573AbdDNVyy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Apr 2017 17:54:54 -0400
Received: by mail-pg0-f45.google.com with SMTP id g2so47737254pge.3
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Apr 2017 14:54:53 -0700 (PDT)
From: Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH 0/2] make mrproper cleanup more file
Date: Fri, 14 Apr 2017 14:54:48 -0700
Message-Id: <20170414215450.18307-1-sthemmin@microsoft.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>

The point of mrproper is to cleanup all the machine specific
files from the build.

Stephen Hemminger (2):
  kbuild: cleanup signing keys with mrproper
  kbuild: remove initramfs cpio with mrproper

 Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.11.0

