Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:42798 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754720AbeF2MJP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Jun 2018 08:09:15 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH v3 0/1] kconfig: expr_print(): print constant symbols within quotes
Date: Fri, 29 Jun 2018 14:08:51 +0200
Message-Id: <20180629120852.20416-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Dirk Gouders <dirk@gouders.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Masahiro,

I'm sorry to have to send a v3 before you could even comment on v2.

But, I was so concentrated on the default values that I totaly missed
the remaining part of expressions to be handled consistently.

Dirk

Dirk Gouders (1):
  kconfig: expr_print(): print constant symbols within quotes

 scripts/kconfig/expr.c | 57 ++++++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 27 deletions(-)

-- 
2.16.1

