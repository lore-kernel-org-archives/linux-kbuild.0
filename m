Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:34505 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729134AbfJ2MjH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Oct 2019 08:39:07 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/4] More nsdeps improvements
Date: Tue, 29 Oct 2019 21:38:05 +0900
Message-Id: <20191029123809.29301-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jonathan Corbet <corbet@lwn.net>, Matthias Maennich <maennich@google.com>, Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

This series improves nsdeps more by addressing the root problem.

Based on linux-next.

This series does NOT apply to the Linus tree because
I updates modpost from my Kbuild tree.

I can pick up this series to kbuild tree if there is no objection.
If it goes to the module tree, we need to discuss how to deal with
the conflicts.

The modpost is actively touched these days
from both kbuild and module trees.



Masahiro Yamada (4):
  modpost: do not invoke extra modpost for nsdeps
  modpost: dump missing namespaces into a single modules.nsdeps file
  scripts/nsdeps: support nsdeps for external module builds
  mospost: remove unneeded local variable in contains_namespace()

 .gitignore                                   |  2 +-
 Documentation/core-api/symbol-namespaces.rst |  3 ++
 Documentation/dontdiff                       |  1 +
 Makefile                                     | 10 ++--
 scripts/Makefile.modpost                     |  8 ++-
 scripts/mod/modpost.c                        | 55 ++++++++------------
 scripts/mod/modpost.h                        |  4 +-
 scripts/nsdeps                               | 29 ++++++-----
 8 files changed, 53 insertions(+), 59 deletions(-)

-- 
2.17.1
