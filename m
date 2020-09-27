Return-Path: <SRS0=3mix=DE=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDD3C4346E
	for <linux-kbuild@archiver.kernel.org>; Sun, 27 Sep 2020 10:28:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08C612399A
	for <linux-kbuild@archiver.kernel.org>; Sun, 27 Sep 2020 10:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601202519;
	bh=zHKbbXj9aZy+2TNsxN0fet3o2W7o3OFFA0JaiCNkilQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=VEKBRBBR1vDKxAFv0aBtSw5dr//LOIzFZ5pApgoB1Q1xkyqa4ltC60yQwDA5t1kwg
	 zb7SdiQgCmdGgqMRntRBJtEP5ZTjyDudnpuzjWDDn36XrsVI/NXQi6t8083l005EHG
	 bZjXyKf0N4okpGreqbxJFW7zPkiz5fsaRCn05dY0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgI0K2i (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 27 Sep 2020 06:28:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:37788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726149AbgI0K2i (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 27 Sep 2020 06:28:38 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 290BD23977;
        Sun, 27 Sep 2020 10:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601202518;
        bh=zHKbbXj9aZy+2TNsxN0fet3o2W7o3OFFA0JaiCNkilQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eZ47rqly6qNt2o3d6sq6HXeijPrrPb3gtriM/ykjtzrgdfQ1v9zxmblbh7nf9v8+R
         OQLwdwV6FN+sc69xWWsj2CdIi1OWJSyUJe4HEShF55WHTmd+ZlrMmSxs3CSwdB6ffS
         sFClhDocFQnPKHwlWi7bAL4jA/bJtDO6E2nMHaGI=
Date:   Sun, 27 Sep 2020 12:28:48 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sherry Sun <sherry.sun@nxp.com>
Cc:     sudeep.dutt@intel.com, ashutosh.dixit@intel.com, arnd@arndb.de,
        masahiroy@kernel.org, michal.lkml@markovi.net,
        lee.jones@linaro.org, rikard.falkeborn@gmail.com, mst@redhat.co,
        bp@suse.de, jhugo@codeaurora.org, tglx@linutronix.de,
        manivannan.sadhasivam@linaro.org, mgross@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH 1/3] mic: vop: fix a written error in MODULE_DEVICE_TABLE
Message-ID: <20200927102848.GA88650@kroah.com>
References: <20200925073158.8238-1-sherry.sun@nxp.com>
 <20200925073158.8238-2-sherry.sun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925073158.8238-2-sherry.sun@nxp.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 25, 2020 at 03:31:56PM +0800, Sherry Sun wrote:
> For vop bus, the first parameter should be vop in MODULE_DEVICE_TABLE.
> 
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
> ---
>  drivers/misc/mic/vop/vop_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/mic/vop/vop_main.c b/drivers/misc/mic/vop/vop_main.c
> index d609f0dc6124..589425fa78d4 100644
> --- a/drivers/misc/mic/vop/vop_main.c
> +++ b/drivers/misc/mic/vop/vop_main.c
> @@ -796,7 +796,7 @@ static struct vop_driver vop_driver = {
>  
>  module_vop_driver(vop_driver);
>  
> -MODULE_DEVICE_TABLE(mbus, id_table);
> +MODULE_DEVICE_TABLE(vop, id_table);
>  MODULE_AUTHOR("Intel Corporation");
>  MODULE_DESCRIPTION("Intel(R) Virtio Over PCIe (VOP) driver");
>  MODULE_LICENSE("GPL v2");

Doesn't this have to go _after_ the MODULE_DEVICE_TABLE(vop...) support,
which you add in patch 2 of this series?

Does this patch here break the build?  If not, how is it working?

And if you only have one vop driver, why do you need autoloading for it?

thanks,

greg k-h
