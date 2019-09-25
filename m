Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f43.google.com ([209.85.166.43]:45112 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730974AbfIYXFG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Sep 2019 19:05:06 -0400
Received: by mail-io1-f43.google.com with SMTP id c25so1247226iot.12
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2019 16:05:06 -0700 (PDT)
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 0/2] Simplify kselftest build and install use-cases
Date: Wed, 25 Sep 2019 17:04:33 -0600
Message-Id: <cover.1569452305.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net, shuah@kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

This patch series simplifies kselftest use-cases and addresses requests
from developers and testers to add support for building and installing
from the main Makefile.

Shuah Khan (2):
  Makefile: Add kselftest_build target to build tests
  selftests: Add kselftest_install target to main Makefile

 Makefile                                     | 8 ++++++++
 tools/testing/selftests/Makefile             | 8 ++++++--
 tools/testing/selftests/kselftest_install.sh | 4 ++--
 3 files changed, 16 insertions(+), 4 deletions(-)

-- 
2.20.1
