Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87CBEB64DC
	for <linux-kbuild@archiver.kernel.org>; Tue,  4 Jul 2023 00:04:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjGDAEb (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 3 Jul 2023 20:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjGDAEa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Jul 2023 20:04:30 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4554E187
        for <linux-kbuild@vger.kernel.org>; Mon,  3 Jul 2023 17:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=KI4yq88RuElMmswgsTHpHasA6zbAezSWtmo7IvqqJ14=; b=K8hQSHHLAihjmkLHXI5jryg/BB
        hrsRRifGTWurdJVKXWmoeabCvwMAE6rokYl5IS9LWRCBEzzPSrQ5s9GVIJjaiUU1pvAXkurrLIdVX
        TSQLmKBHl7Li3UjnfoJnKZVS4H2Xaw531P/LO/4oAPXVOpBMA4uHqSoEenawPt1Ona0ZO+y/dVrSy
        hUDOCzud6y04d4ZgYazSCxBqFKj5J4BZWqQEue4ZqY0sHdV7Ir9XPlu2A3/lLML/ihqc1w+Cma28Q
        fr/AxxEQ7/HT4R/+ib5feixxSXdyHCwc8rlw0iu4IIXqJfIaZfkukEXL4NkyT6n7Nhfesnv6wypAv
        mIAIcsbg==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qGTWw-00Bh3o-0K;
        Tue, 04 Jul 2023 00:04:30 +0000
Message-ID: <c7b1cb3d-801b-b78f-d203-edd840c9e98a@infradead.org>
Date:   Mon, 3 Jul 2023 17:04:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: gconfig help text quesion
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

The gconfig help text says:

Toggling Show Debug Info under the Options menu will show 
the dependencies, which you can then match by examining other options.

This is at the end of the intro_text string.

I don't see any way to toggle the Show Debug Info flag,
or even any such flag.

Is it hidden somewhere or should this text be removed?

thanks.
-- 
~Randy
