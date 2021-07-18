Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DEF3C636CA
	for <linux-kbuild@archiver.kernel.org>; Sun, 18 Jul 2021 18:48:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6ACBE6117A
	for <linux-kbuild@archiver.kernel.org>; Sun, 18 Jul 2021 18:48:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbhGRSvX (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 18 Jul 2021 14:51:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:34264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229525AbhGRSvX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Jul 2021 14:51:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3211661184;
        Sun, 18 Jul 2021 18:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626634104;
        bh=Cdq2EiusGlw1OdTxHSGUdhGCJXzXwoSP455vR/3kF4s=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=lMnvMX3jh4UIP9H7BwLHnQbFlACjtqLILzZ/f/WPYysmK/8v7vPBow/2RMjTSDOdV
         vXblVDshQ1krumW34gKaqR78yge3qPlAoFZj7etDyqZZr6ZJ89xsTXyhr8ESqZp6lN
         NLeVmDp9eEP8dy3bLq17Z1+GeMcCqkyWDyVkUEzLXk+WWLwd4kcCUcro4jmhZS+7Xa
         6MGLSJeSFWPxwlQmFDS3QJ/rTWj/Auq96eaGCmPzcN9gLYR15FbIWEpqB2KzyCjHmQ
         k0i98vE2jrZwRfm2bgdRWaKnt1PolIRmPMAIq2UYpYSyvMjZ4OQwUNWv18xYG9RRcZ
         r/kwKInQwATsQ==
Subject: Re: [GIT PULL] Kbuild fixes for v5.14-rc2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQDiO4fsn8W11qoLMvryJadsgoHm6HeXFvqOz5Mzzb1Jw@mail.gmail.com>
References: <CAK7LNAQDiO4fsn8W11qoLMvryJadsgoHm6HeXFvqOz5Mzzb1Jw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQDiO4fsn8W11qoLMvryJadsgoHm6HeXFvqOz5Mzzb1Jw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.14
X-PR-Tracked-Commit-Id: 5e60f363b38fd40e4d8838b5d6f4d4ecee92c777
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6750691a82ad264dff140a7e9ca8f340729431f0
Message-Id: <162663410405.7372.12287467069374942202.pr-tracker-bot@kernel.org>
Date:   Sun, 18 Jul 2021 18:48:24 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Mon, 19 Jul 2021 00:20:42 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6750691a82ad264dff140a7e9ca8f340729431f0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
