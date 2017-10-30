Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:45099 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751905AbdJ3Uvf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Oct 2017 16:51:35 -0400
Date: Mon, 30 Oct 2017 13:51:34 -0700
From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] Check all .c files for bad kernel-doc comments
Message-ID: <20171030205134.GA29718@bombadil.infradead.org>
References: <20171027194149.14328-1-willy@infradead.org>
 <CAK7LNATB+mJgMi4sfxb04zYwE5hfv2zONiBHXXtk7wq=No4DNw@mail.gmail.com>
 <20171030134007.GA2846@bombadil.infradead.org>
 <87mv48fytl.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mv48fytl.fsf@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Matthew Wilcox <mawilcox@microsoft.com>

On Mon, Oct 30, 2017 at 05:19:18PM +0200, Jani Nikula wrote:
> Related, there was also a script to do reStructuredText lint style
> checks in addition to the kernel-doc checks using make CHECK and
> C=1. See http://mid.mail-archive.com/87h98quc1w.fsf@intel.com

I don't really care which patch goes in.  If I understand your python
script correctly, it relies on having various python packages installed.
Unless we're going to switch kernel-doc over to being written in python,
I'd prefer to not require additional dependencies.
