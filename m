Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC581C4707A
	for <linux-kbuild@archiver.kernel.org>; Sun, 23 May 2021 07:48:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C74F661261
	for <linux-kbuild@archiver.kernel.org>; Sun, 23 May 2021 07:48:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbhEWHuC (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 23 May 2021 03:50:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:37710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231559AbhEWHuB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 May 2021 03:50:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDD3361244;
        Sun, 23 May 2021 07:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621756115;
        bh=oKb6swTiag35mIhWgDmHypchT7malrYcdp+LgFX+qu0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OGIAnk8mj1q1F1bC0zZRWKHowsZDozrnSWH9tQn2oH8GGh4uxwNhSr1o3pVK1rkdo
         jMgzgI2FJzPjgdhakHhOFT+gwcGMgnBx1d9VYtbicazj/SXePAHOK9fHsulNPTh9IR
         /+B56yTsNSXYWphT9CFHoK1U/XSscnkswgO8FxkA=
Date:   Sun, 23 May 2021 09:48:31 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Nico Schottelius <nico-linuxsetlocalversion@schottelius.org>,
        Matthias Maennich <maennich@google.com>,
        Matthieu Baerts <matthieu.baerts@tessares.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] scripts/setlocalversion: remove mercurial, svn and
 git-svn supports
Message-ID: <YKoIz2NEIwtRZIZ1@kroah.com>
References: <20210523031428.164186-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210523031428.164186-1-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 23, 2021 at 12:14:24PM +0900, Masahiro Yamada wrote:
> The mercurial, svn, git-svn supports were added by the following commits
> without explaining why they are useful for the kernel source tree.
> 
>  - 3dce174cfcba ("kbuild: support mercurial in setlocalversion")
> 
>  - ba3d05fb6369 ("kbuild: add svn revision information to setlocalversion")
> 
>  - ff80aa97c9b4 ("setlocalversion: add git-svn support")
> 
> Let's revert all of them, and see if somebody will complain about it.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 

For all 5 in this series:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
