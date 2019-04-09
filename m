Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726486AbfDIPjf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Apr 2019 11:39:35 -0400
Date: Tue, 9 Apr 2019 11:39:33 -0400
From: Sasha Levin <sashal@kernel.org>
Subject: Re: syncconfig changes in 4.19.34 break builds
Message-ID: <20190409153933.GM4689@sasha-vm>
References: <CABWYdi1sSjZ8pw7tJpgvZyLfdJwT5judfjj7F3X5fLcAK3xvsw@mail.gmail.com>
 <CAK7LNARvfpkO8D=xJ+GQMWuxX5a3RVkUsBg8XUgFz+4m=knK3Q@mail.gmail.com>
 <CABWYdi1H9TnB32RCPL2axRvAf3sqf2K2BaoMs+0f-1CibfZ_Tg@mail.gmail.com>
 <CAK7LNASjMrSrL+LhTuSq4T3juUbYSZUUtevUz=hwS+qFQiDuTg@mail.gmail.com>
 <CAK7LNAQtbuWOw5yGiCeodg0Kf+JGaJj6s6FSyDysxCLxtMBLeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAK7LNAQtbuWOw5yGiCeodg0Kf+JGaJj6s6FSyDysxCLxtMBLeg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ivan Babrou <ivan@cloudflare.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>, stable@vger.kernel.org

On Tue, Apr 09, 2019 at 02:50:04PM +0900, Masahiro Yamada wrote:
>Greg, Sasha,
>
>
>Sorry, the commit ID was wrong.
>
>
>The following commit for 4.19.x:
>
>commit 02826a6ba301b72461c3706e1cc66d5571cd327e
>Author: Masahiro Yamada <yamada.masahiro@socionext.com>
>Date:   Mon Nov 5 16:52:34 2018 +0900
>
>    kbuild: deb-pkg: fix bindeb-pkg breakage when O= is used

This commit claims it's fixing 80463f1b7bf9, which is not in 4.19. Was
that a mistake in the commit message?

--
Thanks,
Sasha
