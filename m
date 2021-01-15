Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CB2C433E6
	for <linux-kbuild@archiver.kernel.org>; Fri, 15 Jan 2021 00:49:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DEB823A34
	for <linux-kbuild@archiver.kernel.org>; Fri, 15 Jan 2021 00:49:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727674AbhAOAtc (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 14 Jan 2021 19:49:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:53162 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725873AbhAOAtb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 19:49:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 064D423A34;
        Fri, 15 Jan 2021 00:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610671731;
        bh=RVokMZWq9rRs3WD8NYZX1AGE4s6tHutTCt7qQgO1RHA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cGcfBG6yJU5GdFCiw6HY1fX/UEGG6i9KWRHRCQvC4PZ4neD3VfwMfsM13lnYQ/V8e
         XONfeGM0Pfu4eo/ZLPLbNV/7ZzHfXaVapyRMQGvRFxFGYychd5VAZ0WZdLFIHk/EKl
         1sRSxLo125mQzO0C6IkQikIcIQCUGpL1LdLwSjD15Rrq0Zm1KkxoYUCnr7txw+cf6n
         4++nQf8erYksmBgUlr4k4+zbxmUkF2IlLIoTDqL36J3tR8m9XNa8J6tLIHXeC8YXCI
         8Ze05uG8aX5mZ2wmEeAWKcoHmKNM4LRaPED2Gk0mzrXs6EltSQl3LULi9xKfzNZ3wI
         hojYS2+6uJbtg==
Date:   Fri, 15 Jan 2021 02:48:46 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Rolf Eike Beer <eb@emlix.com>
Cc:     David Woodhouse <dwmw2@infradead.org>,
        Linux Kernel Developers List <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v5] scripts: use pkg-config to locate libcrypto
Message-ID: <YADmbs3UppSovYT2@kernel.org>
References: <20538915.Wj2CyUsUYa@devpool35>
 <2278760.8Yd83Mgoko@devpool35>
 <3394639.6NgGvCfkNl@devpool47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3394639.6NgGvCfkNl@devpool47>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 13, 2021 at 01:49:12PM +0100, Rolf Eike Beer wrote:
> Otherwise build fails if the headers are not in the default location. While at
> it also ask pkg-config for the libs, with fallback to the existing value.
> 
> Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> Cc: stable@vger.kernel.org # 5.6.x

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

/Jarkko
