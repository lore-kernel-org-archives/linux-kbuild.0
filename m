Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:49401 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731078AbfGOR4w (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jul 2019 13:56:52 -0400
MIME-Version: 1.0
References: <20190715144848.4cc41e07@canb.auug.org.au> <ccb5b818-c191-2d9e-311f-b2c79b7f6823@infradead.org>
 <CAF90-WirEMg7arNOTmo+tyJ20rt_zeN=nr0OO6Qk0Ss8J4QrUA@mail.gmail.com> <20190715173341.zth4na7zekjsesaa@salvia>
In-Reply-To: <20190715173341.zth4na7zekjsesaa@salvia>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 16 Jul 2019 02:56:09 +0900
Message-ID: <CAK7LNAS0rX_SRXqb=N=Td-DFNWd=PytDFje12gYh2pYNRBVAJA@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 15 (HEADERS_TEST w/ netfilter tables offload)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Laura Garcia <nevola@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Netfilter Development Mailing list <netfilter-devel@vger.kernel.org>

On Tue, Jul 16, 2019 at 2:33 AM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> On Mon, Jul 15, 2019 at 07:28:04PM +0200, Laura Garcia wrote:
> > CC'ing netfilter.
> >
> > On Mon, Jul 15, 2019 at 6:45 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> > >
> > > On 7/14/19 9:48 PM, Stephen Rothwell wrote:
> > > > Hi all,
> > > >
> > > > Please do not add v5.4 material to your linux-next included branches
> > > > until after v5.3-rc1 has been released.
> > > >
> > > > Changes since 20190712:
> > > >
> > >
> > > Hi,
> > >
> > > I am seeing these build errors from HEADERS_TEST (or KERNEL_HEADERS_TEST)
> > > for include/net/netfilter/nf_tables_offload.h.s:
> > >
> > >   CC      include/net/netfilter/nf_tables_offload.h.s
> [...]
> > > Should this header file not be tested?

This means you must endlessly exclude
headers that include nf_tables.h


> Yes, it should indeed be added.

Adding 'header-test-' is the last resort.


I had already queued a patch:

git clone -b build-test
git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git

commit 9dae5c5fc798e0e970cca4cd1b224dece3ad4766
Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon Jul 15 00:42:56 2019 +0900

    netfilter: nf_tables: split local helpers out to nft_internals.h



If it is OK, I will send it out.



-- 
Best Regards
Masahiro Yamada
