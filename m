Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.us.es ([193.147.175.20]:58634 "EHLO mail.us.es"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731715AbfGORds (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jul 2019 13:33:48 -0400
Received: from antivirus1-rhel7.int (unknown [192.168.2.11])
        by mail.us.es (Postfix) with ESMTP id 9B63062313
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Jul 2019 19:33:44 +0200 (CEST)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
        by antivirus1-rhel7.int (Postfix) with ESMTP id 8EA0F115101
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Jul 2019 19:33:44 +0200 (CEST)
Date: Mon, 15 Jul 2019 19:33:41 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: linux-next: Tree for Jul 15 (HEADERS_TEST w/ netfilter tables
 offload)
Message-ID: <20190715173341.zth4na7zekjsesaa@salvia>
References: <20190715144848.4cc41e07@canb.auug.org.au>
 <ccb5b818-c191-2d9e-311f-b2c79b7f6823@infradead.org>
 <CAF90-WirEMg7arNOTmo+tyJ20rt_zeN=nr0OO6Qk0Ss8J4QrUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF90-WirEMg7arNOTmo+tyJ20rt_zeN=nr0OO6Qk0Ss8J4QrUA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Garcia <nevola@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Netfilter Development Mailing list <netfilter-devel@vger.kernel.org>

On Mon, Jul 15, 2019 at 07:28:04PM +0200, Laura Garcia wrote:
> CC'ing netfilter.
> 
> On Mon, Jul 15, 2019 at 6:45 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > On 7/14/19 9:48 PM, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Please do not add v5.4 material to your linux-next included branches
> > > until after v5.3-rc1 has been released.
> > >
> > > Changes since 20190712:
> > >
> >
> > Hi,
> >
> > I am seeing these build errors from HEADERS_TEST (or KERNEL_HEADERS_TEST)
> > for include/net/netfilter/nf_tables_offload.h.s:
> >
> >   CC      include/net/netfilter/nf_tables_offload.h.s
[...]
> > Should this header file not be tested?

Yes, it should indeed be added.
