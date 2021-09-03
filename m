Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4112C433EF
	for <linux-kbuild@archiver.kernel.org>; Fri,  3 Sep 2021 23:12:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACB93610A2
	for <linux-kbuild@archiver.kernel.org>; Fri,  3 Sep 2021 23:12:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350484AbhICXNt (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Fri, 3 Sep 2021 19:13:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:60604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236080AbhICXNt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Sep 2021 19:13:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B1BCA60F3A;
        Fri,  3 Sep 2021 23:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630710768;
        bh=UFyeh3V2XhfvvKUol9rNcZqF+wqyIvMn8hIhu7HETBA=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=KP7hInFobwbRA1/RHJd8dUdGnLq3uC6+KfGzZUjc/a5KJ2UUaAWx1LehyxPZcItI/
         mAbAzKk1Jrz4EvqmrUmsWuFv5fpsBnF4RKiSyIuW2KSftu/UPERe4kgYBywSO58vu9
         fUmgsfWxh+WfpBP1cypR1CcnTs8a/GxsGWRnmIJ6/7N0c93uZ8ehY2OfhO9zAzk1Ze
         +RhfXy5V4qDNxGqzTLaNxZcYkLCQuFLL8bOfFR2XmnTeDcKBdR3/AuxhN0ExZ4CWqq
         85oHhpwQmztvb9Uwx7Bx3iBJ0BeCjAtfUBjUz03zHSLCxRLQMcwEKqbMDxdACAzWSz
         qoK4mfm1uGLtg==
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQ0Q6CdXaD-dVGj_e3O3JYs_crpejWKpXHYQJYxyk-1VQ@mail.gmail.com>
References: <CAK7LNAQ0Q6CdXaD-dVGj_e3O3JYs_crpejWKpXHYQJYxyk-1VQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQ0Q6CdXaD-dVGj_e3O3JYs_crpejWKpXHYQJYxyk-1VQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v5.15
X-PR-Tracked-Commit-Id: bc7cd2dd1f8e5889cc68b69984033ac5bef6ba61
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b250e6d141ce4f0d0ada60e4b5db577050e5feb0
Message-Id: <163071076858.25061.2397762855864330858.pr-tracker-bot@kernel.org>
Date:   Fri, 03 Sep 2021 23:12:48 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linuxfoundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Fri, 3 Sep 2021 08:30:57 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b250e6d141ce4f0d0ada60e4b5db577050e5feb0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
