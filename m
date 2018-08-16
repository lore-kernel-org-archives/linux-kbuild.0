Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44131 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728981AbeHPDI3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Aug 2018 23:08:29 -0400
Received: by mail-pf1-f196.google.com with SMTP id k21-v6so1169536pff.11
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Aug 2018 17:13:52 -0700 (PDT)
Received: from localhost ([2601:647:5180:35d7::5eb6])
        by smtp.gmail.com with ESMTPSA id 3-v6sm580810pfq.10.2018.08.15.17.13.50
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Aug 2018 17:13:50 -0700 (PDT)
From: Michael Forney <mforney@mforney.org>
Subject: [PATCH] kbuild: Add a space after `!` to prevent parsing as file pattern
Date: Wed, 15 Aug 2018 17:13:50 -0700
Message-Id: <20180816001350.7516-1-mforney@mforney.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Some shells use !(pattern|...|pattern) to match file names not
containing the specified patterns. This may result in output like

  $ ./scripts/clang-version.sh gcc
  ./scripts/clang-version.sh[18]: COPYING: not found
  printf: %d __clang_major__: conversion error
  printf: %d __clang_minor__: conversion error
  printf: %d __clang_patchlevel__: conversion error
  00000
  $

and set CONFIG_CLANG_VERSION to the invalid value '00000'.

POSIX says[0]

  If the pipeline begins with the reserved word ! and command1 is a
  subshell command, the application shall ensure that the ( operator at
  the beginning of command1 is separated from the ! by one or more
  <blank> characters. The behavior of the reserved word ! immediately
  followed by the ( operator is unspecified.

So, just add a <blank> to prevent this.

[0] http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_09_02

Signed-off-by: Michael Forney <mforney@mforney.org>
---
 scripts/clang-version.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/clang-version.sh b/scripts/clang-version.sh
index dbf0a31eb111..e65fbc3079d4 100755
--- a/scripts/clang-version.sh
+++ b/scripts/clang-version.sh
@@ -12,7 +12,7 @@
 
 compiler="$*"
 
-if !( $compiler --version | grep -q clang) ; then
+if ! ( $compiler --version | grep -q clang) ; then
 	echo 0
 	exit 1
 fi
-- 
2.17.1
