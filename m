Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg001.nifty.com ([202.248.44.39]:28746 "EHLO
	conssluserg001-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753691AbbLOBlN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Dec 2015 20:41:13 -0500
MIME-Version: 1.0
In-Reply-To: <566EF982.7040404@suse.com>
References: <20151210163329.GA18947@udknight>
	<CAMzpN2jG+mKQdAxKnvTebQtF1J79pC+E4QxELLO_C2K6ZR8PzA@mail.gmail.com>
	<20151214161401.GA8036@udknight>
	<566EF982.7040404@suse.com>
Date: Tue, 15 Dec 2015 10:41:00 +0900
Message-ID: <CAK7LNAQyJe=TdYH1TXB6Yw2CJLKjmjwszAisCZ1JwDDNQT6XwA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: support make dir/file.i for *.S
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Wang YanQing <udknight@gmail.com>, Brian Gerst <brgerst@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Michal,

2015-12-15 2:16 GMT+09:00 Michal Marek <mmarek@suse.com>:

>
> Ah, I missed. I'll revert the patch in the kbuild tree.


Please drop the noise commit rather than reverting it.
It was just applied a few days ago, and there is only one commit on top of it.




-- 
Best Regards
Masahiro Yamada
