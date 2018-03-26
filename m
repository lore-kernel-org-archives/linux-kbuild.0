Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:28130 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751024AbeCZPXk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Mar 2018 11:23:40 -0400
MIME-Version: 1.0
In-Reply-To: <20180323175936.GA18412@ziepe.ca>
References: <20180323175936.GA18412@ziepe.ca>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 27 Mar 2018 00:22:44 +0900
Message-ID: <CAK7LNAR--43op1wQsHaBP6egbusQoEB0AcH15sjbRxAbJR=rwQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rpm-pkg: Support GNU tar >= 1.29
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Pressler <danielpr@mellanox.com>

2018-03-24 2:59 GMT+09:00 Jason Gunthorpe <jgg@mellanox.com>:
> There is a change in how command line parsing is done in this version.
> Excludes and includes are now ordered with the file list. Since
> the spec file puts the file list before the exclude list it means newer
> tar ignores the excludes and packs all the build output into the
> kernel-devel RPM resulting in a huge package.
>
> Simple argument re-ordering fixes the problem.
>
> Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
> ---

Applied to linux-kbuild/fixes. Thanks!






-- 
Best Regards
Masahiro Yamada
