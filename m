Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:39461 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757224Ab0BLTOb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 12 Feb 2010 14:14:31 -0500
Message-ID: <4B75A66A.70005@zytor.com>
Date: Fri, 12 Feb 2010 11:05:14 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] bitops: compile time optimization for hweight_long(CONSTANT)
References: <4B6C93A2.1090302@zytor.com> <20100206093659.GA28326@aftab> <4B6E1DA3.50204@zytor.com> <20100208092845.GB12618@a1.tnic> <4B6FDAED.9060204@zytor.com> <20100208095945.GA14740@a1.tnic> <20100211172424.GB19779@aftab> <4B743F7D.3090605@zytor.com> <20100212170649.GC3114@aftab> <4B758FC0.1020600@zytor.com> <20100212174751.GD3114@aftab>
In-Reply-To: <20100212174751.GD3114@aftab>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@amd64.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Borislav Petkov <petkovbb@googlemail.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Wu Fengguang <fengguang.wu@intel.com>, LKML <linux-kernel@vger.kernel.org>, Jamie Lokier <jamie@shareable.org>, Roland Dreier <rdreier@cisco.com>, Al Viro <viro@ZenIV.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Brian Gerst <brgerst@gmail.com>

On 02/12/2010 09:47 AM, Borislav Petkov wrote:
> 
> However, this is generic code and for the above to work we have to
> enforce x86-specific CFLAGS for it. What is the preferred way to do
> that?
> 

That's a question for Michal and the kbuild list.  Michal?

	-hpa

