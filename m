Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DFEC07E9B
	for <linux-kbuild@archiver.kernel.org>; Sat, 10 Jul 2021 18:35:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 398D361260
	for <linux-kbuild@archiver.kernel.org>; Sat, 10 Jul 2021 18:35:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhGJShp (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 10 Jul 2021 14:37:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:53910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229599AbhGJSho (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Jul 2021 14:37:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 97CA46138C;
        Sat, 10 Jul 2021 18:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625942099;
        bh=iZpV87su4CYAwsLdRAUv/eCrLdq88fEYAwJzybv4K7k=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=K135OQi1SqF0hIXJPvtKAESRUcW/Svmi47oOQmUY4brmsRaZYZHJs0jsqtCffKX4V
         91nIM1VTvfmnrqR9prYv/VlcWumVTcGD/4quKXOSNsvFuOa5zA2DIayd8Liay90Jn2
         jux4NijlI9YHDXbZiKSUqfyfr/DkTCenKmyuAGPWTgQaK6VFuVrTkRZ/qd28OZtgRR
         rbnpFx3NzAjNn/D8BmUrpodURY2XtpgPK4nZ8iDouuTyqGHsTBYMDOuPP0G0QvGYMg
         qnNy9beAGUNrZ+AaRU8Lou8kreplui1WypZ+B2oVk4oYEAQ3kxA5eY4oR/UoFd/OHy
         tKyHLkMaB3B/A==
Subject: Re: [GIT PULL] Kbuild updates for v5.14-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAT-9N_o_J8+pD5H9gnxzxuN-3ZBQ1wt-VmyHE=oEC295g@mail.gmail.com>
References: <CAK7LNAT-9N_o_J8+pD5H9gnxzxuN-3ZBQ1wt-VmyHE=oEC295g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAT-9N_o_J8+pD5H9gnxzxuN-3ZBQ1wt-VmyHE=oEC295g@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v5.14
X-PR-Tracked-Commit-Id: 27932b6a2088eac7a5afa5471963b926cfbb4de7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 81361b837a3450f0a44255fddfd7a4c72502b667
Message-Id: <162594209958.22528.8831028585543954987.pr-tracker-bot@kernel.org>
Date:   Sat, 10 Jul 2021 18:34:59 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sat, 10 Jul 2021 04:18:51 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v5.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/81361b837a3450f0a44255fddfd7a4c72502b667

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
