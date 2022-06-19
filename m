Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3703FCCA47A
	for <linux-kbuild@archiver.kernel.org>; Sun, 19 Jun 2022 19:12:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233518AbiFSTMN (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 19 Jun 2022 15:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbiFSTMM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Jun 2022 15:12:12 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8ECF6159;
        Sun, 19 Jun 2022 12:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=xjmI1B2BqVspVoKUW+yjdA2bM8d8VyfustD1Xd3lBJw=; b=cevIZIuc5EcAf1wBxziIfA397w
        ke+4A2HBJo1mMFy6b11YW2doHtaL84Ka1UjmDeWE4O5tR+dNCGL899wdrvYW7+mLXCeJJpyn+hCmM
        03D6kSy5zgeUbkFhIkpYBdG9EScZ4Zm+swglnvt4eX72bqqeFXkraCkHdB1qXYGbAc6XtUB3L0fX4
        HsVa6VKsko6HwJi+ZJ20R3XgbPAgzcuBwLXDT0GtgyrgyWBFexfqAuOqEw6VlBgzNa2t8qKzDu9XZ
        ZVoQA9odPr7iittRZkeDbe10ioQPSTyhlNBH4RH+/X/QgeDqvkqpyZu6FKuKHoXwBKFyzd1iYwdVO
        b8XyKoeg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1o30L9-004Yly-Jr; Sun, 19 Jun 2022 19:12:07 +0000
Date:   Sun, 19 Jun 2022 20:12:07 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     SangYuhiter <sangyu.code@gmail.com>
Cc:     linux-kbuild@vger.kernel.org, masahiroy@kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: kbuild: fix typo in kconfig-language.rst
Message-ID: <Yq91B7w+Z48kd8h5@casper.infradead.org>
References: <20220619170337.24743-1-sangyu.code@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220619170337.24743-1-sangyu.code@gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 20, 2022 at 01:03:37AM +0800, SangYuhiter wrote:
>   Note:
> -	Things that merit "default y/m" include:
> +	Things that merit "default y/n" include:

This is incorrect.  it's Y(es) or M(odule).


