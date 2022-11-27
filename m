Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6FF3C4321E
	for <linux-kbuild@archiver.kernel.org>; Sun, 27 Nov 2022 00:47:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiK0Arm (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 26 Nov 2022 19:47:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiK0Ark (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 26 Nov 2022 19:47:40 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688D065D2;
        Sat, 26 Nov 2022 16:47:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BE008B80A7C;
        Sun, 27 Nov 2022 00:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 603D3C433D6;
        Sun, 27 Nov 2022 00:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669510055;
        bh=kEKjCLjRLlU+JYAgCnxhaqnUTajLBJeMZVs4sX9ujm8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=ExgNMCwCa7oLNpB3fKwRJ7II0Cw6zY7oEVIzi3bAhRjxCMXua7zQBbL63aiAFAPJ2
         4eNkxc3YOElxs476l1GQdDFr8eOthNKAobqsNVEizI63aVTgH+gQQPJjMddVH04dh4
         cwrSHjM2HU3mIk1H2ri7cYWYkBgbGmqOxOC2opCsQM2UZv2aQb+oU8M0lJOuTK74/i
         jIm1ug+JuXFlApaNry0icaXlHYaIe85mOWKHv7AsTOFo900vRCXdCLA5u1GEZUUJnU
         kxty0ZELu2Zxvozg1Kc2gmZDop+fbjSz2JtaerDCV3qZ0r2mCpugwE/ZLJou4wLGcW
         1+/wQL6uLPUvg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4722CE270C7;
        Sun, 27 Nov 2022 00:47:35 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.1-rc7
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNARrgsRx7FqeS4ojaNKr9u4bvOY-j4p7YGLV5i2H4scsig@mail.gmail.com>
References: <CAK7LNARrgsRx7FqeS4ojaNKr9u4bvOY-j4p7YGLV5i2H4scsig@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNARrgsRx7FqeS4ojaNKr9u4bvOY-j4p7YGLV5i2H4scsig@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.1-4
X-PR-Tracked-Commit-Id: 869e4ae4cd2a23d625aaa14ae62dbebf768cb77d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: faf68e3523c21d07c5f7fdabd0daf6301ff8db3f
Message-Id: <166951005528.5114.10503061316583646984.pr-tracker-bot@kernel.org>
Date:   Sun, 27 Nov 2022 00:47:35 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sun, 27 Nov 2022 08:35:44 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.1-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/faf68e3523c21d07c5f7fdabd0daf6301ff8db3f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
