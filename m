Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C266DC001B0
	for <linux-kbuild@archiver.kernel.org>; Thu, 10 Aug 2023 06:18:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbjHJGSS (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 10 Aug 2023 02:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbjHJGSR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Aug 2023 02:18:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 441D310F6;
        Wed,  9 Aug 2023 23:18:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CF9EF64FCF;
        Thu, 10 Aug 2023 06:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC96C433C7;
        Thu, 10 Aug 2023 06:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1691648295;
        bh=HW6WcwY86Xv36o5oTbZQRyHn+By+nLMJcJiW0R8LQs4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uGPdVX6xrgKC1YdoM1amf6ofIb92/ksHtAQsTj/iX5RyAZK+JyZlqIc1dDyJ7HSJS
         +CSvZFtPXIFBTSIYcQYCp/H7zX2MPkS0EkqEKqClzNc7FW+jVTNh988Cw8B6NQ0k0/
         9otSQwUpZ9Sywq/8O6NkYgVMkGt+7nuwxL06sqWI=
Date:   Thu, 10 Aug 2023 08:18:11 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Shreenidhi Shedi <yesshedi@gmail.com>
Cc:     dhowells@redhat.com, dwmw2@infradead.org, masahiroy@kernel.org,
        nathan@kernel.org, ndesaulniers@google.com, nicolas@fjasle.eu,
        linux-kernel@vger.kernel.org, sshedi@vmware.com,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v9 5/7] sign-file: improve help message
Message-ID: <2023081055-purple-handled-8fd4@gregkh>
References: <20230809172211.343677-1-yesshedi@gmail.com>
 <20230809172211.343677-6-yesshedi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809172211.343677-6-yesshedi@gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 09, 2023 at 10:52:08PM +0530, Shreenidhi Shedi wrote:
> Add a proper help message with examples on how to use this tool.

This should be the first patch, right?  Then you can add the proper
documentation for the new features when you add them.

thanks,

greg k-h
