Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E313BC63777
	for <linux-kbuild@archiver.kernel.org>; Thu, 26 Nov 2020 09:13:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89F6120DD4
	for <linux-kbuild@archiver.kernel.org>; Thu, 26 Nov 2020 09:13:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FOEY4NHS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389160AbgKZJNe (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 26 Nov 2020 04:13:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732910AbgKZJNd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Nov 2020 04:13:33 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C66C0613D4;
        Thu, 26 Nov 2020 01:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=fpxCoZp/fVTV3nfcRbvgEMI7fyDG0Ed4Z5/IweW+i6g=; b=FOEY4NHSWhz0XHQIP0SREqQUwK
        EtFUsIyu8Jf4LIA01cb+GKH9A/FbYZGsXim9dhnEgGyZhtujwywzhLLSaUH50se6z83kzhqtcyUjC
        LZdQUFk2B8Z0YEC3JJaYkOqkA4J1lhztKK6JF0+lJ2Lf6ZmLmP7q/Xk4sidsWZVXDyBvkKX/sNi7c
        T71bA7+jTd73kCEXlgklua/GM1cIMH1BPo+l7uB2cbsfxAJYdo11/k4UGavBp4uo/Oovxtusf/HVk
        OFqcEp44IY8rCrQHUdLXpZvpZaqIlzlfBeoXYZxLYUOQLpyKHkq94fAr4aSJ2XqZLrvSRZr7cSITM
        51Q0ynxQ==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kiDLF-0006Fz-3B; Thu, 26 Nov 2020 09:13:29 +0000
Date:   Thu, 26 Nov 2020 09:13:29 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Boris Kolpackov <boris@codesynthesis.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Felix Fietkau <nbd@openwrt.org>,
        Patrick Franz <patfra71@gmail.com>,
        Ingo Molnar <mingo@kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Junio C Hamano <gitster@pobox.com>,
        linux-kernel@vger.kernel.org
Subject: Re: kconfig as a git subtree on Linux
Message-ID: <20201126091329.GA21541@infradead.org>
References: <20201125172544.GJ4332@42.do-not-panic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125172544.GJ4332@42.do-not-panic.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 25, 2020 at 05:25:44PM +0000, Luis Chamberlain wrote:
> I'd like to propose we discuss the possibility of taking kconfig and
> making it a git subtree under the Linux kernel. This would allow
> other projects outside of the Linux kernel to be able to update their
> own copy / fork of kconfig in a jiffie *very* easily.

Hell no.  Not because I'm against sharing, but because git submodules
are a complete fucking pain to deal with.  Adding submodules just fucks
up being able to easily use a repository.  
