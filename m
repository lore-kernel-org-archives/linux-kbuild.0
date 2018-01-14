Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:39118 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751626AbeANLd6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Jan 2018 06:33:58 -0500
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 0/2] kconfig: 'if' and automatic submenu creation documentation
Date: Sun, 14 Jan 2018 12:33:43 +0100
Message-Id: <20180114113345.18623-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yamada.masahiro@socionext.com, sam@ravnborg.org, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

These together should make the automatic submenu logic a lot clearer.

Ulf Magnusson (2):
  kconfig: Document 'if' flattening logic
  kconfig: Improve auto. menu documentation accuracy

 scripts/kconfig/menu.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

-- 
2.14.1

