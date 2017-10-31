Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:12871 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751969AbdJaILt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Oct 2017 04:11:49 -0400
From: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] Check all .c files for bad kernel-doc comments
In-Reply-To: <20171030205134.GA29718@bombadil.infradead.org>
References: <20171027194149.14328-1-willy@infradead.org> <CAK7LNATB+mJgMi4sfxb04zYwE5hfv2zONiBHXXtk7wq=No4DNw@mail.gmail.com> <20171030134007.GA2846@bombadil.infradead.org> <87mv48fytl.fsf@intel.com> <20171030205134.GA29718@bombadil.infradead.org>
Date: Tue, 31 Oct 2017 10:13:10 +0200
Message-ID: <8760avg2g9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Matthew Wilcox <mawilcox@microsoft.com>

On Mon, 30 Oct 2017, Matthew Wilcox <willy@infradead.org> wrote:
> On Mon, Oct 30, 2017 at 05:19:18PM +0200, Jani Nikula wrote:
>> Related, there was also a script to do reStructuredText lint style
>> checks in addition to the kernel-doc checks using make CHECK and
>> C=1. See http://mid.mail-archive.com/87h98quc1w.fsf@intel.com
>
> I don't really care which patch goes in.  If I understand your python
> script correctly, it relies on having various python packages installed.
> Unless we're going to switch kernel-doc over to being written in python,
> I'd prefer to not require additional dependencies.

I think your patch has a much better chance of getting enabled by
default in the long run, so I'd prefer that. I've also kind of dropped
the ball on my script... but thought it might be interesting.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Technology Center
