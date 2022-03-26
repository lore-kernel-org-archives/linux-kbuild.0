Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61536C433EF
	for <linux-kbuild@archiver.kernel.org>; Sat, 26 Mar 2022 20:18:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235111AbiCZUTi (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 26 Mar 2022 16:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235106AbiCZUTg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 26 Mar 2022 16:19:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 227851FA63;
        Sat, 26 Mar 2022 13:17:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ACB7660BB8;
        Sat, 26 Mar 2022 20:17:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B285C340E8;
        Sat, 26 Mar 2022 20:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648325878;
        bh=P46zrdFOnYJmWss0fBs7IgoY4Q1ajrPAtv8iqg4nQYU=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=dcgzzwA5vTRLFHWJcS6xmxeclY1oZvG2DY1OIJZBJxJlc4pgzNZ7M66exFUQyyu3F
         gNeLs5rE3YIMN3jlw3otxwXWkjELhWp3f+da4UeT5tru+c+27i9Z5iUNmeNzO9udmt
         Ayr7lVsMWYc3vLUGyonEcZk/XqpsdikPoEIOdd4LlFHtSG0a8G5ZTiQuMpcyyD5LSB
         SJL4S39bWGAp1wxO6hg32O4kEzBk0OvRq5WbT5yNKVNtZNw/CkXmfq7aFY0Iyo47En
         niFQhAXY8kpHW0G/f0o2ZIiF3WEo3O4E/Q/cIE3m1BcWwcCn/+yDtu375I1zC8gZB3
         2mUsVmwBsi2uQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 09822E6D402;
        Sat, 26 Mar 2022 20:17:58 +0000 (UTC)
Subject: Re: [GIT PULL] array-bounds updates for v5.18-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <202203251511.4F76EAB@keescook>
References: <202203251511.4F76EAB@keescook>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <202203251511.4F76EAB@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/array-bounds-v5.18-rc1
X-PR-Tracked-Commit-Id: 00a4f836eb369723b148e3f250c850a028778832
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b06a17583f6f810f620f95382b171cc5ce9848ee
Message-Id: <164832587803.7233.10809777112389024414.pr-tracker-bot@kernel.org>
Date:   Sat, 26 Mar 2022 20:17:58 +0000
To:     Kees Cook <keescook@chromium.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Fri, 25 Mar 2022 15:29:01 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/array-bounds-v5.18-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b06a17583f6f810f620f95382b171cc5ce9848ee

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
