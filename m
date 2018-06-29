Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:38566 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936507AbeF2NSo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Jun 2018 09:18:44 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH v4 0/1] kconfig: expr_print(): print constant symbols within quotes
Date: Fri, 29 Jun 2018 15:18:23 +0200
Message-Id: <20180629131824.25248-1-dirk@gouders.net>
In-Reply-To: <20180629120852.20416-1-dirk@gouders.net>
References: <20180629120852.20416-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Dirk Gouders <dirk@gouders.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Masahiro,

somehow, I expect you will ask to print y,m and n without quotes to stay
consistend with the current behavior.  I have to confess in mconf, for
example that looks more consistent, whereas with zconfdump() I like
the quotes more...

For that case, I created a v4 that prints constants within quotes,
except y,m and n.

Dirk

Dirk Gouders (1):
  kconfig: expr_print(): print constant symbols within quotes

 scripts/kconfig/expr.c | 60 +++++++++++++++++++++++++++-----------------------
 1 file changed, 33 insertions(+), 27 deletions(-)

-- 
2.16.1

