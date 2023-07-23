Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382F6C001B0
	for <linux-kbuild@archiver.kernel.org>; Sun, 23 Jul 2023 22:28:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbjGWW2j (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 23 Jul 2023 18:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjGWW2i (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 Jul 2023 18:28:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 169251B0;
        Sun, 23 Jul 2023 15:28:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 906DC60EBB;
        Sun, 23 Jul 2023 22:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3CBBC433C8;
        Sun, 23 Jul 2023 22:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690151315;
        bh=rbPuOZxYphIFzQLuxb23r2hchrvZ2ZBS2QSLJSHVM+Q=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=LeTXgpChPatMmRKY0Qxqw4DQ+JyCYpbDrndGq7n78aoaQBu8RErdA2LMmulkkXbpb
         QVxtkxnmRcKDy8OY4GIYsd9EYv7Of5qGm8nobusNdQl5bjG+6SQWbkjWY2RVvHnH0n
         yJRuIHMzMEpMqPZPkrZbUvHcU7Fqb+FUAvEGCVBP2wER9pIXqGUbgAl0LV1Pirk3iu
         37/QuelxBZPSGAj8i83cYRZ34K27W3EyqP784vtDJCjxAXG7CL5OpiaPuVXwi5qENF
         nvo/KdZDq6YcqKxrAIoUuXj1NiL9i5YScbv6R/e/uqVgULlgFgTOLKhkGBi32EaALW
         K059X+s+Kbcmg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BF9A1C595C2;
        Sun, 23 Jul 2023 22:28:35 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.5-rc3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAS7+XWY8Vy4Hfst7DnpOwx3tnGpAbPTAojjzzH40+gDgQ@mail.gmail.com>
References: <CAK7LNAS7+XWY8Vy4Hfst7DnpOwx3tnGpAbPTAojjzzH40+gDgQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAS7+XWY8Vy4Hfst7DnpOwx3tnGpAbPTAojjzzH40+gDgQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.5
X-PR-Tracked-Commit-Id: df01b7cfcef08bf3fdcac2909d0e1910781d6bfd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 12a5336ca384b295093c18e0c66ca60b4518d9b9
Message-Id: <169015131574.21688.16909216222685156816.pr-tracker-bot@kernel.org>
Date:   Sun, 23 Jul 2023 22:28:35 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Mon, 24 Jul 2023 03:51:00 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/12a5336ca384b295093c18e0c66ca60b4518d9b9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
