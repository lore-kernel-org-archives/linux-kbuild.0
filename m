Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78418ECAAD5
	for <linux-kbuild@archiver.kernel.org>; Mon, 12 Sep 2022 09:41:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbiILJl2 (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 12 Sep 2022 05:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbiILJl1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Sep 2022 05:41:27 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB5731ED1;
        Mon, 12 Sep 2022 02:41:25 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MR1j449YVzlVt4;
        Mon, 12 Sep 2022 17:37:28 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500022.china.huawei.com
 (7.185.36.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 12 Sep
 2022 17:41:23 +0800
From:   Zeng Heng <zengheng4@huawei.com>
To:     <masahiroy@kernel.org>
CC:     <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <weiyongjun1@huawei.com>
Subject: [PATCH -next 0/2] Kconfig: clean code
Date:   Mon, 12 Sep 2022 17:48:36 +0800
Message-ID: <20220912094838.2398580-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

A patch set abount clean code for Kconfig. 

Zeng Heng (2):
  Kconfig: remove unused argment 'ch'
  Kconfig: remove unused function 'menu_get_root_menu'

 scripts/kconfig/conf.c | 2 +-
 scripts/kconfig/lkc.h  | 3 +--
 scripts/kconfig/menu.c | 5 -----
 3 files changed, 2 insertions(+), 8 deletions(-)

-- 
2.25.1

