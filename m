Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60055 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934239AbdCJKPb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Mar 2017 05:15:31 -0500
Subject: Re: Kbuild maintainership
References: <CAK7LNASmP6bsQcru5XoqgxsuznjK0JMwff96TRn3F_=hOUU6qA@mail.gmail.com>
 <dd914266-6ea1-3dd7-0531-0335bf3f723c@suse.com>
 <20170310201702.47b0a523@canb.auug.org.au>
From: Michal Marek <mmarek@suse.com>
Message-ID: <132b313f-ac2d-be4d-8ab7-84b114041722@suse.com>
Date: Fri, 10 Mar 2017 11:15:26 +0100
MIME-Version: 1.0
In-Reply-To: <20170310201702.47b0a523@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, masahiroy@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>

On 2017-03-10 10:17, Stephen Rothwell wrote:
> I assume that I will get a request to change the kbuild-current and
> kbuilt trees in linux-next soon.  In the meantime, should I remove the
> current ones?

There is one genksyms fix in kbuild.git#kbuild which is not in mainline.
Masahiro, can you please pull it into your tree and give Stephen the url
and branches?

Thanks,
Michal
