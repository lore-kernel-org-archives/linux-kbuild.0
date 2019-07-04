Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:63204 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbfGDUuv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jul 2019 16:50:51 -0400
From: Cedric Hombourger <Cedric_Hombourger@mentor.com>
Subject: [PATCH v3 0/1] builddeb: generate multi-arch friendly linux-libc-dev
Date: Thu, 4 Jul 2019 22:50:26 +0200
Message-ID: <1562273427-204-1-git-send-email-Cedric_Hombourger@mentor.com>
In-Reply-To: <432e997617a0669886cd9ea5ceac7c1a2173044b.camel@decadent.org.uk>
References: <432e997617a0669886cd9ea5ceac7c1a2173044b.camel@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: ben@decadent.org.uk
Cc: yamada.masahiro@socionext.com, isar-users@googlegroups.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, riku.voipio@linaro.org, Cedric Hombourger <Cedric_Hombourger@mentor.com>

Changes in v3:

 - add Multi-Arch: same to debian/control for linux-libc-dev

Changes in v2:

 - forward $debarch from mkdebian to builddeb
 - use dpkg-architecture -qDEB_HOST_MULTIARCH instead of $CC -dumpmachine

Cedric Hombourger (1):
  builddeb: generate multi-arch friendly linux-libc-dev package

 scripts/package/builddeb | 8 ++++++++
 scripts/package/mkdebian | 5 +++--
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.11.0
