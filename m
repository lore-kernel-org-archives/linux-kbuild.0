Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:38678 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbfGPGp1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 02:45:27 -0400
MIME-Version: 1.0
References: <20190715144848.4cc41e07@canb.auug.org.au> <ccb5b818-c191-2d9e-311f-b2c79b7f6823@infradead.org>
 <CAF90-WirEMg7arNOTmo+tyJ20rt_zeN=nr0OO6Qk0Ss8J4QrUA@mail.gmail.com>
 <20190715173341.zth4na7zekjsesaa@salvia> <CAK7LNAS0rX_SRXqb=N=Td-DFNWd=PytDFje12gYh2pYNRBVAJA@mail.gmail.com>
 <20190715180905.rytaht5kslpbatcy@salvia>
In-Reply-To: <20190715180905.rytaht5kslpbatcy@salvia>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 16 Jul 2019 15:44:24 +0900
Message-ID: <CAK7LNATBkx5vH4mgb7GYjOquye0nTRR2+VVJ=y=kk=GyoVVuUw@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 15 (HEADERS_TEST w/ netfilter tables offload)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Laura Garcia <nevola@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Netfilter Development Mailing list <netfilter-devel@vger.kernel.org>

On Tue, Jul 16, 2019 at 3:09 AM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> On Tue, Jul 16, 2019 at 02:56:09AM +0900, Masahiro Yamada wrote:
> > On Tue, Jul 16, 2019 at 2:33 AM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> > >
> > > On Mon, Jul 15, 2019 at 07:28:04PM +0200, Laura Garcia wrote:
> > > > CC'ing netfilter.
> > > >
> > > > On Mon, Jul 15, 2019 at 6:45 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> > > > >
> > > > > On 7/14/19 9:48 PM, Stephen Rothwell wrote:
> > > > > > Hi all,
> > > > > >
> > > > > > Please do not add v5.4 material to your linux-next included branches
> > > > > > until after v5.3-rc1 has been released.
> > > > > >
> > > > > > Changes since 20190712:
> > > > > >
> > > > >
> > > > > Hi,
> > > > >
> > > > > I am seeing these build errors from HEADERS_TEST (or KERNEL_HEADERS_TEST)
> > > > > for include/net/netfilter/nf_tables_offload.h.s:
> > > > >
> > > > >   CC      include/net/netfilter/nf_tables_offload.h.s
> > > [...]
> > > > > Should this header file not be tested?
> >
> > This means you must endlessly exclude
> > headers that include nf_tables.h
> >
> >
> > > Yes, it should indeed be added.
> >
> > Adding 'header-test-' is the last resort.
>
> OK, so policy now is that all internal headers should compile
> standalone, right?

I would not say that.
I just want to put as much code as possible into the test-coverage.

If there is a good reason to opt out of the header-test, that is OK.
We should take a look at the cause of the error
before blindly adding it into the blacklist.


For this particular case, I just thought some functions
could be localized in net/netfilter/, and would be cleaner.

Having said that, I am not familiar enough with
the netfilter subsystem.
So, this should be reviewed by the experts in the area.


Anyway, CONFIG_NF_TABLES seems mandatory to compile
include/net/netfilter/nf_tables_*.h

So, I will queue the following patch
to suppress the error for now.

diff --git a/include/Kbuild b/include/Kbuild
index 7e9f1acb9dd5..e59605243bca 100644
--- a/include/Kbuild
+++ b/include/Kbuild
@@ -905,10 +905,11 @@ header-test-                      +=
net/netfilter/nf_nat_redirect.h
 header-test-                   += net/netfilter/nf_queue.h
 header-test-                   += net/netfilter/nf_reject.h
 header-test-                   += net/netfilter/nf_synproxy.h
-header-test-                   += net/netfilter/nf_tables.h
-header-test-                   += net/netfilter/nf_tables_core.h
-header-test-                   += net/netfilter/nf_tables_ipv4.h
+header-test-$(CONFIG_NF_TABLES)        += net/netfilter/nf_tables.h
+header-test-$(CONFIG_NF_TABLES)        += net/netfilter/nf_tables_core.h
+header-test-$(CONFIG_NF_TABLES)        += net/netfilter/nf_tables_ipv4.h
 header-test-                   += net/netfilter/nf_tables_ipv6.h
+header-test-$(CONFIG_NF_TABLES)        += net/netfilter/nf_tables_offload.h
 header-test-                   += net/netfilter/nft_fib.h
 header-test-                   += net/netfilter/nft_meta.h
 header-test-                   += net/netfilter/nft_reject.h



This test just landed in upstream,
and will take some time to iron out the issues.

If I am disturbing people too much,
I perhaps need to loosen the policy.
Sorry if this test is too annoying.


Thanks.


--
Best Regards
Masahiro Yamada
