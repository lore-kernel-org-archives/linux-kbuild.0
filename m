Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A77C6FA99
	for <linux-kbuild@archiver.kernel.org>; Sun, 12 Mar 2023 20:07:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbjCLUHi (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 12 Mar 2023 16:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjCLUHh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 Mar 2023 16:07:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D302B2AE;
        Sun, 12 Mar 2023 13:07:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8B11D60F24;
        Sun, 12 Mar 2023 20:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22128C433D2;
        Sun, 12 Mar 2023 20:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678651655;
        bh=2Fm44MKxxUElyQkYSM0Gxd7QugXbe3Dels56fjEj7bI=;
        h=From:To:Cc:Subject:Date:From;
        b=aCLdaSgZNwWLM9UShXKP1yLhMvaKjrBz676cMxuynB8mKrmrV7Z0IOq4rvwKK7Y/e
         Y9rAb+NEWZBshJRc9WmIRXeBPiLQOXkL18lLMeXwCxRJxzFWshOCzslxXDf3iQ3VyQ
         YDeKBgtpDiK9fXa9NTF0RBZEYzN40Bw97Y/SfMqvJhNL3w/RXGqrp7zZ4hsWGlxqqH
         NEg5q0oL4ErkUYZGDxUBCzL9kzBGhQCIAzqc7D0HXdwAPd8odhe8320o5+WnB2UZx/
         Z063eN+Ks5UWGAwZs87EJrccoweVIb/SZq/9VkU0V2eM2rLsJEk55v7HBdaNHe7olN
         KOu7XEnCKyhxQ==
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nick Terrell <terrelln@fb.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 0/6] kbuild: fix some packaging issues, and use git-archive for source package
Date:   Mon, 13 Mar 2023 05:07:25 +0900
Message-Id: <20230312200731.599706-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This series fixes some bugs, then switch to 'git archive'
for source package creation as suggested by Linus.



Masahiro Yamada (6):
  kbuild: deb-pkg: make debian source package working again
  kbuild: deb-pkg: do not take KERNELRELEASE from the source version
  kbuild: deb-pkg: set CROSS_COMPILE only when undefined
  kbuild: deb-pkg: split image and debug objects staging out into
    functions
  kbuild: deb-pkg: use dh_listpackages to know enabled packages
  kbuild: use git-archive for source package creation

 .gitignore                       |    1 +
 Makefile                         |    9 +-
 scripts/.gitignore               |    1 -
 scripts/Makefile                 |    2 +-
 scripts/Makefile.package         |  113 ++--
 scripts/check-git                |   14 +
 scripts/list-gitignored.c        | 1057 ------------------------------
 scripts/package/builddeb         |  269 ++++----
 scripts/package/deb-build-option |   14 +-
 scripts/package/gen-diff-patch   |   44 ++
 scripts/package/mkdebian         |   24 +-
 scripts/package/mkspec           |   17 +-
 scripts/setlocalversion          |   45 +-
 13 files changed, 335 insertions(+), 1275 deletions(-)
 create mode 100755 scripts/check-git
 delete mode 100644 scripts/list-gitignored.c
 create mode 100755 scripts/package/gen-diff-patch

-- 
2.34.1

