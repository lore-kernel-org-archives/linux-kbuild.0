Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.us.es ([193.147.175.20]:41178 "EHLO mail.us.es"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729494AbfGOSJK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jul 2019 14:09:10 -0400
Received: from antivirus1-rhel7.int (unknown [192.168.2.11])
        by mail.us.es (Postfix) with ESMTP id 2CB54E2C44
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Jul 2019 20:09:08 +0200 (CEST)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
        by antivirus1-rhel7.int (Postfix) with ESMTP id 1F0A31150D8
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Jul 2019 20:09:08 +0200 (CEST)
Date: Mon, 15 Jul 2019 20:09:05 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: linux-next: Tree for Jul 15 (HEADERS_TEST w/ netfilter tables
 offload)
Message-ID: <20190715180905.rytaht5kslpbatcy@salvia>
References: <20190715144848.4cc41e07@canb.auug.org.au>
 <ccb5b818-c191-2d9e-311f-b2c79b7f6823@infradead.org>
 <CAF90-WirEMg7arNOTmo+tyJ20rt_zeN=nr0OO6Qk0Ss8J4QrUA@mail.gmail.com>
 <20190715173341.zth4na7zekjsesaa@salvia>
 <CAK7LNAS0rX_SRXqb=N=Td-DFNWd=PytDFje12gYh2pYNRBVAJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAS0rX_SRXqb=N=Td-DFNWd=PytDFje12gYh2pYNRBVAJA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Laura Garcia <nevola@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Netfilter Development Mailing list <netfilter-devel@vger.kernel.org>

On Tue, Jul 16, 2019 at 02:56:09AM +0900, Masahiro Yamada wrote:
> On Tue, Jul 16, 2019 at 2:33 AM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> >
> > On Mon, Jul 15, 2019 at 07:28:04PM +0200, Laura Garcia wrote:
> > > CC'ing netfilter.
> > >
> > > On Mon, Jul 15, 2019 at 6:45 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> > > >
> > > > On 7/14/19 9:48 PM, Stephen Rothwell wrote:
> > > > > Hi all,
> > > > >
> > > > > Please do not add v5.4 material to your linux-next included branches
> > > > > until after v5.3-rc1 has been released.
> > > > >
> > > > > Changes since 20190712:
> > > > >
> > > >
> > > > Hi,
> > > >
> > > > I am seeing these build errors from HEADERS_TEST (or KERNEL_HEADERS_TEST)
> > > > for include/net/netfilter/nf_tables_offload.h.s:
> > > >
> > > >   CC      include/net/netfilter/nf_tables_offload.h.s
> > [...]
> > > > Should this header file not be tested?
> 
> This means you must endlessly exclude
> headers that include nf_tables.h
> 
> 
> > Yes, it should indeed be added.
> 
> Adding 'header-test-' is the last resort.

OK, so policy now is that all internal headers should compile
standalone, right?

I can have a look and make it compile standalone.
