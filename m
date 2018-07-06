Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([23.128.96.9]:43054 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753510AbeGFAbI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jul 2018 20:31:08 -0400
Date: Fri, 06 Jul 2018 09:31:03 +0900 (KST)
Message-Id: <20180706.093103.1547249026984330034.davem@davemloft.net>
Subject: Re: [PATCH] kbuild: update ARCH alias info for sparc
From: David Miller <davem@davemloft.net>
In-Reply-To: <03cfef31-5308-7b17-9e0d-3a0dc680e750@infradead.org>
References: <03cfef31-5308-7b17-9e0d-3a0dc680e750@infradead.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: rdunlap@infradead.org
Cc: linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, sparclinux@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>
Date: Thu, 5 Jul 2018 12:12:03 -0700

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> The supported alias for building sparc 32-bit is "sparc32",
> not "sparc", so update the alias documentation for that.
> Just using "sparc" produces a 64-bit config file.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Acked-by: David S. Miller <davem@davemloft.net>
