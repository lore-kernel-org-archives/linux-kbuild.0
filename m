Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6368FC6FA8B
	for <linux-kbuild@archiver.kernel.org>; Fri, 23 Sep 2022 14:49:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232079AbiIWOtU (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Fri, 23 Sep 2022 10:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbiIWOtT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Sep 2022 10:49:19 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32ACC1432A9;
        Fri, 23 Sep 2022 07:49:19 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 85C0367373; Fri, 23 Sep 2022 16:49:16 +0200 (CEST)
Date:   Fri, 23 Sep 2022 16:49:16 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kbuild@vger.kernel.org,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Ming Lin <ming.l@ssi.samsung.com>,
        Sagi Grimberg <sagi@grimberg.me>
Subject: Re: [PATCH] lib/sg_pool: change module_init(sg_pool_init) to
 subsys_initcall
Message-ID: <20220923144916.GA18811@lst.de>
References: <20220923113835.21544-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923113835.21544-1-masahiroy@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Thanks, applied with the typo fixes included.
