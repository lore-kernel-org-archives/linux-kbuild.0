Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7E6C433E0
	for <linux-kbuild@archiver.kernel.org>; Sat,  6 Feb 2021 12:53:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC5F464E96
	for <linux-kbuild@archiver.kernel.org>; Sat,  6 Feb 2021 12:53:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbhBFMxv (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 6 Feb 2021 07:53:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:60162 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229531AbhBFMxs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Feb 2021 07:53:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91F5364E5B;
        Sat,  6 Feb 2021 12:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612615987;
        bh=wkYV0EMZCfWNHqFbj1aIARGBWuutf+OaP14PnbdsrKA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kE+zRREHx7Er78Oap2iOX9IX9GAs6zEHz62NcXViZ4fDdw111c5dXq48bfGu0pGev
         AfL2Z1+I9IovKMAof2CTMi7SzKjQLieHWI5iBy0AbCq+4htrRlkxykvs7gSImB4o2l
         i8MbNCsdMmpcsJB8jop90stplSQp2ddapiWEMblM=
Date:   Sat, 6 Feb 2021 13:53:04 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sasha Levin <sashal@kernel.org>
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        torvalds@linux-foundation.org, stable@kernel.org
Subject: Re: [PATCH 3/3] kbuild: introduce KERNEL_VERSION2 and
 LINUX_VERSION_CODE2
Message-ID: <YB6RMGw8cN0FY67Z@kroah.com>
References: <20210206035033.2036180-1-sashal@kernel.org>
 <20210206035033.2036180-3-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210206035033.2036180-3-sashal@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 05, 2021 at 10:50:33PM -0500, Sasha Levin wrote:
> SUBLEVEL only has 8 bits of space, which means that we'll overflow it
> once it reaches 256.
> 
> Few of the stable branches will imminently overflow SUBLEVEL while
> there's no risk of overflowing VERSION.
> 
> Thus, give SUBLEVEL 8 more bits which will be stolen from VERSION, this
> should create a better balance between the different version numbers we
> use.
> 
> We can't however use the original KERNEL_VERSION and LINUX_VERSION_CODE
> as userspace has created ABI dependency on their structure, and we risk
> breaking this userspace by modifying the layout of the version integers.
> 
> Cc: stable@kernel.org
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
