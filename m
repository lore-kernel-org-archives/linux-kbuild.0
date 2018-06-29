Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:60980 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934348AbeF2JNR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Jun 2018 05:13:17 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH 0/2] kconfig: expr_print(): print constant symbols within quotes
Date: Fri, 29 Jun 2018 11:12:35 +0200
Message-Id: <20180629091237.16620-1-dirk@gouders.net>
In-Reply-To: <ghd0wc58z6.fsf@lena.gouders.net>
References: <ghd0wc58z6.fsf@lena.gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Dirk Gouders <dirk@gouders.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Masahiro,

I reworked the fix for the aborts in a way you suggested.
I decided to do it that way, because it reproduces the real content of Kconfig files.
I hope that was what you meant with your comment to the previous attempt.

While working on that fix I found a comment in expr.h that seems to be wrong
and send a fix for that, as well.

Dirk

Dirk Gouders (2):
  kconfig: expr_print(): print constant symbols within quotes
  kconfig: fix comment for symbol flag SYMBOL_AUTO

 scripts/kconfig/expr.c | 12 +++++++++++-
 scripts/kconfig/expr.h |  4 +++-
 2 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.16.1

