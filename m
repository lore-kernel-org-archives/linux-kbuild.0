Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C62AFC433FE
	for <linux-kbuild@archiver.kernel.org>; Sun, 19 Sep 2021 20:37:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2753610A8
	for <linux-kbuild@archiver.kernel.org>; Sun, 19 Sep 2021 20:37:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232412AbhISUiY (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 19 Sep 2021 16:38:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:54336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230113AbhISUiX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Sep 2021 16:38:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1EAD560F9B;
        Sun, 19 Sep 2021 20:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632083806;
        bh=ayaXk+NZyNeJzZutR1ltVU+XNZKxnMaKl8dzXOWiYE8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=jYw7/rmGWk6U2KGl1bt0MiRCLIINcL8uFh36ZEg2poxXHIFQX2p+P6PFSH2rQOSuw
         KCP9xqQcW++eAQ8VQSujaNeVmyy5bPRMh6RyAS/k+SezZXLG+km2/GRKVNovJF17pq
         xASDczUX+7ymLDZsPKhhJCN02zlz+ZEmumOkOZF4yJIkV9XBQ/uPSOOnQMYFjyEq5p
         dDhztNdtYyFAUlPOqO3sPt8sOa93M/WtKBra2O7OgfkjtZNhFaGo3nIlBxEfdgOFYg
         R247vLkyDYA14ehVXuSuliwsE3CwjwIfgLIzzSGyUz2SKEqRohgdUpFpmAZtok348b
         EEgDlrs7mhGCw==
Subject: Re: [GIT PULL] Kbuild fixes for v5.15-rc2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQ88+q0xZXLCFyUOkhCyUShmryGBY9LWAOgw6Ly6Ec8iw@mail.gmail.com>
References: <CAK7LNAQ88+q0xZXLCFyUOkhCyUShmryGBY9LWAOgw6Ly6Ec8iw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQ88+q0xZXLCFyUOkhCyUShmryGBY9LWAOgw6Ly6Ec8iw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.15
X-PR-Tracked-Commit-Id: 0664684e1ebd7875e120d0cecd525bac4805f8ed
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2f629969b01dab4ef6254fdfcfda3d82b1ad5420
Message-Id: <163208380607.27843.9792343371644498488.pr-tracker-bot@kernel.org>
Date:   Sun, 19 Sep 2021 20:36:46 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sun, 19 Sep 2021 17:45:35 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2f629969b01dab4ef6254fdfcfda3d82b1ad5420

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
