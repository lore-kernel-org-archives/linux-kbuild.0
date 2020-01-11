Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:63361 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728500AbgAKHXX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Jan 2020 02:23:23 -0500
MIME-Version: 1.0
References: <20200106032324.3147-1-masahiroy@kernel.org> <20200108154406.GA21695@infradead.org>
 <20200108154835.GA2449518@kroah.com>
In-Reply-To: <20200108154835.GA2449518@kroah.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2020 16:22:20 +0900
Message-ID: <CAK7LNAQCFjUBQu355LkckYzzX7nf_BhfXpnEPACTbBHrGRPGMw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: allow modules to link *.a archives
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christoph Hellwig <hch@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Fumiya Shigemitsu <shfy1014@gmail.com>, Yongxin Liu <yongxin.liu@windriver.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Jan 9, 2020 at 12:48 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jan 08, 2020 at 07:44:06AM -0800, Christoph Hellwig wrote:
> > On Mon, Jan 06, 2020 at 12:23:24PM +0900, Masahiro Yamada wrote:
> > > Since commit 69ea912fda74 ("kbuild: remove unneeded link_multi_deps"),
> > > modules cannot link *.a archives.
> > >
> > > I do not see such a usecase in the upstream code, but multiple people
> > > reported this issue, so it seems to be a desired feature for external
> > > modules.
> >
> > Kernel policy is to not keep around infrastructure not used upstream.
> > And linking archives in the kernel doesn't really make any sense, so
> > this shouldn't go in in any form.
>
> Yeah, I agree, it's just going to bit-rot and people really shouldn't be
> doing stuff like this in their kernel modules.
>
> If they want to, they need to figure out how to do it themselves :)
>
> greg k-h


OK, I will abandon this patch.

-- 
Best Regards
Masahiro Yamada
