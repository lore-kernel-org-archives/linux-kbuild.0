Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730801AbgF2TfP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 15:35:15 -0400
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 0/2] Clean up goback logic
Date: Mon, 29 Jun 2020 17:30:15 +0200
Message-Id: <cover.1593444492.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Those patches cleanup the goBack logic.

The first patch removes some unused stuff and makes the goBack
to work only on singleMode.

The second patch ensures that the goback button won't be shown
on split mode. While not clear at the logic, it won't show either on
full mode. So, the button will only show on single mode, with is
compatible with the current goBack() implementation.

Mauro Carvalho Chehab (2):
  kconfig: qconf: simplify the goBack() logic
  kconfig: qconf: don't show goback button on splitMode

 scripts/kconfig/qconf.cc | 55 +++++++++++++++-------------------------
 1 file changed, 21 insertions(+), 34 deletions(-)

-- 
2.26.2
