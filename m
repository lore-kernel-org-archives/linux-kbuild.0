Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52281C433E0
	for <linux-kbuild@archiver.kernel.org>; Thu, 25 Feb 2021 18:38:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10CAE64F25
	for <linux-kbuild@archiver.kernel.org>; Thu, 25 Feb 2021 18:38:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233502AbhBYSif (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 25 Feb 2021 13:38:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:34852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234017AbhBYSha (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Feb 2021 13:37:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B913B64F29;
        Thu, 25 Feb 2021 18:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614278205;
        bh=vl4mhFgJP400ZuJrIIh5HU2XQIQSiVV1LOIkPm0i0nw=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=MYOVSe9xdhyHVyX5RHwSQiPj76A/RHN+wItgzApUaFa1JIzcXQlM7aPR62mc2l8vN
         inmFUvd1VlHLtT+ZOOOXjQdRnNkHJHAHUWRW47WLIBdMlqRz2P/JBZZgc73EoPU/Yu
         gt1oVEWlNVcmZ+Dz/qoYmsVDn3CPVCH8sCgsv4hb7QCTfuMdLwZL9AGM8ZYnAjIAKz
         aYi8dxuphtNU7czU+BL0BMrgKr/BiZ/TwSRovfpEzLNrjBm+Q7K0grhrRrw1dyJ9AX
         mE0FkIr5mfgiPkLnKQC3kilT287piw6Ngz9M6fGtRRQIxSc36StBnh5MnC1cGkCRt1
         trRERja8GLNwg==
Subject: Re: [GIT PULL] Kbuild updates for v5.12-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQtF+_=U5ba+-rFW1ZFpKoWD4UM7bHBuPd+vYA21waOaA@mail.gmail.com>
References: <CAK7LNAQtF+_=U5ba+-rFW1ZFpKoWD4UM7bHBuPd+vYA21waOaA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQtF+_=U5ba+-rFW1ZFpKoWD4UM7bHBuPd+vYA21waOaA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v5.12
X-PR-Tracked-Commit-Id: 481083ec0bfc14c15f00fbe87c7b06dc01091950
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6fbd6cf85a3be127454a1ad58525a3adcf8612ab
Message-Id: <161427820573.26451.14185193203998505027.pr-tracker-bot@kernel.org>
Date:   Thu, 25 Feb 2021 18:36:45 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Fri, 26 Feb 2021 01:42:04 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6fbd6cf85a3be127454a1ad58525a3adcf8612ab

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
