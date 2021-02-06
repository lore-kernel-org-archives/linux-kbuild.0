Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770F5C433E0
	for <linux-kbuild@archiver.kernel.org>; Sat,  6 Feb 2021 12:52:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41C9C64E96
	for <linux-kbuild@archiver.kernel.org>; Sat,  6 Feb 2021 12:52:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhBFMwI (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 6 Feb 2021 07:52:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:59986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229506AbhBFMwB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Feb 2021 07:52:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5588C64E51;
        Sat,  6 Feb 2021 12:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612615879;
        bh=AORe1C1FgufUmxGHE8kmERM4XeV9DFN2ZMIr96e/da0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H3HCITLMpWBWh58ZMCKqRvicga/qWEIkmys3i95V+B6UgEw7aV1bYcxXzcFVLIl7+
         q7LmtHIzylzU3NdVPc83cNDBZJuK/3WB8oNjtyuuclhPhCXuY6Myl7BV16EfKxHNUX
         qAUWwNqbdbLD4OZH8CfJW5Wlo2VvYqRD0YtM2TLk=
Date:   Sat, 6 Feb 2021 13:51:17 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sasha Levin <sashal@kernel.org>
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        torvalds@linux-foundation.org
Subject: Re: [PATCH 2/3] kbuild: clamp SUBLEVEL to 255
Message-ID: <YB6QxWgfBnGSexyW@kroah.com>
References: <20210206035033.2036180-1-sashal@kernel.org>
 <20210206035033.2036180-2-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210206035033.2036180-2-sashal@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 05, 2021 at 10:50:32PM -0500, Sasha Levin wrote:
> Right now if SUBLEVEL becomes larger than 255 it will overflow into the
> territory of PATCHLEVEL, causing havoc in userspace that tests for
> specific kernel version.
> 
> While userspace code tests for MAJOR and PATCHLEVEL, it doesn't test
> SUBLEVEL at any point as ABI changes don't happen in the context of
> stable tree.
> 
> Thus, to avoid overflows, simply clamp SUBLEVEL to it's maximum value in
> the context of LINUX_VERSION_CODE. This does not affect "make
> kernelversion" and such.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>


Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
