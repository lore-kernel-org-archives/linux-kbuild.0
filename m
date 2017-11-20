Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ms.lwn.net ([45.79.88.28]:34284 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752010AbdKTTOX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 14:14:23 -0500
Date: Mon, 20 Nov 2017 12:14:22 -0700
From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Check all .c files for bad kernel-doc comments
Message-ID: <20171120121422.69d3ac27@lwn.net>
In-Reply-To: <20171120184040.GA21971@bombadil.infradead.org>
References: <20171027194149.14328-1-willy@infradead.org>
        <CAK7LNATB+mJgMi4sfxb04zYwE5hfv2zONiBHXXtk7wq=No4DNw@mail.gmail.com>
        <20171120184040.GA21971@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Matthew Wilcox <mawilcox@microsoft.com>, Jani Nikula <jani.nikula@linux.intel.com>

On Mon, 20 Nov 2017 10:40:40 -0800
Matthew Wilcox <willy@infradead.org> wrote:

> > ifeq ($(KBUILD_ENABLE_EXTRA_GCC_CHECKS),)
> > cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $< ;
> > endif  
> 
> Thanks!  v2 below.  Jon, could you apply?

Done, thanks.

jon
