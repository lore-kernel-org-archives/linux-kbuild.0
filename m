Return-Path: <SRS0=f+jF=D5=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3300BC388F9
	for <linux-kbuild@archiver.kernel.org>; Thu, 22 Oct 2020 20:25:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D18032462E
	for <linux-kbuild@archiver.kernel.org>; Thu, 22 Oct 2020 20:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603398322;
	bh=NQYxTLEGqwXNftNlKC2iOoCQa0Nv0TCTGFvzL3j4j7E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=w3yzRLfLlFD42ov8JiQOfTJHw2zVMVgQc6s96HqKKx/CYhNVrxImX/mqvsReoJebY
	 mZjQUeU4S2MPGPrT1OAgRvADcvx8OEwjm6FyL6UVNSmWLr/EY0M/Veb3BH4FUFscOu
	 +yrXLXKZhxJFXs3AAiMNg0pXgOPEeQzHgLf5qZ/w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2900807AbgJVUZW (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 22 Oct 2020 16:25:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:34804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2900849AbgJVUZT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Oct 2020 16:25:19 -0400
Subject: Re: [GIT PULL 2/2] Kconfig updates for v5.10-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603398319;
        bh=NQYxTLEGqwXNftNlKC2iOoCQa0Nv0TCTGFvzL3j4j7E=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=IZ+TaOVNNBop6qjRFM0ZuxcvF2QVG12Gn+IzT/a6dNBA7mTzEo2XBemlhu/tCPzRO
         9HPsVZQjEWetZ/e94CGtMsppkckzTBcSqYtKtNwRpEErOUF+zOhZMU/MlrhNQdMlWz
         lf9prAkTg69ci+Q6cvGMoBYNn7KCAGOBfz6/vdQg=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNASn4Si3=YhAPtc06wEqajpU0uBh46-4T10f=cHy=LY2iA@mail.gmail.com>
References: <CAK7LNASn4Si3=YhAPtc06wEqajpU0uBh46-4T10f=cHy=LY2iA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNASn4Si3=YhAPtc06wEqajpU0uBh46-4T10f=cHy=LY2iA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kconfig-v5.10
X-PR-Tracked-Commit-Id: f9a825a7f65a1c94858667934c4ed59bc548dd1f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f9893351acaecf0a414baf9942b48d5bb5c688c6
Message-Id: <160339831910.30214.7084111249095727746.pr-tracker-bot@kernel.org>
Date:   Thu, 22 Oct 2020 20:25:19 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Thu, 22 Oct 2020 22:49:05 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kconfig-v5.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f9893351acaecf0a414baf9942b48d5bb5c688c6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
