Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:37274 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932209AbeGCQLj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Jul 2018 12:11:39 -0400
Subject: Re: [PATCH 1/5] kconfig: include common Kconfig files from top-level
 Kconfig
References: <20180702144711.22111-1-hch@lst.de>
 <20180702144711.22111-2-hch@lst.de>
 <5c090e3f-ced0-62c5-c511-f4c66804ed32@infradead.org>
 <4dfba139-43a2-5949-3221-39cae3191ae7@infradead.org>
 <20180703133616.GB15589@lst.de>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e230cffa-b3ea-d5c2-3d2c-5f822c9c2e7d@infradead.org>
Date: Tue, 3 Jul 2018 09:11:35 -0700
MIME-Version: 1.0
In-Reply-To: <20180703133616.GB15589@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/03/18 06:36, Christoph Hellwig wrote:
> On Mon, Jul 02, 2018 at 01:08:16PM -0700, Randy Dunlap wrote:
>>> I would prefer to have init/Kconfig before arch/$(SRCARCH)/Kconfig.
>>
>> Ugh, that won't get this set correctly on x86_64:
>> CONFIG_PGTABLE_LEVELS=2
> 
> Did you try it?  As far as I can tell modern kconfig isn't really
> order sensitive any more.
> --

Yes, it was wrong. :(

Once the symbol has a default value, it won't be assigned a different
default value (at least that's how it looks; I haven't read the kconfig
source code).

-- 
~Randy
