Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay-out1.synopsys.com ([198.182.61.142]:34816 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727587AbfFCLE7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Jun 2019 07:04:59 -0400
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: RE: [PATCH] kbuild: use more portable 'command -v' for
 cc-cross-prefix
Date: Mon, 3 Jun 2019 11:04:49 +0000
Message-ID: <CY4PR1201MB012052D53B42622F45E39143A1140@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <20190603104902.23799-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190603104902.23799-1-yamada.masahiro@socionext.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-stable <stable@vger.kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

Hi Masahiro-san,

> -----Original Message-----
> From: linux-snps-arc <linux-snps-arc-bounces@lists.infradead.org> On Beha=
lf Of Masahiro Yamada
> Sent: Monday, June 3, 2019 1:49 PM
> To: linux-kbuild@vger.kernel.org
> Cc: Michal Marek <michal.lkml@markovi.net>; Vineet Gupta <vgupta@synopsys=
.com>; Alexey Brodkin
> <abrodkin@synopsys.com>; linux-kernel@vger.kernel.org; linux-stable <stab=
le@vger.kernel.org>; Masahiro
> Yamada <yamada.masahiro@socionext.com>; linux-snps-arc@lists.infradead.or=
g
> Subject: [PATCH] kbuild: use more portable 'command -v' for cc-cross-pref=
ix

[snip]
=20
> Fixes: bd55f96fa9fc ("kbuild: refactor cc-cross-prefix implementation")
> Cc: linux-stable <stable@vger.kernel.org> # 5.1
> Reported-by: Alexey Brodkin <abrodkin@synopsys.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Thanks for the prompt fix - it does the trick, now no junk in the console!

Tested-by: Alexey Brodkin <abrodkin@synopsys.com>
