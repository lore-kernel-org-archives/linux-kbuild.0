Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:34994 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752674AbdLDQmn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Dec 2017 11:42:43 -0500
Date: Mon, 4 Dec 2017 08:42:40 -0800
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 3/5] kasan: support alloca() poisoning
Message-ID: <20171204164240.GA24425@infradead.org>
References: <20171201213643.2506-1-paullawrence@google.com>
 <20171201213643.2506-4-paullawrence@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171201213643.2506-4-paullawrence@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Lawrence <paullawrence@google.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>

I don't think we are using alloca in kernel mode code, and we shouldn't.
What do I miss?  Is this hidden support for on-stack VLAs?  I thought
we'd get rid of them as well.

