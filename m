Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:55794 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbfHLPmG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 11:42:06 -0400
MIME-Version: 1.0
References: <20190810075226.GA24085@lst.de>
In-Reply-To: <20190810075226.GA24085@lst.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 13 Aug 2019 00:41:20 +0900
Message-ID: <CAK7LNAQfQWNMMLS1-3mE41Ffy3MV9i3VpbWtmKQdUqZjyk8Yqg@mail.gmail.com>
Subject: Re: can we use mandatory-y for non-uapi headers?
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Christoph,


On Sat, Aug 10, 2019 at 4:52 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Hi Masahiro,
>
> what is the reason that the documentation says mandatory-y should only
> be used for uapi headers?

Where is it documented?

Documentation/kbuild/makefiles.rst section 7.4 describes
mandatory-y is essentially used by include/(uapi/)asm-generic/Kbuild

include/(uapi/)asm-generic/Kbuild means:

include/uapi/asm-generic/Kbuild
include/asm-generic/Kbuild




-- 
Best Regards
Masahiro Yamada
