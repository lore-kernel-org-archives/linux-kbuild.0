Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:23974 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756235AbaDIBYA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 8 Apr 2014 21:24:00 -0400
Date: Tue, 8 Apr 2014 18:23:33 -0700
From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [GIT] kbuild/lto changes for 3.15-rc1
Message-ID: <20140409012333.GZ32556@tassilo.jf.intel.com>
References: <20140407201919.GA15838@sepie.suse.cz>
 <CA+55aFy8hWqBpF1TXOPvA2rRaZp=H2LTO3wd3AERspmcGZhAeQ@mail.gmail.com>
 <20140408224926.GY32556@tassilo.jf.intel.com>
 <20140409001013.GB8795@kam.mff.cuni.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140409001013.GB8795@kam.mff.cuni.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Hubicka <hubicka@ucw.cz>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, jmario@redhat.com, mliska@suse.cz, vmakarov@redhat.com, markus@trippelsdorf.de, tglek@mozilla.com

Thanks Honza. Just one comment:

>     The runtime benefits are more visible on bigger, bloated and less
>     optimized projects than on hand tuned video encoder implementation.
>     I believe Kernel largely falls into hand tuned category despite its size.

In my experience there's a lot of badly tuned code in the kernel these days,
especially when you go outside the core code (i.e. into drivers/*)

Or code that used to be tuned, but isn't aftermore after several years
of feature additions and bug fixes. The kernel code quality is also quite varying.

So anything the compiler can do helps.

>     I would be curious about the results on Kernel.

We saw some upsides in performance with some standard tests, but nothing 
too significant.

-Andi
