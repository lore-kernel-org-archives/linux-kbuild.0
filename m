Return-Path: <SRS0=f+jF=D5=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7182BC388F7
	for <linux-kbuild@archiver.kernel.org>; Thu, 22 Oct 2020 20:25:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B27524655
	for <linux-kbuild@archiver.kernel.org>; Thu, 22 Oct 2020 20:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603398320;
	bh=z/0xVyfKHIf+w42cfVuuM9u1TJC0XrQsnypWe6JJMpw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:List-ID:From;
	b=0cPc49v3JPqSQO89buaDhfDImKeZpQGww6HTFkXnowwSJYueVWQadqSEdgTrGt2ut
	 cUExb0jwKw3TldtbWCgpvJ76DsY+8fOWJdxfIOSwgE/BcO/h6XgGTq/kFasT3ZorjY
	 Nw1LsYGKDbUstmUXp/xnb+V9kV8iO+SBUZxtZnBw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S368104AbgJVUZT (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 22 Oct 2020 16:25:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:34790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2900807AbgJVUZT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Oct 2020 16:25:19 -0400
Subject: Re: [GIT PULL 1/2] Kbuild updates for v5.10-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603398318;
        bh=z/0xVyfKHIf+w42cfVuuM9u1TJC0XrQsnypWe6JJMpw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=X3/dgb0s93IQhLGYnsYO6+R23Kg+oFibrpMbbnx+rp5YpDRWYUeJ43mCIHFSLNtAL
         l83L8wbKJ1k3hrYW2z/91fiKZKTCpEqoQ2sTGIS+n3pMNZbcrkfA9WORn3CvQEngge
         XY4egHyJ1oozJhhmZ+QiWL05fLOLYxS9J+pSR5Rc=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNATH0zXhw+2-XJ2DcUkmJaC6=gW-67zqAtx1dnXn+hDhEw@mail.gmail.com>
References: <CAK7LNATH0zXhw+2-XJ2DcUkmJaC6=gW-67zqAtx1dnXn+hDhEw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNATH0zXhw+2-XJ2DcUkmJaC6=gW-67zqAtx1dnXn+hDhEw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v5.10
X-PR-Tracked-Commit-Id: 1e66d50ad3a1dbf0169b14d502be59a4b1213149
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 746b25b1aa0f5736d585728ded70a8141da91edb
Message-Id: <160339831878.30214.17012702160207559515.pr-tracker-bot@kernel.org>
Date:   Thu, 22 Oct 2020 20:25:18 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linuxfoundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Thu, 22 Oct 2020 22:46:51 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v5.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/746b25b1aa0f5736d585728ded70a8141da91edb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
