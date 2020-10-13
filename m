Return-Path: <SRS0=YaqL=DU=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA7EC433E7
	for <linux-kbuild@archiver.kernel.org>; Tue, 13 Oct 2020 09:08:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68195214DB
	for <linux-kbuild@archiver.kernel.org>; Tue, 13 Oct 2020 09:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602580094;
	bh=p8NqRmOJyLfUXcRw4LsDuaSZ1HDIpCdA36ZLSHLW/ww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=su7bC3q55d6tgXotOiZFZCOXXhOuMnJnawAQxhIwZBkCwVdoTzNz9i2A25fL6vtrW
	 MO8WeVw+DkFHDhTSt++CIpDfwXtvsdKiz+TEOwJqH3rdB6sMW40lOuVCUQEu+aNL4d
	 AvTwCqVziN4oGY8VadVOsvzR7C/7T/O0jjlqY1Fs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404207AbgJMJIO (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 13 Oct 2020 05:08:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:36652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404121AbgJMJIN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Oct 2020 05:08:13 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EA54A208D5;
        Tue, 13 Oct 2020 09:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602580093;
        bh=p8NqRmOJyLfUXcRw4LsDuaSZ1HDIpCdA36ZLSHLW/ww=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=swrPY+ehjIps6I5ADtKcbruEshXfKuJBthgcSvqjuo1WMUGUBnYM4ZHzXxwiyTUEL
         p9J4dqgUGTn3tyLx4F65ZDyh0S3/LCLduQ7MHIUb67SQjyZBPXsGZ6/XoNldf0MTB6
         6HU2JMkwc8wlRjN4/YP+z3GomyCwU5XFGPufpc/U=
Date:   Tue, 13 Oct 2020 11:08:50 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Sherry Sun <sherry.sun@nxp.com>
Cc:     "sudeep.dutt@intel.com" <sudeep.dutt@intel.com>,
        "ashutosh.dixit@intel.com" <ashutosh.dixit@intel.com>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH V2 0/2]  Add module autoloading support for vop and cosm
 driver
Message-ID: <20201013090850.GA1922404@kroah.com>
References: <20200929080214.23553-1-sherry.sun@nxp.com>
 <VI1PR04MB4960EDA39029B1B1CD8FD4F792040@VI1PR04MB4960.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR04MB4960EDA39029B1B1CD8FD4F792040@VI1PR04MB4960.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 13, 2020 at 08:52:01AM +0000, Sherry Sun wrote:
> Gentle ping....

It's the merge window, sorry, this fell through the cracks before that
happened.

Please resubmit once 5.10-rc1 comes out.

thanks,

greg k-h
