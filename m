Return-Path: <SRS0=8Fgl=C4=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9CFC43463
	for <linux-kbuild@archiver.kernel.org>; Sat, 19 Sep 2020 19:43:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0288521707
	for <linux-kbuild@archiver.kernel.org>; Sat, 19 Sep 2020 19:43:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgISTnB (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 19 Sep 2020 15:43:01 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:45430 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726511AbgISTnB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Sep 2020 15:43:01 -0400
X-Greylist: delayed 2376 seconds by postgrey-1.27 at vger.kernel.org; Sat, 19 Sep 2020 15:43:00 EDT
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kJi8j-00FPaf-LS; Sat, 19 Sep 2020 21:03:17 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     netdev <netdev@vger.kernel.org>
Cc:     David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH RFC/RFT 0/2] W=1 by default for Ethernet PHY subsystem
Date:   Sat, 19 Sep 2020 21:02:56 +0200
Message-Id: <20200919190258.3673246-1-andrew@lunn.ch>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There is a movement to make the code base compile clean with W=1. Some
subsystems are already clean. In order to keep them clean, we need
developers to build new code with W=1 by default in these subsystems.

This patchset refactors the core Makefile warning code to allow the
additional warnings W=1 adds available to any Makefile. The Ethernet
PHY subsystem Makefiles then make use of this to make W=1 the default
for this subsystem.

RFT since i've only tested with x86 and arm with a modern gcc. Is the
code really clean for older compilers? For clang?

Andrew Lunn (2):
  scripts: Makefile.extrawarn: Add W=1 warnings to a symbol
  net: phylib: Enable W=1 by default

 drivers/net/mdio/Makefile  |  3 +++
 drivers/net/pcs/Makefile   |  3 +++
 drivers/net/phy/Makefile   |  3 +++
 scripts/Makefile.extrawarn | 33 ++++++++++++++++++---------------
 4 files changed, 27 insertions(+), 15 deletions(-)

-- 
2.28.0

