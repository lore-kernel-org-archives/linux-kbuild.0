Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44675 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732796AbfHIAVw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 20:21:52 -0400
From: Shaun Tancheff <shaun@tancheff.com>
Subject: [PATCH 0/1] kbuild: Support building a tree of modules with -M=<root>
Date: Thu,  8 Aug 2019 19:21:03 -0500
Message-Id: <20190809002104.18599-1-stancheff@cray.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Shaun Tancheff <stancheff@cray.com>, linux-kbuild@vger.kernel.org, Joe Lawrence <joe.lawrence@redhat.com>, "'James E . J . Bottomley'" <jejb@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>, "'Martin K . Petersen'" <martin.petersen@oracle.com>, Michal Marek <michal.lkml@markovi.net>, Shuah Khan <shuah@kernel.org>, Thomas Renninger <trenn@suse.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-scsi@vger.kernel.org

Currently when building lustre against 5.3 kernel modules fail to
generate <module>.ko files.

Lustre builds a tree of modules however the numerous modules.order files
are created but only the modules.order file at the root appears to be 
read.

This changes the the scheme for KBUILD_EXTMOD to write to and read from
a single modules.order file at the root.

Shaun Tancheff (1):
  kbuild: recursive build of external kernel modules

 Makefile               | 1 +
 scripts/Makefile.build | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.20.1
