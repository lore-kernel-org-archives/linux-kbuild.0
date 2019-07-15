Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:39776 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730874AbfGOQnm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jul 2019 12:43:42 -0400
Subject: Re: linux-next: Tree for Jul 15 (HEADERS_TEST w/ netfilter tables
 offload)
References: <20190715144848.4cc41e07@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ccb5b818-c191-2d9e-311f-b2c79b7f6823@infradead.org>
Date: Mon, 15 Jul 2019 09:43:34 -0700
MIME-Version: 1.0
In-Reply-To: <20190715144848.4cc41e07@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

On 7/14/19 9:48 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add v5.4 material to your linux-next included branches
> until after v5.3-rc1 has been released.
> 
> Changes since 20190712:
> 

Hi,

I am seeing these build errors from HEADERS_TEST (or KERNEL_HEADERS_TEST)
for include/net/netfilter/nf_tables_offload.h.s:

  CC      include/net/netfilter/nf_tables_offload.h.s
In file included from ./../include/net/netfilter/nf_tables_offload.h:5:0,
                 from <command-line>:0:
../include/net/netfilter/nf_tables.h: In function ‘nft_gencursor_next’:
../include/net/netfilter/nf_tables.h:1223:14: error: ‘const struct net’ has no member named ‘nft’; did you mean ‘nf’?
  return net->nft.gencursor + 1 == 1 ? 1 : 0;
              ^~~
              nf
In file included from ../include/linux/kernel.h:11:0,
                 from ../include/net/flow_offload.h:4,
                 from ./../include/net/netfilter/nf_tables_offload.h:4,
                 from <command-line>:0:
../include/net/netfilter/nf_tables.h: In function ‘nft_genmask_cur’:
../include/net/netfilter/nf_tables.h:1234:29: error: ‘const struct net’ has no member named ‘nft’; did you mean ‘nf’?
  return 1 << READ_ONCE(net->nft.gencursor);
                             ^
../include/linux/compiler.h:261:17: note: in definition of macro ‘__READ_ONCE’
  union { typeof(x) __val; char __c[1]; } __u;   \
                 ^
../include/net/netfilter/nf_tables.h:1234:14: note: in expansion of macro ‘READ_ONCE’
  return 1 << READ_ONCE(net->nft.gencursor);
              ^~~~~~~~~
../include/net/netfilter/nf_tables.h:1234:29: error: ‘const struct net’ has no member named ‘nft’; did you mean ‘nf’?
  return 1 << READ_ONCE(net->nft.gencursor);
                             ^
../include/linux/compiler.h:263:22: note: in definition of macro ‘__READ_ONCE’
   __read_once_size(&(x), __u.__c, sizeof(x));  \
                      ^
../include/net/netfilter/nf_tables.h:1234:14: note: in expansion of macro ‘READ_ONCE’
  return 1 << READ_ONCE(net->nft.gencursor);
              ^~~~~~~~~
../include/net/netfilter/nf_tables.h:1234:29: error: ‘const struct net’ has no member named ‘nft’; did you mean ‘nf’?
  return 1 << READ_ONCE(net->nft.gencursor);
                             ^
../include/linux/compiler.h:263:42: note: in definition of macro ‘__READ_ONCE’
   __read_once_size(&(x), __u.__c, sizeof(x));  \
                                          ^
../include/net/netfilter/nf_tables.h:1234:14: note: in expansion of macro ‘READ_ONCE’
  return 1 << READ_ONCE(net->nft.gencursor);
              ^~~~~~~~~
../include/net/netfilter/nf_tables.h:1234:29: error: ‘const struct net’ has no member named ‘nft’; did you mean ‘nf’?
  return 1 << READ_ONCE(net->nft.gencursor);
                             ^
../include/linux/compiler.h:265:30: note: in definition of macro ‘__READ_ONCE’
   __read_once_size_nocheck(&(x), __u.__c, sizeof(x)); \
                              ^
../include/net/netfilter/nf_tables.h:1234:14: note: in expansion of macro ‘READ_ONCE’
  return 1 << READ_ONCE(net->nft.gencursor);
              ^~~~~~~~~
../include/net/netfilter/nf_tables.h:1234:29: error: ‘const struct net’ has no member named ‘nft’; did you mean ‘nf’?
  return 1 << READ_ONCE(net->nft.gencursor);
                             ^
../include/linux/compiler.h:265:50: note: in definition of macro ‘__READ_ONCE’
   __read_once_size_nocheck(&(x), __u.__c, sizeof(x)); \
                                                  ^
../include/net/netfilter/nf_tables.h:1234:14: note: in expansion of macro ‘READ_ONCE’
  return 1 << READ_ONCE(net->nft.gencursor);
              ^~~~~~~~~
make[2]: *** [../scripts/Makefile.build:304: include/net/netfilter/nf_tables_offload.h.s] Error 1


Should this header file not be tested?

thanks.
-- 
~Randy
