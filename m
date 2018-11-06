Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ale.deltatee.com ([207.54.116.67]:39190 "EHLO ale.deltatee.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725936AbeKGF2m (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Nov 2018 00:28:42 -0500
References: <20181003213100.189959-1-namit@vmware.com>
 <20181003213100.189959-3-namit@vmware.com>
 <89262174-6f15-6116-e67f-436f7c1bfe99@deltatee.com>
 <6651971B-E3AB-4CDD-868C-2338593F7D83@vmware.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <d0812681-4a8f-8cc4-24ce-d02002ee34d2@deltatee.com>
Date: Tue, 6 Nov 2018 13:01:31 -0700
MIME-Version: 1.0
In-Reply-To: <6651971B-E3AB-4CDD-868C-2338593F7D83@vmware.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v9 02/10] Makefile: Prepare for using macros for inline
 asm
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>, Ingo Molnar <mingo@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Stephen Bates <sbates@raithlin.com>



On 2018-11-06 12:18 p.m., Nadav Amit wrote:
> Err.. I don’t have a dist-cc environment. I wonder whether something like
> that would do the trick:

I tested it to be sure -- but, no, this does not have any affect on
distcc. Distcc usually does pre-processing locally and then sends the
single output of cpp to a remote for compilation and assembly. It
doesn't expect there to be additional assembly files tacked on the
command line and isn't going to handle that case correctly. Thus,
changing the path of the file won't fix anything.

Logan
