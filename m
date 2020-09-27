Return-Path: <SRS0=3mix=DE=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40E2C4346E
	for <linux-kbuild@archiver.kernel.org>; Sun, 27 Sep 2020 19:34:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E7AE21D95
	for <linux-kbuild@archiver.kernel.org>; Sun, 27 Sep 2020 19:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601235240;
	bh=kGvm0D/uqbbLsjzAHl6x1eT4/vNWKHPAs5FKOtCVUDk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=w8Y9AjYRA0k6l7jQYE9NLPigaVFet4QrX+bOROtyx2ysOFjU2esmn23CBHjha2caO
	 PSvZG+LpwxXjpeF9EYZVIL1JSO7P4ks+Zu/FDOUlzANAH4GPMuisEOl1TJMAO34O5i
	 Dj/uTWbDx8rcmYqE2qUJ66iUigZp8DGWbXw2tezc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgI0TeA (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 27 Sep 2020 15:34:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:32970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726309AbgI0TeA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 27 Sep 2020 15:34:00 -0400
Subject: Re: [GIT PULL] Kbuild fixes for v5.9-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601235239;
        bh=kGvm0D/uqbbLsjzAHl6x1eT4/vNWKHPAs5FKOtCVUDk=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=WdPjW6CmdkBrSLpttNzpvy4zTyWHfTyA/VQ5WJ4k35knGpDKASKhPzeKuH/cyb/dt
         ch9zbQSxma8/0+5ZQDzifKYROcNWVpqsYKhLpqAQ6rqC4zHo5fjaPHdGy45JL/etyh
         aTChsK8fSDlpWhCIpuy4wUvrOURiYp3vn3Yna5SU=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNARTwQUtJKnEyyJySJunja4szZPHvxim5+KTA04w6wjhgA@mail.gmail.com>
References: <CAK7LNARTwQUtJKnEyyJySJunja4szZPHvxim5+KTA04w6wjhgA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNARTwQUtJKnEyyJySJunja4szZPHvxim5+KTA04w6wjhgA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.9-4
X-PR-Tracked-Commit-Id: e30d694c3381b565e043cf74b0bed059db1b4ac9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 16bc1d5432ebd8e50e480eb300fd2b84afa28286
Message-Id: <160123523972.14460.4525244834390054926.pr-tracker-bot@kernel.org>
Date:   Sun, 27 Sep 2020 19:33:59 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Mon, 28 Sep 2020 02:38:39 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.9-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/16bc1d5432ebd8e50e480eb300fd2b84afa28286

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
