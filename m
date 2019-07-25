Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:37064 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbfGYVes (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 17:34:48 -0400
Date: Thu, 25 Jul 2019 23:34:44 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: .h.s files spam
Message-ID: <20190725213444.GA19265@ravnborg.org>
References: <20190725195633.GA15202@avx2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190725195633.GA15202@avx2>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Alexey

On Thu, Jul 25, 2019 at 10:56:33PM +0300, Alexey Dobriyan wrote:
> What are these files for?
> 
> 	$ cat ../obj/include/linux/kernel.h.s
>         .file   "null"
>         .text
>         .ident  "GCC: (Gentoo 9.1.0-r1 p1.1) 9.1.0"
>         .section        .note.GNU-stack,"",@progbits
> 
> 	$ find ../obj/ -type f -name '*.s' | wc -l
> 	4047
> 
> It is "allyesconfig" in case someone is going to reproduce it.

The files are created by the new headers-test-y stuff.
We now verify that a big part of the header files in include/*
are self-contained. (They include all their dependencies).
The header-test-y support is also enabled for the rest of the kernel,
but used only in very few places outside include/* as of today.

	Sam
