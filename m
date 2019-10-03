Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f171.google.com ([209.85.215.171]:41790 "EHLO
        mail-pg1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728457AbfJCDS1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Oct 2019 23:18:27 -0400
Received: by mail-pg1-f171.google.com with SMTP id s1so827925pgv.8
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Oct 2019 20:18:27 -0700 (PDT)
Message-Id: <20191003031312.157994411@gmail.com>
Date: Wed, 02 Oct 2019 20:13:12 -0700
From: rd.dunlab@gmail.com
Subject: [PATCH 0/4] scripts: update namespace.pl
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: rdunlap@infradead.org, Masahiro Yamada <yamada.masahiro@socionext.com>

This patch series updates scripts/namespace.pl:

1/4: handle rename of lib-ksyms.o to lib.a by scripts/Makefile.build
2/4: add a few x86 object files to the namespace exceptions list
3/4: include trailing ".o" in the namespace exceptions list of
     file names and change/fix "acpia" to "acpica"
4/4: add a blank line to separate a section of the output


 scripts/namespace.pl |   48 +++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 21 deletions(-)
