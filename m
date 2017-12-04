Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr10109.outbound.protection.outlook.com ([40.107.1.109]:56889
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752877AbdLDQwR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Dec 2017 11:52:17 -0500
Subject: Re: [PATCH v3 3/5] kasan: support alloca() poisoning
References: <20171201213643.2506-1-paullawrence@google.com>
 <20171201213643.2506-4-paullawrence@google.com>
 <20171204164240.GA24425@infradead.org>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <fb09a40f-1fae-ce4c-9d7c-a13c284b19e9@virtuozzo.com>
Date: Mon, 4 Dec 2017 19:55:37 +0300
MIME-Version: 1.0
In-Reply-To: <20171204164240.GA24425@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>, Paul Lawrence <paullawrence@google.com>
Cc: Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>



On 12/04/2017 07:42 PM, Christoph Hellwig wrote:
> I don't think we are using alloca in kernel mode code, and we shouldn't.
> What do I miss?  Is this hidden support for on-stack VLAs?  I thought
> we'd get rid of them as well.
> 

Yes, this is for on-stack VLA. Last time I checked, we still had a few.
