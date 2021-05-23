Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FFEFC47080
	for <linux-kbuild@archiver.kernel.org>; Sun, 23 May 2021 05:58:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72E5761205
	for <linux-kbuild@archiver.kernel.org>; Sun, 23 May 2021 05:58:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbhEWGAV (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 23 May 2021 02:00:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:45686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231540AbhEWGAU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 May 2021 02:00:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C8732611CB;
        Sun, 23 May 2021 05:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621749534;
        bh=F7/BwE440Fb+fQTAzAkled22MFeqdsC6NxFazIAMFi8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=fr8T1/e25nzjT5YFTmq5yH9Ff3DD0m+y4KPDOSigYPNVIyR2wl3S51G3Vzn9Zuk+e
         gs9thAgfSQese/2CTwacpuxr0sgvrYBqgQlqWdJqqSXrqQ+iOXYKWWk8M1af54DXEY
         iH8IMrlznuU5TAVIn/cvfmnDKn+uOm95Fxoj+ACUnAJHxxcsXND0Qse8JRFh8Tag8x
         96/Ko4MUxxE/jJScmQNWvTywY5t5qIuyeTjol70LQRkENqtPCQZToj0YTfvL67575p
         bpqdm1jdjfGlr/z6Hu8fTRYQ7FjJWg3gaS2dsGhtp+q97LkOsBRphZWdEN9Ao2gkNO
         e8XrDgj1s2vig==
Subject: Re: [GIT PULL] Kbuild fixes for v5.13-rc3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQ-fcQGRFEAeQazDdi+Aq3+4FLDpuFotmMaSx0L9qAk5g@mail.gmail.com>
References: <CAK7LNAQ-fcQGRFEAeQazDdi+Aq3+4FLDpuFotmMaSx0L9qAk5g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQ-fcQGRFEAeQazDdi+Aq3+4FLDpuFotmMaSx0L9qAk5g@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.13
X-PR-Tracked-Commit-Id: c93db682cfb213501881072a9200a48ce1dc3c3f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4d7620341eda38573a73ab63c33423534fa38eb9
Message-Id: <162174953467.7972.15144212210961663476.pr-tracker-bot@kernel.org>
Date:   Sun, 23 May 2021 05:58:54 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sun, 23 May 2021 13:56:18 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4d7620341eda38573a73ab63c33423534fa38eb9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
