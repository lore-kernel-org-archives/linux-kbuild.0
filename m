Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:24683 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727893AbgEQMeV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 08:34:21 -0400
From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH 09/29] kbuild: disallow multi-word in M= or KBUILD_EXTMOD
Date: Sun, 17 May 2020 12:33:13 +0000
Message-ID: <fe378a92bba24164a4f901902ab06820@AcuMS.aculab.com>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
 <20200517094859.2376211-10-masahiroy@kernel.org>
In-Reply-To: <20200517094859.2376211-10-masahiroy@kernel.org>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Masahiro Yamada' <masahiroy@kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Cc: Jessica Yu <jeyu@kernel.org>, Michal Marek <michal.lkml@markovi.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

From: Masahiro Yamada
> Sent: 17 May 2020 10:49
> $(firstword ...) in scripts/Makefile.modpost was added by commit
> 3f3fd3c05585 ("[PATCH] kbuild: allow multi-word $M in Makefile.modpost")
> to build multiple external module directories.
> 
> This feature has been broken for a while. Remove the bitrotten code, and
> stop parsing if M or KBUILD_EXTMOD contains multiple words.

ISTR that one of the kernel documentation files says that it is possible
to build multiple modules together in order to avoid 'faffing' with
exported symbol lists.

So the docs need updating to match.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
