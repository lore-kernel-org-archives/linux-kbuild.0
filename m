Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from condef-07.nifty.com ([202.248.20.72]:42457 "EHLO
        condef-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754785AbdCTN66 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Mar 2017 09:58:58 -0400
MIME-Version: 1.0
In-Reply-To: <20161122213434.14788-3-mmarek@suse.com>
References: <20161122213434.14788-1-mmarek@suse.com> <20161122213434.14788-3-mmarek@suse.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 20 Mar 2017 22:54:13 +0900
Message-ID: <CAK7LNASiseJXVu5cmEuYKFdTa2DEcSV536zdzSBychb5mXWXQA@mail.gmail.com>
Subject: Re: [PATCH 3/6] arc: Use full path in KBUILD_IMAGE definition
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org, Alexey Brodkin <Alexey.Brodkin@synopsys.com>

2016-11-23 6:34 GMT+09:00 Michal Marek <mmarek@suse.com>:
> The KBUILD_IMAGE variable is used by the rpm and deb-pkg targets, which
> expect it to point to the image file in the build directory. The
> builddeb script has a workaround for architectures which only provide
> the basename, but let's provide a clean interface for packaging tools.
>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: linux-snps-arc@lists.infradead.org
> Signed-off-by: Michal Marek <mmarek@suse.com>



Applied to linux-kbuild/misc.  Thanks!



-- 
Best Regards
Masahiro Yamada
