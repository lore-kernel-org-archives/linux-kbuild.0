Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ale.deltatee.com ([207.54.116.67]:49780 "EHLO ale.deltatee.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726492AbeK2LxK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Nov 2018 06:53:10 -0500
References: <20181112150215.508-1-namit@vmware.com>
 <20181112150215.508-2-namit@vmware.com> <20181113113000.GB4788@gmail.com>
 <40E4E1B4-EF5F-43A1-B42C-C4CF6349FC62@vmware.com>
 <48577A3F-0F76-4CCA-A959-965344D7259F@vmware.com>
 <7ff5de62-d1df-9a67-1c86-497ce00a4de4@deltatee.com>
 <7072A2D8-30F8-45CB-AB0C-B1BE4A30259A@vmware.com>
 <db8293cf-9abc-e899-8f43-6e42039006d9@deltatee.com>
 <521458D7-A27C-4112-81ED-1974EFE96A76@vmware.com>
 <be24a6eb-ebf0-8d9f-0051-681f0da66109@deltatee.com>
 <5682CCB4-B7D3-4DDC-81BB-2D4DCE968A3D@vmware.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <336cf7d8-6495-b112-8d3a-c146222fda78@deltatee.com>
Date: Wed, 28 Nov 2018 17:49:38 -0700
MIME-Version: 1.0
In-Reply-To: <5682CCB4-B7D3-4DDC-81BB-2D4DCE968A3D@vmware.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] Makefile: Fix distcc compilation with x86 macros
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>
Cc: Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>



On 2018-11-28 5:38 p.m., Nadav Amit wrote:
> So what’s your take? Would you think this patch is still needed? Should it
> only be enabled automatically for distcc and not for distcc-pump?

Not sure. The patch will probably slow things down a lot (seeing
assembly is always done locally and there are twice as many compile
steps) and will create some confusion once it's possible to disable it
for the new versions. Maybe hold off and see if anyone else complains?

I don't really know how you'd detect whether pump is in use or not and
I'm uncertain as to whether any of the auto detection can actually be
made to be reliable.

Logan
