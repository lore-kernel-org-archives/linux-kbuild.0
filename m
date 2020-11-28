Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5211C64E7D
	for <linux-kbuild@archiver.kernel.org>; Sat, 28 Nov 2020 22:24:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8707B22370
	for <linux-kbuild@archiver.kernel.org>; Sat, 28 Nov 2020 22:24:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzPQw+Fw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388033AbgK1VtS (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 28 Nov 2020 16:49:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:54402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387527AbgK1T2l (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Nov 2020 14:28:41 -0500
Subject: Re: [GIT PULL] Kbuild fixes for v5.10-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606591680;
        bh=tHJyQQystzCWA98RDu3H8yU7/xnhIHrHoYWdgmpJkb0=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=SzPQw+Fw4MMi8JBJf7DEWA8O6CdbwcTkp1P15zv/nSLOq4SpJCo17RGH8qR7ffKUl
         pEHzWX8GCTH3Cnwbote8XsclJ+BOImvKKLTwnf9UQkV+O+eYqaYtWv2powze3zy9cJ
         EFKZaeII26TyWnPPcDTAGl8fNC1JLtJd/VQjydWo=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAS-j7MqrpKnM_GQS9KfL_8Dw9NJrpaghRO9D637cqrnaA@mail.gmail.com>
References: <CAK7LNAS-j7MqrpKnM_GQS9KfL_8Dw9NJrpaghRO9D637cqrnaA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAS-j7MqrpKnM_GQS9KfL_8Dw9NJrpaghRO9D637cqrnaA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.10
X-PR-Tracked-Commit-Id: d1889589a4f54b2d1d7075d608b596d6fcfd3d96
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 45e885c439e825c19f3a51e46ef8210984bc0a9c
Message-Id: <160659168088.23349.13299569846302026493.pr-tracker-bot@kernel.org>
Date:   Sat, 28 Nov 2020 19:28:00 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sun, 29 Nov 2020 02:23:31 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/45e885c439e825c19f3a51e46ef8210984bc0a9c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
