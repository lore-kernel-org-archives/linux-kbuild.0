Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B84C43461
	for <linux-kbuild@archiver.kernel.org>; Tue, 20 Apr 2021 08:30:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE1A061104
	for <linux-kbuild@archiver.kernel.org>; Tue, 20 Apr 2021 08:30:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbhDTIap convert rfc822-to-8bit (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 20 Apr 2021 04:30:45 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:46533 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230445AbhDTIao (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Apr 2021 04:30:44 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-271-NKPQNoYbP8uEJWWfFkVBNA-1; Tue, 20 Apr 2021 09:30:09 +0100
X-MC-Unique: NKPQNoYbP8uEJWWfFkVBNA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Tue, 20 Apr 2021 09:30:07 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Tue, 20 Apr 2021 09:30:07 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     "'H. Peter Anvin'" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Kbuild Mailing List" <linux-kbuild@vger.kernel.org>
Subject: RE: [PATCH 0/3] x86 disk image and modules initramfs generation
Thread-Topic: [PATCH 0/3] x86 disk image and modules initramfs generation
Thread-Index: AQHXNXA3hW9Bgwsx/EekG3uw9oZ0YKq9EYRw
Date:   Tue, 20 Apr 2021 08:30:07 +0000
Message-ID: <75fc46bae17f4fa4958f5ad7d49d9244@AcuMS.aculab.com>
References: <20210419230252.1583169-1-hpa@zytor.com>
In-Reply-To: <20210419230252.1583169-1-hpa@zytor.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: H. Peter Anvin
> Sent: 20 April 2021 00:03
> 
> When compiling on a different machine than the runtime target,
> including but not limited to simulators, it is rather handy to be able
> to produce a bootable image. The scripts for that in x86 are
> relatively old, and assume a BIOS system.

I've given up and copied the kernel tree onto all my test systems.

I needed something like 'make modules_install' and 'make install'
that would generated a directory tree that could be copied (scp -r)
onto the target system.

But the script to run 'update-grub' is all intwined in the commands.

You also don't get a copy of the headers.
Even for the local system (as root) you just get a symlink into
the source tree.
This causes a problem trying to build 'out of tree' modules
after updating the kernel source tree (but not rebulding).

I can (and do) write 'horrid' makefiles (gmake and nmake)
but this seemed to need more refactoring that I wanted to do.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

