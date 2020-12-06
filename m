Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF86C4361B
	for <linux-kbuild@archiver.kernel.org>; Sun,  6 Dec 2020 18:39:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B0B822ADF
	for <linux-kbuild@archiver.kernel.org>; Sun,  6 Dec 2020 18:39:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbgLFSjS (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 6 Dec 2020 13:39:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:56528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726440AbgLFSjS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 6 Dec 2020 13:39:18 -0500
Subject: Re: [GIT PULL] Kbuild fixes for v5.10-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607279918;
        bh=9kz/T5VNGKZat3jcXKOkLQBr62dtPjhQN46YU5TFzgI=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=gr65CecgT2I3B5+mWRsI3MQzioUcbOHXaE6nanAJhCgvP2NaRQ5vqsNoDohoF7s/o
         6uOmER3Mos1UW1Nq4dr38aF1U8hGruEiOep5PGQg7hZO5CDn8w5WwkiTgBhFolax7+
         xl9lFATwQee38jihdGdlFNVM7gLoa87kA1WBs9pS408PoZ2PHyynfQYupfk0J7+aOD
         OH6zZ8Vla16NzwdsqAthvKBUECO89WXFdsweL4Qs4DiRmIGruo1mPsU/iTjIzwzoJ6
         4qnd0oX38yhhn13E4t5Y2GLQ8nUz95r6z3TB4pcE4KmgvtB1kcVWOnKYcDBKbpb7hz
         ZqUktvi8hdeCw==
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNASVM_r0q6vQzjzTivu-bhOxgDwm4rsJzT5j7TFJmwOViA@mail.gmail.com>
References: <CAK7LNASVM_r0q6vQzjzTivu-bhOxgDwm4rsJzT5j7TFJmwOViA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNASVM_r0q6vQzjzTivu-bhOxgDwm4rsJzT5j7TFJmwOViA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.10-2
X-PR-Tracked-Commit-Id: 7d32358be8acb119dcfe39b6cf67ec6d94bf1fe7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e6585a493921991653be1fd65c3aa3fb90b000ae
Message-Id: <160727991780.20057.18241976319057303872.pr-tracker-bot@kernel.org>
Date:   Sun, 06 Dec 2020 18:38:37 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sun, 6 Dec 2020 21:47:13 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.10-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e6585a493921991653be1fd65c3aa3fb90b000ae

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
