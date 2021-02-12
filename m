Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A1FC433E0
	for <linux-kbuild@archiver.kernel.org>; Fri, 12 Feb 2021 16:39:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E1806186A
	for <linux-kbuild@archiver.kernel.org>; Fri, 12 Feb 2021 16:39:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbhBLQjj (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Fri, 12 Feb 2021 11:39:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:37864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231263AbhBLQhr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Feb 2021 11:37:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96E5064E3D;
        Fri, 12 Feb 2021 16:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613147825;
        bh=TUCMyB8s7iVSOuvLP+3BA2E3kA4eTVJYvN1Ao3fl6Is=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YrvAOrMzyio5Bj0CydbOb7Ob6/lmxIoImfPTLrFHI5M+2Mqjr7elMWKeHCRhYOzNr
         1w8zLrc1VVuYMY/Hx8QAfzXfRJYvHe39N0oAdZO/bynkdKQ7D3lw3IoCu+a888uuhq
         YW8lHkyZDgn5nOGcQu04XMi+aTTaI/v0rhAtn7OA=
Date:   Fri, 12 Feb 2021 17:37:02 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sasha Levin <sashal@kernel.org>
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: simplify access to the kernel's version
Message-ID: <YCaurki1DFU6r79Z@kroah.com>
References: <20210212162924.2269887-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210212162924.2269887-1-sashal@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 12, 2021 at 11:29:24AM -0500, Sasha Levin wrote:
> Instead of storing the version in a single integer and having various
> kernel (and userspace) code how it's constructed, export individual
> (major, patchlevel, sublevel) components and simplify kernel code that
> uses it.
> 
> This should also make it easier on userspace.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
