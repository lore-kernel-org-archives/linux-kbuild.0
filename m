Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:52084 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfGIQaw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 12:30:52 -0400
Date: Tue, 9 Jul 2019 09:30:42 -0700
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] kbuild: Inform user to pass ARCH= for make mrproper
Message-ID: <20190709163042.GA28716@infradead.org>
References: <20190709132639.26802-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190709132639.26802-1-geert@linux-m68k.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Is there any chance we could save ARCH in .config?  That would make
cross compile builds so much easier..  Same for CROSS_COMPILE.
