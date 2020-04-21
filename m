Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:52276 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726021AbgDUExK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 00:53:10 -0400
MIME-Version: 1.0
References: <20200414012132.32721-1-vitor@massaru.org> <CAK7LNAQYxtcNinV7JR+c8Pn9Rp1g0TxJ7m_mOFNOJQsB=OiAoA@mail.gmail.com>
 <b82142248b38085fa3ab49a9d3181cabd5a79a91.camel@massaru.org>
In-Reply-To: <b82142248b38085fa3ab49a9d3181cabd5a79a91.camel@massaru.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 21 Apr 2020 13:52:14 +0900
Message-ID: <CAK7LNAQPdSDGX32wXM8MPAQjOwky9qWX2sAo4SWZEcWP5RdTOg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: ensure mrproper removes arch/$(SUBARCH)/include/generated/
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vitor Massaru Iha <vitor@massaru.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Brendan Higgins <brendanhiggins@google.com>, Shuah Khan <skhan@linuxfoundation.org>, "linux-kernel-mentees@lists.linuxfoundation.org" <linux-kernel-mentees@lists.linuxfoundation.org>

Hi Vitor,


On Tue, Apr 21, 2020 at 7:27 AM Vitor Massaru Iha <vitor@massaru.org> wrote:
>

> > > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> >
> > Reported-by: Brendan Higgins <brendanhiggins@google.com>
>
> Was actually Reported-by Theodore Ts'o <tytso@mit.edu>
> https://groups.google.com/forum/#!msg/kunit-dev/QmA27YEgEgI/hvS1kiz2CwAJ

OK, please add his tag, then.


>
> Can I add suggested-by Masahiro Yamada <masahiroy@kernel.org> ?

Please feel free to do so.




-- 
Best Regards
Masahiro Yamada
