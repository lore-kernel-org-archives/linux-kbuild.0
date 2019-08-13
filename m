Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:51515 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726650AbfHMJsH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 05:48:07 -0400
From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH v2] kbuild: Change fallthrough comments to attributes
Date: Tue, 13 Aug 2019 09:48:01 +0000
Message-ID: <85e25647ae404bf38bc008ea914e08b3@AcuMS.aculab.com>
References: <20190812214711.83710-1-nhuck@google.com>
         <20190812221416.139678-1-nhuck@google.com>
         <814c1b19141022946d3e0f7e24d69658d7a512e4.camel@perches.com>
         <CAKwvOdnpXqoQDmHVRCh0qX=Yh-8UpEWJ0C3S=syn1KN8rB3OGQ@mail.gmail.com>
         <20190813063327.GA46858@archlinux-threadripper>
 <3078e553a777976655f72718d088791363544caa.camel@perches.com>
In-Reply-To: <3078e553a777976655f72718d088791363544caa.camel@perches.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Joe Perches' <joe@perches.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Huckleberry <nhuck@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux Memory Management List <linux-mm@kvack.org>, clang-built-linux <clang-built-linux@googlegroups.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>

From: Joe Perches
> Sent: 13 August 2019 08:05
...
> The afs ones seem to be because the last comment in the block
> is not the fallthrough, but a description of the next case;
> 
> e.g.: from fs/afs/fsclient.c:
> 
> 		/* extract the volume name */
> 	case 3:
> 		_debug("extract volname");

I'd change those to:
	case 3:  /* extract the volume name */

Then the /* fall through */ would be fine.

The /* FALLTHROUGH */ comment has been valid C syntax (for lint)
for over 40 years.
IMHO since C compilers are now doing all the checks that lint used
to do, it should be using the same syntax.
Both the [[]] and attribute forms look horrid.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
