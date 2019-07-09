Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:48996 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbfGIHn6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 03:43:58 -0400
From: Cedric Hombourger <Cedric_Hombourger@mentor.com>
Subject: [PATCH v4 0/1] builddeb: generate multi-arch friendly linux-libc-dev
Date: Tue, 9 Jul 2019 09:43:34 +0200
Message-ID: <1562658215-186-1-git-send-email-Cedric_Hombourger@mentor.com>
In-Reply-To: <CAK7LNARgFmSm+kCngidevQ3HnNjqKDKfGzYXrFPzhgBRHmccXw@mail.gmail.com>
References: <CAK7LNARgFmSm+kCngidevQ3HnNjqKDKfGzYXrFPzhgBRHmccXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: ben@decadent.org.uk, isar-users@googlegroups.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, riku.voipio@linaro.org, Cedric Hombourger <Cedric_Hombourger@mentor.com>

Changes in v4 (address comments from Masahiro Yamada)

 - Use arch from debian/arch and no longer forward it from mkdebian to
   builddep since it may be found there
 
Changes in v3 (address comments from Ben Hutchings)

 - add Multi-Arch: same to debian/control for linux-libc-dev
 - forward debarch from mkdebian to sub-processes (builddeb in particular)

Changes in v2 (address comments from Ben Hutchings)

 - forward $debarch from mkdebian to builddeb
 - use dpkg-architecture -qDEB_HOST_MULTIARCH instead of $CC -dumpmachine

Cedric Hombourger (1):
  builddeb: generate multi-arch friendly linux-libc-dev package

 scripts/package/builddeb | 8 ++++++++
 scripts/package/mkdebian | 5 +++--
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.11.0
