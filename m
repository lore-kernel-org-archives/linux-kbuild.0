Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ale.deltatee.com ([207.54.116.67]:57774 "EHLO ale.deltatee.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbeKIFhm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Nov 2018 00:37:42 -0500
References: <20181003213100.189959-1-namit@vmware.com>
 <20181003213100.189959-3-namit@vmware.com>
 <89262174-6f15-6116-e67f-436f7c1bfe99@deltatee.com>
 <6651971B-E3AB-4CDD-868C-2338593F7D83@vmware.com>
 <d0812681-4a8f-8cc4-24ce-d02002ee34d2@deltatee.com>
 <DC1EA50F-FAC3-4750-BCF7-0622D1FB4756@vmware.com>
 <a3902c4c-64b1-9c49-02fb-d5e4c9b04314@deltatee.com>
 <192946CF-8543-4CF5-B2A3-93674FCD07E2@vmware.com>
 <7bc80811-8ab3-d26a-6fb3-b7aeebcfce43@deltatee.com>
 <85B77A64-5FF3-4B82-8A07-E045E259C985@zytor.com>
 <3B824A03-AB76-4B34-B1CA-F27C0F1B0575@vmware.com>
 <2c022676-9299-bb5f-023b-5c114cd79f81@deltatee.com>
 <080748A5-2588-47C9-BC2A-E643630FB9A7@vmware.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <3ae6dd1f-9b59-8552-f438-c40b08771226@deltatee.com>
Date: Thu, 8 Nov 2018 13:00:33 -0700
MIME-Version: 1.0
In-Reply-To: <080748A5-2588-47C9-BC2A-E643630FB9A7@vmware.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v9 02/10] Makefile: Prepare for using macros for inline
 asm
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>, "hpa@zytor.com" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Stephen Bates <sbates@raithlin.com>



On 2018-11-08 12:54 p.m., Nadav Amit wrote:
> I don’t think the assembly stage needs to be done locally. gcc can still be
> used to deploy the assembler. I am not too familiar with distcc, so I don’t
> know whether the preprocessing supports multiple source-files, and whether
> it has some strange-behavior when it comes to .S/.s files.

The problem is that it's the assembly stage that needs the extra
macros.s and without that file being transferred somehow, that stage
must be done locally.

The distcc guys have a thought that the macros.s file might be able to
be transferred using pump mode with a change to include_server.py. I
don't think that will work for icecc though.

Logan
